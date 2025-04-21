import pylibefp



efp = pylibefp.core.efp()

frags = ["tip3p_mm_l", "tip3p_mm_l"]
efp.add_potential(frags)
efp.add_fragment(frags)
efp.set_frag_coordinates(0, "xyzabc",
    [0.0, 0.0, 0.0, 1.0, 2.0, 3.0])
efp.set_frag_coordinates(1, "xyzabc",
    [3.0, 0.0, 0.0, 5.0, 2.0, 8.0])
efp.prepare()
    
efp.set_opts({
    "elec": False,
    "elec_damp": "screen",
    "xr": False,
    "pol": False,  
    "disp": False,
    "qq": True,
    "lj":True,
    "spec_elec":True,
    'special_fragment':1
})  

efp.compute()
ene = efp.get_energy()
print(ene)
