import pylibefp

efp = pylibefp.core.efp()

frags = ["h2o_l"]
efp.add_potential(frags)
efp.add_fragment(frags)
efp.set_frag_coordinates(0, "points",
    [-4.394, -1.900, -0.700, -4.517, -1.130, -0.175, -3.580, -2.281, -0.424])

efp.prepare()
    
efp.set_opts({
    "elec": True,
    "elec_damp": "overlap",
    "disp_damp": "tt",
    "xr": True,
    "pol": True,  
    "disp": True,
})  

efp.compute()
ene = efp.get_energy()
ene2 = efp.energy_summary()
print(ene)
print(ene2)
