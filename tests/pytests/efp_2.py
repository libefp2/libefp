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

def test_elec_2a():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'elec_damp': 'screen'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0015865516, ene['elec'], atol=1.e-3)


def test_elec_2b():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'elec_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0017049246, ene['elec'], atol=1.e-3)


def test_pol_2a():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen'})
    asdf.compute()
    ene = asdf.get_energy()
    pprint.pprint(ene)
    assert compare_values(0.0013685212, ene['total'], atol=1.e-3)


def test_pol_2b():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen', 'pol_driver': 'direct'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0013685212, ene['total'], atol=1.e-3)


def test_disp_2a():
    asdf = system_2()
    asdf.set_opts({'disp': True, 'disp_damp': 'tt'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0014688094, ene['disp'], atol=1.e-3)


def test_disp_2b():
    asdf = system_2()
    asdf.set_opts({'disp': True, 'disp_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0015801770, ene['disp'], atol=1.e-3)


def test_xr_2():
    asdf = system_2()
    asdf.set_opts({'xr': True})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0008443933, ene['xr'], atol=1.e-3)

def test_total_2a():
    asdf = system_2()
    asdf.set_opts({'elec': True, 'pol': True, 'disp': True, 'xr': True, 'elec_damp': 'screen', 'disp_damp': 'tt'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare(5, asdf.get_frag_count(), sys._getframe().f_code.co_name + ': nfrag')
    assert compare_values(0.0007440865, ene['total'], atol=1.e-3)


    
