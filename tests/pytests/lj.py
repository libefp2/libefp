# matches lj_2.in

import numpy as np

import pylibefp

efp = pylibefp.core.efp()

b2a = 0.529177
a2b = 1.0 / b2a

frags = ["tip3p_mm_l", "tip3p_mm_l"]
efp.add_potential(frags)
efp.add_fragment(frags)

frag1_geom = np.array([ -1.815220,   2.663988,    0.000000, 
                       -1.616905,   1.722730,  0.001942, 
                       -2.465495,   2.770431,  -0.695494])
frag1_geom *= a2b

frag2_geom = np.array([ -1.815220,     5.663988,     0.000000,
                       -1.616905 ,    4.722730  ,   0.001942,
                       -2.465495 ,    5.770431 ,   -0.695494])
frag2_geom *= a2b

efp.set_frag_coordinates(0, "atoms", frag1_geom.tolist())
efp.set_frag_coordinates(1, "atoms", frag2_geom.tolist())
efp.prepare()
    
efp.set_opts({
    "elec": False,
    "elec_damp": "screen",
    "xr": False,
    "pol": False,  
    "disp": False,
    "qq": True,
    "lj":True,
})  

efp.compute(True)
ene = efp.get_energy()
print(ene)
grad = efp.get_gradient()
print(grad)
