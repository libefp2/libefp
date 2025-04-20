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

def test_elec_3a():
    asdf = system_3()
    asdf.set_opts({'elec': True, 'elec_damp': 'screen'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0039531505, ene['elec'], atol=1.e-3)


def test_elec_3b():
    asdf = system_3()
    asdf.set_opts({'elec': True, 'elec_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0023592829, ene['elec'], atol=1.e-3)


def test_pol_3a():
    asdf = system_3()
    asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen', 'pol_damp': 'off'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0066095992, ene['total'], atol=1.e-3)


def test_pol_3b():
    asdf = system_3()
    asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen', 'pol_damp': 'off', 'pol_driver': 'direct'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0066095992, ene['total'], atol=1.e-3)


def test_disp_3a():
    asdf = system_3()
    asdf.set_opts({'disp': True, 'disp_damp': 'tt'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0173897265, ene['disp'], atol=1.e-3)


def test_disp_3b():
    asdf = system_3()
    asdf.set_opts({'disp': True, 'disp_damp': 'overlap'})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0220107872, ene['disp'], atol=1.e-3)


def test_xr_3():
    asdf = system_3()
    asdf.set_opts({'xr': True})
    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0301402098, ene['xr'], atol=1.e-3)

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
    assert compare_values(0.0061408841, ene['total'], sys._getframe().f_code.co_name, atol=1.e-3)    
