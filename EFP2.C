#include <algorithm>
#include <cstring>
#include <iostream>
#include <memory>
#include <vector>

#include <BSetMgr.hh>
#include <GenMatrix.h>
#include <InputSection.h>
#include <ShellsStatsDef.h>
#include <TokenList.h>
#include <qchem.h>

#include "EFP2.h"
#include "libefp/src/efp.h"

//Comment to test if I can push to libefp

struct user_data
{
    double *density_matrix;
    double *qm_field_save;
	INTEGER code;
	size_t dm_size;
};

struct EFP2_impl
{
	double wf_dep_energy_gs;
	double integral_ene;
    double Escf;
    double state_energy;
	double *id_gs;
	double *idt_gs;
	double *qm_field_es;
	struct user_data user_data;
	struct efp *efp;
    /* True if field due to EFP multipoles need to be (re)computed. */
    bool if_multipole_field;
    /* True if field due to EFP induced dipoles need to be (re)computed. */
    bool if_pol_field;
};

static void libefp_error_log_cb(const char *msg)
{
    fprintf(stderr, "LIBEFP LOG: %s\n", msg);
}

static void check_fail(enum efp_result res)
{
    if (res) {
        fprintf(stderr, "LIBEFP: %s\n", efp_result_to_string(res));
        QCrash("LIBEFP ERROR");
    }
}

static int string_compare(const void *a, const void *b)
{
    const char *s1 = *(const char *const *)a;
    const char *s2 = *(const char *const *)b;

    return strcmp(s1, s2);
}

// calculate electrostatic field from electrons in qm subsystem
static enum efp_result get_electron_density_field(size_t n_pt,
    const double *xyz, double *field, void *user_data)
{
    if (!user_data)
        return EFP_RESULT_FATAL;

    double *densityMatrix = ((struct user_data *)user_data)->density_matrix;
    double *pef_ab = new double[n_pt*3];

    memset(field, 0, n_pt*3*sizeof(double));
    memset(pef_ab, 0, n_pt*3*sizeof(double));

    ShlPrs s2BraOrg(DEF_ID);
    ShlPrs s2KetOrg = s2BraOrg;
    ShlPrs s2Bra(s2BraOrg.code(), SHLPR_CFMM);
    ShlPrs s2Ket(s2KetOrg.code(), SHLPR_CFMM);

    int n_pt_int = (int)n_pt;
    AOints(pef_ab, NULL, NULL, NULL, densityMatrix, xyz, NULL, NULL,
        &n_pt_int, 112, s2Bra, s2Ket);

    VRneg(pef_ab, 3*n_pt);
    VRadd2(field, pef_ab, 3*n_pt);

    double *qm_field_save = ((struct user_data *)user_data)->qm_field_save;

    if (qm_field_save)
        memcpy(qm_field_save, pef_ab, 3 * n_pt * sizeof(double));

    delete[] pef_ab;
    return EFP_RESULT_SUCCESS;
}

static void euler_to_matrix(double a, double b, double c, GenMatrix &out)
{
    double sina = sin(a), cosa = cos(a);
    double sinb = sin(b), cosb = cos(b);
    double sinc = sin(c), cosc = cos(c);

    out(0, 0) =  cosa * cosc - sina * cosb * sinc;
    out(0, 1) = -cosa * sinc - sina * cosb * cosc;
    out(0, 2) =  sinb * sina;
    out(1, 0) =  sina * cosc + cosa * cosb * sinc;
    out(1, 1) = -sina * sinc + cosa * cosb * cosc;
    out(1, 2) = -sinb * cosa;
    out(2, 0) =  sinb * sinc;
    out(2, 1) =  sinb * cosc;
    out(2, 2) =  cosb;
}

static void matrix_to_euler(const GenMatrix &rotmat, double *ea, double *eb,
    double *ec)
{
    double a, b, c, sinb;

    b = acos(rotmat(2, 2));
    sinb = sqrt(1.0 - rotmat(2, 2) * rotmat(2, 2));

    if (fabs(sinb) < 1.0e-7) {
        a = atan2(-rotmat(0, 1), rotmat(0, 0));
        c = 0.0;
    }
    else {
        a = atan2(rotmat(0, 2), -rotmat(1, 2));
        c = atan2(rotmat(2, 0), rotmat(2, 1));
    }

    *ea = a, *eb = b, *ec = c;
}

static bool is_lib(const char *name)
{
    size_t len = strlen(name);

    return len > 2 && name[len - 2] == '_' &&
        (name[len - 1] == 'l' || name[len - 1] == 'L');
}

static size_t name_len(const char *name)
{
    return is_lib(name) ? strlen(name) - 2 : strlen(name);
}

static void add_potentials(struct efp *efp,
    const std::vector<std::string>& fragname, const char *fraglib_path,
    const char *userlib_path)
{
    size_t n_frags = fragname.size();
    const char **uniq = new const char*[n_frags];
    char path[256];

    for (size_t i = 0; i < n_frags; i++)
        uniq[i] = fragname[i].c_str();

    qsort(uniq, n_frags, sizeof(char *), string_compare);

    size_t n_uniq = 1;

    for (size_t i = 1; i < n_frags; i++) {
        if (strcmp(uniq[i - 1], uniq[i]) != 0)
            uniq[n_uniq++] = uniq[i];
    }

    for (size_t i = 0; i < n_uniq; i++) {
        const char *prefix = is_lib(uniq[i]) ?
            fraglib_path : userlib_path;
        strcat(strncat(strcat(strcpy(path, prefix), "/"), uniq[i],
            name_len(uniq[i])), ".efp");
        check_fail(efp_add_potential(efp, path));
    }

    delete[] uniq;
}

static void load_topology(struct efp *efp, const char *path)
{
    FILE *fp;
    int i, j;

    if ((fp = fopen(path, "r")) == NULL)
        return;

    while (fscanf(fp, "%*s %*s %d %d\n", &i, &j) == 2)
        check_fail(efp_skip_fragments(efp, i, j, true));

    fclose(fp);
}

static void set_rem_defaults()
{
    if (RemUninitialized(REM_EFP_ELEC))
        rem_write(1, REM_EFP_ELEC);
    if (RemUninitialized(REM_EFP_POL))
        rem_write(1, REM_EFP_POL);
    if (RemUninitialized(REM_EFP_DISP))
        rem_write(1, REM_EFP_DISP);
    if (RemUninitialized(REM_EFP_EXREP))
        rem_write(1, REM_EFP_EXREP);
    if (RemUninitialized(REM_EFP_QM_ELEC))
        rem_write(1, REM_EFP_QM_ELEC);
    if (RemUninitialized(REM_EFP_QM_POL))
        rem_write(1, REM_EFP_QM_POL);
    if (RemUninitialized(REM_EFP_QM_DISP))
        rem_write(0, REM_EFP_QM_DISP);
    if (RemUninitialized(REM_EFP_QM_EXREP))
        rem_write(0, REM_EFP_QM_EXREP);
    if (RemUninitialized(REM_EFP_ELEC_DAMP))
        rem_write(2, REM_EFP_ELEC_DAMP);
    if (RemUninitialized(REM_EFP_POL_DAMP))
        rem_write(1, REM_EFP_POL_DAMP);
    if (RemUninitialized(REM_EFP_DISP_DAMP))
        rem_write(2, REM_EFP_DISP_DAMP);
    if (RemUninitialized(REM_EFP_QM_ELEC_DAMP))
        rem_write(0, REM_EFP_QM_ELEC_DAMP);
    if (RemUninitialized(REM_EFP_QM_POL_DAMP))
        rem_write(0, REM_EFP_QM_POL_DAMP);
    if (RemUninitialized(REM_EFP_QM_DISP_DAMP))
        rem_write(0, REM_EFP_QM_DISP_DAMP);
    if (RemUninitialized(REM_EFP_QM_EXREP_DAMP))
        rem_write(0, REM_EFP_QM_EXREP_DAMP);
    if (RemUninitialized(REM_EFP_DIRECT_POLARIZATION_DRIVER))
        rem_write(0, REM_EFP_DIRECT_POLARIZATION_DRIVER);
    if (RemUninitialized(REM_EFP_ENABLE_LINKS))
        rem_write(0, REM_EFP_ENABLE_LINKS);
    if (RemUninitialized(REM_EFP_COORD_XYZ))
        rem_write(0, REM_EFP_COORD_XYZ);
	if (RemUninitialized(REM_EFP_PAIRWISE))
	    rem_write(0, REM_EFP_PAIRWISE);
    if (RemUninitialized(REM_EFP_ORDER))
        rem_write(2, REM_EFP_ORDER);
}

EFP2::EFP2()
{
    impl_ = new EFP2_impl();
    std::memset(impl_, 0, sizeof(*impl_));
}

EFP2::~EFP2()
{
    if (impl_) {
        efp_shutdown(impl_->efp);
        delete[] impl_->id_gs;
        delete[] impl_->idt_gs;
        delete[] impl_->qm_field_es;
        free(impl_->user_data.density_matrix);
    }
    delete impl_;
}

void EFP2::init(InputSection& is)
{
    TokenList tl;
    std::vector<std::string> fragname;
    std::vector<double> coord;
    double unitconv;
    int ifrag;

    printf("\n\n%s\n\n", efp_banner());

    set_rem_defaults();

    ifrag = 0;
    unitconv = rem_read(REM_INPUT_BOHR) ? 1.0 : ConvFac(ANGSTROMS_TO_BOHRS);

    try {
        for (is >> tl; tl && tl[0] != "$end"; is >> tl) {
            //treat lines starting with ! as comments
            if (!tl.NTokens() || tl[0][0] == '!')
                continue;

            if (rem_read(REM_EFP_COORD_XYZ) == 0) {
                if (tl.NTokens() != 7 && tl.NTokens() != 4 &&
                  !(tl.NTokens() == 1 && rem_read(REM_EFP_INPUT) == 1)) {
                    throw "incorrect number of tokens in string; check EFP_COORD_XYZ keyword";
                }
            }

            fragname.push_back(std::string((const char *)tl[0]));
            std::transform(fragname.back().begin(),
                       fragname.back().end(),
                       fragname.back().begin(), ::tolower);

            if (rem_read(REM_EFP_COORD_XYZ) != 0) {
                for (int i = 0; i < 3; i++) {
                    is >> tl;

                    if (tl.NTokens() != 4)
                        throw "incorrect number of tokens in string; check EFP_COORD_XYZ keyword";

                    coord.push_back(tl[1].GetDouble() * unitconv);
                    coord.push_back(tl[2].GetDouble() * unitconv);
                    coord.push_back(tl[3].GetDouble() * unitconv);
                }
            } else if (rem_read(REM_EFP_INPUT) < 0) {
                coord.push_back(tl[1].GetDouble() * unitconv);
                coord.push_back(tl[2].GetDouble() * unitconv);
                coord.push_back(tl[3].GetDouble() * unitconv);
                if (tl.NTokens() == 7) {
                    coord.push_back(tl[4].GetDouble());
                    coord.push_back(tl[5].GetDouble());
                    coord.push_back(tl[6].GetDouble());
                } else {
                    coord.push_back(0.0);
                    coord.push_back(0.0);
                    coord.push_back(0.0);
                }
            } else if (rem_read(REM_EFP_INPUT) == 1) {
                double xyzabc_[6];
                FileMan(FM_READ, FILE_EFP_INPUT_DATA, FM_DP, 6, ifrag * 6, FM_BEG, xyzabc_);
                coord.push_back(xyzabc_[0] * unitconv);
                coord.push_back(xyzabc_[1] * unitconv);
                coord.push_back(xyzabc_[2] * unitconv);
                coord.push_back(xyzabc_[3]);
                coord.push_back(xyzabc_[4]);
                coord.push_back(xyzabc_[5]);
                ifrag++;
            }
            else {
                QCrash("All-atom input for EFP is not supported");
            }
        }
    } catch (char const *err) {
        tl.Print("Problem with the input string: ");
        std::cout << err << endl;
        QCrash("Reading of EFP fragments failed due to an error in the input");
    }

    size_t n_frags = fragname.size();
    struct efp_opts opts;
    efp_opts_default(&opts);
    opts.disp_damp = EFP_DISP_DAMP_TT;

    switch (rem_read(REM_EFP_ELEC_DAMP)) {
    case 0:
        opts.elec_damp = EFP_ELEC_DAMP_OFF;
        printf("EFP electrostatic damping is off\n");
        break;
    case 1:
        opts.elec_damp = EFP_ELEC_DAMP_OVERLAP;
        printf("EFP electrostatic damping is overlap-based damping\n");
        break;
    case 2:
        opts.elec_damp = EFP_ELEC_DAMP_SCREEN;
        printf("EFP electrostatic damping is screen-based damping\n");
        break;
    default:
        QCrash("unknown EFP_ELEC_DAMP value");
    }

    switch (rem_read(REM_EFP_DISP_DAMP)) {
    case 0:
        opts.disp_damp = EFP_DISP_DAMP_OFF;
        printf("EFP dispersion damping is off\n");
        break;
    case 1:
        opts.disp_damp = EFP_DISP_DAMP_TT;
        printf("EFP dispersion damping is Tang-Toennies damping\n");
        break;
    case 2:
        opts.disp_damp = EFP_DISP_DAMP_OVERLAP;
        printf("EFP dispersion damping is overlap-based damping\n");
        break;
    default:
        QCrash("unknown EFP_DISP_DAMP value");
    }

    switch(rem_read(REM_EFP_POL_DAMP)) {
    case 0:
        opts.pol_damp = EFP_POL_DAMP_OFF;
        printf("EFP polarization damping is off\n");
        break;
    case 1:
        opts.pol_damp = EFP_POL_DAMP_TT;
        printf("EFP polarization damping is Tang-Toennies damping\n");
        break;
    default:
        QCrash("unknown EFP_POL_DAMP value");
    }

    if (rem_read(REM_EFP_ELEC)) opts.terms |= EFP_TERM_ELEC;
    else opts.terms &= ~EFP_TERM_ELEC;

    if (rem_read(REM_EFP_POL)) opts.terms |= EFP_TERM_POL;
    else opts.terms &= ~EFP_TERM_POL;

    if (rem_read(REM_EFP_DISP)) opts.terms |= EFP_TERM_DISP;
    else opts.terms &= ~EFP_TERM_DISP;

    if (rem_read(REM_EFP_EXREP)) opts.terms |= EFP_TERM_XR;
    else opts.terms &= ~EFP_TERM_XR;

    if (rem_read(REM_EFP_QM_ELEC)) opts.terms |= EFP_TERM_AI_ELEC;
    else opts.terms &= ~EFP_TERM_AI_ELEC;

    if (rem_read(REM_EFP_QM_POL)) opts.terms |= EFP_TERM_AI_POL;
    else opts.terms &= ~EFP_TERM_AI_POL;

    if (rem_read(REM_EFP_QM_DISP)) opts.terms |= EFP_TERM_AI_DISP;
    else opts.terms &= ~EFP_TERM_AI_DISP;

    if (rem_read(REM_EFP_QM_EXREP)) opts.terms |= EFP_TERM_AI_XR;
    else opts.terms &= ~EFP_TERM_AI_XR;

    if (rem_read(REM_EFP_DIRECT_POLARIZATION_DRIVER))
        opts.pol_driver = EFP_POL_DRIVER_DIRECT;

    if (rem_read(REM_EFP_FRAGMENTS_ONLY)) {
        opts.terms &= ~EFP_TERM_AI_ELEC;
        opts.terms &= ~EFP_TERM_AI_POL;
        opts.terms &= ~EFP_TERM_AI_DISP;
        opts.terms &= ~EFP_TERM_AI_XR;
    }

    if (rem_read(REM_EFP_PAIRWISE)) {
        opts.enable_pairwise = 1;
        opts.ligand = -1;
    }

    if (rem_read(REM_EFP_ORDER) == 1) {
        opts.terms &= ~EFP_TERM_AI_POL;
        opts.terms &= ~EFP_TERM_AI_DISP;
        opts.terms &= ~EFP_TERM_AI_XR;
        opts.terms &= ~EFP_TERM_POL;
        opts.terms &= ~EFP_TERM_DISP;
        opts.terms &= ~EFP_TERM_XR;
    }

    if (rem_read(REM_EFP_ORDER) == 0) {
        opts.terms &= ~EFP_TERM_AI_ELEC;
        opts.terms &= ~EFP_TERM_AI_POL;
        opts.terms &= ~EFP_TERM_AI_DISP;
        opts.terms &= ~EFP_TERM_AI_XR;
        opts.terms &= ~EFP_TERM_ELEC;
        opts.terms &= ~EFP_TERM_POL;
        opts.terms &= ~EFP_TERM_DISP;
        opts.terms &= ~EFP_TERM_XR;
    }

    const char userlib_path[] = ".";
	char fraglib_path[256], *qcaux;

    if ((qcaux = getenv("QCAUX")) == NULL)
        QCrash("Could not get location of the EFP library");

    sprintf(fraglib_path, "%s/fraglib", qcaux);

    impl_->efp = efp_create();
    if (!impl_->efp)
        QCrash("unable to create efp object");

    efp_set_error_log(libefp_error_log_cb);
    check_fail(efp_set_opts(impl_->efp, &opts));
    add_potentials(impl_->efp, fragname, fraglib_path, userlib_path);

    for (size_t i = 0; i < n_frags; i++)
        check_fail(efp_add_fragment(impl_->efp, fragname[i].c_str()));

    check_fail(efp_set_electron_density_field_fn(impl_->efp, get_electron_density_field));
    check_fail(efp_prepare(impl_->efp));

    if (rem_read(REM_EFP_ENABLE_LINKS))
        load_topology(impl_->efp, "efp-topology");

    if (rem_read(REM_EFP_COORD_XYZ) == 0)
        check_fail(efp_set_coordinates(impl_->efp, EFP_COORD_TYPE_XYZABC, &coord.front()));
    else
        //check_fail(efp_set_coordinates(impl_->efp, EFP_COORD_TYPE_ATOMS, &coord.front()));
        check_fail(efp_set_coordinates(impl_->efp, EFP_COORD_TYPE_POINTS, &coord.front()));

    size_t n_dip;
    check_fail(efp_get_induced_dipole_count(impl_->efp, &n_dip));

    impl_->id_gs = new double[n_dip * 3];
    impl_->idt_gs = new double[n_dip * 3];
    impl_->qm_field_es = new double[n_dip * 3];

    impl_->if_multipole_field = true;
    impl_->if_pol_field = true;

    printf("\n\nGEOMETRY OF EFP SUBSYSTEM\n\n");
    print_geometry();
}


void EFP2::reorient_geometry()
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY))
        return;

    size_t n_frags;
    std::vector<double> coord;
    GenMatrix qcorigin(3, 1);
    GenMatrix qcrotmat(3, 3);

    check_fail(efp_get_frag_count(impl_->efp, &n_frags));

    FileMan_Open_Read(FILE_NEW_GEOM_ORIGIN);
    qcorigin.ReadFromDisk(FILE_NEW_GEOM_ORIGIN);
    FileMan_Close(FILE_NEW_GEOM_ORIGIN);

    FileMan_Open_Read(FILE_ORIENT_MATRIX);
    qcrotmat.ReadFromDisk(FILE_ORIENT_MATRIX);
    FileMan_Close(FILE_ORIENT_MATRIX);

    coord.resize(6 * n_frags);
    check_fail(efp_get_coordinates(impl_->efp, &coord.front()));

    for (size_t i = 0; i < n_frags; i++) {
        GenMatrix pos(3, 1), posrot(3, 1);

        pos(0, 0) = coord[6 * i + 0] - qcorigin(0, 0);
        pos(1, 0) = coord[6 * i + 1] - qcorigin(1, 0);
        pos(2, 0) = coord[6 * i + 2] - qcorigin(2, 0);

        MatMult(posrot, qcrotmat, pos);

        coord[6 * i + 0] = posrot(0, 0);
        coord[6 * i + 1] = posrot(1, 0);
        coord[6 * i + 2] = posrot(2, 0);

        double a = coord[6 * i + 3];
        double b = coord[6 * i + 4];
        double c = coord[6 * i + 5];

        GenMatrix rotmat(3, 3), prod(3, 3);
        euler_to_matrix(a, b, c, rotmat);
        MatMult(prod, qcrotmat, rotmat);
        matrix_to_euler(prod, &a, &b, &c);

        coord[6 * i + 3] = a;
        coord[6 * i + 4] = b;
        coord[6 * i + 5] = c;
    }

    check_fail(efp_set_coordinates(impl_->efp, EFP_COORD_TYPE_XYZABC,
        &coord.front()));

    rem_write(0, REM_ISYM_RQ);
    rem_write(0, REM_CC_SYMMETRY);
    rem_write(1, REM_SYM_IGNORE);

    printf("\n\nREORIENTED EFP GEOMETRY\n\n");
    print_geometry();
}

void EFP2::print_geometry()
{
    size_t n_frags;
    check_fail(efp_get_frag_count(impl_->efp, &n_frags));

    for (size_t i = 0; i < n_frags; i++) {
        size_t nat;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));

        struct efp_atom *atoms = new struct efp_atom[nat];
        check_fail(efp_get_frag_atoms(impl_->efp, i, nat, atoms));

        for (size_t j = 0; j < nat; j++) {
            printf("%10s %10.5lf %10.5lf %10.5lf\n", atoms[j].label,
                atoms[j].x / ConvFac(ANGSTROMS_TO_BOHRS),
                atoms[j].y / ConvFac(ANGSTROMS_TO_BOHRS),
                atoms[j].z / ConvFac(ANGSTROMS_TO_BOHRS));
        }

        delete[] atoms;
    }
    printf("\n\n");
}

bool EFP2::initialized()
{
    return impl_->efp != NULL;
}

bool EFP2::get_if_multipole_field() {
//    printf("\n mult_field %s", impl_->if_multipole_field ? "true":"false");
    return impl_->if_multipole_field;
}

void EFP2::update_multipole_field() {
    // printf("\n in update_multipole_field");
    // if (impl_->if_multipole_field) impl_->if_multipole_field = false;
    // need to compute two times: why???
    static int counter = 0;
    counter++;
    if (counter > 1) impl_->if_multipole_field = false;
}

bool EFP2::get_if_pol_field() {
    // printf("\n pol_field %s", impl_->if_pol_field ? "true":"false");
    return impl_->if_pol_field;
}

void EFP2::update_pol_field() {
    // compute every other time
    // printf("\n in update_pol_field");
    impl_->if_pol_field = !impl_->if_pol_field;
}

double EFP2::get_excited_state_energy_correction(double *w, size_t n_elem, double Ecis)
{
	double energy = 0.0;
	size_t size = n_elem * sizeof(double);

    impl_->user_data.qm_field_save = impl_->qm_field_es;
    impl_->user_data.density_matrix = (double *)realloc(impl_->user_data.density_matrix, size);
    memcpy(impl_->user_data.density_matrix, w, size);

	// calling it here before updating the induced dipoles
    if (rem_read(REM_EFP_ORDER)!=0)
        get_pairwise_energy(Ecis, 1);

    // do not bother about polarization correction for efp_order = 1
    if (rem_read(REM_EFP_ORDER)!=1) {
        check_fail(efp_set_electron_density_field_user_data(impl_->efp, &impl_->user_data));
        check_fail(efp_get_wavefunction_dependent_energy_correction(impl_->efp, &energy));
    }

	/*
    size_t n_dip;
	check_fail(efp_get_induced_dipole_count(impl_->efp, &n_dip));

    double *id = new double[3 * n_dip];
    double *idt = new double[3 * n_dip];
    double *did = new double[3 * n_dip];
    double *didt = new double[3 * n_dip];

    check_fail(efp_get_induced_dipole_values(impl_->efp, id));
    check_fail(efp_get_induced_dipole_conj_values(impl_->efp, idt));

    VRsub(did, id, impl_->id_gs, n_dip * 3);
    VRsub(didt, idt, impl_->idt_gs, n_dip * 3);

    // correction to CI energy: difference in CI/EOM and HF AI polarization energies
    double dE_CI1 = energy - impl_->wf_dep_energy_gs;
    // correction to CI energy: (ind_CI-ind_HF)*field_CI
    double dE_CI2 = 0.0;

    for (size_t i = 0; i < n_dip; i++) {
        dE_CI2 -= 0.5 * (did[3 * i + 0] + didt[3 * i + 0]) * impl_->qm_field_es[3 * i + 0];
        dE_CI2 -= 0.5 * (did[3 * i + 1] + didt[3 * i + 1]) * impl_->qm_field_es[3 * i + 1];
        dE_CI2 -= 0.5 * (did[3 * i + 2] + didt[3 * i + 2]) * impl_->qm_field_es[3 * i + 2];
    }

    delete[] id;
	delete[] idt;
	delete[] did;
	delete[] didt;
*/
    // calling second time - beware
    if (rem_read(REM_EFP_ORDER)!=0) {
        //get_pairwise_energy(Ecis + energy, 1);
        print_pairwise_energy(1);
    }

    //return (dE_CI1 + dE_CI2);
    return (energy);
}

#include <iostream>
#include <sstream>
#include <libqints/algorithms/gto/gto_order.h>
#include <libqints/qchem/aobasis.h>
#include <libfock/stv/vmul.h>
#include <libmdc/threading_policy.h>
using libqints::qchem::aobasis;

void EFP2::update_wf_qints(double *h, INTEGER code)
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_ELEC) == 0)
        return;
    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    dev.memory = (size_t)(rem_read(REM_MEM_TOTAL)) * 1024 * 1024 / dev.nthreads;

    // Get sizes of all objects and initialize
    size_t nbsf = aobasis.b1.get_nbsf();
    size_t n_mult = 0, n_frag = 0, n_atoms = 0, n_id = 0;
    check_fail(efp_get_multipole_count(impl_->efp, &n_mult));
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));
    check_fail(efp_get_induced_dipole_count(impl_->efp, &n_id));
    for (size_t i = 0; i < n_frag; i++)
    {
        size_t nat;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
        n_atoms += nat;
    }
    arma::vec mono; // monopole (used when damping is required)
    arma::vec mono_screen; // damping parameters for all monopole
    arma::mat mono_coord;  // Cartesian coordinate of all monopole
    if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0)
    {
        mono.set_size(n_mult);
        mono_screen.set_size(n_mult);
        mono_coord.set_size(3, n_mult);
    }

    // Read and compute atoms
    arma::mat vmul_atm(nbsf, nbsf, arma::fill::zeros);
    {
        std::vector<libqints::ftype_multipole> vfm(n_atoms);
        double *ai_screen_ptr = NULL;
        if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0) ai_screen_ptr = mono_screen.memptr();
        arma::vec mom(n_atoms);
        for (size_t i = 0, iatom = 0; i < n_frag; i++)
        {
            size_t nat, nfragmult;
            check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
            check_fail(efp_get_frag_multipole_count(impl_->efp, i, &nfragmult));
            if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0)
            {
                check_fail(efp_get_ai_screen(impl_->efp, i, ai_screen_ptr));
                ai_screen_ptr += nfragmult;
            }
            struct efp_atom *atoms = new struct efp_atom[nat];
            check_fail(efp_get_frag_atoms(impl_->efp, i, nat, atoms));
            for (size_t j = 0; j < nat; j++, iatom++)
            {
                vfm[iatom].k = 0;
                vfm[iatom].x = atoms[j].x;
                vfm[iatom].y = atoms[j].y;
                vfm[iatom].z = atoms[j].z;
                mom(iatom) = atoms[j].znuc;
            }
            delete[] atoms;
        }
        ai_screen_ptr = NULL;
        libqints::basis_1e1c_multipole bm(vfm);
        vfm = std::vector<libqints::ftype_multipole>();
        libaview::array_view<double> av_vmul(vmul_atm.memptr(), vmul_atm.n_elem);
        libaview::array_view<double> av_mom(mom.memptr(), mom.n_elem);
        libfock::vmul<double>(aobasis.b1, bm, dev).compute(av_mom, av_vmul);
    }
    // Read and compute induced dipoles
    arma::mat vmul_id(nbsf, nbsf, arma::fill::zeros);
    {
        std::vector<libqints::ftype_multipole> vfm(n_id);
        double *xyz_id = new double[n_id * 3];
        check_fail(efp_get_induced_dipole_coordinates(impl_->efp, xyz_id));
        double *id = new double[n_id * 3];
        check_fail(efp_get_induced_dipole_values(impl_->efp, id));
        double *idt = new double[n_id * 3];
        check_fail(efp_get_induced_dipole_conj_values(impl_->efp, idt));
        arma::vec mom(n_id * 4);
        for (size_t i = 0, ifm = 0, imom = 0; i < n_id; i++, ifm++)
        {
            vfm[ifm].k = 1;
            vfm[ifm].x = xyz_id[3 * i + 0];
            vfm[ifm].y = xyz_id[3 * i + 1];
            vfm[ifm].z = xyz_id[3 * i + 2];
            mom(imom++) = 0.0; // Zero charges
            for (size_t j = 0, jj = i * 3; j < 3; j++, imom++, jj++)
                mom(imom) = (id[jj] + idt[jj]) * 0.5;
        }
        delete[] id;
        delete[] idt;
        delete[] xyz_id;
        libqints::basis_1e1c_multipole bm(vfm);
        vfm = std::vector<libqints::ftype_multipole>();
        libaview::array_view<double> av_vmul(vmul_id.memptr(), vmul_id.n_elem);
        libaview::array_view<double> av_mom(mom.memptr(), mom.n_elem);
        libfock::vmul<double>(aobasis.b1, bm, dev).compute(av_mom, av_vmul);
    }
    // Read and compute multipoles
    arma::mat vmul_mult(nbsf, nbsf, arma::fill::zeros);
    {
        std::vector<libqints::ftype_multipole> vfm(n_mult);
        double *xyz_mult = new double[n_mult * 3];
        check_fail(efp_get_multipole_coordinates(impl_->efp, xyz_mult));
        double *mult = new double[n_mult * (1 + 3 + 6 + 10)];
        check_fail(efp_get_multipole_values(impl_->efp, mult));
        arma::vec mom_mult(n_mult * 20);
        for (size_t i = 0, imom = 0, ifm = 0; i < n_mult; i++, ifm++)
        {
            vfm[ifm].k = 3;
            vfm[ifm].x = xyz_mult[3 * i + 0];
            vfm[ifm].y = xyz_mult[3 * i + 1];
            vfm[ifm].z = xyz_mult[3 * i + 2];
            double *c_mult = mult + i * 20;
            size_t jj = 0;
            for (size_t j = 0; j < 4; j++, jj++, imom++) // monopole and dipole
                mom_mult(imom) = c_mult[jj];
            // quadrupole (different ordering in qints)
            mom_mult(imom++) = c_mult[4]; // xx
            mom_mult(imom++) = c_mult[7]; // xy
            mom_mult(imom++) = c_mult[8]; // xz
            mom_mult(imom++) = c_mult[5]; // yy
            mom_mult(imom++) = c_mult[9]; // yz
            mom_mult(imom++) = c_mult[6]; // zz
            // octupole (different ordering in qints)
            mom_mult(imom++) = c_mult[10]; // xxx
            mom_mult(imom++) = c_mult[13]; // xxy
            mom_mult(imom++) = c_mult[14]; // xxz
            mom_mult(imom++) = c_mult[15]; // xyy
            mom_mult(imom++) = c_mult[19]; // xyz
            mom_mult(imom++) = c_mult[17]; // xzz
            mom_mult(imom++) = c_mult[11]; // yyy
            mom_mult(imom++) = c_mult[16]; // yyz
            mom_mult(imom++) = c_mult[18]; // yzz
            mom_mult(imom++) = c_mult[12]; // zzz

            if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0)
            {
                mono(i) = mult[i * 20];
                mono_coord(0, i) = vfm[ifm].x;
                mono_coord(1, i) = vfm[ifm].y;
                mono_coord(2, i) = vfm[ifm].z;
            }
        }
        delete[] mult;
        delete[] xyz_mult;
        libqints::basis_1e1c_multipole bm(vfm);
        vfm = std::vector<libqints::ftype_multipole>();
        libaview::array_view<double> av_vmul(vmul_mult.memptr(), vmul_mult.n_elem);
        libaview::array_view<double> av_mom(mom_mult.memptr(), mom_mult.n_elem);
        libfock::vmul<double>(aobasis.b1, bm, dev).compute(av_mom, av_vmul);
    }

    // Call vmul
    arma::mat vmul = vmul_atm + vmul_id + vmul_mult;
    libqints::gto::reorder_cc(vmul, aobasis.b1, true, true, libqints::gto::lex, libqints::gto::korder);
    threading_policy::pop();

    // Pack
    INTEGER NB2 = rem_read(REM_NB2);
    ShlPrs S2(code);
    INTEGER NB2car = S2.getNB2car();
    arma::vec pkd_vmul(NB2car, arma::fill::zeros);
    ScaV2M(vmul.memptr(), pkd_vmul.memptr(), 1, 0);

    if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0)
    {
        arma::vec Z(NB2car, arma::fill::zeros);
        double *xyz_ptr = mono_coord.memptr();
        for (size_t j1 = 0; j1 < mono_screen.n_elem; j1++, xyz_ptr += 3) {
            double damp = mono_screen(j1);
            if (damp > 1.0e-6) {
                MakeFld(Z.memptr(), xyz_ptr, 0, S2.code(), S2, damp);
                for (int i = 0; i < NB2; i++) {
                    pkd_vmul(i) += Z(i) * mono(j1);
                }
            }
        }
        xyz_ptr = NULL;
    }

    VRadd(h, h, pkd_vmul.memptr(), NB2);
}

/*
void EFP2::update_mult_ints(double *h, INTEGER code)
{
    impl_->user_data.code = code;
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_ELEC) == 0 || rem_read(REM_EFP_ORDER) != 2)
        return;
    printf("Compute multipole integrals \n");
    INTEGER NB2 = rem_read(REM_NB2);


    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    threading_policy::pop();

    if ((rem_read(REM_USE_LIBQINTS) != 0 && dev.nthreads > 1) || (rem_read(REM_USE_LIBQINTS) > 0)) // && rem_read(REM_EFP_PAIRWISE) == 0)
    {
        update_wf_qints(h, code);
        return;
    }

    size_t n_mult;
    check_fail(efp_get_multipole_count(impl_->efp, &n_mult));
    double *xyz_mult = new double[n_mult * 3];
    check_fail(efp_get_multipole_coordinates(impl_->efp, xyz_mult));
    double *mult = new double[n_mult * (1 + 3 + 6 + 10)];
    check_fail(efp_get_multipole_values(impl_->efp, mult));

    // size_t n_frag;
    // check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    size_t n_atoms = 0;
    for (size_t i = 0; i < n_frag; i++) {
        size_t nat;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
        n_atoms += nat;
    }

    double *z_ptr, *xyz_ptr, *ai_screen_ptr, *ai_screen_ptr2;

    INTEGER n_charges = n_atoms + n_mult;
    double *z_c = new double[n_charges];
    double *xyz_c = new double[3 * n_charges];
    double *ai_screen = new double[n_charges];

    memset(ai_screen, 0, n_charges * sizeof(double));

    for (size_t i = 0; i < n_mult; i++) {
        z_c[i] = mult[i * 20];
        xyz_c[3 * i + 0] = xyz_mult[3 * i + 0];
        xyz_c[3 * i + 1] = xyz_mult[3 * i + 1];
        xyz_c[3 * i + 2] = xyz_mult[3 * i + 2];
    }

    z_ptr = z_c + n_mult;
    xyz_ptr = xyz_c + n_mult * 3;
    ai_screen_ptr = ai_screen;
    ai_screen_ptr2 = ai_screen + n_mult;

    for (size_t i = 0; i < n_frag; i++) {
        size_t nat, nfragmult;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));

        struct efp_atom *atoms = new struct efp_atom[nat];
        check_fail(efp_get_frag_atoms(impl_->efp, i, nat, atoms));

        check_fail(efp_get_frag_multipole_count(impl_->efp, i,
                                                &nfragmult));
        if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0) {
            check_fail(efp_get_ai_screen(impl_->efp, i,
                                         ai_screen_ptr));
        }

        for (size_t j = 0; j < nat; j++) {
            *z_ptr++ = atoms[j].znuc;
            *xyz_ptr++ = atoms[j].x;
            *xyz_ptr++ = atoms[j].y;
            *xyz_ptr++ = atoms[j].z;
        }

        ai_screen_ptr += nfragmult;
        delete[] atoms;
    }

    // charges
    xyz_ptr = xyz_c;
    for (size_t j1 = 0; j1 < n_charges; j1++, xyz_ptr += 3) {
        double damp = ai_screen[j1];
        //that should only compute integrals for the first point
        MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, 0.0);

        for (int i = 0; i < NB2; i++) {
            V[i] -= Z[i] * z_c[j1];
        }

        if (damp > 1.0e-6) {
            MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, damp);
            for (int i = 0; i < NB2; i++) {
                V[i] += Z[i] * z_c[j1];
            }
        }
    }
    QFree(Z);

    // dipoles, quadrupoles, octupoles
    LXmax = 3;
    Kmax = LFuncC(0, LXmax);
    Z = QAllocDouble(Kmax * NB2car);

    //find quadrupoles indices in Z array
    int nxx, nyy, nzz, nxy, nxz, nyz;
    KonL2K(&nxx, 2, 0, 0);
    KonL2K(&nyy, 0, 2, 0);
    KonL2K(&nzz, 0, 0, 2);
    KonL2K(&nxy, 1, 1, 0);
    KonL2K(&nxz, 1, 0, 1);
    KonL2K(&nyz, 0, 1, 1);
    nxx--; nyy--; nzz--; nxy--; nxz--; nyz--;

    //find ocupole indices in Z array
    int nxxx, nyyy, nzzz, nxxy, nxxz, nxyy, nyyz, nxzz, nyzz, nxyz;
    KonL2K(&nxxx, 3, 0, 0);
    KonL2K(&nyyy, 0, 3, 0);
    KonL2K(&nzzz, 0, 0, 3);
    KonL2K(&nxxy, 2, 1, 0);
    KonL2K(&nxxz, 2, 0, 1);
    KonL2K(&nxyy, 1, 2, 0);
    KonL2K(&nyyz, 0, 2, 1);
    KonL2K(&nxzz, 1, 0, 2);
    KonL2K(&nyzz, 0, 1, 2);
    KonL2K(&nxyz, 1, 1, 1);
    nxxx--;nyyy--;nzzz--;nxxy--;nxxz--;
    nxyy--;nyyz--;nxzz--;nyzz--;nxyz--;

    z_ptr = mult, xyz_ptr = xyz_mult;
    for (size_t i1 = 0; i1 < n_mult; i1++, z_ptr += 20, xyz_ptr += 3) {
        //that should only compute integrals for the first point
        MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, 0);
        for (int i = 0; i < NB2; i++) {
            //dipole
            V[i] -= Z[i+1*NB2car]*z_ptr[1] +
                    Z[i+2*NB2car]*z_ptr[2] +
                    Z[i+3*NB2car]*z_ptr[3];
            //quadrupole
            V[i] -= (   Z[i+nxx*NB2car]*z_ptr[4]
                        +   Z[i+nyy*NB2car]*z_ptr[5]
                        +   Z[i+nzz*NB2car]*z_ptr[6]
                        + 2*Z[i+nxy*NB2car]*z_ptr[7]
                        + 2*Z[i+nxz*NB2car]*z_ptr[8]
                        + 2*Z[i+nyz*NB2car]*z_ptr[9]) / 3.0;
            //octupole
            V[i] -= (   Z[i+nxxx*NB2car]*z_ptr[10]
                        +   Z[i+nyyy*NB2car]*z_ptr[11]
                        +   Z[i+nzzz*NB2car]*z_ptr[12]
                        + 3*Z[i+nxxy*NB2car]*z_ptr[13]
                        + 3*Z[i+nxxz*NB2car]*z_ptr[14]
                        + 3*Z[i+nxyy*NB2car]*z_ptr[15]
                        + 3*Z[i+nyyz*NB2car]*z_ptr[16]
                        + 3*Z[i+nxzz*NB2car]*z_ptr[17]
                        + 3*Z[i+nyzz*NB2car]*z_ptr[18]
                        + 6*Z[i+nxyz*NB2car]*z_ptr[19]) / 15.0;
        }
    }
    VRadd(h, h, V, NB2);

    QFree(V);
    QFree(Z);

    delete[] mult;
    delete[] xyz_mult;
    delete[] z_c;
    delete[] xyz_c;
    delete[] ai_screen;
}
*/

void EFP2::update_mult_ints(double *h, INTEGER code)
{
    impl_->user_data.code = code;  // save code value for future use
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_ELEC) == 0 || rem_read(REM_EFP_ORDER) != 2)
        return;
    printf(" Compute multipole integrals in update_mult_ints_new() \n");
    INTEGER NB2 = rem_read(REM_NB2);

    ShlPrs S2(code);
    double *V, *Z0, *Z;
    INTEGER K0, Kmax;
    INTEGER NB2car = S2.getNB2car();
    V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
    VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

    //find quadrupoles indices in Z array
    int nxx, nyy, nzz, nxy, nxz, nyz;
    KonL2K(&nxx, 2, 0, 0);
    KonL2K(&nyy, 0, 2, 0);
    KonL2K(&nzz, 0, 0, 2);
    KonL2K(&nxy, 1, 1, 0);
    KonL2K(&nxz, 1, 0, 1);
    KonL2K(&nyz, 0, 1, 1);
    nxx--; nyy--; nzz--; nxy--; nxz--; nyz--;

    //find ocupole indices in Z array
    int nxxx, nyyy, nzzz, nxxy, nxxz, nxyy, nyyz, nxzz, nyzz, nxyz;
    KonL2K(&nxxx, 3, 0, 0);
    KonL2K(&nyyy, 0, 3, 0);
    KonL2K(&nzzz, 0, 0, 3);
    KonL2K(&nxxy, 2, 1, 0);
    KonL2K(&nxxz, 2, 0, 1);
    KonL2K(&nxyy, 1, 2, 0);
    KonL2K(&nyyz, 0, 2, 1);
    KonL2K(&nxzz, 1, 0, 2);
    KonL2K(&nyzz, 0, 1, 2);
    KonL2K(&nxyz, 1, 1, 1);
    nxxx--;nyyy--;nzzz--;nxxy--;nxxz--;
    nxyy--;nyyz--;nxzz--;nyzz--;nxyz--;

    // storage for rank=0 (charge) integrals
    K0 = LFuncC(0, 0);
    Z0 = QAllocDouble(K0 * NB2car);

    size_t n_frag;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    for (size_t i = 0; i < n_frag; i++) {

        size_t n_pt;
        check_fail(efp_get_frag_multipole_count(impl_->efp, i, &n_pt));

        // compute integrals based on the highest rank of multipoles in fragment:
        // 0 - charge, 1 - dipole, 2 - quad, 3 - oct
        size_t rank;
        check_fail(efp_get_frag_rank(impl_->efp, i, &rank));
        Kmax = LFuncC(0, rank);
        Z = QAllocDouble(Kmax * NB2car);

        for (size_t j = 0; j < n_pt; j++) {

            struct efp_mult_pt *pt;
            check_fail(efp_get_frag_mult_pt(impl_->efp, i, j, pt));

            double xyz[3] = {pt->x, pt->y, pt->z};

            double qi;
            // compute integrals with screened monopoles separately
            if (pt->if_screen0)
                qi = pt->znuc;
            else
                qi = pt->znuc + pt->monopole;

            // all multipoles - no screening
            MakeFld(Z, xyz, rank, S2.code(), S2, 0);
            for (int i = 0; i < NB2; i++) {
                // charge-monopole
                V[i] += Z[i] * qi;
                //dipole
                if (rank > 0)
                    V[i] -= Z[i + 1 * NB2car] * pt->dipole[0] +
                            Z[i + 2 * NB2car] * pt->dipole[1] +
                            Z[i + 3 * NB2car] * pt->dipole[2];
                //quadrupole
                if (rank > 1)
                    V[i] -= (Z[i + nxx * NB2car] * pt->quadrupole[0]
                             + Z[i + nyy * NB2car] * pt->quadrupole[1]
                             + Z[i + nzz * NB2car] * pt->quadrupole[2]
                             + 2 * Z[i + nxy * NB2car] * pt->quadrupole[3]
                             + 2 * Z[i + nxz * NB2car] * pt->quadrupole[4]
                             + 2 * Z[i + nyz * NB2car] * pt->quadrupole[5]) / 3.0;
                //octupole
                if (rank > 2)
                    V[i] -= (Z[i + nxxx * NB2car] * pt->octupole[0]
                             + Z[i + nyyy * NB2car] * pt->octupole[1]
                             + Z[i + nzzz * NB2car] * pt->octupole[2]
                             + 3 * Z[i + nxxy * NB2car] * pt->octupole[3]
                             + 3 * Z[i + nxxz * NB2car] * pt->octupole[4]
                             + 3 * Z[i + nxyy * NB2car] * pt->octupole[5]
                             + 3 * Z[i + nyyz * NB2car] * pt->octupole[6]
                             + 3 * Z[i + nxzz * NB2car] * pt->octupole[7]
                             + 3 * Z[i + nyzz * NB2car] * pt->octupole[8]
                             + 6 * Z[i + nxyz * NB2car] * pt->octupole[9]) / 15.0;
            }

            // second call for integrals - taking care of screened monopoles
            if (pt->if_screen0) {

                double screen = pt->screen0;
                double q_mon = pt->monopole;

                MakeFld(Z, xyz, 0, S2.code(), S2, screen);
                for (int i = 0; i < NB2; i++) {
                    // charge-monopole
                    V[i] += Z[i] * q_mon;
                }
            }
        }
        QFree(Z);
    }

    VRadd(h, h, V, NB2);
    QFree(Z0);
    QFree(V);
}


void EFP2::update_pol_ints(double *h, INTEGER code)
{
    impl_->user_data.code = code;

    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_ELEC) == 0 || rem_read(REM_EFP_ORDER) != 2)
        return;
    printf("Compute polarization integrals \n");
    INTEGER NB2 = rem_read(REM_NB2);

    /*
    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    threading_policy::pop();

    if ((rem_read(REM_USE_LIBQINTS) != 0 && dev.nthreads > 1) || (rem_read(REM_USE_LIBQINTS) > 0)) // && rem_read(REM_EFP_PAIRWISE) == 0)
    {
        update_wf_qints(h, code);
        return;
    }
*/
    size_t n_frag;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    ShlPrs S2(code);
    double *V, *Z;
    INTEGER Kmax;
    INTEGER NB2car = S2.getNB2car();
    V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
    VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

    // induced dipoles
    size_t n_id;
    check_fail(efp_get_induced_dipole_count(impl_->efp, &n_id));
    double *xyz_id = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_coordinates(impl_->efp, xyz_id));
    double *id = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_values(impl_->efp, id));
    double *idt = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_conj_values(impl_->efp, idt));

    Kmax = LFuncC(0, 1);
    Z = QAllocDouble(Kmax * NB2car);

    double *xyz_ptr;
    xyz_ptr = xyz_id;
    for (size_t j1 = 0; j1 < n_id; j1++, xyz_ptr += 3) {
        //that should only compute integrals for the first point
        MakeFld(Z, xyz_ptr, 1, S2.code(), S2, 0);
        for (int i = 0; i < NB2; i++) {
            //dipole
            V[i] -= 0.5 * (Z[i+1*NB2car] * (id[j1 * 3 + 0] +
                                            idt[j1 * 3 + 0]) +
                           Z[i+2*NB2car] * (id[j1 * 3 + 1] +
                                            idt[j1 * 3 + 1]) +
                           Z[i+3*NB2car] * (id[j1 * 3 + 2] +
                                            idt[j1 * 3 + 2]));
        }
    }
    VRadd(h, h, V, NB2);

    QFree(V);
    QFree(Z);
    delete[] id;
    delete[] idt;
    delete[] xyz_id;
}

/*
void EFP2::update_pol_ints(double *h, INTEGER code)
{
    impl_->user_data.code = code;
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_ELEC) == 0 || rem_read(REM_EFP_ORDER) != 2)
        return;
    printf("Compute polarization integrals \n");
    INTEGER NB2 = rem_read(REM_NB2);


    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    threading_policy::pop();

    if ((rem_read(REM_USE_LIBQINTS) != 0 && dev.nthreads > 1) || (rem_read(REM_USE_LIBQINTS) > 0)) // && rem_read(REM_EFP_PAIRWISE) == 0)
    {
        update_wf_qints(h, code);
        return;
    }

    size_t n_frag;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    ShlPrs S2(code);
    double *V, *Z;
    INTEGER LXmax, Kmax;
    INTEGER NB2car = S2.getNB2car();
    V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
    VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

    // induced dipoles
    size_t n_id;
    check_fail(efp_get_induced_dipole_count(impl_->efp, &n_id));
    double *xyz_id = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_coordinates(impl_->efp, xyz_id));
    double *id = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_values(impl_->efp, id));
    double *idt = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_conj_values(impl_->efp, idt));

    LXmax = 1;
    Kmax = LFuncC(0, LXmax);
    Z = QAllocDouble(Kmax * NB2car);

    double *xyz_ptr;
    xyz_ptr = xyz_id;
    for (size_t j1 = 0; j1 < n_id; j1++, xyz_ptr += 3) {
        //that should only compute integrals for the first point
        MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, 0);
        for (int i = 0; i < NB2; i++) {
            //dipole
            V[i] -= 0.5 * (Z[i+1*NB2car] * (id[j1 * 3 + 0] +
                                            idt[j1 * 3 + 0]) +
                           Z[i+2*NB2car] * (id[j1 * 3 + 1] +
                                            idt[j1 * 3 + 1]) +
                           Z[i+3*NB2car] * (id[j1 * 3 + 2] +
                                            idt[j1 * 3 + 2]));
        }
    }
    VRadd(h, h, V, NB2);

    QFree(V);
    QFree(Z);
    delete[] id;
    delete[] idt;
    delete[] xyz_id;
}
*/

/*
void EFP2::update_wf(double *h, INTEGER code)
{
    impl_->user_data.code = code;
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_ELEC) == 0 || rem_read(REM_EFP_ORDER) != 2)
        return;
    printf("\n In update_wf() \n");

    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    threading_policy::pop();
    INTEGER NB2 = rem_read(REM_NB2);

    if ((rem_read(REM_USE_LIBQINTS) != 0 && dev.nthreads > 1) || (rem_read(REM_USE_LIBQINTS) > 0)) // && rem_read(REM_EFP_PAIRWISE) == 0)
    {
        update_wf_qints(h, code);
        return;
    }

    size_t n_mult;
    check_fail(efp_get_multipole_count(impl_->efp, &n_mult));
    double *xyz_mult = new double[n_mult * 3];
    check_fail(efp_get_multipole_coordinates(impl_->efp, xyz_mult));
    double *mult = new double[n_mult * (1 + 3 + 6 + 10)];
    check_fail(efp_get_multipole_values(impl_->efp, mult));

    size_t n_frag;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    size_t n_atoms = 0;
    for (size_t i = 0; i < n_frag; i++) {
        size_t nat;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
        n_atoms += nat;
    }

    double *z_ptr, *xyz_ptr, *ai_screen_ptr, *ai_screen_ptr2;

    INTEGER n_charges = n_atoms + n_mult;
    double *z_c = new double[n_charges];
    double *xyz_c = new double[3 * n_charges];
    double *ai_screen = new double[n_charges];

    memset(ai_screen, 0, n_charges * sizeof(double));

    for (size_t i = 0; i < n_mult; i++) {
        z_c[i] = mult[i * 20];
        xyz_c[3 * i + 0] = xyz_mult[3 * i + 0];
        xyz_c[3 * i + 1] = xyz_mult[3 * i + 1];
        xyz_c[3 * i + 2] = xyz_mult[3 * i + 2];
    }

    z_ptr = z_c + n_mult;
    xyz_ptr = xyz_c + n_mult * 3;
    ai_screen_ptr = ai_screen;
    ai_screen_ptr2 = ai_screen + n_mult;

    for (size_t i = 0; i < n_frag; i++) {
        size_t nat, nfragmult;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));

        struct efp_atom *atoms = new struct efp_atom[nat];
        check_fail(efp_get_frag_atoms(impl_->efp, i, nat, atoms));

        check_fail(efp_get_frag_multipole_count(impl_->efp, i,
            &nfragmult));
        if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0) {
            check_fail(efp_get_ai_screen(impl_->efp, i,
                ai_screen_ptr));
        }

        for (size_t j = 0; j < nat; j++) {
            *z_ptr++ = atoms[j].znuc;
            *xyz_ptr++ = atoms[j].x;
            *xyz_ptr++ = atoms[j].y;
            *xyz_ptr++ = atoms[j].z;
        }

        ai_screen_ptr += nfragmult;
        delete[] atoms;
    }

    ShlPrs S2(code);
    double *V, *Z;
    INTEGER LXmax, Kmax;
    INTEGER NB2car = S2.getNB2car();
    V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
    VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

    LXmax = 0;
    Kmax = LFuncC(0, LXmax);
    Z = QAllocDouble(Kmax * NB2car);

    // charges
    xyz_ptr = xyz_c;
    for (size_t j1 = 0; j1 < n_charges; j1++, xyz_ptr += 3) {
        double damp = ai_screen[j1];
        //that should only compute integrals for the first point
        MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, 0.0);

        for (int i = 0; i < NB2; i++) {
            V[i] -= Z[i] * z_c[j1];
        }

        if (damp > 1.0e-6) {
            MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, damp);
            for (int i = 0; i < NB2; i++) {
                V[i] += Z[i] * z_c[j1];
            }
        }
    }
    QFree(Z);

    // induced dipoles
    size_t n_id;
    check_fail(efp_get_induced_dipole_count(impl_->efp, &n_id));
    double *xyz_id = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_coordinates(impl_->efp, xyz_id));
    double *id = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_values(impl_->efp, id));
    double *idt = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_conj_values(impl_->efp, idt));

    LXmax = 1;
    Kmax = LFuncC(0, LXmax);
    Z = QAllocDouble(Kmax * NB2car);

    xyz_ptr = xyz_id;
    for (size_t j1 = 0; j1 < n_id; j1++, xyz_ptr += 3) {
        //that should only compute integrals for the first point
        MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, 0);
        for (int i = 0; i < NB2; i++) {
            //dipole
            V[i] -= 0.5 * (Z[i+1*NB2car] * (id[j1 * 3 + 0] +
                            idt[j1 * 3 + 0]) +
                       Z[i+2*NB2car] * (id[j1 * 3 + 1] +
                            idt[j1 * 3 + 1]) +
                       Z[i+3*NB2car] * (id[j1 * 3 + 2] +
                            idt[j1 * 3 + 2]));
        }
    }
    QFree(Z);

    // dipoles, quadrupoles, octupoles
    LXmax = 3;
    Kmax = LFuncC(0, LXmax);
    Z = QAllocDouble(Kmax * NB2car);

    //find quadrupoles indices in Z array
    int nxx, nyy, nzz, nxy, nxz, nyz;
    KonL2K(&nxx, 2, 0, 0);
    KonL2K(&nyy, 0, 2, 0);
    KonL2K(&nzz, 0, 0, 2);
    KonL2K(&nxy, 1, 1, 0);
    KonL2K(&nxz, 1, 0, 1);
    KonL2K(&nyz, 0, 1, 1);
    nxx--; nyy--; nzz--; nxy--; nxz--; nyz--;

    //find ocupole indices in Z array
    int nxxx, nyyy, nzzz, nxxy, nxxz, nxyy, nyyz, nxzz, nyzz, nxyz;
    KonL2K(&nxxx, 3, 0, 0);
    KonL2K(&nyyy, 0, 3, 0);
    KonL2K(&nzzz, 0, 0, 3);
    KonL2K(&nxxy, 2, 1, 0);
    KonL2K(&nxxz, 2, 0, 1);
    KonL2K(&nxyy, 1, 2, 0);
    KonL2K(&nyyz, 0, 2, 1);
    KonL2K(&nxzz, 1, 0, 2);
    KonL2K(&nyzz, 0, 1, 2);
    KonL2K(&nxyz, 1, 1, 1);
    nxxx--;nyyy--;nzzz--;nxxy--;nxxz--;
    nxyy--;nyyz--;nxzz--;nyzz--;nxyz--;

    z_ptr = mult, xyz_ptr = xyz_mult;
    for (size_t i1 = 0; i1 < n_mult; i1++, z_ptr += 20, xyz_ptr += 3) {
        //that should only compute integrals for the first point
        MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, 0);
        for (int i = 0; i < NB2; i++) {
            //dipole
            V[i] -= Z[i+1*NB2car]*z_ptr[1] +
                Z[i+2*NB2car]*z_ptr[2] +
                Z[i+3*NB2car]*z_ptr[3];
            //quadrupole
            V[i] -= (   Z[i+nxx*NB2car]*z_ptr[4]
                +   Z[i+nyy*NB2car]*z_ptr[5]
                +   Z[i+nzz*NB2car]*z_ptr[6]
                + 2*Z[i+nxy*NB2car]*z_ptr[7]
                + 2*Z[i+nxz*NB2car]*z_ptr[8]
                + 2*Z[i+nyz*NB2car]*z_ptr[9]) / 3.0;
            //octupole
            V[i] -= (   Z[i+nxxx*NB2car]*z_ptr[10]
                +   Z[i+nyyy*NB2car]*z_ptr[11]
                +   Z[i+nzzz*NB2car]*z_ptr[12]
                + 3*Z[i+nxxy*NB2car]*z_ptr[13]
                + 3*Z[i+nxxz*NB2car]*z_ptr[14]
                + 3*Z[i+nxyy*NB2car]*z_ptr[15]
                + 3*Z[i+nyyz*NB2car]*z_ptr[16]
                + 3*Z[i+nxzz*NB2car]*z_ptr[17]
                + 3*Z[i+nyzz*NB2car]*z_ptr[18]
                + 6*Z[i+nxyz*NB2car]*z_ptr[19]) / 15.0;
        }
    }
    VRadd(h, h, V, NB2);

    QFree(V);
    QFree(Z);

    delete[] mult;
    delete[] xyz_mult;
    delete[] z_c;
    delete[] xyz_c;
    delete[] id;
    delete[] idt;
    delete[] xyz_id;
    delete[] ai_screen;
}
*/

void EFP2::update_qm_atoms()
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_ELEC) == 0)
        return;

    double *jA, *nucChg;
    INTEGER *iAtNo, NAtoms;

    get_carts(NULL, &jA, &iAtNo, &NAtoms);
    nucChg = effectiveNucCharges();

    check_fail(efp_set_point_charges(impl_->efp, NAtoms, nucChg, jA));
}

inline static void dgemm_wrap(char transa, char transb, INTEGER m, INTEGER n,
    INTEGER k, double alpha, const double *a, INTEGER lda, const double *b,
    INTEGER ldb, double beta, double *c, INTEGER ldc)
{
    dgemm(&transa, &transb, &m, &n, &k, &alpha, (double *)a, &lda,
        (double *)b, &ldb, &beta, c, &ldc);
}

// converts dipole integrals from AO basis to MO basis
// only [act * virt] block of MOs is used
static void convert_dipole_ints(int n_basis, const double *dipole_ints_ao,
    double *dipole_ints_mo)
{
    // MO coefficients
    // coefficients for the first MO are first n_basis doubles, and so on
    double *mo_c = (double *)calloc(n_basis * n_basis, sizeof(double));
    FileMan(FM_READ, FILE_MO_COEFS, FM_DP, n_basis * n_basis, 0,
        FM_BEG, mo_c);

    double *tmp1 = (double *)malloc(n_basis * n_basis * sizeof(double));

    for (int a = 0; a < 3; a++) {
        dgemm_wrap('t', 'n', n_basis, n_basis, n_basis, 1.0, mo_c,
            n_basis, dipole_ints_ao, n_basis, 0.0, tmp1, n_basis);
        dgemm_wrap('n', 'n', n_basis, n_basis, n_basis, 1.0, tmp1,
            n_basis, mo_c, n_basis, 0.0, dipole_ints_mo, n_basis);
        dipole_ints_ao += n_basis * n_basis;
        dipole_ints_mo += n_basis * n_basis;
    }

    free(tmp1);
    free(mo_c);
}

// gets dipole integrals in AO basis
// dipole_ints_ao[3 * n_basis * n_basis]
static void get_dipole_ints_ao(size_t n_basis, double *dipole_ints_ao)
{
    int nb2 = rem_read(REM_NB2);
    double *tmp = (double *)calloc(nb2, sizeof(double));

    FileMan_Open_Read(FILE_MULT_MATRIX);
    // x
    FileMan(FM_READ, FILE_MULT_MATRIX, FM_DP, nb2, nb2, FM_BEG, tmp);
    // vectorized matrix -> square matrix
    ScaV2M(dipole_ints_ao, tmp, TRUE, TRUE);

    // y
    FileMan(FM_READ, FILE_MULT_MATRIX, FM_DP, nb2, 2 * nb2, FM_BEG, tmp);
    // vectorized matrix -> square matrix
    ScaV2M(dipole_ints_ao + n_basis * n_basis, tmp, TRUE, TRUE);

    // z
    FileMan(FM_READ, FILE_MULT_MATRIX, FM_DP, nb2, 3 * nb2, FM_BEG, tmp);
    // vectorized matrix -> square matrix
    ScaV2M(dipole_ints_ao + 2 * n_basis * n_basis, tmp, TRUE, TRUE);

    FileMan(FM_CLOSE,FILE_MULT_MATRIX,0,0,0,0,0);
    free(tmp);
}

static size_t get_num_core(void)
{
    INTEGER n_core_a = 0, n_core_b = 0;
    ncoree(&n_core_a, &n_core_b);
    return ((size_t)n_core_a);
}

void EFP2::setup_aiefp_dispersion(void)
{
    double *oe, *dipint_ao, *dipint_mo;
    size_t n_basis, n_core, n_act, n_vir;

    if (!rem_read(REM_EFP_QM_DISP))
        return;

    n_basis = (size_t)bSetMgr.crntShlsStats(STAT_NBASIS);
    n_core = get_num_core();
    n_act = (size_t)rem_read(REM_NALPHA) - n_core;
    n_vir = n_basis - (n_act + n_core);

    oe = (double *)calloc(n_basis, sizeof(double));
    FileMan(FM_READ, FILE_MO_COEFS, FM_DP, n_basis, 2 * n_basis * n_basis,
        FM_BEG, oe);

    dipint_ao = (double *)calloc(3 * n_basis * n_basis, sizeof(double));
    get_dipole_ints_ao(n_basis, dipint_ao);

    dipint_mo = (double *)calloc(3 * n_basis * n_basis, sizeof(double));
    convert_dipole_ints(n_basis, dipint_ao, dipint_mo);

    check_fail(efp_set_orbital_energies(impl_->efp, n_core, n_act,
        n_vir, oe));
    check_fail(efp_set_dipole_integrals(impl_->efp, n_core, n_act,
        n_vir, dipint_mo));

    free(oe);
    free(dipint_ao);
    free(dipint_mo);
}

void EFP2::compute(int do_grad)
{
    check_fail(efp_compute(impl_->efp, do_grad));
}

double EFP2::get_wf_dependent_energy(double *w, double n_elem)
{
	double energy = 0.0;
    if (rem_read(REM_EFP_ORDER) != 0) {
    	size_t size = n_elem * sizeof(double);
	    impl_->user_data.qm_field_save = NULL;
	    impl_->user_data.density_matrix =
	        (double *)realloc(impl_->user_data.density_matrix, size);
	    memcpy(impl_->user_data.density_matrix, w, size);
	    impl_->user_data.dm_size = n_elem;
        check_fail(efp_set_electron_density_field_user_data(impl_->efp,
                                                            &impl_->user_data));
        check_fail(efp_get_wavefunction_dependent_energy(impl_->efp, &energy));
        check_fail(efp_get_induced_dipole_values(impl_->efp, impl_->id_gs));
        check_fail(efp_get_induced_dipole_conj_values(impl_->efp,
                                                      impl_->idt_gs));
    }

    impl_->wf_dep_energy_gs = energy;

    return energy;
}

double EFP2::get_total_energy()
{
    struct efp_energy energy;

    check_fail(efp_get_energy(impl_->efp, &energy));

    return energy.total;
}

//void EFP2::get_pairwise_energy(double *densityMatrix, size_t n_elem, double *Escf)
void EFP2::get_pairwise_energy(double Estate, int if_excited)
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY)  || !rem_read(REM_EFP_PAIRWISE) || rem_read(REM_EFP_ORDER) == 0)
        return;

    INTEGER NB2 = rem_read(REM_NB2);

    double *densityMatrix2;
    if (impl_->user_data.density_matrix != NULL)
        densityMatrix2 = impl_->user_data.density_matrix;
    else
        printf("density matrix is empty");

    if (if_excited == 0) {  // ground state
        impl_->Escf = Estate;
        impl_->state_energy = Estate;
    }
    else   // excited state
        impl_->state_energy = impl_->Escf + Estate;

    size_t n_frag;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    struct efp_energy *pair_energies = new struct efp_energy[n_frag];
    check_fail(efp_get_pairwise_energy(impl_->efp, pair_energies));

    // energy of QM-EFP integrals
    double Eint = 0.0;

    INTEGER code = impl_->user_data.code;
    ShlPrs S2(code);
    double *V, *Z, *Z0;
    INTEGER K0, Kmax;
    INTEGER NB2car = S2.getNB2car();
    V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
    //VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

    // charges
    K0 = LFuncC(0, 0);
    Z = QAllocDouble(K0 * NB2car);

    //find quadrupoles indices in Z array
    int nxx, nyy, nzz, nxy, nxz, nyz;
    KonL2K(&nxx, 2, 0, 0);
    KonL2K(&nyy, 0, 2, 0);
    KonL2K(&nzz, 0, 0, 2);
    KonL2K(&nxy, 1, 1, 0);
    KonL2K(&nxz, 1, 0, 1);
    KonL2K(&nyz, 0, 1, 1);
    nxx--; nyy--; nzz--; nxy--; nxz--; nyz--;

    //find ocupole indices in Z array
    int nxxx, nyyy, nzzz, nxxy, nxxz, nxyy, nyyz, nxzz, nyzz, nxyz;
    KonL2K(&nxxx, 3, 0, 0);
    KonL2K(&nyyy, 0, 3, 0);
    KonL2K(&nzzz, 0, 0, 3);
    KonL2K(&nxxy, 2, 1, 0);
    KonL2K(&nxxz, 2, 0, 1);
    KonL2K(&nxyy, 1, 2, 0);
    KonL2K(&nyyz, 0, 2, 1);
    KonL2K(&nxzz, 1, 0, 2);
    KonL2K(&nyzz, 0, 1, 2);
    KonL2K(&nxyz, 1, 1, 1);
    nxxx--;nyyy--;nzzz--;nxxy--;nxxz--;
    nxyy--;nyyz--;nxzz--;nyzz--;nxyz--;

    for (size_t i = 0; i < n_frag; i++) {
        VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

        size_t n_pt;
        check_fail(efp_get_frag_multipole_count(impl_->efp, i, &n_pt));

        // compute integrals based on the highest rank of multipoles in fragment:
        // 0 - charge, 1 - dipole, 2 - quad, 3 - oct
        size_t rank;
        check_fail(efp_get_frag_rank(impl_->efp, i, &rank));
        Kmax = LFuncC(0, rank);
        Z = QAllocDouble(Kmax * NB2car);

        for (size_t j = 0; j < n_pt; j++) {

            struct efp_mult_pt *pt;
            check_fail(efp_get_frag_mult_pt(impl_->efp, i, j, pt));

            double xyz[3] = {pt->x, pt->y, pt->z};

            double qi;
            // compute integrals with screened monopoles separately
            if (pt->if_screen0)
                qi = pt->znuc;
            else
                qi = pt->znuc + pt->monopole;

            // all multipoles - no screening
            MakeFld(Z, xyz, rank, S2.code(), S2, 0);
            for (int i = 0; i < NB2; i++) {
                // charge-monopole
                V[i] += Z[i] * qi;
                //dipole
                if (rank > 0)
                    V[i] -= Z[i + 1 * NB2car] * pt->dipole[0] +
                            Z[i + 2 * NB2car] * pt->dipole[1] +
                            Z[i + 3 * NB2car] * pt->dipole[2];
                //quadrupole
                if (rank > 1)
                    V[i] -= (Z[i + nxx * NB2car] * pt->quadrupole[0]
                             + Z[i + nyy * NB2car] * pt->quadrupole[1]
                             + Z[i + nzz * NB2car] * pt->quadrupole[2]
                             + 2 * Z[i + nxy * NB2car] * pt->quadrupole[3]
                             + 2 * Z[i + nxz * NB2car] * pt->quadrupole[4]
                             + 2 * Z[i + nyz * NB2car] * pt->quadrupole[5]) / 3.0;
                //octupole
                if (rank > 2)
                    V[i] -= (Z[i + nxxx * NB2car] * pt->octupole[0]
                             + Z[i + nyyy * NB2car] * pt->octupole[1]
                             + Z[i + nzzz * NB2car] * pt->octupole[2]
                             + 3 * Z[i + nxxy * NB2car] * pt->octupole[3]
                             + 3 * Z[i + nxxz * NB2car] * pt->octupole[4]
                             + 3 * Z[i + nxyy * NB2car] * pt->octupole[5]
                             + 3 * Z[i + nyyz * NB2car] * pt->octupole[6]
                             + 3 * Z[i + nxzz * NB2car] * pt->octupole[7]
                             + 3 * Z[i + nyzz * NB2car] * pt->octupole[8]
                             + 6 * Z[i + nxyz * NB2car] * pt->octupole[9]) / 15.0;
            }

            // second call for integrals - taking care of screened monopoles
            if (pt->if_screen0) {

                double screen = pt->screen0;
                double q_mon = pt->monopole;

                MakeFld(Z, xyz, 0, S2.code(), S2, screen);
                for (int i = 0; i < NB2; i++) {
                    // charge-monopole
                    V[i] += Z[i] * q_mon;
                }
            }
        }
        QFree(Z);

        /*
        printf("\n V ints \n");
        for (int k= 0; k<NB2car; k++) {
            printf(" %lf ", V[k]);
        } */
        double ene_tmp = 0.0;
        //printf("size of density matrix %d, size of V %d\n", size, (NB2car > NB2 ? NB2car : NB2));
        VMtrace(&ene_tmp, densityMatrix2, V, TRUE);
        //printf("elec pair_energy %lf\n",ene_tmp);
        // efp_order = 1:  <psi_0 | V_elec | psi_0 > is a purely electrostatic component
        // efp_order = 2:  <psi_sol | V_elec | psi_sol > includes electrostatics and solute polarization
        // POTENTIAL BUG: maybe need to clean pair_energies properly...
        pair_energies[fr_i].ai_electrostatic = ene_tmp;
        Eint += ene_tmp;
    }
    QFree(Z0);

    // only do polarization integrals for efp_order = 2
    if (rem_read(REM_EFP_ORDER) == 2) {
        // induced dipoles
        size_t n_id;
        check_fail(efp_get_induced_dipole_count(impl_->efp, &n_id));
        double *xyz_id = new double[n_id * 3];
        check_fail(efp_get_induced_dipole_coordinates(impl_->efp, xyz_id));
        // Get induced dipoles from the ground state (aka old)
        double *id = new double[n_id * 3];
        check_fail(efp_get_old_induced_dipole_values(impl_->efp, id));
        double *idt = new double[n_id * 3];
        check_fail(efp_get_old_induced_dipole_conj_values(impl_->efp, idt));

        Kmax = LFuncC(0, 1);
        Z = QAllocDouble(Kmax * NB2car);

        xyz_ptr = xyz_id;
        int dip_count = 0;
        for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {
            VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);
            size_t ndip;
            check_fail(efp_get_frag_induced_dipole_count(impl_->efp, fr_i, &ndip));

            for (size_t j1 = 0; j1 < ndip; j1++, xyz_ptr += 3) {
                MakeFld(Z, xyz_ptr, 1, S2.code(), S2, 0);
                for (int i = 0; i < NB2; i++) {
                    //dipole
                    V[i] -= 0.5 * (Z[i + 1 * NB2car] * (id[(dip_count+j1) * 3 + 0] + idt[(dip_count+j1) * 3 + 0]) +
                                   Z[i + 2 * NB2car] * (id[(dip_count+j1) * 3 + 1] + idt[(dip_count+j1) * 3 + 1]) +
                                   Z[i + 3 * NB2car] * (id[(dip_count+j1) * 3 + 2] + idt[(dip_count+j1) * 3 + 2]));
                }
            }
            dip_count += ndip;

            double ene_tmp = 0.0;
            VMtrace(&ene_tmp, densityMatrix2, V, TRUE);
            //printf("pol pair energy %lf\n", ene_tmp);
            pair_energies[fr_i].ai_polarization = ene_tmp;
            Eint += ene_tmp;
        }
        QFree(Z);
        delete[] id;
        delete[] idt;
        delete[] xyz_id;
    }
    QFree(V);
    check_fail(efp_set_pairwise_energy(impl_->efp, pair_energies));
    delete[] pair_energies;

    impl_->integral_ene = Eint;
}

/*
void EFP2::get_pairwise_energy(double Estate, int if_excited)
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY)  || !rem_read(REM_EFP_PAIRWISE) || rem_read(REM_EFP_ORDER) == 0)
        return;

    INTEGER NB2 = rem_read(REM_NB2);

    double *densityMatrix2;
    if (impl_->user_data.density_matrix != NULL)
        densityMatrix2 = impl_->user_data.density_matrix;
    else
        printf("density matrix is empty");

    if (if_excited == 0) {  // ground state
        impl_->Escf = Estate;
        impl_->state_energy = Estate;
    }
    else   // excited state
        impl_->state_energy = impl_->Escf + Estate;

    size_t n_mult;
    check_fail(efp_get_multipole_count(impl_->efp, &n_mult));
    double *xyz_mult = new double[n_mult * 3];
    check_fail(efp_get_multipole_coordinates(impl_->efp, xyz_mult));
    double *mult = new double[n_mult * (1 + 3 + 6 + 10)];
    check_fail(efp_get_multipole_values(impl_->efp, mult));
    double *ai_screen = new double[n_mult];
    memset(ai_screen, 0, n_mult * sizeof(double));

    size_t n_frag;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    size_t n_atoms = 0;
    for (size_t i = 0; i < n_frag; i++) {
        size_t nat;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
        n_atoms += nat;
    }

    double *z_atom = new double[n_atoms];
    double *xyz_atom = new double [n_atoms * 3];
    //double *ai_screen_ptr;
    //ai_screen_ptr = ai_screen;
    int nat_count = 0;
    int screen_count = 0;
    for (size_t i = 0; i < n_frag; i++) {
        size_t nat, nfragmult;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
        check_fail(efp_get_frag_multipole_count(impl_->efp, i, &nfragmult));

        struct efp_atom *atoms = new struct efp_atom[nat];
        check_fail(efp_get_frag_atoms(impl_->efp, i, nat, atoms));

        for (size_t j = 0; j < nat; j++) {
            z_atom[j + nat_count] = atoms[j].znuc;
            xyz_atom[j*3 + 0 + nat_count*3] = atoms[j].x;
            xyz_atom[j*3 + 1 + nat_count*3] = atoms[j].y;
            xyz_atom[j*3 + 2 + nat_count*3] = atoms[j].z;
        }

        if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0) {
            check_fail(efp_get_ai_screen(impl_->efp, i, ai_screen + screen_count));
        }
        //ai_screen_ptr += nfragmult;
        nat_count += nat;
        screen_count += nfragmult;
        delete[] atoms;
    }

    struct efp_energy *pair_energies = new struct efp_energy[n_frag];
    check_fail(efp_get_pairwise_energy(impl_->efp, pair_energies));

    // energy of QM-EFP integrals
    double Eint = 0.0;

    INTEGER code = impl_->user_data.code;
    ShlPrs S2(code);
    double *V, *Z, *Z3;
    INTEGER LXmax, Kmax;
    INTEGER NB2car = S2.getNB2car();
    V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
    //VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

    // charges
    LXmax = 0;
    Kmax = LFuncC(0, LXmax);
    Z = QAllocDouble(Kmax * NB2car);

    // multipoles up to octupoles
    LXmax = 3;
    Kmax = LFuncC(0, LXmax);
    Z3 = QAllocDouble(Kmax * NB2car);

    //find quadrupoles indices in Z array
    int nxx, nyy, nzz, nxy, nxz, nyz;
    KonL2K(&nxx, 2, 0, 0);
    KonL2K(&nyy, 0, 2, 0);
    KonL2K(&nzz, 0, 0, 2);
    KonL2K(&nxy, 1, 1, 0);
    KonL2K(&nxz, 1, 0, 1);
    KonL2K(&nyz, 0, 1, 1);
    nxx--; nyy--; nzz--; nxy--; nxz--; nyz--;

    //find ocupole indices in Z array
    int nxxx, nyyy, nzzz, nxxy, nxxz, nxyy, nyyz, nxzz, nyzz, nxyz;
    KonL2K(&nxxx, 3, 0, 0);
    KonL2K(&nyyy, 0, 3, 0);
    KonL2K(&nzzz, 0, 0, 3);
    KonL2K(&nxxy, 2, 1, 0);
    KonL2K(&nxxz, 2, 0, 1);
    KonL2K(&nxyy, 1, 2, 0);
    KonL2K(&nyyz, 0, 2, 1);
    KonL2K(&nxzz, 1, 0, 2);
    KonL2K(&nyzz, 0, 1, 2);
    KonL2K(&nxyz, 1, 1, 1);
    nxxx--;nyyy--;nzzz--;nxxy--;nxxz--;
    nxyy--;nyyz--;nxzz--;nyzz--;nxyz--;

    double *xyz_ptr, *mxyz_ptr, *mult_ptr;
    int ai_screen_count = 0, atom_count = 0;
    xyz_ptr = xyz_atom;
    mxyz_ptr = xyz_mult;
    mult_ptr = mult;
    for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {
        VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);
        size_t nat, nfragmult;
        check_fail(efp_get_frag_atom_count(impl_->efp, fr_i, &nat));
        check_fail(efp_get_frag_multipole_count(impl_->efp, fr_i, &nfragmult));

        // charges
        for (size_t j1 = 0; j1 < nat; j1++, xyz_ptr += 3) {
            //that should only compute integrals for the first point
            MakeFld(Z, xyz_ptr, 0, S2.code(), S2, 0.0);
            for (int i = 0; i < NB2; i++) {
                V[i] -= Z[i] * z_atom[atom_count + j1];
            }
        }
        atom_count += nat;

        for (size_t i1 = 0; i1 < nfragmult; i1++, mult_ptr += 20, mxyz_ptr += 3) {
            // trying to skip integral computing if higher multipoles are not present...
            size_t rank;
            check_fail(efp_get_frag_mult_rank(impl_->efp, fr_i, i1, &rank));

            // if higher multipoles are there
            if (rank > 0) {
                MakeFld(Z3, mxyz_ptr, 3, S2.code(), S2, 0);
                for (int i = 0; i < NB2; i++) {
                    // charges
                    V[i] -= Z3[i] * mult_ptr[0];
                    //dipole
                    V[i] -= Z3[i + 1 * NB2car] * mult_ptr[1] +
                            Z3[i + 2 * NB2car] * mult_ptr[2] +
                            Z3[i + 3 * NB2car] * mult_ptr[3];
                    //quadrupole
                    V[i] -= (Z3[i + nxx * NB2car] * mult_ptr[4]
                             + Z3[i + nyy * NB2car] * mult_ptr[5]
                             + Z3[i + nzz * NB2car] * mult_ptr[6]
                             + 2 * Z3[i + nxy * NB2car] * mult_ptr[7]
                             + 2 * Z3[i + nxz * NB2car] * mult_ptr[8]
                             + 2 * Z3[i + nyz * NB2car] * mult_ptr[9]) / 3.0;
                    //octupole
                    V[i] -= (Z3[i + nxxx * NB2car] * mult_ptr[10]
                             + Z3[i + nyyy * NB2car] * mult_ptr[11]
                             + Z3[i + nzzz * NB2car] * mult_ptr[12]
                             + 3 * Z3[i + nxxy * NB2car] * mult_ptr[13]
                             + 3 * Z3[i + nxxz * NB2car] * mult_ptr[14]
                             + 3 * Z3[i + nxyy * NB2car] * mult_ptr[15]
                             + 3 * Z3[i + nyyz * NB2car] * mult_ptr[16]
                             + 3 * Z3[i + nxzz * NB2car] * mult_ptr[17]
                             + 3 * Z3[i + nyzz * NB2car] * mult_ptr[18]
                             + 6 * Z3[i + nxyz * NB2car] * mult_ptr[19]) / 15.0;
                }
            }
                // only charges are there
            else {
                MakeFld(Z, mxyz_ptr, 0, S2.code(), S2, 0);
                for (int i = 0; i < NB2; i++) {
                    // charges
                    V[i] -= Z[i] * mult_ptr[0];
                }
            }
            // charge damping
            double damp = ai_screen[ai_screen_count + i1];
            if (damp > 1.0e-6) {
                MakeFld(Z, mxyz_ptr, 0, S2.code(), S2, damp);
                for (int i = 0; i < NB2; i++) {
                    V[i] += Z[i] * mult_ptr[0];
                }
            }
        }
        ai_screen_count += nfragmult;

        /*
        printf("\n V ints \n");
        for (int k= 0; k<NB2car; k++) {
            printf(" %lf ", V[k]);
        } */
        double ene_tmp = 0.0;
        //printf("size of density matrix %d, size of V %d\n", size, (NB2car > NB2 ? NB2car : NB2));
        VMtrace(&ene_tmp, densityMatrix2, V, TRUE);
        //printf("elec pair_energy %lf\n",ene_tmp);
        // efp_order = 1:  <psi_0 | V_elec | psi_0 > is a purely electrostatic component
        // efp_order = 2:  <psi_sol | V_elec | psi_sol > includes electrostatics and solute polarization
        // POTENTIAL BUG: maybe need to clean pair_energies properly...
        pair_energies[fr_i].ai_electrostatic = ene_tmp;
        Eint += ene_tmp;
    }
    QFree(Z);
    QFree(Z3);
    delete[] mult;
    delete[] xyz_mult;
    delete[] ai_screen;

    // only do polarization integrals for efp_order = 2
    if (rem_read(REM_EFP_ORDER) == 2) {
        // induced dipoles
        size_t n_id;
        check_fail(efp_get_induced_dipole_count(impl_->efp, &n_id));
        double *xyz_id = new double[n_id * 3];
        check_fail(efp_get_induced_dipole_coordinates(impl_->efp, xyz_id));
        // Get induced dipoles from the ground state (aka old)
        double *id = new double[n_id * 3];
        check_fail(efp_get_old_induced_dipole_values(impl_->efp, id));
        double *idt = new double[n_id * 3];
        check_fail(efp_get_old_induced_dipole_conj_values(impl_->efp, idt));

        LXmax = 1;
        Kmax = LFuncC(0, LXmax);
        Z = QAllocDouble(Kmax * NB2car);

        xyz_ptr = xyz_id;
        int dip_count = 0;
        for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {
            VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);
            size_t ndip;
            check_fail(efp_get_frag_induced_dipole_count(impl_->efp, fr_i, &ndip));

            for (size_t j1 = 0; j1 < ndip; j1++, xyz_ptr += 3) {
                MakeFld(Z, xyz_ptr, LXmax, S2.code(), S2, 0);
                for (int i = 0; i < NB2; i++) {
                    //dipole
                    V[i] -= 0.5 * (Z[i + 1 * NB2car] * (id[(dip_count+j1) * 3 + 0] + idt[(dip_count+j1) * 3 + 0]) +
                                   Z[i + 2 * NB2car] * (id[(dip_count+j1) * 3 + 1] + idt[(dip_count+j1) * 3 + 1]) +
                                   Z[i + 3 * NB2car] * (id[(dip_count+j1) * 3 + 2] + idt[(dip_count+j1) * 3 + 2]));
                }
            }
            dip_count += ndip;

            double ene_tmp = 0.0;
            VMtrace(&ene_tmp, densityMatrix2, V, TRUE);
            //printf("pol pair energy %lf\n", ene_tmp);
            pair_energies[fr_i].ai_polarization = ene_tmp;
            Eint += ene_tmp;
        }
        QFree(Z);
        delete[] id;
        delete[] idt;
        delete[] xyz_id;
    }
    QFree(V);
    check_fail(efp_set_pairwise_energy(impl_->efp, pair_energies));
    delete[] pair_energies;

    impl_->integral_ene = Eint;
}
*/


void EFP2::print_energy()
{
    struct efp_energy energy;
    check_fail(efp_get_energy(impl_->efp, &energy));

    printf("\n\n    EFP ENERGY COMPONENTS (ATOMIC UNITS)\n\n");
    printf("%35s %16.10lf\n", "ELECTROSTATIC ENERGY", energy.electrostatic);
    printf("%35s %16.10lf\n", "POLARIZATION ENERGY", energy.polarization);
    printf("%35s %16.10lf\n", "DISPERSION ENERGY", energy.dispersion);
    printf("%35s %16.10lf\n", "EXCHANGE-REPULSION ENERGY",
        energy.exchange_repulsion);
    printf("%35s %16.10lf\n", "OVERLAP-BASED CHARGE PENETRATION",
        energy.charge_penetration);
    printf("\n");

    if (!rem_read(REM_EFP_FRAGMENTS_ONLY)) {
        printf("%35s %16.10lf\n", "QM-NUC/EFP ELECTROSTATIC ENERGY",
            energy.electrostatic_point_charges);
        printf("%35s %16.10lf\n", "QM/EFP DISPERSION ENERGY",
            energy.ai_dispersion);
        printf("%35s %16.10lf\n", "QM/EFP EXCHANGE-REPULSION ENERGY",
            0.0);
        printf("\n");
    }

    printf("%35s %16.10lf\n", "TOTAL EFP ENERGY", energy.total);

    if (!rem_read(REM_EFP_FRAGMENTS_ONLY)) {
        printf("%35s %16.10lf\n", "EFP CORRECTION TO SCF ENERGY",
            energy.total - energy.polarization);
    }
    printf("\n\n");

    print_pairwise_energy(0);
}

void EFP2::print_pairwise_energy(int if_excited)
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || !rem_read(REM_EFP_PAIRWISE) || rem_read(REM_EFP_ORDER) == 0)
        return;

    printf("\n ------ QM---EFP PAIRWISE ENERGY ANALYSIS FOLLOWS ------------------------\n\n");
    size_t n_frags;
    check_fail(efp_get_frag_count(impl_->efp, &n_frags));
    double coord[6 * n_frags];
    check_fail(efp_get_coordinates(impl_->efp, coord));

    struct efp_energy *energies = new struct efp_energy[n_frags];
    check_fail(efp_get_pairwise_energy(impl_->efp, energies));

    char frag_name[32];
    size_t frag_atoms;
    double lattice_energy[6];
    for (size_t j=0; j<6; j++){
        lattice_energy[j]=0.0;
    }
    for (size_t i=0; i <n_frags; i++){
        check_fail(efp_get_frag_name(impl_->efp, i, sizeof(frag_name),frag_name));
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &frag_atoms));

        struct efp_atom atoms[frag_atoms];
        check_fail(efp_get_frag_atoms(impl_->efp, i, frag_atoms, atoms));

        printf("   PAIRWISE ENERGY BETWEEN QM REGION AND FRAGMENT %zu (%s) \n", i, frag_name);
        printf("fragment %s\n", frag_name);
        for (size_t a = 0; a < frag_atoms; a++) {
            double x = atoms[a].x / ConvFac(ANGSTROMS_TO_BOHRS);
            double y = atoms[a].y / ConvFac(ANGSTROMS_TO_BOHRS);
            double z = atoms[a].z / ConvFac(ANGSTROMS_TO_BOHRS);
            printf("   %-16s %12.6lf %12.6lf %12.6lf\n", atoms[a].label, x, y, z);
        }
        printf("\n");

        if (rem_read(REM_EFP_ORDER) == 1) {
            printf("%56s %16.10lf\n", "ELEC ENERGY <Psi_0|Vcoul|Psi_0>",
                    energies[i].electrostatic + energies[i].ai_electrostatic);
        }
        if (rem_read(REM_EFP_ORDER) == 2) {
            printf("%56s %16.10lf\n", "ELEC + SOLUTE POL ENERGY <Psi_sol|Vcoul|Psi_sol>",
                    energies[i].electrostatic + energies[i].ai_electrostatic);
            if (if_excited == 0) {
                printf("%56s %16.10lf\n", "SOLVENT POL ENERGY Epol", energies[i].polarization);
                printf("%56s %16.10lf\n", "SOLVENT POL ENERGY <Psi_sol|Vpol|Psi_sol>", energies[i].ai_polarization);
                printf("%56s %16.10lf\n", "SOLVENT POL ENERGY TOTAL", energies[i].polarization + energies[i].ai_polarization);
                energies[i].total = energies[i].electrostatic + energies[i].ai_electrostatic +
                                    energies[i].polarization + energies[i].ai_polarization + energies[i].dispersion +
                                    energies[i].exchange_repulsion + energies[i].charge_penetration;
                printf("%56s %16.10lf\n", "PAIRWISE TOTAL ENERGY", energies[i].total);
            }
            else {
                printf("%56s %16.10lf\n", "SOLVENT POL ENERGY Epol", energies[i].polarization);
                printf("%56s %16.10lf\n", "SOLVENT POL ENERGY Epol_corr", energies[i].exs_polarization);
                printf("%56s %16.10lf\n", "SOLVENT POL ENERGY <Psi_sol|Vpol|Psi_sol>", energies[i].ai_polarization);
                printf("%56s %16.10lf\n", "SOLVENT POL ENERGY TOTAL (0 ORDER)", energies[i].polarization + energies[i].ai_polarization);
                energies[i].total = energies[i].electrostatic + energies[i].ai_electrostatic +
                                    energies[i].polarization + energies[i].ai_polarization + energies[i].dispersion +
                                    energies[i].exchange_repulsion + energies[i].charge_penetration;
                printf("%56s %16.10lf\n", "PAIRWISE TOTAL ENERGY", energies[i].total);
            }

        }
        printf("\n ------------------------------------------------------------------------\n");

        lattice_energy[0] = lattice_energy[0] + energies[i].electrostatic + energies[i].ai_electrostatic;
        lattice_energy[1] = lattice_energy[1] + energies[i].polarization;
        lattice_energy[2] = lattice_energy[2] + energies[i].exs_polarization;
        lattice_energy[3] = lattice_energy[3] + energies[i].ai_polarization;
        lattice_energy[5] = lattice_energy[5] + energies[i].total;
    }
    //free(energies);

    if (rem_read(REM_EFP_ORDER) == 1) {
        printf("\n%56s %16.10lf\n", "TOTAL QM-EFP ELECTROSTATIC ENERGY", lattice_energy[0]);
    }
    if (rem_read(REM_EFP_ORDER) == 2) {
        printf("    TOTAL QM-EFP ENERGY COMPONENTS (ATOMIC UNITS)\n");
        printf("%56s %16.10lf\n", "QM-EFP ELEC + SOLUTE POL ENERGY <Psi_sol|Vcoul|Psi_sol>", lattice_energy[0]);
        if (if_excited == 0) {
            printf("%56s %16.10lf\n", "QM-EFP SOLVENT POL ENERGY Epol", lattice_energy[1]);
            printf("%56s %16.10lf\n", "QM-EFP SOLVENT POL ENERGY <Psi_sol|Vpol|Psi_sol>", lattice_energy[3]);
            printf("%56s %16.10lf\n", "QM-EFP SOLVENT POL ENERGY TOTAL", lattice_energy[1] + lattice_energy[3]);
        }
        else {
            printf("%56s %16.10lf\n", "QM-EFP SOLVENT POL ENERGY Epol", lattice_energy[1]);
            printf("%56s %16.10lf\n", "QM-EFP SOLVENT POL ENERGY Epol_corr", lattice_energy[2]);
            printf("%56s %16.10lf\n", "QM-EFP SOLVENT POL ENERGY <Psi_sol|Vpol|Psi_sol>", lattice_energy[3]);
            printf("%56s %16.10lf\n", "QM-EFP SOLVENT POL ENERGY TOTAL (0 ORDER)", lattice_energy[1] + lattice_energy[3]);
        }
        printf("%56s %16.10lf\n", "QM-EFP TOTAL ENERGY", lattice_energy[5]);
    }
    printf("\n");

    double Eefp;
    struct efp_energy energy;
    check_fail(efp_get_energy(impl_->efp, &energy));
    Eefp = energy.total;

    //check_fail(efp_get_wavefunction_dependent_energy(impl_->efp, &Epol));
    double Eqm = 0.0;
    if (rem_read(REM_EFP_ORDER) == 1) {
        Eqm = impl_->state_energy - Eefp;
        printf("%56s %16.10lf\n", "NON-SEPARABLE TERM <Psi_0|H0|Psi_0>", Eqm);
    }
    if (rem_read(REM_EFP_ORDER) == 2) {
        Eqm = impl_->state_energy - impl_->integral_ene - Eefp;
        printf("%56s %16.10lf\n", "NON-SEPARABLE TERM <Psi_sol|H0|Psi_sol>", Eqm);
    }

    printf("\n ------ QM---EFP PAIRWISE ENERGY ANALYSIS COMPLETED ---------------------\n\n");
}

void EFP2::get_qm_gradient(std::vector<double>& grad)
{
    size_t n_atoms;

    check_fail(efp_get_point_charge_count(impl_->efp, &n_atoms));
    grad.resize(3 * n_atoms);
    check_fail(efp_get_point_charge_gradient(impl_->efp, &grad.front()));
}

void EFP2::get_gradient(std::vector<double>& grad)
{
    size_t n_frag;

    check_fail(efp_get_frag_count(impl_->efp, &n_frag));
    grad.resize(6 * n_frag);
    check_fail(efp_get_gradient(impl_->efp, &grad.front()));
}

extern "C" void efpenergypol2(double *jPv, INTEGER *size, double *Ecis, double *energy)
{
	*energy = EFP2::instance().get_excited_state_energy_correction(
	    jPv, *size, *Ecis);
}
