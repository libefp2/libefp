import sys
import pytest
import pprint
import pylibefp

from qcelemental.testing import compare, compare_recursive, compare_values

from systems import *

def blank_ene():
    fields = [
        'charge_penetration', 'disp', 'dispersion', 'elec', 'electrostatic', 'electrostatic_point_charges',
        'exchange_repulsion', 'pol', 'polarization', 'xr'
        ]
    ene = {f: 0.0 for f in fields}
    return ene


def test_total_1a():
    asdf = system_1()
    asdf.set_opts({
        'elec': True,
        'elec_damp': 'screen',
        'xr': True,
        'pol': True,  # 'pol_damp': 'tt',
        'disp': True,
        'disp_damp': 'tt'
    })
    asdf.compute()
    ene = asdf.get_energy()
    pprint.pprint(ene)
    print('<<< get_opts():  ', asdf.get_opts(), '>>>')
    print('<<< summary():   ', asdf.summary(), '>>>')
    print('<<< get_energy():', ene, '>>>')
    print('<<< get_atoms(): ', asdf.get_atoms(), '>>>')
    print(asdf.energy_summary())
    print(asdf.geometry_summary(units_to_bohr=b2a))
    print(asdf.geometry_summary(units_to_bohr=1.0))

    #expected_ene = blank_ene()
    #expected_ene['elec'] = expected_ene['electrostatic'] = 0.0002900482
    #expected_ene['xr'] = expected_ene['exchange_repulsion'] = 0.0000134716
    #expected_ene['pol'] = expected_ene['polarization'] = 0.0002777238 - expected_ene['electrostatic']
    #expected_ene['disp'] = expected_ene['dispersion'] = -0.0000989033
    #expected_ene['total'] = 0.0001922903
    #assert compare(2, asdf.get_frag_count(), sys._getframe().f_code.co_name + ': nfrag')
    #assert compare_values(0.0, asdf.get_frag_charge(1), sys._getframe().f_code.co_name + ': f_chg', atol=1.e-4)
    #assert compare(1, asdf.get_frag_multiplicity(1), sys._getframe().f_code.co_name + ': f_mult')
    #assert compare('NH3_L', asdf.get_frag_name(1), sys._getframe().f_code.co_name + ': f_name')
    #assert compare_recursive(expected_ene, ene, sys._getframe().f_code.co_name + ': ene', atol=1.e-4)
