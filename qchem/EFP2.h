#ifndef EFP2_H_INCLUDED
#define EFP2_H_INCLUDED

#include <vector>

class EFP2_impl;
class InputSection;

class EFP2 {
public:
	/* Initialize EFP2 instance using user's input. */
	void init(InputSection &);

	/* Returns true if the current EFP2 instance was initialized. */
	bool initialized();

    /* Returns if_multipole_field value. */
    bool get_if_multipole_field();

    /* Modifies if_multipole_field that determines whether multipole integrals need to be computed
     * Currently computes multipole integrals two times (it's a mystery why second time is needed)
     * for each geometry */
    void update_multipole_field(bool true_false);

	/* Modifies if_multipole_field that determines whether multipole integrals need to be computed
     * Currently computes multipole integrals two times (it's a mystery why second time is needed)
     * for each geometry */
    //void update_multipole_field();


    /* Returns if_pol_field value. */
    bool get_if_pol_field();

    /* sets if_pol_field value. */
    void set_if_pol_field(bool true_false);

    /* Modifies if_pol_field value that determines whether pol integrals need
     * to be computed (true) or read from disk (false) */
    void update_pol_field();

	/* Reorient EFP fragments according to Q-Chem's orientation of
	 * ab initio subsystem. */
	void reorient_geometry();

	/* Print geometry of EFP subsystem. */
	void print_geometry();

	/* Setup all necessary stuff for AI/EFP dispersion computation
	 * if enabled */
	void setup_aiefp_dispersion();

	/* Compute all EFP and the rest of QM/EFP interactions after
	 * the QM SCF has converged.
	 * \p do_grad - specifies whether to compute the gradient.
	 * If \p do_grad is not zero than the gradient will also be
	 * computed. */
	void compute(int do_grad);

    /* Update quantum mechanical Hamiltonian with the contributions
    * from EFP multipoles using libqints.
    * \p h - a Hamiltonian matrix.
    * \p code - Q-Chem's ShlPrs code. */
    void update_mult_qints(double *h, INTEGER code);

    /* Update quantum mechanical Hamiltonian with the contributions
    * from EFP MM atoms using libqints.
     * @param h - Hamiltonian matrix.
     * @param code - Q-Chem's ShlPrs code.
     */
    void update_mm_qints(double *h, INTEGER code);

    /* Update quantum mechanical Hamiltonian with the contributions
 * from EFP multipoles and atoms using AOints.
 * \p h - a Hamiltonian matrix.
 * \p code - Q-Chem's ShlPrs code. */
    void update_mult_ints(double *h, INTEGER code);

    /* Update quantum mechanical Hamiltonian with the contributions
    * from EFP induced dipoles using libqints.
    * \p h - a Hamiltonian matrix.
*    \p code - Q-Chem's ShlPrs code. */
    void update_pol_qints(double *h, INTEGER code);

    /* Update quantum mechanical Hamiltonian with the contributions
 * from EFP induced dipoles using AOints.
 * \p h - a Hamiltonian matrix.
 * \p code - Q-Chem's ShlPrs code. */
    void update_pol_ints(double *h, INTEGER code);

	/* Update quantum mechanical Hamiltonian with the contributions
	 * from EFPs using libqints.
	 * NEED TO BE UPDATED TO MATCH NEW EFP STRUCTURE
	 * \p h - a Hamiltonian matrix.
	 * \p code - Q-Chem's ShlPrs code. */
	// void update_wf_qints(double *h, INTEGER code);

	/* Update the positions of quantum nuclei for libefp. */
	void update_qm_atoms();

	/* Returns the wavefunction dependent energy.
	 * \p w - is a density matrix.
	 * \p n - is a total number of elements in array \p w. */
	double get_wf_dependent_energy(double *w, double n);

    /* Compute electronic-EFP MM charge gradient on QM atoms
	 * \p w - is a density matrix.
	 * \p grad - gradient
     */
    void get_qmmm_electronic_gradient(double *w, double *grad);

	/* Returns the total EFP energy. */
	double get_total_energy();

	/* Returns EFP correction to the energy of the excited state.
	 * \p w - is the density matrix of the excited state WF.
	 * \p n - is the total number of elements in array \p w.
	 * \p Ecis - excitation energy */
	double get_excited_state_energy_correction(double *w, size_t n, double Ecis);

     /* return gradient on QM atoms due to nuclear-MM charge & LJ terms
     * \p grad - gradient array of size 3*N where N is the number of QM atoms
     */
    void get_qmmm_nuclear_gradient(double *grad);

    /* Returns gradient on quantum nuclei from EFP electrostatics.
	 * Upon return the \p a vector will contain 3*N elements of
	 * gradient, where N is the number of QM atoms.
     * not used now */
	//void get_qm_gradient(std::vector<double> &a);

	/* Returns current EFP gradient.
	 * The vector \p a will contain 6*N gradient values for
	 * fragment translation and rotation. N is the total number of
	 * EFP fragments. */
	void get_gradient(std::vector<double> &a);

    /* computes pairwise energies between QM region and EFP fragments.
     *  \p Estate - reference AI energy (HF or excitation energy)
     *  \p if_excited = 1/0 a switch to distinguish between the ground state (0) or excited state (1). */
    void compute_integral_pairwise_energy(double Estate, int if_excited);

	/* Print EFP energy terms to stdout. */
	void print_energy();

    /* Print pairwise energy decomposition to stdout.
     * \p if_excited = 1/0 a switch to distinguish between the ground state (0) or excited state (1). */
    void print_pairwise_energy(int if_excited);

    /* Returns a EFP2 singleton instance. */
	static EFP2& instance() {
		static EFP2 instance;
		return instance;
	}


private:
	EFP2();
	EFP2(const EFP2 &);
	~EFP2();

	EFP2_impl *impl_;
};

#endif /* EFP2_H_INCLUDED */
