import libefp2py

import pylibefp

b2a = 0.529177
a2b = 1.0 / b2a

# coordinates in Bohr
frags, frag_coords = libefp2py.read_libefp_input("../symm_2pw.in")
#print(frag_coords)

efp = pylibefp.core.efp()

efp.add_potential(frags)
efp.add_fragment(frags)

for i in range(len(frags)):
    efp.set_frag_coordinates(i, "points", frag_coords[i])

efp.prepare()
    
efp.set_opts({
    'elec': True,
    'pol': True,
    'disp': True,
    'xr': True,
    'elec_damp': 'screen',
    'pol_damp': 'tt',
    'disp_damp': 'tt',
    'enable_pbc': True,
    'enable_cutoff': True,
    'swf_cutoff': 11.0 * a2b,
    'print': 0,
    'symmetry': True,
    'symm_frag': 'frag',
    'enable_pairwise': True,
    'ligand': 0,
})

efp.set_periodic_box([24.0048* a2b, 27.0356* a2b, 25.7166* a2b,], 90.0, 109.424, 90.0)
#box = efp._efp_get_periodic_box()
#print(box)

efp.compute()
ene = efp.get_energy()
print(ene)
