import sys
import pytest
import pprint
import pylibefp

from qcelemental.testing import compare, compare_recursive, compare_values

from systems import *


def blank_ene():
    fields = [
        'charge_penetration', 'disp', 'dispersion', 'elec', 'electrostatic', 'electrostatic_point_charges',
        'exchange_repulsion', 'pol', 'polarization', 'xr', 'qq'
    ]
    ene = {f: 0.0 for f in fields}
    return ene


def test_elec_1a():
    asdf = system_1()
    asdf.set_opts({'elec': True, 'elec_damp': 'screen'})
    asdf.compute()
    ene = asdf.get_energy()
    expected_ene = blank_ene()
    expected_ene['elec'] = expected_ene['electrostatic'] = expected_ene['total'] = 0.0002900477909609442
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
    print(ene)

    elec = 0.0002900477909609442
    pol = 0.0002777238 - elec
    expected_ene = blank_ene()
    expected_ene['elec'] = expected_ene['electrostatic'] = elec
    expected_ene['pol'] = expected_ene['polarization'] = pol
    expected_ene['total'] = elec + pol
    pprint.pprint(opts)
    assert compare_recursive(expected_ene, ene, atol=1.e-4)


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
    assert compare_recursive(expected_ene, ene, atol=1.e-4)

def test_disp_1a():
    asdf = system_1()
    asdf.set_opts({'disp': True, 'disp_damp': 'tt'})
    asdf.compute()
    ene = asdf.get_energy()

    expected_ene = blank_ene()
    expected_ene['disp'] = expected_ene['dispersion'] = expected_ene['total'] = -0.0000989033
    assert compare_recursive(expected_ene, ene, atol=1.e-4)


def test_disp_1b():

    asdf = system_1()
    asdf.set_opts({'disp': True, 'disp_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()

    expected_ene = blank_ene()
    expected_ene['disp'] = expected_ene['dispersion'] = expected_ene['total'] = -0.0001007275
    assert compare_recursive(expected_ene, ene, atol=1.e-4)   

def test_xr_1():
    asdf = system_1()
    asdf.set_opts({'xr': True})
    asdf.compute()
    ene = asdf.get_energy()

    expected_ene = blank_ene()
    expected_ene['xr'] = expected_ene['exchange_repulsion'] = expected_ene['total'] = 0.0000134716
    assert compare_recursive(expected_ene, ene, atol=1.e-4)    
