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
#include <libmdc/libmdc.h>

#include "EFP2.h"
#include "libefp/src/efp.h"

struct EFP2_impl
{
	double wf_dep_energy_gs;
	double integral_ene;
    double Escf;
    double state_energy;
    double *density_matrix;
    INTEGER code;
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

/*
// calculates electrostatic field due to electrons of QM subsystem
static enum efp_result compute_electron_density_field(struct efp *efp, double *densityMatrix) {

    if (densityMatrix == NULL)
        return EFP_RESULT_FATAL;

    ShlPrs s2BraOrg(DEF_ID);
    ShlPrs s2KetOrg = s2BraOrg;
    ShlPrs s2Bra(s2BraOrg.code(), SHLPR_CFMM);
    ShlPrs s2Ket(s2KetOrg.code(), SHLPR_CFMM);

    size_t n_frag;
    check_fail(efp_get_frag_count(efp, &n_frag));

    for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {
        size_t n_pt;
        check_fail(efp_get_frag_induced_dipole_count(efp, fr_i, &n_pt));

        for (size_t j = 0; j < n_pt; j++) {
            struct efp_pol_pt *pt;
            pt = (struct efp_pol_pt *) malloc(sizeof(struct efp_pol_pt));
            check_fail(efp_get_frag_pol_pt(efp, fr_i, j, pt));

            double xyz[3] = {pt->x, pt->y, pt->z};
            double pef_ab[3] = {0.0, 0.0, 0.0};
            size_t n_1 = 1;
            int n_1_int = (int)n_1;

            AOints(pef_ab, NULL, NULL, NULL, densityMatrix, xyz, NULL, NULL,
                   &n_1_int, 112, s2Bra, s2Ket);

            pt->ai_field[0] = -pef_ab[0];
            pt->ai_field[1] = -pef_ab[1];
            pt->ai_field[2] = -pef_ab[2];

            check_fail(save_ai_field_pol_pt(efp, pt, fr_i, j));
        }
    }
    return EFP_RESULT_SUCCESS;
}
*/

// calculates electrostatic field due to electrons of QM subsystem
static enum efp_result compute_electron_density_field(struct efp *efp, double *densityMatrix) {

    if (densityMatrix == NULL)
        return EFP_RESULT_FATAL;

    qtime_t Timer = QTimerOn();
    double TimeForElField[3];

    ShlPrs s2BraOrg(DEF_ID);
    ShlPrs s2KetOrg = s2BraOrg;
    ShlPrs s2Bra(s2BraOrg.code(), SHLPR_CFMM);
    ShlPrs s2Ket(s2KetOrg.code(), SHLPR_CFMM);

    size_t n_frag = 0, n_id = 0;
    check_fail(efp_get_frag_count(efp, &n_frag));
    check_fail(efp_get_induced_dipole_count(efp, &n_id));

    double *xyz_id = new double[n_id * 3];
    check_fail(efp_get_induced_dipole_coordinates(efp, xyz_id));
    //double *pef_ab = new double[n_id * 3];
    double *pef_ab;
    pef_ab = (double*)calloc(n_id * 3, sizeof(double));

    int n_id_int = (int)n_id;

    AOints(pef_ab, NULL, NULL, NULL, densityMatrix, xyz_id, NULL, NULL,
           &n_id_int, 112, s2Bra, s2Ket);

    check_fail(save_ai_field(efp, pef_ab));
    free(pef_ab);

    QTimerOff(TimeForElField,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP compute_electron_density_field(): %.1f s (CPU) %.1f s (wall)\n",TimeForElField[0],TimeForElField[2]);

    return EFP_RESULT_SUCCESS;
}

static enum efp_result compute_qmmm_electronic_gradient(struct efp *efp, double *densityMatrix, double *grad) {

    if (densityMatrix == NULL) {
        printf("\n No density matrix found in compute_qmmm_gradient(). Abort. \n ");
        return EFP_RESULT_FATAL;
    }

    size_t n_frag;
    check_fail(efp_get_frag_count(efp, &n_frag));

    size_t NAtoms = 0;
    for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {
        if (rem_read(REM_EFP_QM_FRAGMENT) == fr_i) continue;
        size_t n_atom;
        check_fail(efp_get_frag_atom_count(efp, fr_i, &n_atom));
        NAtoms += n_atom;
    }

    double *charges = (double *)malloc(NAtoms * sizeof(double));
    double *coords = (double *)malloc( 3*NAtoms * sizeof(double));

    check_fail(efp_get_atom_mm_info(efp, charges, coords));
    int NAT = (int)NAtoms;

    //size_t QM_atoms;
    //check_fail(efp_get_point_charge_count(efp, &QM_atoms));
    //double *jEx = QAllocDoubleWithInit(3*QM_atoms);

    AOints(grad, NULL, NULL, NULL, densityMatrix, coords, charges, NULL, &NAT, -111);

    //memcpy( jEx, grad, sizeof(double)*3*QM_atoms);
    //printf("\n QM_atoms = %u \n", QM_atoms);
    //for (size_t i=0; i<3*QM_atoms; i++) {
    //   printf("grad %lf\n", jEx[i]);
    //}
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

    if (RemUninitialized(REM_EFP_QMMM))
        rem_write(0, REM_EFP_QMMM);
    if (RemUninitialized(REM_EFP_QM_FRAGMENT))
        rem_write(-100, REM_EFP_QM_FRAGMENT);

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
    if (RemUninitialized(REM_EFP_PRINT))
        rem_write(0, REM_EFP_PRINT);
    if (RemUninitialized(REM_EFP_POL_FIELD_UPDATE))
        rem_write(1, REM_EFP_POL_FIELD_UPDATE);
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
        free(impl_->density_matrix);
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
        opts.pol_damp_tt_value = 0.6;
        if (rem_read(REM_EFP_POL_DAMP_TT_VALUE) > 0) {
            opts.pol_damp_tt_value = rem_read(REM_EFP_POL_DAMP_TT_VALUE)/1000.0;
        }
        printf("EFP polarization damping factor = %f", opts.pol_damp_tt_value);
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

    switch (rem_read(REM_EFP_QMMM)) {
        //keyword not active
        case 0:
            opts.terms &= ~EFP_TERM_QQ;
            opts.terms &= ~EFP_TERM_LJ;
            opts.terms &= ~EFP_TERM_AI_QQ;
            opts.special_terms &= ~EFP_SPEC_TERM_ELEC;
            opts.special_terms &= ~EFP_SPEC_TERM_POL;
            opts.special_terms &= ~EFP_SPEC_TERM_DISP;
            opts.special_terms &= ~EFP_SPEC_TERM_XR;
            opts.special_terms &= ~EFP_SPEC_TERM_QQ;
            opts.special_terms &= ~EFP_SPEC_TERM_LJ;
            opts.special_fragment = -100;
            break;
        // turn off all efp terms, do mechanical embedding QM/MM
        case 1:
            opts.terms |= EFP_TERM_QQ;
            opts.terms |= EFP_TERM_LJ;
            opts.special_terms |= EFP_SPEC_TERM_QQ;
            opts.special_terms |= EFP_SPEC_TERM_LJ;
            // and turn off everything EFP-related
            opts.terms &= ~EFP_TERM_AI_QQ;
            opts.terms &= ~EFP_TERM_ELEC;
            opts.terms &= ~EFP_TERM_POL;
            opts.terms &= ~EFP_TERM_DISP;
            opts.terms &= ~EFP_TERM_XR;
            opts.terms &= ~EFP_TERM_AI_ELEC;
            opts.terms &= ~EFP_TERM_AI_POL;
            opts.terms &= ~EFP_TERM_AI_DISP;
            opts.terms &= ~EFP_TERM_AI_XR;
            opts.special_terms &= ~EFP_SPEC_TERM_ELEC;
            opts.special_terms &= ~EFP_SPEC_TERM_POL;
            opts.special_terms &= ~EFP_SPEC_TERM_DISP;
            opts.special_terms &= ~EFP_SPEC_TERM_XR;
            opts.special_fragment = rem_read(REM_EFP_QM_FRAGMENT);
            break;

        // standard electrostatic embedding QM/MM with LJ terms between QM and MM
        // and between EFPs;
        case 2:
            opts.terms |= EFP_TERM_AI_QQ;  // QM-MM-like electrostatics
            opts.terms |= EFP_TERM_QQ;  // MM-MM electrostatics between fragments
            opts.terms |= EFP_TERM_LJ;  // LJ between fragments
            opts.special_terms &= ~EFP_SPEC_TERM_QQ;  // exclude MM-MM electrostatics between "QM" frag and rest
            opts.special_terms |= EFP_SPEC_TERM_LJ;   // LJ between "QM" fragment and rest

            // and turn off everything EFP-related
            opts.terms &= ~EFP_TERM_ELEC;
            opts.terms &= ~EFP_TERM_POL;
            opts.terms &= ~EFP_TERM_DISP;
            opts.terms &= ~EFP_TERM_XR;
            opts.terms &= ~EFP_TERM_AI_ELEC;
            opts.terms &= ~EFP_TERM_AI_POL;
            opts.terms &= ~EFP_TERM_AI_DISP;
            opts.terms &= ~EFP_TERM_AI_XR;
            opts.special_terms &= ~EFP_SPEC_TERM_ELEC;
            opts.special_terms &= ~EFP_SPEC_TERM_POL;
            opts.special_terms &= ~EFP_SPEC_TERM_DISP;
            opts.special_terms &= ~EFP_SPEC_TERM_XR;

            opts.special_fragment = rem_read(REM_EFP_QM_FRAGMENT);
            break;

            // electrostatic embedding QM/MM with LJ term between QM and MM;
            // EFP-EFP terms as given in input
        case 3:
            opts.terms |= EFP_TERM_AI_QQ;  // QM-MM-like electrostatics
            opts.terms &= ~EFP_TERM_QQ;  // turn off MM-MM electrostatics between fragments
            opts.terms &= ~EFP_TERM_LJ;  // turn off LJ between fragments
            opts.special_terms &= ~EFP_SPEC_TERM_QQ;  // exclude MM-MM electrostatics between "QM" frag and rest
            opts.special_terms |= EFP_SPEC_TERM_LJ;   // LJ between "QM" fragment and rest

            // and turn off QM-EFP couplings
            opts.terms &= ~EFP_TERM_AI_ELEC;
            opts.terms &= ~EFP_TERM_AI_POL;
            opts.terms &= ~EFP_TERM_AI_DISP;
            opts.terms &= ~EFP_TERM_AI_XR;
            opts.special_terms &= ~EFP_SPEC_TERM_ELEC;
            opts.special_terms &= ~EFP_SPEC_TERM_POL;
            opts.special_terms &= ~EFP_SPEC_TERM_DISP;
            opts.special_terms &= ~EFP_SPEC_TERM_XR;

            opts.special_fragment = rem_read(REM_EFP_QM_FRAGMENT);
            break;

        // QM/EFP with LJ between QM and EFP region added;
        // other terms as given in input
        case 4:
            opts.terms &= ~EFP_TERM_AI_QQ;  // turn off QM-MM-like electrostatics
            opts.terms &= ~EFP_TERM_QQ;  // turn off MM-MM electrostatics between fragments
            opts.terms &= ~EFP_TERM_LJ;  // turn off LJ between fragments
            opts.special_terms &= ~EFP_SPEC_TERM_QQ;  // turn off MM-MM electrostatics between "QM" frag and rest
            opts.special_terms |= EFP_SPEC_TERM_LJ;   // LJ between "QM" fragment and rest

            // turn off QM-EFP dispersion and exchange
            opts.terms &= ~EFP_TERM_AI_DISP;
            opts.terms &= ~EFP_TERM_AI_XR;
            // and turn off things between "QM" fragments and the rest
            opts.special_terms &= ~EFP_SPEC_TERM_ELEC;
            opts.special_terms &= ~EFP_SPEC_TERM_POL;
            opts.special_terms &= ~EFP_SPEC_TERM_DISP;
            opts.special_terms &= ~EFP_SPEC_TERM_XR;

            opts.special_fragment = rem_read(REM_EFP_QM_FRAGMENT);
            break;
    }

    if (rem_read(REM_EFP_PAIRWISE)) {
        opts.enable_pairwise = 1;
        opts.ligand = -1;
    }

    if (rem_read(REM_EFP_PRINT)) {
        opts.print = rem_read(REM_EFP_PRINT);
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

    check_fail(efp_prepare(impl_->efp));

    if (rem_read(REM_EFP_ENABLE_LINKS))
        load_topology(impl_->efp, "efp-topology");

    if (rem_read(REM_EFP_COORD_XYZ) == 0)
        check_fail(efp_set_coordinates(impl_->efp, EFP_COORD_TYPE_XYZABC, &coord.front()));
    else
        //check_fail(efp_set_coordinates(impl_->efp, EFP_COORD_TYPE_ATOMS, &coord.front()));
        check_fail(efp_set_coordinates(impl_->efp, EFP_COORD_TYPE_POINTS, &coord.front()));

    // Q-Chem computes hcore integrals twice, but we do not want to compute them first time 
    impl_->if_multipole_field = true;
    impl_->if_pol_field = true;

    if (rem_read(REM_EFP_PRINT) > 0) {
        printf("\n\nGEOMETRY OF EFP SUBSYSTEM\n\n");
        print_geometry();
    }
}

void EFP2::reorient_geometry()
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY))
        return;

    if (rem_read(REM_EFP_PRINT) > 1) {
        printf("\n\n in EFP2::reorient_geometry()\n\n");
    }
    
    static int counter = 0;

    // we assume QM origin and orientation are not changed in q-chem run...
    // so arrange EFP region with respect to QM region only once
    if (counter == 0) {
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
    }

    // update position of a special fragment
    if (rem_read(REM_EFP_QM_FRAGMENT) > -1) {

        double *jA, *nucChg;
        INTEGER *iAtNo, NAtoms;

        get_carts(NULL, &jA, &iAtNo, &NAtoms);
        nucChg = effectiveNucCharges();

        check_fail(efp_set_point_charges(impl_->efp, NAtoms, nucChg, jA));
        check_fail(update_special_fragment(impl_->efp, jA));
    }

    counter++;

    if (rem_read(REM_EFP_PRINT) > 0) {
        printf("\n\nREORIENTED EFP GEOMETRY\n\n");
        print_geometry();
    }
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

void EFP2::update_multipole_field(bool true_false) {
    if (true_false)
        impl_->if_multipole_field = true;
    else 
        impl_->if_multipole_field = false;
}

bool EFP2::get_if_pol_field() {
    // printf("\n pol_field %s", impl_->if_pol_field ? "true":"false");
    return impl_->if_pol_field;
}

void EFP2::set_if_pol_field(bool true_false) {
    // printf("\n pol_field %s", impl_->if_pol_field ? "true":"false");
    impl_->if_pol_field = true_false;
}

void EFP2::update_pol_field() {

    static int pol_field_counter = 0;
    impl_->if_pol_field = true;

    if (pol_field_counter % rem_read(REM_EFP_POL_FIELD_UPDATE) != 0)
        impl_->if_pol_field = false;

    pol_field_counter++;
}

double EFP2::get_excited_state_energy_correction(double *w, size_t n_elem, double Ecis)
{
	double energy = 0.0;

    size_t size = n_elem * sizeof(double);
    impl_->density_matrix = (double *)realloc(impl_->density_matrix, size);
    memcpy(impl_->density_matrix, w, size);

	// compute elec and pol integral pairwise contributions before updating the induced dipoles
    if (rem_read(REM_EFP_PAIRWISE) && rem_read(REM_EFP_ORDER) > 0)
        compute_integral_pairwise_energy(Ecis, 1);

    // do not bother about polarization correction for efp_order = 1 or if no polarization
    if (rem_read(REM_EFP_ORDER) > 1 && rem_read(REM_EFP_POL) != 0 && rem_read(REM_EFP_QM_POL) != 0) {
        check_fail(compute_electron_density_field(impl_->efp, w));
        check_fail(efp_get_wavefunction_dependent_energy_correction(impl_->efp, &energy));
    }

    // print pairwise energies if requested
    if (rem_read(REM_EFP_PAIRWISE) && rem_read(REM_EFP_ORDER) > 0) {
        print_pairwise_energy(1);
    }

    return (energy);
}

/*
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

    VRadd(h , h, pkd_vmul.memptr(), NB2);
}
*/

#include <iostream>
#include <sstream>
#include <libqints/algorithms/gto/gto_order.h>
#include <libqints/qchem/aobasis.h>
#include <libfock/stv/vmul.h>
#include <libmdc/threading_policy.h>
using libqints::qchem::aobasis;

/*
void EFP2::update_mult_qints(double *h, INTEGER code)
{
    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    dev.memory = (size_t)(rem_read(REM_MEM_TOTAL)) * 1024 * 1024 / dev.nthreads;

    qtime_t Timer = QTimerOn();
    double TimeForMultInt[3];

    // Get sizes of all objects and initialize
    size_t nbsf = aobasis.b1.get_nbsf();
    size_t n_mult = 0, n_frag = 0;
    check_fail(efp_get_multipole_count(impl_->efp, &n_mult));
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    arma::vec mono; // monopole (used when damping is required)
    arma::vec mono_screen; // damping parameters for all monopole
    arma::mat mono_coord;  // Cartesian coordinate of all monopole
    if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0)
    {
        mono.set_size(n_mult);
        mono_screen.set_size(n_mult);
        mono_coord.set_size(3, n_mult);
    }

    // // Read and compute atoms
    // arma::mat vmul_atm(nbsf, nbsf, arma::fill::zeros);
    // {
    //     std::vector<libqints::ftype_multipole> vfm(n_mult);
    //     double *ai_screen_ptr = NULL;
    //     if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0) ai_screen_ptr = mono_screen.memptr();
    //     arma::vec mom(n_atoms);
    //     for (size_t i = 0, iatom = 0; i < n_frag; i++)
    //     {
    //         size_t nat, nfragmult;
    //         check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
    //         check_fail(efp_get_frag_multipole_count(impl_->efp, i, &nfragmult));
    //         if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0)
    //         {
    //             check_fail(efp_get_ai_screen(impl_->efp, i, ai_screen_ptr));
    //             ai_screen_ptr += nfragmult;
    //         }
    //         struct efp_atom *atoms = new struct efp_atom[nat];
    //         check_fail(efp_get_frag_atoms(impl_->efp, i, nat, atoms));
    //         for (size_t j = 0; j < nat; j++, iatom++)
    //         {
    //             vfm[iatom].k = 0;
    //             vfm[iatom].x = atoms[j].x;
    //             vfm[iatom].y = atoms[j].y;
    //             vfm[iatom].z = atoms[j].z;
    //             mom(iatom) = atoms[j].znuc;
    //         }
    //         delete[] atoms;
    //     }
    //     ai_screen_ptr = NULL;
    //     libqints::basis_1e1c_multipole bm(vfm);
    //     vfm = std::vector<libqints::ftype_multipole>();
    //     libaview::array_view<double> av_vmul(vmul_atm.memptr(), vmul_atm.n_elem);
    //     libaview::array_view<double> av_mom(mom.memptr(), mom.n_elem);
    //     libfock::vmul<double>(aobasis.b1, bm, dev).compute(av_mom, av_vmul);
    // }
     

    // Read and compute multipoles
    arma::mat vmul_mult(nbsf, nbsf, arma::fill::zeros);
    {
        std::vector<libqints::ftype_multipole> vfm(n_mult);
        double *xyz_mult = new double[n_mult * 3];
        check_fail(efp_get_multipole_coordinates(impl_->efp, xyz_mult));
        double *mult = new double[n_mult * (1 + 3 + 6 + 10)];
        check_fail(efp_get_multipole_values(impl_->efp, mult));  // monopole and nuclear charges are summed up
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
    arma::mat vmul = vmul_mult;
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
        check_fail(efp_get_mono_values(impl_->efp, mono.memptr()));
        check_fail(efp_get_all_ai_screen(impl_->efp, mono_screen.memptr()));
        arma::vec Z(NB2car, arma::fill::zeros);
        double *xyz_ptr = mono_coord.memptr();
        for (size_t j1 = 0; j1 < mono_screen.n_elem; j1++, xyz_ptr += 3) {
            double damp = mono_screen(j1);
            if (damp > 1.0e-6 && damp < 10.0) {
                MakeFld(Z.memptr(), xyz_ptr, 0, S2.code(), S2, damp);
                for (int i = 0; i < NB2; i++) {
                    pkd_vmul(i) += Z(i) * mono(j1);
                }
            }
        }
        xyz_ptr = NULL;
    }

    VRadd(h , h, pkd_vmul.memptr(), NB2);

    QTimerOff(TimeForMultInt,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP multipole integrals with libqints: %.1f s (CPU) %.1f s (wall)\n",TimeForMultInt[0],TimeForMultInt[2]);
}
*/

void EFP2::update_mult_qints(double *h, INTEGER code)
{
    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    dev.memory = (size_t)(rem_read(REM_MEM_TOTAL)) * 1024 * 1024 / dev.nthreads;

    qtime_t Timer = QTimerOn();
    double TimeForMultInt[3];

    // Get sizes of all objects and initialize
    size_t nbsf = aobasis.b1.get_nbsf();
    size_t n_ho_mult = 0, n_mm_mult = 0;
    check_fail(efp_get_ho_multipole_count(impl_->efp, &n_ho_mult));
    check_fail(efp_get_mm_multipole_count(impl_->efp, &n_mm_mult));

    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP is going to compute %zu high-order multipole integrals and %zu charge integrals with libqints\n", 
            n_ho_mult, n_mm_mult);

    arma::vec mono; // monopole (used when damping is required)
    arma::vec mono_screen; // damping parameters for all monopole
    arma::mat mono_coord;  // Cartesian coordinate of all monopole
    if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0 && n_ho_mult > 0)
    {
        mono.set_size(n_ho_mult);
        mono_screen.set_size(n_ho_mult);
        mono_coord.set_size(3, n_ho_mult);
    }

    // Read and compute higher_order multipoles
    arma::mat vmul_mult(nbsf, nbsf, arma::fill::zeros);
    do {
        if (n_ho_mult == 0) break;

        qtime_t TimerMult = QTimerOn();
        double TimeForMult[3];
        
        std::vector<libqints::ftype_multipole> vfm(n_ho_mult);
        double *xyz_mult = new double[n_ho_mult * 3];
        check_fail(efp_get_ho_multipole_coordinates(impl_->efp, xyz_mult));
        double *mult = new double[n_ho_mult * (1 + 3 + 6 + 10)];
        check_fail(efp_get_ho_multipole_values(impl_->efp, mult));  // monopole and nuclear charges are summed up
        arma::vec mom_mult(n_ho_mult * 20);
        for (size_t i = 0, imom = 0, ifm = 0; i < n_ho_mult; i++, ifm++)
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

        QTimerOff(TimeForMult,TimerMult);
        if (rem_read(REM_EFP_PRINT) > 0)
            printf(" EFP multipole integrals with libqints: %.1f s (CPU) %.1f s (wall)\n",TimeForMult[0],TimeForMult[2]);

    } while (0);


    // Read and compute simple moonopoles
    arma::mat vmul_mm(nbsf, nbsf, arma::fill::zeros);
    do {
        if (n_mm_mult == 0) break;

        qtime_t TimerMM = QTimerOn();
        double TimeForMM[3];    

         std::vector<libqints::ftype_multipole> vfm(n_mm_mult);

         double *xyz_mult = new double[n_mm_mult * 3];
         check_fail(efp_get_mm_multipole_coordinates(impl_->efp, xyz_mult));
         double *mult = new double[n_mm_mult];
         check_fail(efp_get_mm_multipole_values(impl_->efp, mult));  // monopole and nuclear charges are summed up
         arma::vec mom_mult(n_mm_mult);
 
         for (size_t i = 0; i < n_mm_mult; i++)
         {
            vfm[i].k = 0;
            vfm[i].x = xyz_mult[3 * i + 0];
            vfm[i].y = xyz_mult[3 * i + 1];
            vfm[i].z = xyz_mult[3 * i + 2];
            mom_mult(i) = mult[i];
         }

         delete[] mult;
         delete[] xyz_mult;
         libqints::basis_1e1c_multipole bm(vfm);
         vfm = std::vector<libqints::ftype_multipole>();
         libaview::array_view<double> av_vmul(vmul_mm.memptr(), vmul_mm.n_elem);
         libaview::array_view<double> av_mom(mom_mult.memptr(), mom_mult.n_elem);
         libfock::vmul<double>(aobasis.b1, bm, dev).compute(av_mom, av_vmul);

         QTimerOff(TimeForMM,TimerMM);
         if (rem_read(REM_EFP_PRINT) > 0)
             printf(" EFP charge integrals with libqints: %.1f s (CPU) %.1f s (wall)\n",TimeForMM[0],TimeForMM[2]);
     
    } while (0);

    // Call vmul
    arma::mat vmul = vmul_mult + vmul_mm;
    libqints::gto::reorder_cc(vmul, aobasis.b1, true, true, libqints::gto::lex, libqints::gto::korder);
    threading_policy::pop();

    qtime_t TimerDamp = QTimerOn();
    double TimeForDamp[3];

    // Pack
    INTEGER NB2 = rem_read(REM_NB2);
    ShlPrs S2(code);
    INTEGER NB2car = S2.getNB2car();
    arma::vec pkd_vmul(NB2car, arma::fill::zeros);
    ScaV2M(vmul.memptr(), pkd_vmul.memptr(), 1, 0);

    if (rem_read(REM_EFP_QM_ELEC_DAMP) != 0)
    {
        check_fail(efp_get_ho_mono_values(impl_->efp, mono.memptr()));
        check_fail(efp_get_ho_ai_screen(impl_->efp, mono_screen.memptr()));
        arma::vec Z(NB2car, arma::fill::zeros);
        double *xyz_ptr = mono_coord.memptr();
        for (size_t j1 = 0; j1 < mono_screen.n_elem; j1++, xyz_ptr += 3) {
            double damp = mono_screen(j1);
            if (damp > 1.0e-6 && damp < 10.0) {
                MakeFld(Z.memptr(), xyz_ptr, 0, S2.code(), S2, damp);
                for (int i = 0; i < NB2; i++) {
                    pkd_vmul(i) += Z(i) * mono(j1);
                }
            }
        }
        xyz_ptr = NULL;
    }

    VRadd(h , h, pkd_vmul.memptr(), NB2);

    QTimerOff(TimeForDamp,TimerDamp);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP charge damping integrals with MakeFld: %.1f s (CPU) %.1f s (wall)\n",TimeForDamp[0],TimeForDamp[2]);

    QTimerOff(TimeForMultInt,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" Total EFP electrostatic integrals: %.1f s (CPU) %.1f s (wall)\n",TimeForMultInt[0],TimeForMultInt[2]);
}

void EFP2::update_mm_qints(double *h, INTEGER code)
{
    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    dev.memory = (size_t)(rem_read(REM_MEM_TOTAL)) * 1024 * 1024 / dev.nthreads;

    qtime_t Timer = QTimerOn();
    double TimeForMMInt[3];

    // Get sizes of all objects and initialize
    size_t nbsf = aobasis.b1.get_nbsf();

    size_t n_frag = 0;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    size_t n_atom = 0;
    for (size_t i = 0; i < n_frag; i++) {
        // skip interactions with QM fragment
        if (rem_read(REM_EFP_QM_FRAGMENT) == i) continue;
        size_t nat;
        check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
        n_atom += nat;
    }

    // Read and compute atoms
    arma::mat vmul_atm(nbsf, nbsf, arma::fill::zeros);
    {
        std::vector<libqints::ftype_multipole> vfm(n_atom);
        arma::vec mom(n_atom);
        for (size_t i = 0, iatom = 0; i < n_frag; i++)
        {
            // skip interactions with QM fragment
            if (rem_read(REM_EFP_QM_FRAGMENT) == i) continue;
            size_t nat;
            check_fail(efp_get_frag_atom_count(impl_->efp, i, &nat));
            struct efp_atom *atoms = new struct efp_atom[nat];
            check_fail(efp_get_frag_atoms(impl_->efp, i, nat, atoms));
            for (size_t j = 0; j < nat; j++, iatom++)
            {
                vfm[iatom].k = 0;
                vfm[iatom].x = atoms[j].x;
                vfm[iatom].y = atoms[j].y;
                vfm[iatom].z = atoms[j].z;
                mom(iatom) = atoms[j].mm_charge;
            }
            delete[] atoms;
        }
        libqints::basis_1e1c_multipole bm(vfm);
        vfm = std::vector<libqints::ftype_multipole>();
        libaview::array_view<double> av_vmul(vmul_atm.memptr(), vmul_atm.n_elem);
        libaview::array_view<double> av_mom(mom.memptr(), mom.n_elem);
        libfock::vmul<double>(aobasis.b1, bm, dev).compute(av_mom, av_vmul);
    }

    // Call vmul
    arma::mat vmul = vmul_atm;
    libqints::gto::reorder_cc(vmul, aobasis.b1, true, true, libqints::gto::lex, libqints::gto::korder);
    threading_policy::pop();

    // Pack
    INTEGER NB2 = rem_read(REM_NB2);
    ShlPrs S2(code);
    INTEGER NB2car = S2.getNB2car();
    arma::vec pkd_vmul(NB2car, arma::fill::zeros);
    ScaV2M(vmul.memptr(), pkd_vmul.memptr(), 1, 0);

    VRadd(h , h, pkd_vmul.memptr(), NB2);

    QTimerOff(TimeForMMInt,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP MM integrals with libqints: %.1f s (CPU) %.1f s (wall)\n",TimeForMMInt[0],TimeForMMInt[2]);
}

void EFP2::update_mult_ints(double *h, INTEGER code)
{
    impl_->code = code;  // save code value for future use
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_ORDER) != 2)
        return;
    // mechanical embedding
    if (rem_read(REM_EFP_QMMM) == 1)
        return;
    // electrostatic embedding - might continue
    bool do_qmmm = rem_read(REM_EFP_QMMM) == 2 || rem_read(REM_EFP_QMMM) == 3;
    if (rem_read(REM_EFP_QM_ELEC) == 0 && !do_qmmm)
        return;

    INTEGER NB2 = rem_read(REM_NB2);


threading_policy::enable_omp_only();
libqints::dev_omp dev;
dev.init(1024);
threading_policy::pop();
//    if (( rem_read(REM_USE_LIBQINTS) != 0 && dev.nthreads > 1) || (rem_read(REM_USE_LIBQINTS) > 0))
    if ( dev.nthreads > 1 )  // always use libqints in parallel jobs
    {
        if (do_qmmm)
            update_mm_qints(h, code);
        else
            update_mult_qints(h, code);
        return;
    }

    qtime_t Timer = QTimerOn();
    double TimeForMultInt[3];

    //printf("\n Compute EFP multipole integrals with MakeFld\n");
    ShlPrs S2(code);
    double *V, *Z0, *Z;
    INTEGER K0, Kmax;
    INTEGER NB2car = S2.getNB2car();

    size_t n_frag;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    // electrostatic QM/MM embedding
    if (do_qmmm) {

        V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
        VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

        // storage for rank=0 (charge) integrals
        K0 = LFuncC(0, 0);
        Z0 = QAllocDouble(K0 * NB2car);

        for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {

            // skip interactions with QM fragment
            if (rem_read(REM_EFP_QM_FRAGMENT) == fr_i) continue;

            size_t n_atom;
            check_fail(efp_get_frag_atom_count(impl_->efp, fr_i, &n_atom));

            struct efp_atom *atoms = new struct efp_atom[n_atom];
            check_fail(efp_get_frag_atoms(impl_->efp, fr_i, n_atom, atoms));

            for (size_t j = 0; j < n_atom; j++) {
                double xyz[3] = {atoms[j].x, atoms[j].y, atoms[j].z};
                double qi = atoms[j].mm_charge;

                // no screening
                MakeFld(Z0, xyz, 0, S2.code(), S2, 0);
                for (int i = 0; i < NB2; i++) {
                    // charge-monopole
                    V[i] -= Z0[i] * qi;
                }
            }
            delete[] atoms;
        }
        VRadd(h, h, V, NB2);
        QFree(Z0);
        QFree(V);
    }

    // normal EFP multipole integrals
    else {

        // work with multipoles - normal EFP stuff
        //find quadrupoles indices in Z array
        int nxx, nyy, nzz, nxy, nxz, nyz;
        KonL2K(&nxx, 2, 0, 0);
        KonL2K(&nyy, 0, 2, 0);
        KonL2K(&nzz, 0, 0, 2);
        KonL2K(&nxy, 1, 1, 0);
        KonL2K(&nxz, 1, 0, 1);
        KonL2K(&nyz, 0, 1, 1);
        nxx--;
        nyy--;
        nzz--;
        nxy--;
        nxz--;
        nyz--;

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
        nxxx--;
        nyyy--;
        nzzz--;
        nxxy--;
        nxxz--;
        nxyy--;
        nyyz--;
        nxzz--;
        nyzz--;
        nxyz--;

        V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
        VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);    
    
        // assuming octopoles are the highest rank
        Kmax = LFuncC(0, 3);
        Z = QAllocDouble(Kmax * NB2car);

        // storage for rank=0 (charge) integrals
        K0 = LFuncC(0, 0);
        Z0 = QAllocDouble(K0 * NB2car);

        for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {

            size_t n_pt;
            check_fail(efp_get_frag_multipole_count(impl_->efp, fr_i, &n_pt));

            // compute integrals based on the highest rank of multipoles in fragment:
            // 0 - charge, 1 - dipole, 2 - quad, 3 - oct
            int rank;
            check_fail(efp_get_frag_rank(impl_->efp, fr_i, &rank));
            if (rank < 0) continue;
            if (rank > 3) QCrash("EFP fragment with multipoles higher than octopoles detected! Exit.");
            

            for (size_t j = 0; j < n_pt; j++) {

                struct efp_mult_pt *pt;
                pt = (struct efp_mult_pt *) malloc(sizeof(struct efp_mult_pt));
                check_fail(efp_get_frag_mult_pt(impl_->efp, fr_i, j, pt));

                double xyz[3] = {pt->x, pt->y, pt->z};

                double qi;
                qi = pt->znuc + pt->monopole;

                //printf(" Point %d on fragment %d\n", j, fr_i);
                //print_efp_mult_pt(pt);

                // all multipoles - no screening
                MakeFld(Z, xyz, rank, S2.code(), S2, 0);

                for (int i = 0; i < NB2; i++) {
                    // charge-monopole
                    V[i] -= Z[i] * qi;

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
                if (pt->if_screen) {
                    double screen = pt->screen0;
                    double q_mon = pt->monopole;
                    if (screen > 1.0e-6 && screen < 10.0) {
                        MakeFld(Z0, xyz, 0, S2.code(), S2, screen);
                        for (int i = 0; i < NB2; i++) {
                            // charge-monopole
                            V[i] += Z0[i] * q_mon;
                        }
                    }
                }

                free(pt);
            }
        }
        QFree(Z);
        QFree(Z0);
        VRadd(h, h, V, NB2);
        QFree(V);
    }

    QTimerOff(TimeForMultInt,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP multipole integrals with AOints: %.1f s (CPU) %.1f s (wall)\n",TimeForMultInt[0],TimeForMultInt[2]);
}


/*
void EFP2::update_mult_ints_OLD(double *h, INTEGER code)
{
    impl_->code = code;  // save code value for future use
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_ELEC) == 0 || rem_read(REM_EFP_ORDER) != 2)
        return;

    printf("\n Compute EFP multipole integrals \n");

    INTEGER NB2 = rem_read(REM_NB2);

//threading_policy::enable_omp_only();
//libqints::dev_omp dev;
//dev.init(1024);
//threading_policy::pop();

//if (( rem_read(REM_USE_LIBQINTS) != 0 && dev.nthreads > 1) || (rem_read(REM_USE_LIBQINTS) > 0))
//{
//    update_mult_qints(h, code);
//    return;
//}

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

    for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {

        size_t n_pt;
        check_fail(efp_get_frag_multipole_count(impl_->efp, fr_i, &n_pt));

        // compute integrals based on the highest rank of multipoles in fragment:
        // 0 - charge, 1 - dipole, 2 - quad, 3 - oct
        size_t rank;
        check_fail(efp_get_frag_rank(impl_->efp, fr_i, &rank));
        Kmax = LFuncC(0, rank);

        Z = QAllocDouble(Kmax * NB2car);

        for (size_t j = 0; j < n_pt; j++) {

            struct efp_mult_pt *pt;
            pt = (struct efp_mult_pt *)malloc(sizeof(struct efp_mult_pt));
            check_fail(efp_get_frag_mult_pt(impl_->efp, fr_i, j, pt));

            double xyz[3] = {pt->x, pt->y, pt->z};

            double qi;
            qi = pt->znuc + pt->monopole;

            //printf(" Point %d on fragment %d\n", j, fr_i);
            //print_efp_mult_pt(pt);

            // all multipoles - no screening
            MakeFld(Z, xyz, rank, S2.code(), S2, 0);
            for (int i = 0; i < NB2; i++) {
                // charge-monopole
                V[i] -= Z[i] * qi;
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
            if (pt->if_screen) {

                double screen = pt->screen0;
                double q_mon = pt->monopole;

                MakeFld(Z0, xyz, 0, S2.code(), S2, screen);
                for (int i = 0; i < NB2; i++) {
                    // charge-monopole
                    V[i] += Z0[i] * q_mon;
                }
            }

            free(pt);
        }
        QFree(Z);
    }

    VRadd(h, h, V, NB2);
    QFree(Z0);
    QFree(V);
}
*/

#include <iostream>
#include <sstream>
#include <libqints/algorithms/gto/gto_order.h>
#include <libqints/qchem/aobasis.h>
#include <libfock/stv/vmul.h>
#include <libmdc/threading_policy.h>
using libqints::qchem::aobasis;

void EFP2::update_pol_qints(double *h, INTEGER code)
{
    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    dev.memory = (size_t)(rem_read(REM_MEM_TOTAL)) * 1024 * 1024 / dev.nthreads;

    qtime_t Timer = QTimerOn();
    double TimeForPolInt[3];

    // Get sizes of all objects and initialize
    size_t nbsf = aobasis.b1.get_nbsf();
    size_t n_id = 0;
    check_fail(efp_get_induced_dipole_count(impl_->efp, &n_id));

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

    // Call vmul
    arma::mat vmul = vmul_id;
    libqints::gto::reorder_cc(vmul, aobasis.b1, true, true, libqints::gto::lex, libqints::gto::korder);
    threading_policy::pop();

    // Pack
    INTEGER NB2 = rem_read(REM_NB2);
    ShlPrs S2(code);
    INTEGER NB2car = S2.getNB2car();
    arma::vec pkd_vmul(NB2car, arma::fill::zeros);
    ScaV2M(vmul.memptr(), pkd_vmul.memptr(), 1, 0);

    VRadd(h , h, pkd_vmul.memptr(), NB2);

    QTimerOff(TimeForPolInt,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP polarization integrals with libqints: %.1f s (CPU) %.1f s (wall)\n",TimeForPolInt[0],TimeForPolInt[2]);
}


void EFP2::update_pol_ints(double *h, INTEGER code)
{
    impl_->code = code;

    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QM_POL) == 0 || rem_read(REM_EFP_ORDER) != 2)
        return;

    // mechanical or electrostatic embedding QM/MM
    bool do_qmmm = rem_read(REM_EFP_QMMM) == 1 || rem_read(REM_EFP_QMMM) == 2 || rem_read(REM_EFP_QMMM) == 3;
    if (do_qmmm)
        return;

    INTEGER NB2 = rem_read(REM_NB2);


    threading_policy::enable_omp_only();
    libqints::dev_omp dev;
    dev.init(1024);
    threading_policy::pop();
    //if ((rem_read(REM_USE_LIBQINTS) != 0 && dev.nthreads > 1) || (rem_read(REM_USE_LIBQINTS) > 0)) // && rem_read(REM_EFP_PAIRWISE) == 0)
    if ( dev.nthreads > 1 ) // always use libqints in parallel jobs 
    {
        //printf("\n Computed EFP polarization integrals with libqints\n");
        update_pol_qints(h, code);
        return;
    }

    qtime_t Timer = QTimerOn();
    double TimeForPolInt[3];

    //printf("\n Compute EFP polarization integrals with MakeFld\n");
    ShlPrs S2(code);
    double *V, *Z;
    INTEGER Kmax;
    INTEGER NB2car = S2.getNB2car();
    V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);
    VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);

    Kmax = LFuncC(0, 1);
    Z = QAllocDouble(Kmax * NB2car);

    size_t n_frag;
    check_fail(efp_get_frag_count(impl_->efp, &n_frag));

    for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {

        size_t n_pt;
        check_fail(efp_get_frag_induced_dipole_count(impl_->efp, fr_i, &n_pt));

        for (size_t j = 0; j < n_pt; j++) {

            struct efp_pol_pt *pt;
            pt = (struct efp_pol_pt *)malloc(sizeof(struct efp_pol_pt));
            check_fail(efp_get_frag_pol_pt(impl_->efp, fr_i, j, pt));

            double xyz[3] = {pt->x, pt->y, pt->z};

            MakeFld(Z, xyz, 1, S2.code(), S2, 0);
            for (int i = 0; i < NB2; i++) {
                //induced dipole
                V[i] -= 0.5 * (Z[i + 1 * NB2car] * (pt->indip[0] + pt->indipconj[0]) +
                               Z[i + 2 * NB2car] * (pt->indip[1] + pt->indipconj[1]) +
                               Z[i + 3 * NB2car] * (pt->indip[2] + pt->indipconj[2]));
            }

            free(pt);
        }
    }
    VRadd(h, h, V, NB2);

    QFree(V);
    QFree(Z);

    QTimerOff(TimeForPolInt,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP polarization integrals with AOints: %.1f s (CPU) %.1f s (wall)\n",TimeForPolInt[0],TimeForPolInt[2]);
}

void EFP2::update_qm_atoms()
{
    bool if_qmmm = rem_read(REM_EFP_QMMM) > 0;
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || (rem_read(REM_EFP_QM_ELEC) == 0 && !if_qmmm))
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
    if (rem_read(REM_EFP_ORDER) == 0 || rem_read(REM_EFP_POL) == 0 || rem_read(REM_EFP_QM_POL) == 0 || rem_read(REM_EFP_FRAGMENTS_ONLY))
        return energy;

    // mechanical or electrostatic embedding
    bool do_qmmm = rem_read(REM_EFP_QMMM) == 1 || rem_read(REM_EFP_QMMM) == 2 || rem_read(REM_EFP_QMMM) == 3;
    if (do_qmmm)
        return energy;

    size_t size = n_elem * sizeof(double);
    impl_->density_matrix = (double *)realloc(impl_->density_matrix, size);
    memcpy(impl_->density_matrix, w, size);

    // do not need to go further with efp order 0 or 1
    if (rem_read(REM_EFP_ORDER) < 2)
        return energy;

    // compute electric field integrals on polarizability points due to density w
    check_fail(compute_electron_density_field(impl_->efp, w));

    qtime_t Timer = QTimerOn();
    double TimeForWFdepEne[3];

    // compute polarization energy self-consistent with density w
    check_fail(efp_get_wavefunction_dependent_energy(impl_->efp, &energy));

    QTimerOff(TimeForWFdepEne,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP wavefunction dependent energy: %.1f s (CPU) %.1f s (wall)\n",TimeForWFdepEne[0],TimeForWFdepEne[2]);

    impl_->wf_dep_energy_gs = energy;

    return energy;
}

void EFP2::get_qmmm_electronic_gradient(double *w, double *grad)
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY) || rem_read(REM_EFP_QMMM) == 0)
        return;

    check_fail(compute_qmmm_electronic_gradient(impl_->efp, w, grad));
}

double EFP2::get_total_energy()
{
    struct efp_energy energy;

    check_fail(efp_get_energy(impl_->efp, &energy));
    //print_energy();
    return energy.total;
}

void EFP2::compute_integral_pairwise_energy(double Estate, int if_excited)
{
    if (rem_read(REM_EFP_FRAGMENTS_ONLY)  || !rem_read(REM_EFP_PAIRWISE) || rem_read(REM_EFP_ORDER) == 0)
        return;

    INTEGER NB2 = rem_read(REM_NB2);

    qtime_t Timer = QTimerOn();
    double TimeForPairInt[3];

    double *densityMatrix2;
    if (impl_->density_matrix != NULL)
        densityMatrix2 = impl_->density_matrix;
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

    struct efp_energy *pair_energies; // = new struct efp_energy[n_frag];
    pair_energies = (struct efp_energy *)malloc(n_frag * sizeof(struct efp_energy));
    check_fail(efp_get_pairwise_energy(impl_->efp, pair_energies));

    // energy of QM-EFP integrals
    double Eint = 0.0;

    // INTEGER code = impl_->user_data.code;
    INTEGER code = impl_->code;
    ShlPrs S2(code);
    double *V, *Z, *Z0;
    INTEGER K0, Kmax;
    INTEGER NB2car = S2.getNB2car();
    V = QAllocDouble(NB2car > NB2 ? NB2car : NB2);

    // charges
    K0 = LFuncC(0, 0);
    Z0 = QAllocDouble(K0 * NB2car);

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

    qtime_t TimerMult = QTimerOn();
    double TimeForMultInt[3];

    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP pairwise integrals for %zu fragments will be computed \n", n_frag);

    for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {
        VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);
        
        size_t n_pt;
        check_fail(efp_get_frag_multipole_count(impl_->efp, fr_i, &n_pt));

        if (rem_read(REM_EFP_PRINT) > 1)
        printf("    EFP pairwise integrals for fragment %zu containing %zu multipole points ......\n", fr_i, n_pt);

        // compute integrals based on the highest rank of multipoles in fragment:
        // 0 - charge, 1 - dipole, 2 - quad, 3 - oct
        int rank;
        check_fail(efp_get_frag_rank(impl_->efp, fr_i, &rank));
        Kmax = LFuncC(0, rank);
        Z = QAllocDouble(Kmax * NB2car);

        for (size_t j = 0; j < n_pt; j++) {

            struct efp_mult_pt *pt;
            pt = (struct efp_mult_pt *)malloc(sizeof(struct efp_mult_pt));
            check_fail(efp_get_frag_mult_pt(impl_->efp, fr_i, j, pt));

            double xyz[3] = {pt->x, pt->y, pt->z};
            double qi;
            qi = pt->znuc + pt->monopole;

            // all multipoles - no screening
            MakeFld(Z, xyz, rank, S2.code(), S2, 0);
            for (int i = 0; i < NB2; i++) {
                // charge-monopole
                V[i] -= Z[i] * qi;
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
            if (pt->if_screen) {

                double screen = pt->screen0;
                double q_mon = pt->monopole;
                if (screen > 1.0e-6 && screen < 10.0) {
                    MakeFld(Z0, xyz, 0, S2.code(), S2, screen);
                    for (int i = 0; i < NB2; i++) {
                        // charge-monopole
                        V[i] += Z0[i] * q_mon;
                    }
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
        // printf("elec pair_energy %lf\n",ene_tmp);

        // efp_order = 1:  <psi_0 | V_elec | psi_0 > is a purely electrostatic component
        // efp_order = 2:  <psi_sol | V_elec | psi_sol > includes electrostatics and solute polarization
        // maybe need to store these pair_energies in different locations...
        pair_energies[fr_i].ai_electrostatic = ene_tmp;
        Eint += ene_tmp;
    }
    QFree(Z0);

    QTimerOff(TimeForMultInt,TimerMult);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP multipole pairwise integrals: %.1f s (CPU) %.1f s (wall)\n",TimeForMultInt[0],TimeForMultInt[2]);

    qtime_t TimerPol = QTimerOn();
    double TimeForPolInt[3];
    
    // only do polarization integrals for efp_order = 2
    if (rem_read(REM_EFP_ORDER) == 2) {

        Kmax = LFuncC(0, 1);
        Z = QAllocDouble(Kmax * NB2car);

        for (size_t fr_i = 0; fr_i < n_frag; fr_i++) {
            VRload(V, NB2car > NB2 ? NB2car : NB2, 0.0);
            size_t n_pt;
            check_fail(efp_get_frag_induced_dipole_count(impl_->efp, fr_i, &n_pt));

            for (size_t j = 0; j < n_pt; j++) {

                struct efp_pol_pt *pt;
                pt = (struct efp_pol_pt *)malloc(sizeof(struct efp_pol_pt));
                check_fail(efp_get_frag_pol_pt(impl_->efp, fr_i, j, pt));

                double xyz[3] = {pt->x, pt->y, pt->z};

                MakeFld(Z, xyz, 1, S2.code(), S2, 0);

                // use ground state induced dipoles in integral calculations
                for (int i = 0; i < NB2; i++) {
                    V[i] -= 0.5 * (Z[i + 1 * NB2car] * (pt->indip_gs[0] + pt->indipconj_gs[0]) +
                            Z[i + 2 * NB2car] * (pt->indip_gs[1] + pt->indipconj_gs[1]) +
                            Z[i + 3 * NB2car] * (pt->indip_gs[2] + pt->indipconj_gs[2]));
                }

                free(pt);
            }

            double ene_tmp = 0.0;
            VMtrace(&ene_tmp, densityMatrix2, V, TRUE);
            // printf("pol pair energy %lf\n", ene_tmp);
            pair_energies[fr_i].ai_polarization = ene_tmp;
            Eint += ene_tmp;
        }
        QFree(Z);
    }
    QFree(V);

    QTimerOff(TimeForPolInt,TimerPol);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" EFP polarization pairwise integrals: %.1f s (CPU) %.1f s (wall)\n",TimeForPolInt[0],TimeForPolInt[2]);

    check_fail(efp_set_pairwise_energy(impl_->efp, pair_energies));
    delete[] pair_energies;

    impl_->integral_ene = Eint;

    QTimerOff(TimeForPairInt,Timer);
    if (rem_read(REM_EFP_PRINT) > 0)
        printf(" Total EFP pairwise integrals: %.1f s (CPU) %.1f s (wall)\n",TimeForPairInt[0],TimeForPairInt[2]);

}

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
    printf("%35s %16.10lf\n", "MM COULOMB ENERGY", energy.qq);
    printf("%35s %16.10lf\n", "MM LJ ENERGY", energy.lj);
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

    // QM/MM: not implemented so far
    if (rem_read(REM_EFP_QMMM) > 0)
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
            //printf("%56s %16.10lf\n", "QM NUC/EFP ELEC ENERGY",
            //        energies[i].electrostatic);
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

/*
void EFP2::get_qm_gradient(std::vector<double>& grad)
{
    size_t n_atoms;

    check_fail(efp_get_point_charge_count(impl_->efp, &n_atoms));
    grad.resize(3 * n_atoms);
    check_fail(efp_get_point_charge_gradient(impl_->efp, &grad.front()));
}
*/

void EFP2::get_qmmm_nuclear_gradient(double *grad)
{
    // before asking for the gradient on QM nuclei (ptc points), add LJ contributions to them
    check_fail(update_gradient_special_fragment(impl_->efp));

    size_t n_atoms;
    check_fail(efp_get_point_charge_count(impl_->efp, &n_atoms));

    // need vector here
    std::vector<double> grad_vec;
    grad_vec.resize(3*n_atoms);
    check_fail(efp_get_point_charge_gradient(impl_->efp, &grad_vec.front()));
    // convert from vector to double array
    copy(grad_vec.begin(),grad_vec.end(),grad);
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
	*energy = EFP2::instance().get_excited_state_energy_correction(jPv, *size, *Ecis);
}
