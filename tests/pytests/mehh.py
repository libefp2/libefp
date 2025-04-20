import pylibefp


efp = pylibefp.core.efp()

frags = ["h2o_l", "nh3_l"]
efp.add_potential(frags)
efp.add_fragment(frags)
efp.set_frag_coordinates(0, "xyzabc",
    [0.0, 0.0, 0.0, 1.0, 2.0, 3.0])
efp.set_frag_coordinates(1, "xyzabc",
    [9.0, 0.0, 0.0, 5.0, 2.0, 8.0])
efp.prepare()
    
efp.set_opts({
    "elec": True,
    "qq": True,
    "elec_damp": "off",
    "lj": True,
    "pol": True,  
    "disp": False,
    "enable_pairwise": True,
})  

efp.compute()
ene = efp.get_energy()
mul = efp.get_multipole_count()
print(ene)
print(mul)
