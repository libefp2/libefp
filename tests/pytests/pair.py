import pylibefp


efp = pylibefp.core.efp()

frags = ["h2o_l", "h2o_l", "nh3_l"]
efp.add_potential(frags)
efp.add_fragment(frags)

efp.set_frag_coordinates(0, "xyzabc",
    [0.000, 0.000, 0.000, 0.000, 0.000, 0.000])
efp.set_frag_coordinates(1, "xyzabc",
    [5.000, 0.000, 0.000, 2.000, 0.000, 2.000])
efp.set_frag_coordinates(2, "xyzabc",
    [0.000, 5.000, 0.000, 5.000, 0.000, -3.000])

efp.prepare()
    
efp.set_opts({
    "elec": True,
    "disp_damp": "overlap",
    "xr": True,
    "pol": True,  
    "disp": False,
    "enable_pairwise": True,
    "ligand": 1,
})  

efp.compute()
ene = efp.get_energy()
ene2 = efp.energy_summary()
print(ene)
print(ene2)
