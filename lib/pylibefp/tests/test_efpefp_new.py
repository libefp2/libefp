import libefp2py
import pylibefp
from qcelemental.testing import compare, compare_values
import pprint


b2a = 0.529177
a2b = 1.0 / b2a

def frag_setup(test_name):
    # coordinates in Bohr
    coord_type, frags, frag_coords, efp_options, if_gradient, ref_energy, periodic_box = libefp2py.read_libefp_input(test_name)
    #print(frag_coords)

    efp = pylibefp.core.efp()
    efp.add_potential(frags)
    efp.add_fragment(frags)
    for i in range(len(frags)):
        efp.set_frag_coordinates(i, coord_type, frag_coords[i])
    efp.prepare()

    efp.set_opts(efp_options)
    if periodic_box:
        #print('box1', periodic_box)
        efp.set_periodic_box(periodic_box)
        #print('box2', efp.get_periodic_box())

    #print(frag_coords)
    #pprint.pprint(efp_options)
    efp.compute(do_gradient = if_gradient)
    ene = efp.get_energy()

    # print pairwise components
    #if 'enable_pairwise' in efp_options.keys():
    #    if efp_options['enable_pairwise'] in [True, 'true', 1]:
    #        efp.print_pairwise_energies()

    print(efp.energy_summary())
    if if_gradient:
        print(efp.gradient_summary())
    if ref_energy != 0.0:
        assert compare_values(ref_energy, ene['total'], atol=1.e-5, return_message=True), 'FAILED'

#####
if __name__ == '__main__':
    files = ['atom_coord.in', 'atom_coord_2.in', 'grad_1.in', 'lj_1.in', 'lj_2.in',
             'pairwise_0.in', 'pairwise_1.in', 'pairwise_2.in', 'pairwise_x.in', 'pbc_1.in', 'pbc_2.in',
             'reduced.in', 'spec_frag_0.in', 'spec_frag_1.in', 'spec_frag_2.in', 'spec_frag_base.in', 'spec_frag_ref.in',
             'symm_1.in', 'symm_2.in', 'symm_2full.in', 'symm_2pw.in']

    # running for all tests in files list
    for f in files:
        print(f'\nComputing {f}...')
        frag_setup('../'+f)

    # single test execution
    frag_setup('../symm_2pw.in')
