import pylibefp

b2a = 0.529177
a2b = 1/b2a
efp = pylibefp.core.efp()

frags = ["h2o_l", "h2o_l", "nh3_l"]
efp.add_potential(frags)
efp.add_fragment(frags)

efp.set_frag_coordinates(0, 'points',
                             [i * a2b for i in [0.000000, 0.063030, 0.000000, -0.752652, -0.500166, 0.000000, 0.752652, -0.500166, 0.000000]])
efp.set_frag_coordinates(1, 'points',
                             [i * a2b for i in [5.047701, -0.041199, 0.000000, 5.113439, 0.896539, 0.000000, 4.129507, -0.242679, 0.000000]])
efp.set_frag_coordinates(2, 'points',
                             [i * a2b for i in [0.000000, 5.000000, -0.063177, 0.929426, 4.912005, 0.292603, -0.540919, 4.239091, 0.292603, -0.388507, 5.848904, 0.292603]])

efp.prepare()
    
efp.set_opts({
    "elec": True,
    "disp_damp": "overlap",
    "xr": True,
    "pol": True,
    "disp": True,
    "enable_pairwise": True,
    "ligand": 1,
    "print": 0,
})  

efp.compute()
#gra = efp.get_gradient()
ene = efp.get_energy()
ene2 = efp.energy_summary()
geo = efp.geometry_summary(units_to_bohr=b2a)
print(ene)
print(geo)
#print(gra)
