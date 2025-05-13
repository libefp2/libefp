# This job matches atom_coord_2.in

import numpy as np
import pylibefp

efp = pylibefp.core.efp()

b2a = 0.529177
a2b = 1.0 / b2a

# coords in angstroms
h2o_coord = np.array([-3.394000,    -1.900000,    -3.700000,
            -3.517419,    -1.130057,    -3.174996,
            -2.580284,    -2.281411,    -3.424198])
nh3_coord = np.array([            -5.515000,     1.083000,     0.968000,
                  -5.171084,     0.157148,     0.817415,
                 -4.838165,     1.726200,     0.612549,
                   -6.354118,     1.191679,     0.436750])
ch3oh_coord = np.array([ -2.056000,     0.767000,    -0.301000,
-2.979940,    -0.252959,    -0.545947,
-1.192965,     0.406624,     0.250842,
-2.554557,     1.516350,     0.296433,
-1.714730,     1.232706,    -1.220716,
-2.587630,    -0.929369,    -1.064807])

# converting to bohrs
h2o_coord *= a2b
nh3_coord *= a2b
ch3oh_coord *= a2b

frags = ["h2o_l", "nh3_l", "ch3oh_l"]
efp.add_potential(frags)
efp.add_fragment(frags)
efp.set_frag_coordinates(0, "atoms", h2o_coord.tolist())
efp.set_frag_coordinates(1, "atoms", nh3_coord.tolist())
efp.set_frag_coordinates(2, "atoms", ch3oh_coord.tolist())

efp.prepare()
    
efp.set_opts({
    "elec": True,
    "elec_damp": "screen",
    "xr": True,
    "pol": True,  
    "disp": True,
    "print": 0,
})  

efp.compute(do_gradient=True)
ene = efp.get_energy()
print(ene)
grad = efp.get_gradient()
print(grad)
