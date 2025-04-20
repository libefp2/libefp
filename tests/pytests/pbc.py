import pylibefp


b2a = 0.529177
a2b = 1.0 / b2a
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
   'elec': True,
   'pol': True,
   'disp': True,
   'xr': True,
   'elec_damp': 'overlap',
   'disp_damp': 'overlap',
   'pol_damp': 'tt',
   'enable_pbc': True,
   'enable_cutoff': True,
   'swf_cutoff': 6.0 * a2b,
})  

efp.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

efp.compute()
ene = efp.get_energy()
ene2 = efp.energy_summary()
print(ene)
print(ene2)
