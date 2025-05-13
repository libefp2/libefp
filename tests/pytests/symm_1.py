import sys
import numpy as np
import libefp2py

# Get the absolute path to the directory containing the module
sys.path.insert(0, '/scratch/gilbreth/paulsk/ls_pylib/libefp')

import pylibefp

b2a = 0.529177
a2b = 1.0 / b2a

# coordinates in Bohr
frags, frag_coords = libefp2py.read_libefp_input("../symm_1.in")
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
    'swf_cutoff': 4.79 * a2b,
    'xr_cutoff': 4.79 * a2b,
    'print': 0,
    'symmetry': True,
    'symm_frag': 'frag',
})
#    'enable_pairwise': True,
#    'ligand': 1,
#})

efp.set_periodic_box([10.66 * a2b, 12.03 * a2b, 10.872 * a2b], 90.0, 115.83, 90.0)
#box = efp._efp_get_periodic_box()
#print(box)

efp.compute()
ene = efp.get_energy()
ene2 = efp.energy_summary()
print(ene2)
