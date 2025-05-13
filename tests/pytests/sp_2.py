import pylibefp

 ## SKP
b2a = 0.529177
a2b = 1.0 / b2a

efp = pylibefp.core.efp()

frags = ["tip3p_mm_l", "tip3p_mm_l"]
efp.add_potential(frags)
efp.add_fragment(frags)

efp.set_frag_coordinates(0, 'points',
                             [i * a2b for i in [-0.028105, 0.006327, -0.059145, 0.589971, 0.606511, 0.368712, -0.143923, -0.706920, 0.569954]])
efp.set_frag_coordinates(1, 'points',
                             [i * a2b for i in [2.985103, 0.063555, -0.008178, 3.448387, -0.518118, -0.618363, 2.788040, -0.490539, 0.748159]])
 
efp.prepare()
    
efp.set_opts({
    "elec": False,
    "xr": False,
    "pol": False,
    "disp": False,
    "qq": True,
    "lj":True,
})

efp.compute()
ene = efp.get_energy()
geo = efp.geometry_summary(units_to_bohr=b2a)
print(ene)
print(geo)
