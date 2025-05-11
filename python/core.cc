/*
    pylibefp/core.cc: Main binding of libefp with pybind11

    Copyright (c) 2017-2019 The Psi4 Developers

    All rights reserved. Use of this source code is governed by a
    BSD-style license that can be found in the LICENSE file.
*/

#include <efp.h>
#if __has_include(<libefp/private.h>)
#include <libefp/private.h>
#else
#include "private.h"
#endif

#include <pybind11/pybind11.h>

#include <sstream>
#include <algorithm>

namespace py = pybind11;

class libefpException : public std::exception {
   public:
    explicit libefpException(const char* m) : message{m} {}
    virtual const char* what() const noexcept override { return message.c_str(); }

   private:
    std::string message = "";
};

std::string _efp_banner(efp* efp) {
    std::string str;
    str = std::string(efp_banner());
    return str;
}

efp_result _efp_prepare(efp* efp) {
    enum efp_result res;
    res = efp_prepare(efp);
    return res;
}

efp_result _efp_compute(efp* efp, int do_gradient) {
    enum efp_result res;
    res = efp_compute(efp, do_gradient);
    return res;
}

efp_result _efp_add_ligand(efp* efp, int ligand_index) {
    enum efp_result res;
    res = efp_add_ligand(efp, ligand_index);
    return res;
}

py::tuple _efp_get_frag_name(efp* efp, size_t frag_idx) {
    enum efp_result res;
    char buffer[80];

    res = efp_get_frag_name(efp, frag_idx, 80, buffer);
    std::string fname = std::string(buffer);

    py::tuple rets = py::make_tuple(res, fname);
    return rets;
}

efp_result _efp_set_frag_coordinates(efp* efp, size_t frag_idx, efp_coord_type ctype, py::list coord) {
    enum efp_result res;

    double* ccoords = NULL;
    // need to know how many atoms are in fragment for 'atoms' ctype
    size_t n_atom = 0;
    res = efp_get_frag_atom_count(efp, frag_idx, &n_atom);

    switch (ctype) {
        case EFP_COORD_TYPE_ATOMS:
            ccoords = new double[3*n_atom];
            break;
        default:
            ccoords = new double[12];
            break;
    }
    double* pcoords = ccoords;
    for (auto itm : coord) *pcoords++ = itm.cast<double>();

    res = efp_set_frag_coordinates(efp, frag_idx, ctype, ccoords);
    return res;
}

efp_result _efp_set_point_charge_values(efp* efp, size_t n_ptc, py::list ptc) {
    enum efp_result res;

    double* cptc = NULL;
    cptc = new double[n_ptc];
    double* pptc = cptc;
    for (auto itm : ptc) *pptc++ = itm.cast<double>();

    res = efp_set_point_charge_values(efp, cptc);
    return res;
}

efp_result _efp_set_point_charge_coordinates(efp* efp, size_t n_ptc, py::list xyz) {
    enum efp_result res;

    double* cxyz = NULL;
    cxyz = new double[3 * n_ptc];
    double* pxyz = cxyz;
    for (auto itm : xyz) *pxyz++ = itm.cast<double>();

    res = efp_set_point_charge_coordinates(efp, cxyz);
    return res;
}

efp_result _efp_set_point_charges(efp* efp, size_t n_ptc, py::list ptc, py::list xyz) {
    enum efp_result res;

    double* cptc = NULL;
    cptc = new double[n_ptc];
    double* pptc = cptc;
    for (auto itm : ptc) *pptc++ = itm.cast<double>();

    double* cxyz = NULL;
    cxyz = new double[3 * n_ptc];
    double* pxyz = cxyz;
    for (auto itm : xyz) *pxyz++ = itm.cast<double>();

    res = efp_set_point_charges(efp, n_ptc, cptc, cxyz);
    return res;
}

py::tuple _efp_get_frag_charge(efp* efp, size_t frag_idx) {
    enum efp_result res;
    double charge = 0.0;

    res = efp_get_frag_charge(efp, frag_idx, &charge);

    py::tuple rets = py::make_tuple(res, charge);
    return rets;
}

py::tuple _efp_get_frag_multiplicity(efp* efp, size_t frag_idx) {
    enum efp_result res;
    int multiplicity = 0;

    res = efp_get_frag_multiplicity(efp, frag_idx, &multiplicity);

    py::tuple rets = py::make_tuple(res, multiplicity);
    return rets;
}

py::tuple _efp_get_gradient(efp* efp, size_t n_frag) {
    enum efp_result res;
    py::list grad;

    double* ccoords = NULL;
    ccoords = new double[6 * n_frag];
    double* pcoords = ccoords;

    res = efp_get_gradient(efp, ccoords);
    for (size_t ic = 0; ic < 6 * n_frag; ++ic) grad.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, grad);
    return rets;
}

// SKP

py::list _efp_get_pairwise_energy(efp* efp, size_t n_frag) {
    enum efp_result res;

    std::vector<struct efp_energy> pair_energies(n_frag);
    res = efp_get_pairwise_energy(efp, pair_energies.data());

    py::list py_energies;

    for (size_t i = 0; i < n_frag; ++i) {
        py::dict energy;
        energy["electrostatic"] = pair_energies[i].electrostatic;
        energy["exchange_repulsion"] = pair_energies[i].exchange_repulsion;
        energy["polarization"] = pair_energies[i].polarization;
        energy["dispersion"] = pair_energies[i].dispersion;
        energy["charge_penetration"] = pair_energies[i].charge_penetration;

        double total = pair_energies[i].electrostatic + pair_energies[i].exchange_repulsion +
                pair_energies[i].polarization + pair_energies[i].dispersion + pair_energies[i].charge_penetration;
        energy["total"] = total;
        py_energies.append(energy);
    }

    return py_energies;
}

py::tuple _efp_get_frag_count(efp* efp) {
    enum efp_result res;
    size_t n_frag = 0;

    res = efp_get_frag_count(efp, &n_frag);

    py::tuple rets = py::make_tuple(res, n_frag);
    return rets;
}

py::tuple _efp_get_frag_atom_count(efp* efp, size_t frag_idx) {
    enum efp_result res;
    size_t n_atom = 0;

    res = efp_get_frag_atom_count(efp, frag_idx, &n_atom);

    py::tuple rets = py::make_tuple(res, n_atom);
    return rets;
}

py::tuple _efp_get_periodic_box(efp* efp) {
    enum efp_result res;
    py::list xyz;

    size_t dim = 6;
    double* ccoords = NULL;
    ccoords = new double[dim];
    double* pcoords = ccoords;

    res = efp_get_periodic_box(efp, ccoords);
    for (size_t ic = 0; ic < dim; ++ic) xyz.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, xyz);
    return rets;
}

py::tuple _efp_get_multipole_count(efp* efp) {
    enum efp_result res;
    size_t n_mult = 0;

    res = efp_get_multipole_count(efp, &n_mult);

    py::tuple rets = py::make_tuple(res, n_mult);
    return rets;
}

py::tuple _efp_get_multipole_coordinates(efp* efp, size_t n_mult) {
    enum efp_result res;
    py::list xyz;

    size_t dim = 3 * n_mult;
    double* ccoords = NULL;
    ccoords = new double[dim];
    double* pcoords = ccoords;

    res = efp_get_multipole_coordinates(efp, ccoords);
    for (size_t ic = 0; ic < dim; ++ic) xyz.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, xyz);
    return rets;
}

py::tuple _efp_get_multipole_values(efp* efp, size_t n_mult) {
    enum efp_result res;
    py::list mult;

    size_t dim = (1 + 3 + 6 + 10) * n_mult;
    double* ccoords = NULL;
    ccoords = new double[dim];
    double* pcoords = ccoords;

    res = efp_get_multipole_values(efp, ccoords);
    for (size_t ic = 0; ic < dim; ++ic) mult.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, mult);
    return rets;
}

py::tuple _efp_get_induced_dipole_count(efp* efp) {
    enum efp_result res;
    size_t n_dip = 0;

    res = efp_get_induced_dipole_count(efp, &n_dip);

    py::tuple rets = py::make_tuple(res, n_dip);
    return rets;
}

py::tuple _efp_get_induced_dipole_coordinates(efp* efp, size_t n_dip) {
    enum efp_result res;
    py::list xyz;

    size_t dim = 3 * n_dip;
    double* ccoords = NULL;
    ccoords = new double[dim];
    double* pcoords = ccoords;

    res = efp_get_induced_dipole_coordinates(efp, ccoords);
    for (size_t ic = 0; ic < dim; ++ic) xyz.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, xyz);
    return rets;
}

py::tuple _efp_get_induced_dipole_values(efp* efp, size_t n_dip) {
    enum efp_result res;
    py::list vals;

    size_t dim = 3 * n_dip;
    double* ccoords = NULL;
    ccoords = new double[dim];
    double* pcoords = ccoords;

    res = efp_get_induced_dipole_values(efp, ccoords);
    for (size_t ic = 0; ic < dim; ++ic) vals.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, vals);
    return rets;
}

py::tuple _efp_get_induced_dipole_conj_values(efp* efp, size_t n_dip) {
    enum efp_result res;
    py::list vals;

    size_t dim = 3 * n_dip;
    double* ccoords = NULL;
    ccoords = new double[dim];
    double* pcoords = ccoords;

    res = efp_get_induced_dipole_conj_values(efp, ccoords);
    for (size_t ic = 0; ic < dim; ++ic) vals.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, vals);
    return rets;
}

py::tuple _efp_get_point_charge_count(efp* efp) {
    enum efp_result res;
    size_t n_ptc = 0;

    res = efp_get_point_charge_count(efp, &n_ptc);

    py::tuple rets = py::make_tuple(res, n_ptc);
    return rets;
}

py::tuple _efp_get_point_charge_coordinates(efp* efp, size_t n_ptc) {
    enum efp_result res;
    py::list xyz;

    size_t dim = 3 * n_ptc;
    double* ccoords = NULL;
    ccoords = new double[dim];
    double* pcoords = ccoords;

    res = efp_get_point_charge_coordinates(efp, ccoords);
    for (size_t ic = 0; ic < dim; ++ic) xyz.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, xyz);
    return rets;
}

py::tuple _efp_get_point_charge_values(efp* efp, size_t n_ptc) {
    enum efp_result res;
    py::list vals;

    size_t dim = n_ptc;
    double* ccoords = NULL;
    ccoords = new double[dim];
    double* pcoords = ccoords;

    res = efp_get_point_charge_values(efp, ccoords);
    for (size_t ic = 0; ic < dim; ++ic) vals.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, vals);
    return rets;
}

// TODO: probably filling would fail if res not good in a lot of these

py::tuple _efp_get_frag_atoms(efp* efp, size_t frag_idx, size_t frag_natom) {
    enum efp_result res;
    struct efp_atom * atoms = new struct efp_atom[frag_natom];
    py::list ats_info;

    if ((res = efp_get_frag_atoms(efp, frag_idx, frag_natom, atoms))) {
        py::tuple rets = py::make_tuple(res, ats_info);
        return rets;
    }

    for (size_t iat = 0; iat < frag_natom; ++iat) {
        py::dict at_info;
        at_info[py::str("Z")] = atoms[iat].znuc;
        at_info[py::str("mass")] = atoms[iat].mass;
        at_info[py::str("label")] = atoms[iat].label;
        at_info[py::str("x")] = atoms[iat].x;
        at_info[py::str("y")] = atoms[iat].y;
        at_info[py::str("z")] = atoms[iat].z;
        ats_info.append(at_info);
    }
    delete [] atoms;

    py::tuple rets = py::make_tuple(res, ats_info);
    return rets;
}

// py::dict extend_efp_get_atoms(efp* efp) {
//    enum efp_result res;
//    size_t frag_natom, natom=0;
//    double frag_chg;
//    int frag_mult;
//    py::list fr, frt, frcg, frmp, full_atoms;
//
//    py::dict mol_info;
//    mol_info[py::str("units")] = "Bohr";
//    mol_info[py::str("input_units_to_au")] = 1.0;
//    mol_info[py::str("fix_com")] = true;
//    mol_info[py::str("fix_orientation")] = true;
//    mol_info[py::str("fix_symmetry")] = "c1";
//
//    size_t frag_count = twrapped_efp_get_frag_count(efp);
//    for (int ifr = 0; ifr < frag_count; ++ifr) {
//        frag_natom = twrapped_efp_get_frag_atom_count(efp, ifr);
//        py::list f;
//        f.append(natom);
//        natom = natom + frag_natom;
//        f.append(natom);
//        fr.append(f);
//        frt.append("Real");
//        frcg.append(static_cast<int>(wrapped_efp_get_frag_charge(efp, ifr)));
//        frmp.append(wrapped_efp_get_frag_multiplicity(efp, ifr));
//
//        struct efp_atom atoms[frag_natom];
//        if ((res = efp_get_frag_atoms(efp, ifr, frag_natom, atoms))) {
//            std::string sres = "efp_get_frag_atoms: " + rts(res) + "\n";
//            throw libefpException(sres.c_str());
//        }
//
//        for (size_t iat = 0; iat < frag_natom; ++iat) {
//            py::dict at_init;
//            at_init[py::str("Z")] = atoms[iat].znuc;
//            at_init[py::str("mass")] = atoms[iat].mass;
//            at_init[py::str("label")] = atoms[iat].label;
//            at_init[py::str("x")] = atoms[iat].x;
//            at_init[py::str("y")] = atoms[iat].y;
//            at_init[py::str("z")] = atoms[iat].z;
//            full_atoms.append(at_init);
//        }
//    }
//
//    mol_info[py::str("fragments")] = fr;
//    mol_info[py::str("fragment_types")] = frt;
//    mol_info[py::str("fragment_charges")] = frcg;
//    mol_info[py::str("fragment_multiplicities")] = frmp;
//    mol_info[py::str("full_atoms")] = full_atoms;
//
//    return mol_info;
//}

py::tuple _efp_get_coordinates(efp* efp, size_t n_frag) {
    enum efp_result res;
    py::list xyzabc;

    double* ccoords = NULL;
    ccoords = new double[6 * n_frag];
    double* pcoords = ccoords;

    res = efp_get_coordinates(efp, pcoords);
    for (size_t ic = 0; ic < 6 * n_frag; ++ic) xyzabc.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, xyzabc);
    return rets;
}

py::tuple _efp_get_frag_xyzabc(efp* efp, size_t frag_idx) {
    enum efp_result res;
    py::list xyzabc;

    double* ccoords = NULL;
    ccoords = new double[6];
    double* pcoords = ccoords;

    res = efp_get_frag_xyzabc(efp, frag_idx, pcoords);
    for (size_t ic = 0; ic < 6; ++ic) xyzabc.append(ccoords[ic]);

    py::tuple rets = py::make_tuple(res, xyzabc);
    return rets;
}

py::tuple _efp_get_wavefunction_dependent_energy(efp* efp) {
    enum efp_result res;
    double ene;

    res = efp_get_wavefunction_dependent_energy(efp, &ene);

    py::tuple rets = py::make_tuple(res, ene);
    return rets;
}

// stash the python E_field fn here
py::function field_fn_callback;
py::function get_field_fn_callback(void) { return field_fn_callback; }

efp_result cwrapped_field_fn(size_t n_pt, const double* xyz, double* field, void* user_data) {
    // prepare xyz: double* --> py::list
    py::list py_xyz;
    for (size_t ic = 0; ic < 3 * n_pt; ++ic) py_xyz.append(xyz[ic]);

    py::function fn = get_field_fn_callback();
    py::list py_field = fn(py_xyz);

    // harvest field: py::list --> double*
    double* field_p = field;
    for (auto itm : py_field) *field_p++ = itm.cast<double>();

    return EFP_RESULT_SUCCESS;
}


void _efp_set_electron_density_field_fn(efp* efp, py::function fn) {
    field_fn_callback = fn;
    efp_set_electron_density_field_fn(efp, cwrapped_field_fn);
}

py::function dummy;
void _clear_electron_density_field_fn(efp* efp) { field_fn_callback = dummy; }

void _clean(efp* efp) {
    _clear_electron_density_field_fn(efp);
    efp_shutdown(efp);
}

//      //  py::list coord --> double* ccoords
//          double* ccoords = NULL;
//          ccoords = new double[12];  // room for xyzabc (6), points (9), or rotmat (12)
//          double* pcoords = ccoords;
//          for (auto itm : coord)
//              *pcoords++ = itm.cast<double>();
//
//      //  double* coords --> py::list
//          py::list coord;
//
//          double* ccoords = NULL;
//          ccoords = new double[12];
//          double* pcoords = ccoords;
//
//          double* ccoords = new double[12];  // alt
//
//          res = efp_get_multipole_coordinates(efp, ccoords);
//          for (size_t ic = 0; ic < 12; ++ic)
//              coord.append(ccoords[ic]);

PYBIND11_MODULE(core, m) {
    m.doc() = "Python wrapping of parallel implementation of the Effective Fragment Potential (EFP) method";

    m.attr("__copyright__") = py::str("Copyright (c) 2017-2024 The Psi4 Developers, 2024-2025 The LibEFP Developers");
    py::exception<libefpException>(m, "libefpException");

    // clang-format off
    py::enum_<efp_result>(m, "efp_result", "Result of a libefp operation")
        .value("EFP_RESULT_SUCCESS", EFP_RESULT_SUCCESS,                      "Operation was successful.")
        .value("EFP_RESULT_FATAL", EFP_RESULT_FATAL,                          "Fatal error has occurred.")
        .value("EFP_RESULT_NO_MEMORY", EFP_RESULT_NO_MEMORY,                  "Insufficient memory.")
        .value("EFP_RESULT_FILE_NOT_FOUND", EFP_RESULT_FILE_NOT_FOUND,        "File not found.")
        .value("EFP_RESULT_SYNTAX_ERROR", EFP_RESULT_SYNTAX_ERROR,            "Syntax error.")
        .value("EFP_RESULT_UNKNOWN_FRAGMENT", EFP_RESULT_UNKNOWN_FRAGMENT,    "Unknown EFP fragment.")
        .value("EFP_RESULT_POL_NOT_CONVERGED", EFP_RESULT_POL_NOT_CONVERGED,  "Polarization SCF procedure did not converge.")
        .export_values();

    py::enum_<efp_term>(m, "efp_term", py::arithmetic(), "Flags to specify EFP energy terms")
        .value("EFP_TERM_ELEC", EFP_TERM_ELEC,                                "EFP/EFP electrostatics.")
        .value("EFP_TERM_POL", EFP_TERM_POL,                                  "EFP/EFP polarization.")
        .value("EFP_TERM_DISP", EFP_TERM_DISP,                                "EFP/EFP dispersion.")
        .value("EFP_TERM_XR", EFP_TERM_XR,                                    "EFP/EFP exchange repulsion.")
        .value("EFP_TERM_CHTR", EFP_TERM_CHTR,                                "EFP/EFP charge transfer, reserved for future.")
        .value("EFP_TERM_AI_ELEC", EFP_TERM_AI_ELEC,                          "Ab initio/EFP electrostatics.")
        .value("EFP_TERM_AI_POL", EFP_TERM_AI_POL,                            "Ab initio/EFP polarization.")
        .value("EFP_TERM_AI_DISP", EFP_TERM_AI_DISP,                          "Ab initio/EFP dispersion, reserved for future.")
        .value("EFP_TERM_AI_XR", EFP_TERM_AI_XR,                              "Ab initio/EFP exchange repulsion, reserved for future.")
        .value("EFP_TERM_AI_CHTR", EFP_TERM_AI_CHTR,                          "Ab initio/EFP charge transfer, reserved for future.")
	    .value("EFP_TERM_QQ", EFP_TERM_QQ,                                    "MM-like charge-charge coulomb interaction") // SKP
        .value("EFP_TERM_LJ", EFP_TERM_LJ,                                    "MM-like Lennard-Jones interaction") // SKP
	    .value("EFP_TERM_AI_QQ", EFP_TERM_AI_QQ,                              "QM/MM coulomb interaction with MM charges") // SKP
        .export_values();
// ============= SKP addition ========================== //
    py::enum_<efp_special_term>(m, "efp_special_term", py::arithmetic(), "Flags to specify EFP energy terms for a special fragment")
	    .value("EFP_SPEC_TERM_ELEC", EFP_SPEC_TERM_ELEC,                                "EFP/EFP electrostatics.")
        .value("EFP_SPEC_TERM_POL", EFP_SPEC_TERM_POL,                                  "EFP/EFP polarization.")
        .value("EFP_SPEC_TERM_DISP", EFP_SPEC_TERM_DISP,                                "EFP/EFP dispersion.")
        .value("EFP_SPEC_TERM_XR", EFP_SPEC_TERM_XR,                                    "EFP/EFP exchange repulsion.")
        .value("EFP_SPEC_TERM_CHTR", EFP_SPEC_TERM_CHTR,                                "EFP/EFP charge transfer, reserved for future.")
        .value("EFP_SPEC_TERM_QQ", EFP_SPEC_TERM_QQ,                                    "MM-like charge-charge coulomb interaction")
        .value("EFP_SPEC_TERM_LJ", EFP_SPEC_TERM_LJ,                                "MM-like Lennard-Jones interaction")
	.export_values();
//====================================================== //
    py::enum_<efp_disp_damp>(m, "efp_disp_damp", "Fragment-fragment dispersion damping type")
        .value("EFP_DISP_DAMP_OVERLAP", EFP_DISP_DAMP_OVERLAP,                "Overlap-based damping (default).")
        .value("EFP_DISP_DAMP_TT", EFP_DISP_DAMP_TT,                          "Tang-Toennies damping.")
        .value("EFP_DISP_DAMP_OFF", EFP_DISP_DAMP_OFF,                        "No dispersion damping.")
        .export_values();

    py::enum_<efp_elec_damp>(m, "efp_elec_damp", "Fragment-fragment electrostatic damping type")
        .value("EFP_ELEC_DAMP_SCREEN", EFP_ELEC_DAMP_SCREEN,                  "SCREEN-controlled damping (default).")
        .value("EFP_ELEC_DAMP_OVERLAP", EFP_ELEC_DAMP_OVERLAP,                "Overlap-based damping.")
        .value("EFP_ELEC_DAMP_OFF", EFP_ELEC_DAMP_OFF,                        "No electrostatic damping.")
        .export_values();

    py::enum_<efp_pol_damp>(m, "efp_pol_damp", "Fragment-fragment polarization damping type")
        .value("EFP_POL_DAMP_TT", EFP_POL_DAMP_TT,                            "Tang-Toennies like damping (default).")
        .value("EFP_POL_DAMP_OFF", EFP_POL_DAMP_OFF,                          "No polarization damping.")
        .export_values();

    py::enum_<efp_coord_type>(m, "efp_coord_type", "Describes the way fragment coordinates are specified")
        .value("EFP_COORD_TYPE_XYZABC", EFP_COORD_TYPE_XYZABC,                "Coordinates of center of mass of a fragment and Euler angles.")
        .value("EFP_COORD_TYPE_POINTS", EFP_COORD_TYPE_POINTS,                "Coordinates of three points belonging to a fragment.")
        .value("EFP_COORD_TYPE_ROTMAT", EFP_COORD_TYPE_ROTMAT,                "Coordinates of fragment center of mass and its rotation matrix.")
        .value("EFP_COORD_TYPE_ATOMS", EFP_COORD_TYPE_ATOMS,                  "Coordinates of all fragment atoms.")
        .export_values();


    py::enum_<efp_pol_driver>(m, "efp_pol_driver", "Driver used for solving polarization equations")
        .value("EFP_POL_DRIVER_ITERATIVE", EFP_POL_DRIVER_ITERATIVE,          "Iterative solution of polarization equations.")
        .value("EFP_POL_DRIVER_DIRECT", EFP_POL_DRIVER_DIRECT,                "Direct solution of polarization equations.")
        .export_values();

    py::enum_<efp_symm_frag>(m, "efp_symm_frag", "Specifies which fragments are considered identical by symmetry")
        .value("EFP_SYMM_FRAG_FRAG", EFP_SYMM_FRAG_FRAG,                       "All same fragments are symmetry-identical (default.")
        .value("EFP_SYMM_FRAG_LIST", EFP_SYMM_FRAG_LIST,                       "Symmetric fragments are given in a list (not implemented).")
        .export_values();

    py::class_<efp_opts>(m, "efp_opts", "Options controlling EFP computation")
        .def(py::init())
        .def_readwrite("terms", &efp_opts::terms,                             "Specifies which energy terms to compute.")
        .def_readwrite("special_terms", &efp_opts::special_terms,             "Terms for a special fragment - typically QM or ML fragment") // SKP
        .def_readwrite("disp_damp", &efp_opts::disp_damp,                     "Dispersion damping type (see #efp_disp_damp).")
        .def_readwrite("elec_damp", &efp_opts::elec_damp,                     "Electrostatic damping type (see #efp_elec_damp).")
        .def_readwrite("pol_damp", &efp_opts::pol_damp,                       "Polarization damping type (see #efp_pol_damp).")
        .def_readwrite("pol_driver", &efp_opts::pol_driver,                   "Driver used to find polarization induced dipoles.")
        .def_readwrite("enable_pbc", &efp_opts::enable_pbc,                   "Enable periodic boundary conditions if nonzero.")
        .def_readwrite("enable_elpot", &efp_opts::enable_elpot,               "Enable switching off elpot contribution for custom torch gradient.")
        .def_readwrite("enable_cutoff", &efp_opts::enable_cutoff,             "Enable frag-fraginteraction cutoff if nonzero.")
        .def_readwrite("swf_cutoff", &efp_opts::swf_cutoff,                   "Cutoff distance for frag-frag interactions.")
        .def_readwrite("xr_cutoff", &efp_opts::xr_cutoff,                     "Cutoff distance for exchange-repulsion calculations.")
        .def_readwrite("enable_pairwise", &efp_opts::enable_pairwise,         "Enable ligand-fragment energy decomposition from total system") // SKP
        .def_readwrite("ligand", &efp_opts::ligand,                           "Ligand number") // SKP
        .def_readwrite("special_fragment", &efp_opts::special_fragment,       "Index of a special (QM or ML) fragment") // SKP
        .def_readwrite("symmetry", &efp_opts::symmetry,                       "Sets system symmetry option") // SKP
        .def_readwrite("symm_frag", &efp_opts::symm_frag,                     "Specifies symmetric elements of the crystal lattice. Default each unique fragment")
        .def_readwrite("update_params", &efp_opts::update_params,             "Enables updating (shifting) library fragment parameters to match fragment geometry. Default 0 (no update). Not implemented.")
        .def_readwrite("update_params_cutoff", &efp_opts::update_params_cutoff, "Cutoff when updating parameters is \"safe\". Default 0.0 (never safe).")
        .def_readwrite("print", &efp_opts::print,                             "Level of print out.");

    py::class_<efp_energy>(m, "efp_energy", "EFP energy terms")
        .def(py::init())
        .def_readwrite("electrostatic", &efp_energy::electrostatic,           "EFP/EFP electrostatic energy.")
        .def_readwrite("ai_electrostatic", &efp_energy::ai_electrostatic,     "AI/EFP electrostatic energy.")
        .def_readwrite("charge_penetration", &efp_energy::charge_penetration, "Charge penetration energy from"
                                                                              "overlap-based electrostatic damping."
                                                                              "Zero if overlap-based damping is turned"
                                                                              "off.")
        .def_readwrite("electrostatic_point_charges", &efp_energy::electrostatic_point_charges,
                                                                              "Interaction energy of EFP electrostatics"
                                                                              "with point charges.")
        .def_readwrite("polarization", &efp_energy::polarization,             "All polarization energy goes here."
                                                                              "Polarization is computed self-consist-"
                                                                              "ently so it can't be separated into"
                                                                              "EFP/EFP and AI/EFP parts.")
        .def_readwrite("exs_polarization", &efp_energy::exs_polarization,     "Separate storage for polarization corresponding to the excited/correlated state."
                                                                              "Relevant for excited state QM/EFP calculations.")
        .def_readwrite("ai_polarization", &efp_energy::ai_polarization,       "Polarization energy storage for pairwise AI/EFP analysis.")
        .def_readwrite("dispersion", &efp_energy::dispersion,                 "EFP/EFP dispersion energy.")
        .def_readwrite("ai_dispersion", &efp_energy::ai_dispersion,           "AI/EFP dispersion energy.")
        .def_readwrite("exchange_repulsion", &efp_energy::exchange_repulsion, "EFP/EFP exchange-repulsion energy.")
	    .def_readwrite("qq", &efp_energy::qq, 				                  "EFP/EFP charge-charge energy.")
	    .def_readwrite("lj", &efp_energy::lj, 				                  "EFP/EFP lennard-jones energy.")
	    .def_readwrite("total", &efp_energy::total,                           "Sum of all the above energy terms.");

    py::class_<efp_atom>(m, "efp_atom", "EFP atom info")
        .def(py::init())
//        .def_readwrite("label", &efp_atom::label,                             "Atom label.")  // char label[32]
        .def_readwrite("x", &efp_atom::x,                                     "X coordinate of atom position.")
        .def_readwrite("y", &efp_atom::y,                                     "Y coordinate of atom position.")
        .def_readwrite("z", &efp_atom::z,                                     "Z coordinate of atom position.")
        .def_readwrite("gx", &efp_atom::gx,                                   "X component of gradient.")
        .def_readwrite("gy", &efp_atom::gy,                                   "Y component of gradient.")
        .def_readwrite("gz", &efp_atom::gz,                                   "Z component of gradient.")
        .def_readwrite("mass", &efp_atom::mass,                               "Atom mass.")
        .def_readwrite("znuc", &efp_atom::znuc,                               "Nuclear charge.")
        .def_readwrite("mm_charge", &efp_atom::mm_charge,                     "Classical charge.")
        .def_readwrite("sigma", &efp_atom::sigma,                             "vdW parameter.")
        .def_readwrite("epsilon", &efp_atom::epsilon,                         "vdW parameter.");
//        .def_readwrite("ff_label", &efp_atom::ff_label,                       "Force field atom type.");

/**
    py::class_<efp_mult_pt>(m, "efp_mult_pt", "EFP Multipole point for working with external programs")
        .def(py::init())
        .def_readwrite("x", &efp_mult_pt::x,                                  "X coordinate.")
        .def_readwrite("y", &efp_mult_pt::y,                                  "Y coordinate.")
        .def_readwrite("z", &efp_mult_pt::z,                                  "Z coordinate.")
        .def_readwrite("znuc", &efp_mult_pt::znuc,                            "Nuclear charge.")
        .def_readwrite("monopole", &efp_mult_pt::monopole,                    "Monopole.")
        .def_readwrite("dipole", &efp_mult_pt::dipole,                        "Dipole.")  // array!
        .def_readwrite("quadrupole", &efp_mult_pt::quadrupole,                "Quadrupole.")
        .def_readwrite("octupole", &efp_mult_pt::octupole,                    "Octupole.")
        .def_readwrite("rank", &efp_mult_pt::rank,                            "Highest non-zero multipole: 0 - monopole, 1 - dipole, 2 - quad, 3 - oct.")
        .def_readwrite("screen0", &efp_mult_pt::screen0,                      "AI-EFP screening parameter.")
        .def_readwrite("if_screen", &efp_mult_pt::if_screen,                  "If screen0 parameter exists and meaningful.");

    py::class_<efp_pol_pt>(m, "efp_pol_pt", "EFP polarizability point for working with external programs")
        .def(py::init())
        .def_readwrite("x", &efp_pol_pt::x,                                  "X coordinate.")
        .def_readwrite("y", &efp_pol_pt::y,                                  "Y coordinate.")
        .def_readwrite("z", &efp_pol_pt::z,                                  "Z coordinate.")
        .def_readwrite("indip", &efp_pol_pt::indip,                          "Induced dipole.")  // array!
        .def_readwrite("indipconj", &efp_pol_pt::indipconj,                  "Conjugated induced dipole.")  // array!
        .def_readwrite("indip_gs", &efp_pol_pt::indip_gs,                    "Induced dipole of the ground electronic state.")  // array!
        .def_readwrite("indipconj_gs", &efp_pol_pt::indipconj_gs,            "Conjugated induced dipole of the ground electronic state.")  // array!
        .def_readwrite("ai_field", &efp_pol_pt::ai_field,                    "Field due to QM wavefunction.");  // array!
// clang-format on
**/

    py::class_<efp, std::unique_ptr<efp, py::nodelete>>(m, "efp", py::dynamic_attr(), "Main libefp opaque structure")
        // dynamic_attr for stashing input_units_to_au
        .def(py::init(&efp_create), "Creates a new efp object via `efp_create`")
        .def("banner", &_efp_banner, "Gets a human readable banner string with information about the library")
        .def("_efp_set_opts", &efp_set_opts, "Wrapped set computation options")
        .def("_efp_get_opts", &efp_get_opts, "Gets currently set computation options")
        .def("_efp_add_potential", &efp_add_potential, "Wrapped adds EFP potential from full file path")
        .def("_efp_add_fragment", &efp_add_fragment, "Wrapped adds a new fragment to the EFP subsystem")
        .def("_efp_add_ligand", &efp_add_ligand, "Wrapped adds a a ligand fragment to the system")
        .def("_efp_prepare", &efp_prepare, "Wrapped prepares the calculation")
        .def("set_electron_density_field_fn", &_efp_set_electron_density_field_fn,
             "Sets the callback function which computes electric field from electrons in ab initio subsystem")
        .def("clear_electron_density_field_fn", &_clear_electron_density_field_fn,
             "Detaches callback function from EFP instance (necessary for destruction. Called by clean or call "
             "alongside shutdown")
        .def("_efp_set_point_charges", &_efp_set_point_charges,
             "Wrapped setup arbitrary point charges of magnitude at locations interacting with EFP subsystem",
             py::arg("n_ptc"), py::arg("ptc"), py::arg("xyz"))
        .def("_efp_set_point_charge_coordinates", &_efp_set_point_charge_coordinates,
             "Wrapped sets coordinates of arbitrary point charges interacting with EFP subsystem",
             py::arg("n_ptc"), py::arg("xyz"))
        .def("_efp_set_point_charge_values", &_efp_set_point_charge_values,
             "Wrapped sets magnitudes of arbitrary point charges interacting with EFP subsystem")
        .def("_efp_get_point_charge_count", &_efp_get_point_charge_count,
             "Gets the number of currently set point charges")
        .def("_efp_get_point_charge_coordinates", &_efp_get_point_charge_coordinates,
             "Wrapped gets coordinates of currently set point charges",
             py::arg("n_ptc"))
        .def("_efp_get_point_charge_values", &_efp_get_point_charge_values,
             "Wrapped gets values of currently set point charges")
        .def("get_point_charge_gradient", &efp_get_point_charge_gradient,
             "Gets gradient on point charges from EFP subsystem and returns them in *arg1*")
        .def("_efp_set_frag_coordinates", &_efp_set_frag_coordinates,
             "Wrapped updates position and orientation of the specified effective fragment with type",
             py::arg("frag_idx"), py::arg("ctype"), py::arg("coord"))
        .def("_efp_get_coordinates", &_efp_get_coordinates,
             py::arg("n_frag"),
             "Wrapped gets center of mass positions and Euler angles of the effective fragments")
        .def("_efp_get_frag_xyzabc", &_efp_get_frag_xyzabc, py::arg("frag_idx"),
             "Wrapped gets center of mass position and Euler angles on fragment ``frag_idx``")
        .def("_efp_set_periodic_box", &efp_set_periodic_box, "Wrapped sets up periodic box size")
        .def("_efp_get_periodic_box", &_efp_get_periodic_box, "Wrapped gets periodic box size")
        .def("_efp_get_wavefunction_dependent_energy", &_efp_get_wavefunction_dependent_energy,
             "Wrapped updates wavefunction-dependent energy terms")
        .def("_efp_compute", &efp_compute, py::arg("do_gradient") = false,
             "Perform the EFP computation, optionally doing gradient")
        .def("_efp_get_frag_charge", &_efp_get_frag_charge, "Gets total charge on fragment", py::arg("frag_idx"))
        .def("_efp_get_frag_multiplicity", &_efp_get_frag_multiplicity, "Gets spin multiplicity on fragment")
        // Multipoles & Induced Dipoles
        .def("_efp_get_multipole_count", &_efp_get_multipole_count,
             "Wrapped gets total number of multipoles from EFP electrostatics")
        .def("_efp_get_multipole_coordinates", &_efp_get_multipole_coordinates,
             "Wrapped gets coordinates of electrostatics multipoles")
        .def("_efp_get_multipole_values", &_efp_get_multipole_values,
             "Wrapped gets electrostatics multipoles from EFP fragments")
        .def("_efp_get_induced_dipole_count", &_efp_get_induced_dipole_count,
             "Wrapped gets the number of polarization induced dipoles")
        .def("_efp_get_induced_dipole_coordinates", &_efp_get_induced_dipole_coordinates,
             "Wrapped gets coordinates of induced dipoles")
        .def("_efp_get_induced_dipole_values", &_efp_get_induced_dipole_values,
             "Wrapped gets values of polarization induced dipoles")
        .def("_efp_get_induced_dipole_conj_values", &_efp_get_induced_dipole_conj_values,
             "Wrapped gets values of polarization conjugated induced dipoles")
        .def("_efp_get_energy", &efp_get_energy, "Gets computed energy components")
        .def("_efp_get_gradient", &_efp_get_gradient, "Gets computed EFP energy gradient")
        .def("_efp_get_pairwise_energy", &_efp_get_pairwise_energy, "Gets pairwise energies")
        .def("_efp_set_symmlist", &efp_set_symmlist, "Prepares information for computing symmetric crystals")
	    .def("_efp_get_frag_count", &_efp_get_frag_count, "Gets the number of fragments in this computation")
        .def("_efp_get_frag_name", &_efp_get_frag_name, "Gets the name of the specified effective fragment")
        .def("_efp_get_frag_atom_count", &_efp_get_frag_atom_count, "Gets the number of atoms on fragment")
        .def("_efp_get_frag_atoms", &_efp_get_frag_atoms,
             "Wrapped get atoms comprising the specified 0-indexed fragment, ``frag_idx``",
             py::arg("frag_idx"), py::arg("frag_natom"))
        .def("get_electric_field", &efp_get_electric_field,
             "Gets electric field for a point on 0-indexed fragment *arg0* and returns it in *arg1*")
        .def("torque_to_derivative", &efp_torque_to_derivative,
             "Convert rigid body torque *arg1* to derivatives *arg2* of energy by Euler angles *arg0*")
        .def("clean", &_clean, "Preferred destructor combining libefp::efp_shutdown and field_fn release")
        .def("shutdown", &efp_shutdown, "Release all resources used by this EFP");
}

// Unwrapped
// * efp_print_banner
// * efp_set_electron_density_field_user_data  # what is this?
// * result_to_string

// clang-format off
// .def("set_error_log", &efp_set_error_log, "Sets the error log callback function")
// .def("skip_fragments", &efp_skip_fragments, "Skip interactions between the fragments *arg0* and *arg1* inclusive if *arg2*")
// .def("set_coordinates", &efp_set_coordinates, "Update positions and orientations of all fragments with types in array *arg0* and returns them in *arg1*")
// .def("get_stress_tensor", &efp_get_stress_tensor, "Gets the stress tensor and returns it in *arg0*")
// .def("get_ai_screen", &efp_get_ai_screen, "Gets the ab initio screening parameters on 0-indexed fragment *arg0* and returns it in *arg1*")
// .def("set_orbital_energies", &efp_set_orbital_energies, "Sets ab initio orbital energies to *efp0* number core orbitals, *efp1* number active orbitals, *efp2* number virtual orbitals, *efp3* array of orbital energies")
// .def("set_dipole_integrals", &efp_set_dipole_integrals, "Sets ab initio dipole integrals to  *efp0* number core orbitals, *efp1* number active orbitals, *efp2* number virtual orbitals, *efp3* dipole integral matrices")
// .def("get_frag_multipole_count", &efp_get_frag_multipole_count, "Gets number of electrostatic multipole points on 0-indexed fragment *arg0* and returns it in *arg1*")
// .def("get_lmo_count", &efp_get_lmo_count, "Gets the number of LMOs in a fragment and returns it in *arg0*")
// .def("get_lmo_coordinates", &efp_get_lmo_coordinates, "Gets coordinates of LMO centroids on 0-indexed fragment *arg0* and returns it in *arg1*")
// .def("get_xrfit", &efp_get_xrfit, "Gets parameters of fitted exchange-repulsion on 0-indexed fragment *arg0* and returns it in *arg1*")
// .def("get_atomic_gradient", &efp_get_atomic_gradient, "Gets computed EFP energy gradient on individual atoms and returns it in *arg0*")
// .def("get_frag_mass", &efp_get_frag_mass, "Gets total mass on 0-indexed fragment *arg0* and returns it in *arg1*")
// .def("get_frag_inertia", &efp_get_frag_inertia, "Gets fragment principal moments of inertia on 0-indexed fragment *arg0* and returns it in *arg1*")
// clang-format on
