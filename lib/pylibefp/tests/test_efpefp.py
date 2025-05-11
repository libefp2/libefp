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


def test_elec_1a():
    asdf = system_1()
    asdf.set_opts({'elec': True, 'elec_damp': 'screen'})
    asdf.compute()
    ene = asdf.get_energy()

    expected_ene = blank_ene()
    expected_ene['elec'] = expected_ene['electrostatic'] = expected_ene['total'] = 0.0002900482
    assert compare_recursive(expected_ene, ene, atol=1.e-6)


def test_elec_1b():
    asdf = system_1()
    asdf.set_opts({'elec': True, 'elec_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()

    elst = 0.0002910961
    cp = -8.066354689359154e-07
    expected_ene = blank_ene()
    expected_ene['elec'] = expected_ene['total'] = elst
    expected_ene['charge_penetration'] = cp
    expected_ene['electrostatic'] = elst - cp
    assert compare_recursive(expected_ene, ene, atol=1.e-6)


def test_pol_1a():
    asdf = system_1()
    opts = {'elec': True, 'pol': True, 'elec_damp': 'screen'}
    asdf.set_opts(opts)
    asdf.compute()
    ene = asdf.get_energy()

    elec = 0.0002900482
    pol = 0.0002777238 - elec
    expected_ene = blank_ene()
    expected_ene['elec'] = expected_ene['electrostatic'] = elec
    expected_ene['pol'] = expected_ene['polarization'] = pol
    expected_ene['total'] = elec + pol
    pprint.pprint(opts)
    assert compare_recursive(expected_ene, ene, atol=1.e-6)


def test_pol_1b():
    asdf = system_1()
    asdf.set_opts({'pol': True, 'elec_damp': 'screen', 'elec': True, 'pol_driver': 'direct'})
    asdf.compute()
    ene = asdf.get_energy()

    elec = 0.0002900478
    pol = 0.0002777238 - elec
    expected_ene = blank_ene()
    expected_ene['elec'] = expected_ene['electrostatic'] = elec
    expected_ene['pol'] = expected_ene['polarization'] = pol
    expected_ene['total'] = elec + pol
    assert compare_recursive(expected_ene, ene, atol=1.e-6)


def test_disp_1a():
    asdf = system_1()
    asdf.set_opts({'disp': True, 'disp_damp': 'tt'})
    asdf.compute()
    ene = asdf.get_energy()

    expected_ene = blank_ene()
    expected_ene['disp'] = expected_ene['dispersion'] = expected_ene['total'] = -0.0000989033
    assert compare_recursive(expected_ene, ene, atol=1.e-6)


def test_disp_1b():

    asdf = system_1()
    asdf.set_opts({'disp': True, 'disp_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()

    expected_ene = blank_ene()
    expected_ene['disp'] = expected_ene['dispersion'] = expected_ene['total'] = -0.0001007275
    assert compare_recursive(expected_ene, ene, atol=1.e-6)


def test_xr_1():
    asdf = system_1()
    asdf.set_opts({'xr': True})
    asdf.compute()
    ene = asdf.get_energy()

    expected_ene = blank_ene()
    expected_ene['xr'] = expected_ene['exchange_repulsion'] = expected_ene['total'] = 0.0000134716
    assert compare_recursive(expected_ene, ene, atol=1.e-6)


def test_total_1a():
    asdf = system_1()
    asdf.set_opts({
        'elec': True,
        'elec_damp': 'screen',
        'xr': True,
        'pol': True,  # 'pol_damp': 'tt',
        'disp': True,
        'disp_damp': 'tt',
        'print': 2
    })
    asdf.compute()
    ene = asdf.get_energy()
    pprint.pprint(ene)
    print('<<< get_opts():  ', asdf.get_opts(), '>>>')
    #print('<<< summary():   ', asdf.summary(), '>>>')
    print('<<< get_energy():', ene, '>>>')
    print('<<< get_atoms(): ', asdf.get_atoms(), '>>>')
    print(asdf.energy_summary())
    print(asdf.geometry_summary(units_to_bohr=b2a))
    print(asdf.geometry_summary(units_to_bohr=1.0))

    expected_ene = blank_ene()
    expected_ene['elec'] = expected_ene['electrostatic'] = 0.0002900482
    expected_ene['xr'] = expected_ene['exchange_repulsion'] = 0.0000134716
    expected_ene['pol'] = expected_ene['polarization'] = 0.0002777238 - expected_ene['electrostatic']
    expected_ene['disp'] = expected_ene['dispersion'] = -0.0000989033
    expected_ene['total'] = 0.0001922903
    assert compare(2, asdf.get_frag_count(), sys._getframe().f_code.co_name + ': nfrag')
    assert compare_values(0.0, asdf.get_frag_charge(1), sys._getframe().f_code.co_name + ': f_chg', atol=1.e-6)
    assert compare(1, asdf.get_frag_multiplicity(1), sys._getframe().f_code.co_name + ': f_mult')
    assert compare('NH3_L', asdf.get_frag_name(1), sys._getframe().f_code.co_name + ': f_name')
    assert compare_recursive(expected_ene, ene, sys._getframe().f_code.co_name + ': ene', atol=1.e-6)


def test_elec_2a():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'elec_damp': 'screen'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0015865516, ene['elec'], atol=1.e-6)


def test_elec_2b():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'elec_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0017049246, ene['elec'], atol=1.e-6)


def test_pol_2a():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen'})
    asdf.compute()
    ene = asdf.get_energy()
    pprint.pprint(ene)
    assert compare_values(0.0013685212, ene['total'], atol=1.e-6)


def test_pol_2b():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen', 'pol_driver': 'direct'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0013685212, ene['total'], atol=1.e-6)


def test_disp_2a():
    asdf = system_2()
    asdf.set_opts({'disp': True, 'disp_damp': 'tt'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0014688094, ene['disp'], atol=1.e-6)


def test_disp_2b():
    asdf = system_2()
    asdf.set_opts({'disp': True, 'disp_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0015801770, ene['disp'], atol=1.e-6)


def test_xr_2():
    asdf = system_2()
    asdf.set_opts({'xr': True})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0008443933, ene['xr'], atol=1.e-6)


def test_total_2a():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'pol': True, 'disp': True, 'xr': True, 'elec_damp': 'screen', 'disp_damp': 'tt'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare(5, asdf.get_frag_count(), sys._getframe().f_code.co_name + ': nfrag')
    assert compare_values(0.0007440865, ene['total'], atol=1.e-6)


def test_elec_3a():
    asdf = system_3()
    asdf.set_opts({'elec': True, 'elec_damp': 'screen'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0039531505, ene['elec'], atol=1.e-6)


def test_elec_3b():
    asdf = system_3()
    asdf.set_opts({'elec': True, 'elec_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0023592829, ene['elec'], atol=1.e-6)


def test_pol_3a():
    asdf = system_3()
    asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen', 'pol_damp': 'off'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0066095992, ene['total'], atol=1.e-6)


def test_pol_3b():
    asdf = system_3()
    asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen', 'pol_damp': 'off', 'pol_driver': 'direct'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0066095992, ene['total'], atol=1.e-6)


def test_disp_3a():
    asdf = system_3()
    asdf.set_opts({'disp': True, 'disp_damp': 'tt'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0173897265, ene['disp'], atol=1.e-6)


def test_disp_3b():
    asdf = system_3()
    asdf.set_opts({'disp': True, 'disp_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0220107872, ene['disp'], atol=1.e-6)


def test_xr_3():
    asdf = system_3()
    asdf.set_opts({'xr': True})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0301402098, ene['xr'], atol=1.e-5)


def test_total_3a():
    asdf = system_3()
    asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'screen',
        'disp_damp': 'tt',
        'pol_damp': 'tt'
    })
    asdf.compute()
    ene = asdf.get_energy()
    assert compare(9, asdf.get_frag_count(), sys._getframe().f_code.co_name + ': nfrag')
    assert compare_values(0.0061408841, ene['total'], sys._getframe().f_code.co_name, atol=1.e-5)


def test_total_4a():
    asdf = system_4()
    asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'screen',
        'disp_damp': 'tt',
        'pol_damp': 'tt'
    })
    asdf.compute()
    ene = asdf.get_energy()

    nfrags = ['ACETONE', 'C2H5OH', 'C6H6', 'CCL4', 'CH3OH', 'CH4', 'CL2', 'DCM', 'DMSO', 'H2', 'H2O', 'NH3']
    mfrags = [1 for fr in range(12)]
    cfrags = [0.0 for fr in range(12)]
    tnm = sys._getframe().f_code.co_name
    assert compare(12, asdf.get_frag_count(), sys._getframe().f_code.co_name + ': nfrag')
    assert compare_recursive({'dummy': cfrags}, {'dummy': asdf.get_frag_charge()}, tnm + ': f_chg', atol=1.e-2)
    assert compare_recursive({'dummy': mfrags}, {'dummy': asdf.get_frag_multiplicity()}, tnm + ': f_mult', atol=1.e-2)
    assert compare_recursive({'dummy': [fr + '_L' for fr in nfrags]}, {'dummy': asdf.get_frag_name()}, tnm + ': f_names', atol=1.e-2)
    assert compare_values(-0.0095597483, ene['total'], sys._getframe().f_code.co_name, atol=1.e-5)


def test_total_4b():
    asdf = system_4()
    asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'overlap',
        'disp_damp': 'overlap',
        'pol_damp': 'tt'
    })
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0092400662, ene['total'], atol=1.e-5)


def test_total_4c():
    asdf = system_4()
    asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'off',
        'disp_damp': 'off',
        'pol_damp': 'tt'
    })
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0091278725, ene['total'], atol=1.e-5)


def test_total_4d():
    asdf = system_4()
    asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'screen',
        'disp_damp': 'tt',
        'pol_damp': 'tt',
        'pol_driver': 'direct'
    })
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0095597483, ene['total'], atol=1.e-5)


if __name__ == '__main__':
    test_total_4a()
