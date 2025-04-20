/*-
 * Copyright (c) 2012-2017 Ilya Kaliman
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#ifndef LIBEFP_EFP_H
#define LIBEFP_EFP_H

#include <stddef.h>
#include <stdbool.h>

/** \file efp.h
 * Public libefp interface.
 *
 * A note on units: masses are in AMU, everything else is in atomic units.
 */

#ifdef __cplusplus
extern "C" {
#endif

/** Version string. */
#define LIBEFP_VERSION_STRING "2.0.0"

/** Result of an operation. */
enum efp_result {
	/** Operation was successful. */
	EFP_RESULT_SUCCESS = 0,
	/** Fatal error has occurred. */
	EFP_RESULT_FATAL,
	/** Insufficient memory. */
	EFP_RESULT_NO_MEMORY,
	/** File not found. */
	EFP_RESULT_FILE_NOT_FOUND,
	/** Syntax error. */
	EFP_RESULT_SYNTAX_ERROR,
	/** Unknown EFP fragment. */
	EFP_RESULT_UNKNOWN_FRAGMENT,
	/** Polarization SCF procedure did not converge. */
	EFP_RESULT_POL_NOT_CONVERGED
};

/** Flags to specify EFP energy terms. */
enum efp_term {
	/** EFP/EFP electrostatics. */
	EFP_TERM_ELEC = 1 << 0,
	/** EFP/EFP polarization. */
	EFP_TERM_POL = 1 << 1,
	/** EFP/EFP dispersion. */
	EFP_TERM_DISP = 1 << 2,
	/** EFP/EFP exchange repulsion. */
	EFP_TERM_XR = 1 << 3,
	/** EFP/EFP charge transfer, reserved for future use. */
	EFP_TERM_CHTR = 1 << 4,
	/** Ab initio/EFP electrostatics. */
	EFP_TERM_AI_ELEC = 1 << 5,
	/** Ab initio/EFP polarization. */
	EFP_TERM_AI_POL = 1 << 6,
	/** Ab initio/EFP dispersion, reserved for future use. */
	EFP_TERM_AI_DISP = 1 << 7,
	/** Ab initio/EFP exchange repulsion, reserved for future use. */
	EFP_TERM_AI_XR = 1 << 8,
	/** Ab initio/EFP charge transfer, reserved for future use. */
	EFP_TERM_AI_CHTR = 1 << 9,
    /** MM-like charge-charge coulomb interaction */
    EFP_TERM_QQ = 1 << 10,
    /** MM-like Lennard-Jones interaction */
    EFP_TERM_LJ = 1 << 11,
    /** QM/MM coulomb interaction with MM charges */
    EFP_TERM_AI_QQ = 1 << 12
};

/** Flags to specify EFP energy terms for a special fragment. */
enum efp_special_term {
    /** EFP/EFP electrostatics. */
    EFP_SPEC_TERM_ELEC = 1 << 0,
    /** EFP/EFP polarization. */
    EFP_SPEC_TERM_POL = 1 << 1,
    /** EFP/EFP dispersion. */
    EFP_SPEC_TERM_DISP = 1 << 2,
    /** EFP/EFP exchange repulsion. */
    EFP_SPEC_TERM_XR = 1 << 3,
    /** EFP/EFP charge transfer, reserved for future use. */
    EFP_SPEC_TERM_CHTR = 1 << 4,
    /** MM-like charge-charge coulomb interaction */
    EFP_SPEC_TERM_QQ = 1 << 5,
    /** MM-like Lennard-Jones interaction */
    EFP_SPEC_TERM_LJ = 1 << 6
};

/** Fragment-fragment dispersion damping type. */
enum efp_disp_damp {
	EFP_DISP_DAMP_OVERLAP = 0, /**< Overlap-based damping (default). */
	EFP_DISP_DAMP_TT,          /**< Tang-Toennies damping. */
	EFP_DISP_DAMP_OFF          /**< No dispersion damping. */
};

/** Fragment-fragment electrostatic damping type. */
enum efp_elec_damp {
	EFP_ELEC_DAMP_SCREEN = 0,  /**< SCREEN-controlled damping (default). */
	EFP_ELEC_DAMP_OVERLAP,     /**< Overlap-based damping. */
	EFP_ELEC_DAMP_OFF          /**< No electrostatic damping. */
};

/** Fragment-fragment polarization damping type. */
enum efp_pol_damp {
	EFP_POL_DAMP_TT = 0,       /**< Tang-Toennies like damping (default). */
	EFP_POL_DAMP_OFF           /**< No polarization damping. */
};

/** Describes the way fragment coordinates are specified. */
enum efp_coord_type {
	/** Coordinates of center of mass of a fragment and Euler angles. */
	EFP_COORD_TYPE_XYZABC = 0,
	/** Coordinates of three points belonging to a fragment. */
	EFP_COORD_TYPE_POINTS,
    /** Coordinates of fragment center of mass and its rotation matrix. */
    EFP_COORD_TYPE_ROTMAT,
    /** Coordinates of all fragment atoms. */
    EFP_COORD_TYPE_ATOMS
};

/** Driver used for solving polarization equations. */
enum efp_pol_driver {
	/** Iterative solution of polarization equations. */
	EFP_POL_DRIVER_ITERATIVE = 0,
	/** Direct solution of polarization equations. */
	EFP_POL_DRIVER_DIRECT
};

/** Specifies which fragments are considered identical by symmetry. */
enum efp_symm_frag {
    EFP_SYMM_FRAG_FRAG = 0,       /**< All same fragments are symmetry-identical. */
    EFP_SYMM_FRAG_LIST           /**< Symmetric fragments are given in a list. */
};

/** \struct efp
 * Main EFP opaque structure.
 */
struct efp;

/** Options controlling EFP computation. */
struct efp_opts {
	/** Specifies which energy terms should be computed.
	 * This field is a collection of bit flags where each bit specifies
	 * whether the term is enabled (bit is set to 1) or disabled (bit is
	 * set to 0). To enable the term, use bitwise OR with the corresponding
	 * efp_term constant (e.g., terms |= EFP_TERM_ELEC). To disable the
	 * term, use bitwise AND NOT (e.g., terms &= ~EFP_TERM_POL). */
    unsigned terms;
    /** Terms for a special fragment - typically QM or ML fragment*/
    unsigned special_terms;
	/** Dispersion damping type (see #efp_disp_damp). */
	enum efp_disp_damp disp_damp;
	/** Electrostatic damping type (see #efp_elec_damp). */
	enum efp_elec_damp elec_damp;
	/** Polarization damping type (see #efp_pol_damp). */
	enum efp_pol_damp pol_damp;
	/** Driver used to find polarization induced dipoles. */
	enum efp_pol_driver pol_driver;
	/** Enable periodic boundary conditions if nonzero. */
	int enable_pbc;
	/** Enable switching off elpot contribution for custom torch gradient*/
    int enable_elpot;
	/** Enable fragment-fragment interaction cutoff if nonzero. */
	int enable_cutoff;
	/** Cutoff distance for fragment-fragment interactions. */
	double swf_cutoff;
    /** Cutoff distance for exchange-repulsion calculations. */
    double xr_cutoff;
	/** Enable ligand-fragment energy decomposition from total system */
    int enable_pairwise; 
    /** Index of ligand for enable_pairwise.
     * default = 0 (ie the first fragment); -1 defines the ligand to be a QM region. */
    int ligand;
    /** Index of a special (QM or ML) fragment */
    int special_fragment;
    /** Is 1 for periodic symmetric system (ctystal lattice). Default is 0 */
    int symmetry;
     /** Specifies symmetric elements of the crystal lattice. Default each unique fragment.
      * Warning: this keyword is not related to space symmetry groups or symmetry elements */
    enum efp_symm_frag symm_frag;
    /** Enables updating (shifting) library fragment parameters to match fragment geometry.
     * 1 corresponds to flexible EFP model by Yongbin Kim. Default is 0 (no update) */
    int update_params;
    /** Cutoff when updating parameters is "safe". Default 0.0 (never safe) */
    double update_params_cutoff;
    /** Level of print out */
    int print;
};

/** EFP energy terms. */
struct efp_energy {
	/**
	 * EFP/EFP electrostatic energy. */
	double electrostatic;
	/**
	 * AI/EFP electrostatic energy. */
 	double ai_electrostatic;
 	/**
	 * Charge penetration energy from overlap-based electrostatic
	 * damping. Zero if overlap-based damping is turned off. */
	double charge_penetration;
	/**
	 * Interaction energy of EFP electrostatics with point charges.
	 * This is obsolete parameter; not tested properly*/
	double electrostatic_point_charges;
    /**
    * MM-like charge-charge interaction energy. */
    double qq;
    /**
    * MM-like Lennard-Jones interaction energy. */
    double lj;
    /**
	 * All polarization energy goes here. Polarization is computed
	 * self-consistently so it can't be separated into EFP/EFP and AI/EFP
	 * parts. */
	double polarization;
	/**
	 * Separate storage for polarization corresponding to the excited/correlated state
	 * (relevant for excited state QM/EFP calculations).
	 */
	double exs_polarization;
	/**
	 * Polarization energy storage for pairwise AI/EFP analysis.
	 * Not used in "normal" code	 */
	double ai_polarization;
	/**
	 * EFP/EFP dispersion energy. */
	double dispersion;
	/**
	 * AI/EFP dispersion energy. */
	double ai_dispersion;
	/**
	 * EFP/EFP exchange-repulsion energy. */
	double exchange_repulsion;
	/**
	 * Sum of all the above energy terms. */
	double total;
};

/** EFP atom info. */
struct efp_atom {
    char label[32];   /**< Atom label. */
    double x;         /**< X coordinate of atom position. */
    double y;         /**< Y coordinate of atom position. */
    double z;         /**< Z coordinate of atom position. */
    double gx;        /**< X component of gradient.  */
    double gy;        /**< Y component of gradient.  */
    double gz;        /**< Z component of gradient.  */
    double mass;      /**< Atom mass. */
    double znuc;      /**< Nuclear charge. */
    double mm_charge;    /**< Classical charge. */
    double sigma;     /**< vdW parameter. */
    double epsilon;   /**< vdW parameter. */
    char ff_label[32];  /**< Force field atom type. */
};

/** Multipole point for working with external programs */
struct efp_mult_pt {
    double x;         /**< X coordinate */
    double y;         /**< Y coordinate */
    double z;         /**< Z coordinate */
    double znuc;      /**< Nuclear charge */
    double monopole;  /**< Monopole */
    double dipole[3];  /**< Dipole */
    double quadrupole[6];  /**< Quadrupole */
    double octupole[10];  /**< Octupole */
    size_t rank;  /** < Highest non-zero multipole: 0 - monopole, 1 - dipole, 2 - quad, 3 - oct */
    double screen0;   /**< AI-EFP screening parameter */
    bool if_screen; /**< If screen0 parameter exists and meaningful */
};

/** Polarizability point for working with external programs */
struct efp_pol_pt {
    double x;         /**< X coordinate */
    double y;         /**< Y coordinate */
    double z;         /**< Z coordinate */
    double indip[3];  /**< induced dipole */
    double indipconj[3];  /**< conjugated induced dipole */
    double indip_gs[3];  /**< induced dipole of the ground electronic state*/
    double indipconj_gs[3];  /**< conjugated induced dipole of the ground electronic state */
    double ai_field[3]; /** < field due to QM wavefunction */
};

/**
 * Callback function which is called by libefp to obtain electric field in the
 * specified points.
 *
 * This function is used to obtain the electric field from electrons
 * in the \a ab \a initio part. This callback is called by libefp during
 * polarization calculation. Libefp supplies the \p xyz array with
 * coordinates of the points where the field should be computed.
 *
 * \param[in] n_pt Number of points in \p xyz array.
 *
 * \param[in] xyz Coordinates of points where electric field should be
 * computed. The size of this array must be [3 * \p n_pt] elements.
 *
 * \param[out] field Computed \a x \a y \a z components of electric field. The
 * size of this array must be at least [3 * \p n_pt] elements.
 *
 * \param[in] user_data User data which was specified during initialization.
 *
 * \return The implemented function should return ::EFP_RESULT_FATAL on error
 * and ::EFP_RESULT_SUCCESS if the calculation has succeeded.
 */
typedef enum efp_result (*efp_electron_density_field_fn)(size_t n_pt,
    const double *xyz, double *field, void *user_data);

/**
 * Get a human readable banner string with information about the library.
 *
 * \return Banner string, zero-terminated.
 */
const char *efp_banner(void);

/**
 * Print libefp banner to stdout.
 */
void efp_print_banner(void);

/**
 * Create a new efp object.
 *
 * \return A new efp object or NULL on error.
 */
struct efp *efp_create(void);

/**
 * Get default values of simulation options.
 *
 * \param[out] opts Structure to store the defaults. See ::efp_opts.
 */
void efp_opts_default(struct efp_opts *opts);

/**
 * Set the error log callback function.
 *
 * The callback function can be used to print verbose diagnostic messages from
 * libefp. By default libefp prints to stderr using the function shown below.
 * Logging can be disabled by setting \a cb to NULL.
 *
 * \code
 * void log_cb(const char *msg)
 * {
 *     fprintf(stderr, "LIBEFP: %s\n", msg);
 * }
 * \endcode
 *
 * \param[in] cb Error log callback function or NULL if none.
 */
void efp_set_error_log(void (*cb)(const char *));

/**
 * Set computation options.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] opts New options for EFP computation. See ::efp_opts.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_opts(struct efp *efp, const struct efp_opts *opts);
 
enum efp_result efp_compute_pairwise_energy_range_range(struct efp *efp, size_t frag_from, size_t frag_to);

enum efp_result efp_compute_two_body_crystal(struct efp *efp);
 
/**
 * Get currently set computation options.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] opts Current options for EFP computation. See ::efp_opts.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_opts(struct efp *efp, struct efp_opts *opts);

/**
 * Add EFP potential from a file.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] path Path to the EFP potential file, zero terminated string.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_add_potential(struct efp *efp, const char *path);

/**
 * Add a new fragment to the EFP subsystem.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] name Fragment name, zero terminated string.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_add_fragment(struct efp *efp, const char *name);

/**
 * Add a ligand fragment to teh system
 * @param[in] efp
 * @param[in] ligand_index Index of the ligand in the fragment list
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_add_ligand(struct efp *efp, int ligand_index);

/**
 * Prepare the calculation.
 *
 * New fragments must NOT be added after a call to this function.
 *
 * \param[in] efp The efp structure.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_prepare(struct efp *efp);

/**
 * Skip interactions between the fragments.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] i Index of the first fragment.
 *
 * \param[in] j Index of the second fragment.
 *
 * \param[in] value Specifies whether to skip i-j interactions (true/false).
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_skip_fragments(struct efp *efp, size_t i, size_t j,
    int value);

/**
 * Set the callback function which computes electric field from electrons
 * in \a ab \a initio subsystem.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] fn The callback function. See ::efp_electron_density_field_fn.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_electron_density_field_fn(struct efp *efp,
    efp_electron_density_field_fn fn);

/**
 * Set user data to be passed to ::efp_electron_density_field_fn.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] user_data User data which will be passed as a last parameter to
 * ::efp_electron_density_field_fn.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_electron_density_field_user_data(struct efp *efp,
    void *user_data);

/**
 * Setup arbitrary point charges interacting with EFP subsystem.
 *
 * This can be used to compute contributions from \a ab \a initio nuclei.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] n_ptc Number of point charges.
 *
 * \param[in] ptc Array of \p n_ptc elements with charge values.
 *
 * \param[in] xyz Array of [3 * \p n_ptc] elements with \a x \a y \a z
 * coordinates of charge positions.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_point_charges(struct efp *efp, size_t n_ptc,
    const double *ptc, const double *xyz);

/**
 * Get the number of currently set point charges.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] n_ptc Number of point charges.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_point_charge_count(struct efp *efp, size_t *n_ptc);

/**
 * Get values of currently set point charges.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] ptc Array of \p n_ptc elements where charges will be stored.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_point_charge_values(struct efp *efp, double *ptc);

/**
 * Set values of point charges.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] ptc Array of \p n_ptc elements with charge values.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_point_charge_values(struct efp *efp, const double *ptc);

/**
 * Get coordinates of currently set point charges.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] xyz Array where \a x \a y \a z coordinates of point charges will
 * be stored. The size of the array must be at least [3 * \a n] elements, where
 * \a n is the total number of point charges.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_point_charge_coordinates(struct efp *efp, double *xyz);

/**
 * Set coordinates of point charges.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] xyz Array with \a x \a y \a z coordinates of point charges. The
 * size of the array must be at least [3 * \a n] elements, where \a n is the
 * total number of point charges.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_point_charge_coordinates(struct efp *efp,
    const double *xyz);

/**
 * Get gradient on point charges from EFP subsystem.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] grad For each point charge \a x \a y \a z components of energy
 * gradient are stored. The size of this array must be at least [3 * \a n]
 * elements, where \a n is the total number of point charges.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_point_charge_gradient(struct efp *efp, double *grad);

/**
 * Update positions and orientations of effective fragments.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] coord_type Specifies the type of coordinates in the \a coord
 * array (see #efp_coord_type).
 *
 * \param[in] coord Array of fragment coordinates.
 *
 * If \p coord_type is \a EFP_COORD_TYPE_XYZABC then for each fragment the \p
 * coord array should contain \a x \a y \a z components of the center of mass
 * position and three Euler rotation angles representing orientation of a
 * fragment. The size of the \p coord array must be at least [6 * \a n]
 * elements, where \a n is the number of fragments.
 *
 * If \p coord_type is \a EFP_COORD_TYPE_POINTS then for each fragment the \p
 * coord array should contain the coordinates of 3 points in space. For each
 * fragment point 1 and first atom of fragment are made to coincide. The vector
 * connecting points 1 and 2 is aligned with the corresponding vector
 * connecting fragment atoms. The plane defined by points 1, 2, and 3 is made
 * to coincide with the corresponding fragment plane. The size of the \p coord
 * array must be at least [9 * \a n] elements, where \a n is the number of
 * fragments.
 *
 * If \p coord_type is \a EFP_COORD_TYPE_ROTMAT then for each fragment the \p
 * coord array should contain \a x \a y \a z components of the center of mass
 * position and nine elements of the rotation matrix representing orientation
 * of a fragment. The size of the \p coord array must be at least [12 * \a n]
 * elements, where \a n is the number of fragments.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_coordinates(struct efp *efp,
    enum efp_coord_type coord_type, const double *coord);

/**
 * Update position and orientation of the specified effective fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[in] coord_type Specifies the type of coordinates in the \a coord
 * array (see #efp_coord_type).
 *
 * \param[in] coord Array of coordinates specifying fragment position and
 * orientation.
 *
 * If \p coord_type is \a EFP_COORD_TYPE_XYZABC then the \p coord array should
 * contain \a x \a y \a z components of the center of mass position and three
 * Euler rotation angles representing orientation of a fragment. The \p coord
 * array must contain a total of 6 elements.
 *
 * If \p coord_type is \a EFP_COORD_TYPE_POINTS then the \p coord array should
 * contain the coordinates of 3 points in space. Point 1 and first atom of
 * fragment are made to coincide. The vector connecting points 1 and 2 is
 * aligned with the corresponding vector connecting fragment atoms. The plane
 * defined by points 1, 2, and 3 is made to coincide with the corresponding
 * fragment plane. The \p coord array must contain a total of 9 elements.
 *
 * If \p coord_type is \a EFP_COORD_TYPE_ROTMAT then the \p coord array should
 * contain \a x \a y \a z components of the center of mass position and nine
 * elements of the rotation matrix representing orientation of a fragment. The
 * \p coord array must contain a total of 12 elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_frag_coordinates(struct efp *efp, size_t frag_idx,
    enum efp_coord_type coord_type, const double *coord);

/**
 * Get center of mass positions and Euler angles of the effective fragments.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] xyzabc Upon return the coordinates of the center of mass and
 * Euler rotation angles for each fragment will be written to this array. The
 * size of the \p xyzabc array must be at least [6 * \a n] elements, where \a n
 * is the total number of fragments.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_coordinates(struct efp *efp, double *xyzabc);

/**
 * Update coordinates of a special fragment following QM geom optimization
 * @param[in] efp The efp structure.
 * @param[in] coord Coordinates of the QM region -> become new coordiantes of a special fragment
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result update_special_fragment(struct efp *efp, const double *coord);

/**
 * Update gradient on special fragment and on ptc (QM nuclei) points
 */
enum efp_result update_gradient_special_fragment(struct efp *efp);

/**
 * Get center of mass position and Euler angles of a fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] xyzabc Upon return the coordinates of the center of mass and
 * Euler rotation angles for the fragment will be written to this array. The
 * size of the \p xyzabc array must be at least [6] elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_xyzabc(struct efp *efp, size_t frag_idx,
    double *xyzabc);

/**
 * Get coordinates of all fragment atoms
 * @param efp The efp structure.
 * @param frag_idx ndex of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 * @param coord Upon return the coordinates of fragment atoms
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_atom_coord(struct efp *efp, size_t frag_idx, double *coord);

/**
 * 
 * @param efp The efp structure.
 * @param frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 * @param charges Values of the atomic charges znuc
 * @return
 */
enum efp_result efp_get_frag_atom_znuc(struct efp *efp, size_t frag_idx, int *charges);

/**
 * Set coordinates of all fragment atoms
 * @param efp The efp structure.
 * @param frag_idx ndex of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 * @param coord Values of the atoms coordinates
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_frag_atom_coord(struct efp *efp, size_t frag_idx, const double *coord);

/**
 * Setup periodic box size.
 *
 * \param[in] efp The efp structure.
 * \param[in] x Box size in x dimension.
 * \param[in] y Box size in y dimension.
 * \param[in] z Box size in z dimension.
 * \param[in] alpha Unit cell alpha angle.
 * \param[in] beta Unit cell beta angle.
 * \param[in] gamma Unit cell gamma angle.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_periodic_box(struct efp *efp, double x, double y,
    double z, double alpha, double beta, double gamma);

/**
 * Get periodic box size.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] xyz Array of 6 elements where 3 dimensions of box size and 3 angles will be
 * stored.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_periodic_box(struct efp *efp, double *xyzabc);

/**
 * Get the stress tensor.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] stress Array of 9 elements where the stress tensor will be
 * stored.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_stress_tensor(struct efp *efp, double *stress);

/**
 * Get the ab initio screening parameters.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] screen Array of N elements where screening parameters will be
 * stored. N is the total number of multipole points.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
//enum efp_result efp_get_ai_screen(struct efp *efp, size_t frag_idx,
//    double *screen);


/**
 * Get all ab initio screening parameters.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] screen Array of N elements where screening parameters will be
 * stored. N is the total number of multipole points in all fragments.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_all_ai_screen(struct efp *efp, double *screen);

/**
 * Get the ab initio screening parameters for one fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] screen Array of N elements where screening parameters will be
 * stored. N is the total number of multipole points in fragment frag_idx.
 *
 * \param[out] if_screen 0 if screening parameters are set to 10.0 (could be ignored);
 * 1 if at least one point has != 10 screening parameter
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_ai_screen(struct efp *efp, size_t frag_idx,
                                  double *screen, int if_screen);

/**
 * Set ab initio orbital energies.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] n_core Number of core orbitals.
 *
 * \param[in] n_act Number of active orbitals.
 *
 * \param[in] n_vir Number of virtual orbitals.
 *
 * \param[in] oe Array of orbital energies. The size of this array must be
 * (n_core + n_act + n_vir) elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_orbital_energies(struct efp *efp, size_t n_core,
    size_t n_act, size_t n_vir, const double *oe);

/**
 * Set ab initio dipole integrals.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] n_core Number of core orbitals.
 *
 * \param[in] n_act Number of active orbitals.
 *
 * \param[in] n_vir Number of virtual orbitals.
 *
 * \param[in] dipint Dipole integral matrices for x,y,z axes. The total size of
 * this array must be 3 * (n_core + n_act + n_vir) ^ 2 elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_dipole_integrals(struct efp *efp, size_t n_core,
    size_t n_act, size_t n_vir, const double *dipint);

/**
 * Update wave function dependent energy terms.
 *
 * This function must be called during \a ab \a initio SCF.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] energy Wave function dependent EFP energy.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_wavefunction_dependent_energy(struct efp *efp,
    double *energy);

/**
 * Computes excitation energy correction.
 * @param[in] efp The efp structure.
 * @param[out] energy Excitation energy correction.
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_wavefunction_dependent_energy_correction(struct efp *efp,
        double *energy);

/**
 * Perform the EFP computation.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] do_gradient If nonzero value is specified in addition to energy
 * compute the gradient.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_compute(struct efp *efp, int do_gradient);

/**
 * Get total charge of a fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] charge Total charge of a fragment.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_charge(struct efp *efp, size_t frag_idx,
    double *charge);

/**
 * Get spin multiplicity of a fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] mult Spin multiplicity of a fragment.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_multiplicity(struct efp *efp, size_t frag_idx,
    int *mult);

/**
 * Get number of electrostatic multipole points for a particular fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] n_mult Number of electrostatic multipole points.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_multipole_count(struct efp *efp, size_t frag_idx,
    size_t *n_mult);

enum efp_result efp_get_frag_multipole_coord(struct efp *efp, size_t frag_idx,
                                             size_t *n_mult);

/**
 * Computes multipole rank of a fragment
 * @param efp
 * @param[in] frag_idx fragment index
 * @param[out] rank Highest rank of multipoles in the fragment
 * (0 - charge, 1 - dipole, 2 - quad, 3 - oct)
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
// enum efp_result efp_get_frag_mult_rank(struct efp *efp, size_t frag_idx, size_t mult_idx, size_t *rank);

/**
 * Computes multipole rank of a fragment
 * @param efp
 * @param[in] frag_idx fragment index
 * @param[out] rank Highest rank of multipoles in the fragment
 * (0 - charge, 1 - dipole, 2 - quad, 3 - oct)
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result
efp_get_frag_rank(struct efp *efp, size_t frag_idx, size_t *rank);

/**
 * Get total number of multipoles from EFP electrostatics.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] n_mult Number of electrostatics multipoles.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_multipole_count(struct efp *efp, size_t *n_mult);

/**
 * Get coordinates of electrostatics multipoles.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] xyz Array where coordinates of EFP electrostatics multipoles
 * will be stored. Size of the \p xyz array must be at least [3 * \p n_mult]
 * elements, where \p n_mult is the value returned by the
 * ::efp_get_multipole_count function.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_multipole_coordinates(struct efp *efp, double *xyz);

/**
 * Get electrostatics multipoles from EFP fragments.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] mult Array where charges, dipoles, quadrupoles, and octupoles
 * for each point will be stored.
 *
 * The size of the \p mult array must be at least [(1 + 3 + 6 + 10) * \p
 * n_mult] elements (charges + dipoles + quadrupoles + octupoles), where \p
 * n_mult is the value returned by the ::efp_get_multipole_count function.
 *
 * Quadrupoles are stored in the following order:
 *    \a xx, \a yy, \a zz, \a xy, \a xz, \a yz
 *
 * Octupoles are stored in the following order:
 *    \a xxx, \a yyy, \a zzz, \a xxy, \a xxz,
 *    \a xyy, \a yyz, \a xzz, \a yzz, \a xyz
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_multipole_values(struct efp *efp, double *mult);

/**
 * Get electrostatics dipoles from EFP fragments.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] dipoles Array with all efp dipoles.
 *
 * The size of the \p mult array must be at least [3 * \p n_mult] elements
 * where \p n_mult is the value returned by the ::efp_get_multipole_count function.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_dipole_values(struct efp *efp, double *dipoles);

/**
 * Get electrostatics quadrupoles from EFP fragments.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] quad Array with all efp quadrupoles.
 *
 * The size of the \p mult array must be at least [6 * \p n_mult] elements
 * where \p n_mult is the value returned by the ::efp_get_multipole_count function.
 *
 *  * Quadrupoles are stored in the following order:
 *    \a xx, \a yy, \a zz, \a xy, \a xz, \a yz
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_quadrupole_values(struct efp *efp, double *quad);

/**
 * Get electrostatics octupoles from EFP fragments.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] oct Array with all efp octupoles.
 *
 * The size of the \p mult array must be at least [10 * \p n_mult] elements
 * where \p n_mult is the value returned by the ::efp_get_multipole_count function.
 *
 * Octupoles are stored in the following order:
 *    \a xxx, \a yyy, \a zzz, \a xxy, \a xxz,
 *    \a xyy, \a yyz, \a xzz, \a yzz, \a xyz
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_octupole_values(struct efp *efp, double *oct);

/**
 *  Get the number of polarization induced dipoles from a particular fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] n_dip Number of polarization induced dipoles in fragment.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
 enum efp_result efp_get_frag_induced_dipole_count(struct efp *efp, size_t frag_idx, size_t *n_dip);

/**
 *  Get the total number of polarization induced dipoles.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] n_dip Number of polarization induced dipoles.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_induced_dipole_count(struct efp *efp, size_t *n_dip);

/**
 * Get coordinates of induced dipoles.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] xyz Array where the coordinates of polarizable points will be
 * stored. The size of the \p xyz array must be at least [3 * \p n_dip]
 * elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_induced_dipole_coordinates(struct efp *efp,
    double *xyz);

/**
 * Get values of polarization induced dipoles.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] dip Array where induced dipoles will be stored. The size of the
 * array must be at least [3 * \p n_dip] elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_induced_dipole_values(struct efp *efp, double *dip);

/**
 * Get values of polarization conjugated induced dipoles.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] dip Array where induced dipoles will be stored. The size of the
 * array must be at least [3 * \p n_dip] elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_induced_dipole_conj_values(struct efp *efp,
    double *dip);

/**
 * Analogues to efp_get_induced_dipole_values but returnes "old" i.e. ground state induced dipoles
 * @param efp The efp structure.
 * @param dip Array where induced dipoles will be stored. The size of the
 * array must be at least [3 * \p n_dip] elements.
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_old_induced_dipole_values(struct efp *efp, double *dip);

/**
 * Analogues to efp_get_induced_dipole_conj_values but returnes "old" i.e. ground state induced dipoles
 * @param efp The efp structure.
 * @param dip Array where induced dipoles will be stored. The size of the
 * array must be at least [3 * \p n_dip] elements.
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_old_induced_dipole_conj_values(struct efp *efp, double *dip);

/**
 * Writes induced dipoles from dip array into polarizable points
 * @param efp
 * @param dip pointer to array with induced dipoles
 * @param if_conjug 0 to write indip and 1 to write indipconj
 * @return
 */
enum efp_result efp_set_induced_dipole_values(struct efp *efp, double *dip, int if_conjug);

/**
 * Get the number of LMOs in a fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] n_lmo Number of LMOs.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_lmo_count(struct efp *efp, size_t frag_idx,
    size_t *n_lmo);

/**
 * Get coordinates of LMO centroids.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] xyz Array where the coordinates of LMO centroids will be
 * stored. The size of the \p xyz array must be at least [3 * \p n_lmo]
 * elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_lmo_coordinates(struct efp *efp, size_t frag_idx,
    double *xyz);

/**
 * Get parameters of fitted exchange-repulsion.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] xrfit Array where the parameters will be stored. The size of the
 * \p xrfit array must be at least [4 * \p n_lmo] elements.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_xrfit(struct efp *efp, size_t frag_idx, double *xrfit);

/**
 * Get computed energy components.
 *
 * \param[in] efp The efp structure.
 * \param[out] energy Computed EFP energy components (see efp_energy).
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_energy(struct efp *efp, struct efp_energy *energy);

/**
 * Get computed EFP energy gradient.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] grad For each fragment \a x \a y \a z components of negative
 * force and torque will be written to this array. The size of this array must
 * be at least [6 * \a n] elements, where \a n is the total number of
 * fragments.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_gradient(struct efp *efp, double *grad);

/**
 * Get computed EFP energy gradient on individual atoms.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] grad For each atom, \a x \a y \a z components of negative force
 * will be added to this array. The size of this array must be at least
 * [3 * \a n] elements, where \a n is the total number of atoms from all
 * fragments. An atom is a point with non-zero mass inside a fragment.
 * Any initial gradient from this array will be gathered on fragments at the
 * beginning and then redistributed back to the atoms. This can be used to
 * account for other interactions, e.g., bonded forces from MM forcefield.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_atomic_gradient(struct efp *efp, double *grad);

/**
 * Get computed EFP energy gradient on individual atoms of fragment frag_id. The function is
 * adapted from efp_get_atomic_gradient(struct efp *efp, double *grad)
 * It distributes gradients on atoms from the gradient and torque on fragment COM
 * @param efp The efp structure.
 * @param frag_id The index of fragment which atoms are analyzed here
 * @param[out] grad For each atom, \a x \a y \a z components of negative force
 * will be added to this array. The size of this array must be
 * [3 * \a n] elements, where \a n is the number of atoms in fragment frag_id.
 * An atom is a point with non-zero mass inside a fragment.
 * Any initial gradient from this array will be gathered on fragments at the
 * beginning and then redistributed back to the atoms. This can be used to
 * account for other interactions, e.g., bonded forces from MM forcefield.
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_atomic_gradient(struct efp *efp, size_t frag_id, double *grad);

/**
 * Get gradient on fragment atoms obtained during calculation of QQ and LJ terms. 
 * @param efp The efp structure.
 * @param frag_id The index of fragment which atoms are analyzed here
 * @param[out] grad For each atom, \a x \a y \a z components of negative force
 */
enum efp_result efp_get_atom_gradient(struct efp *efp, size_t frag_id, double *grad); 

/**
 * Get the number of fragments in this computation.
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] n_frag Total number of fragments in this simulation.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_count(struct efp *efp, size_t *n_frag);

/**
 * Get the name of the specified effective fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[in] size Size of a \p frag_name buffer.
 *
 * \param[out] frag_name A buffer where name of the fragment will be stored.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_name(struct efp *efp, size_t frag_idx, size_t size,
    char *frag_name);

/**
 * Get total mass of a fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. This must be a value between zero
 * and the total number of fragments minus one.
 *
 * \param[out] mass Output mass value.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_mass(struct efp *efp, size_t frag_idx,
    double *mass);

//enum efp_result efp_get_frag_atom_mass(struct efp *efp, size_t frag_idx, double *atom_mass_out);

/**
 * Get fragment principal moments of inertia.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] inertia Array of 3 elements where principal moments of
 * inertia of a fragment will be stored.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_inertia(struct efp *efp, size_t frag_idx,
    double *inertia);

/**
 * Get the number of atoms in the specified fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[out] n_atoms Total number of atoms in the fragment.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_atom_count(struct efp *efp, size_t frag_idx,
    size_t *n_atoms);

/**
 * Get atoms comprising the specified fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[in] size Size of the \p atoms array. Must be greater than or equal to
 * the size returned by the ::efp_get_frag_atom_count function.
 *
 * \param[out] atoms Array where atom information will be stored.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_frag_atoms(struct efp *efp, size_t frag_idx,
    size_t size, struct efp_atom *atoms);


/**
 * Set atoms comprising the specified fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[in] n_atoms Size of the \p atoms array.
 *
 * \param[in] atoms Array with atom information; it will be copied into fragment's atoms.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_set_frag_atoms(struct efp *efp, size_t frag_idx, size_t n_atoms,
                   struct efp_atom *atoms);

/**
 * Get coordinates and mm charges of all efp atoms
 * \param [in] efp he efp structure.
 * \param [out] charges - array of atom mm charges
 * \param [out] coords - array of atom xyz positions
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_atom_mm_info(struct efp *efp, double *charges, double *coords);

/** Copies information about multipole point pt_idx at fragment frag_idx into
 * efp_mult_pt structure mult_pt
 *
 * @param[in] efp
 * @param[in] frag_idx Fragment index
 * @param[in] pt_idx Multipole point index
 * @param[out] mult_pt efp_mult_pt to be returned
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result
efp_get_frag_mult_pt(struct efp *efp, size_t frag_idx, size_t pt_idx,
                     struct efp_mult_pt *mult_pt);

/**
 *
 * @param efp
 * @param[in] frag_idx Fragment index
 * @param[in] pt_idx Polarizability point index
 * @param[out] pol_pt efp_pol_pt to be returned
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result
efp_get_frag_pol_pt(struct efp *efp, size_t frag_idx, size_t pt_idx,
                    struct efp_pol_pt *pol_pt);

/**
 * Saves ab initio field info from an efp_pol_pt structure into polarizable_pt on a fragment frag_idx
 * @param efp
 * @param pol_pt Polarization point
 * @param frag_idx
 * @param pt_idx
 * @return
 */
enum efp_result
save_ai_field_pol_pt(struct efp *efp, struct efp_pol_pt *pol_pt, size_t frag_idx, size_t pt_idx);

/**
 * Get electric field for a point on a fragment.
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 *
 * \param[in] xyz Coordinates of a point for which electric field should be
 * computed.
 *
 * \param[out] field Electric field \a x \a y \a z components in atomic units.
 *
 * \return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_electric_field(struct efp *efp, size_t frag_idx,
    const double *xyz, double *field);

/**
 * Get electrostatic potential for a point on a fragment.
 *
 * @param[in] efp The efp structure.
 * @param[in] frag_idx Index of a fragment. Must be a value between zero and
 * the total number of fragments minus one.
 * @param[in] xyz Coordinates of a point for which electric field should be
 * computed.
 * @param[out] elec_potential Electrostatic potential in atomic units.
 * @return ::EFP_RESULT_SUCCESS on success or error code otherwise.
 */
enum efp_result efp_get_elec_potential(struct efp *efp, size_t frag_idx,
        const double *xyz, double *elec_potential);

/**
 * Convert rigid body torque to derivatives of energy by Euler angles.
 *
 * \param[in] euler Array of 3 elements containing the values of Euler angles
 * for the current orientation of the rigid body.
 *
 * \param[in] torque Array of 3 elements containing torque components.
 *
 * \param[out] deriv Array of 3 elements where derivatives of energy by
 * Euler angles will be stored. This can point to the same memory location as
 * the \p torque argument.
 */
void efp_torque_to_derivative(const double *euler, const double *torque,
    double *deriv);

/**
 * Release all resources used by this \a efp.
 *
 * \param[in] efp The efp structure to be released.
 */
void efp_shutdown(struct efp *efp);

/**
 * Convert #efp_result to a human readable message.
 *
 * \param res Result value to be converted to string.
 *
 * \return Human readable string with the description of the result,
 * zero-terminated.
 */
const char *efp_result_to_string(enum efp_result res);

/**
 * Get the interaction energies of ligand-fragment pairs 
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] total energy and energy components of each ligand-fragment pair
 *
 */
enum efp_result efp_get_pairwise_energy(struct efp *efp, 
                                        struct efp_energy *pair_energies);

/**
 * Set the interaction energies of ligand-fragment pairs
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] total energy and energy components of each ligand-fragment pair
 *
 */
enum efp_result efp_set_pairwise_energy(struct efp *efp, struct efp_energy *pair_energies);

/**
 * Prepares information for computing symmetric crystals. Sets the symmetry list, nsymm_frag AND skiplist
 *
 * \param[in] efp The efp structure.
 *
 */
enum efp_result efp_set_symmlist(struct efp *efp);

/**
 * Prepares the symmetry list AND sets nsymm_frag
 *
 * \param[in] efp The efp structure.
 *
 * \param[in] frag_idx Fragment index.
 *
 * \param[out] symm Symmetry index [0 - no symmetry, 1 to nsymm_frag + 1 - meaningful values]
 */
enum efp_result efp_get_symmlist(struct efp *efp, size_t frag_idx, size_t *symm);

/**
 * Prepares the symmetry list AND sets nsymm_frag
 *
 * \param[in] efp The efp structure.
 *
 * \param[out] nsymm_frag The value of nsymm_frag.
 */
enum efp_result efp_get_nsymm_frag(struct efp *efp, size_t *nsymm_frag);

/**
 * Computes the list of indexes of symmetry-unique fragments
 * @param[in] efp The efp structure.
 * @param[out] unique_frag Array with unique-symmetry fragment' indexes
 */
void unique_symm_frag(struct efp *efp, size_t *unique_frag);

/**
 * Computes number of symmetric fragments of each type
 * @param[in] efp The efp structure
 * @param[out] symm_frag Array of length nsymm_frag specifying # of identical fragments
 */
void n_symm_frag(struct efp *efp, size_t *symm_frag);

/** updates (shifts) parameters of fragment based on coordinates of fragment atoms
 *
 * @param[in] atoms Atoms with target coordinates, to which the parameters will be shifted
 * @param lib_orig[in] Original fragment parameters
 * @param lib_current[out] Updated fragment parameters
 * @return
 */
//static enum efp_result
//update_params(struct efp_atom *atoms, const struct frag *lib_orig, struct frag *lib_current);

/** Checks whether atoms in fragment "frag" match those in fragment "lib"
 *
 * @param[in] frag
 * @param[in] lib
 * @return
 */
//static enum efp_result
//check_frag_atoms(const struct frag *frag, const struct frag *lib);

/**
 * Prints information of fragment atoms
 * @param efp
 * @param frag_index fragment index
 * @param atom_index atom index in the fragment
 */
void print_atoms(struct efp *efp, size_t frag_index, size_t atom_index);

/**
 * Prints information on multipole point
 * @param efp
 * @param frag_index fragment index
 * @param pt_index multipole point index
 */
void print_mult_pt(struct efp *efp, size_t frag_index, size_t pt_index);

/**
 * Prints information on polarizable point
 * @param efp
 * @param frag_index fragment index
 * @param pol_index index of polarizable point
 */
void print_pol_pt(struct efp *efp, size_t frag_index, size_t pol_index);

/**
 * Prints information about ligand if any
 * @param efp
 * @param frag_index index of fragment
 */
void print_ligand(struct efp *efp, size_t frag_index);

/**
 * Prints information on fragment
 * @param efp
 * @param frag_index fragment index
 */
void print_frag_info(struct efp *efp, size_t frag_index);

/**
 * Prints information of efp_mult_pt object
 * @param pt
 */
void print_efp_mult_pt(struct efp_mult_pt *pt);

/**
 * Prints information about efp_pol_pt object
 * @param pt
 */
void print_efp_pol_pt(struct efp_pol_pt *pt);

/**
 * Prints all information of efp_energy structure
 * @param energy
 */
void print_ene(struct efp_energy *energy);

/**
 * Prints all information of efp->pair_energies
 * @param efp
 */
void print_energies(struct efp *efp);

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* LIBEFP_EFP_H */
