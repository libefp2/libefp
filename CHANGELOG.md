# Changelog

## Unreleased (branch `lyuda_bugfix_Oct2026`)

### Bug fixes

- **Polarizable points from CT100 on were misplaced.** GAMESS writes polarizable point labels as `CT1`,
  `CT12`, `CT123`; LibEFP skipped a fixed 4 characters, so from the 100th point on the last label digit was
  read as x and z was lost. Every fragment with more than 99 polarizable points (chlorophylls, carotenoids,
  large ligands) was affected, typically causing a polarization catastrophe.
- **Labels touching negative coordinates.** A coordinate that fills its F15.10 field runs into the label
  (`CT1-132.2805782867`, `BO123124-132.2805782867`); the sign was lost or the coordinate was read as part of
  the label. Fixed for polarizable points, dynamic and dipole-quadrupole polarizable points, LMO centroids,
  coordinates and multipole sections.
- **Dipole-quadrupole polarizable points** were stored at the wrong index (out of bounds when no dynamic
  polarizable points had been read).
- **Dispersion crashed for fragments without LMOs** (no exchange-repulsion data): uninitialized overlap
  arrays were read also with Tang-Toennies damping.
- **Fragments not written in their center-of-mass frame were misplaced** with atom coordinates (`coord atoms`)
  and `xyzabc`, and cutoffs and periodic images were computed from the origin of the fragment frame instead
  of the molecule. See *Behavior changes*.
- **Bond midpoints with atom numbers above 99** were decoded from the label by its length (ambiguous, wrong
  for `BO10074`, uninitialized indices for long labels) when atom positions were given (special/flexible
  fragments). Points that are neither atoms nor bond midpoints were not moved at all.
- **Symmetry class multiplicities** (`n_symm_frag`) were taken from the classes of the first fragments of the
  input, so symmetric-crystal energies were wrong unless the input started with one fragment per class.
- Memory leaks in the symmetric-crystal polarization (every iteration).

### New options

| efpmd keyword / `efp_opts` field | Default | Description |
|---|---|---|
| `ligand_cutoff` | 0 (= `swf_cutoff`) | Separate cutoff for the pairs with the ligand (two-body terms and polarization fields); all other pairs use `swf_cutoff`. Requires `enable_cutoff` and `ligand` >= 0; not with symmetry. |
| `pairwise_ligand_only` | false | With `enable_pairwise`: two-body terms only for the pairs with the ligand; polarization of the whole system as usual. The total energy is then not the energy of the system; no gradients. |
| `print_geometry` (efpmd) | true | `false` skips the geometry printout (large systems). |
| `print_pairwise_geometry` (efpmd) | true | `false` prints one line and the energies per fragment in the pairwise analysis, the ligand geometry once. |

With `print 1` efpmd now prints `TIMING` lines for the main phases (reading parameters, creating fragments,
neighbor lists, two-body terms, polarization: static field, induced dipoles, energy, gradient, pairwise
printout).

### Behavior changes

- **Fragments are moved to their center-of-mass frame when the parameters are read.** The `.efp` file may use
  any frame (e.g., the frame of an MD snapshot); placement with `coord points` is unchanged. `xyzabc`
  positions refer to the center of mass, and cutoffs and periodic images are measured between centers of
  mass. For fragments written by MAKEFP (center of mass at the origin) nothing changes.
- MD and the Hessian assume that the fragment frame axes are principal axes of inertia; efpmd now warns for
  fragments in other frames (fragments are not rotated, which would change the meaning of `xyzabc` Euler
  angles).
- **`efp_compute(efp, do_gradient)` honors `do_gradient`** (it used to compute gradients always).
  `efp_get_gradient()`, `efp_get_point_charge_gradient()`, `efp_get_stress_tensor()` and the atomic gradients
  return an error after `efp_compute(efp, 0)`; programs that read gradients must request them.
- `run_type etest` computes the energy without gradients.
- Reference energies of `symm_2`, `symm_2full`, `symm_2pw` changed (-2.4694268198 -> -5.5786738865): the
  internal origin of `xxii_exp_n2_*.efp` is 14.1 bohr away from the molecule and was used as the fragment
  center for the cutoff and periodic images. Energies without cutoff are unchanged.

### Performance

- Fragment files with many points are parsed in linear time (hash index of labels instead of a search per
  line): a 493,567-point MM fragment loads in 2 s instead of 25 min.
- The dense n_frag x n_frag skip list (23 GB for 1.5e5 fragments) is replaced by a default rule plus a hash
  map of explicitly skipped pairs; with a cutoff, `efp_compute()` builds neighbor lists (cell lists) and all
  pair loops run over them.
- Stress tensor accumulated per thread instead of with atomic updates per pair.
- OpenMP load balancing: the polarization loops run over polarizable points; the two-body loop runs over
  blocks of partners; electrostatics of pairs with more than 10^6 point pairs (MM superfragments) is computed
  in chunks of points. The symmetric-crystal path is parallelized as well.
- Example (151,550 fragments, 64 threads, single point, elec + pol): 15 A cutoff 53 s (21.5 min after the
  parser fixes alone; on the original master the polarization did not converge); EFP/MM with a 30 A boundary
  2.5 min (1 h 12 min before the load balancing).

### Tests

New: `parse_labels_1a/b ... 4a/b`, `disp_no_lmo_1a/b`, `coord_com_1a/b`, `bo_labels_1a/b`, `nbr_1`, `nbr_2`,
`pairwise_ligand_1`, `ligand_cutoff_1`, `ligand_cutoff_2`, `heavy_pair_1`, `symm_classes_a/b`. Test fragments
are generated from the fraglib potentials by `tests/tools/make_parse_test_fragments.py`.
