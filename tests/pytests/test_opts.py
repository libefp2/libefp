import sys
import pytest
import pprint
import pylibefp
from systems import *

from qcelemental.testing import compare_recursive


def test_opts_libefp():
    asdf = system_1()

    ref1 = {
        'ai_elec': False,
        'elec_damp': 'screen',
        'ai_disp': False,
        'chtr': False,
        'swf_cutoff': 0.0,
        'enable_cutoff': False,
        'disp': False,
        'ai_pol': False,
        'pol': False,
        'xr': False,
        'pol_driver': 'iterative',
        'ai_xr': False,
        'elec': False,
        'pol_damp': 'tt',
        'pol_damp_tt_value':  0.6,
        'disp_damp': 'overlap',
        'enable_pbc': False,
        'enable_elpot': False,
        'ai_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'ai_qq': False,
        'qq': False,
        'lj': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0,
    }

    ans1 = asdf.set_opts({})
    assert compare_recursive(ref1, ans1, sys._getframe().f_code.co_name + ': blank', atol=1.e-6, return_message=True), 'FAILED'

    ref2 = {
        'ai_elec': True,
        'elec_damp': 'off',
        'ai_disp': False,
        'chtr': False,
        'swf_cutoff': 1.0,
        'enable_cutoff': False,
        'disp': False,
        'ai_pol': False,
        'pol': False,
        'xr': False,
        'pol_driver': 'iterative',
        'pol_damp_tt_value': 0.6,
        'ai_xr': False,
        'elec': True,
        'pol_damp': 'tt',
        'disp_damp': 'overlap',
        'enable_pbc': False,
        'enable_elpot': False,
        'ai_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'ai_qq': False,
        'qq': False,
        'lj': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0,
    }
    ans2 = asdf.set_opts({
        'elec_damp': 'OFF',
        'swf_cutoff': 1.0,
        'elec': True,
        'ai_elec': True,
        'enable_cutoff': False,
    })
    assert compare_recursive(ref2, ans2, sys._getframe().f_code.co_name + ': setting', atol=1.e-6, return_message=True), 'FAILED'

    ref3 = {
        'ai_elec': True,
        'elec_damp': 'off',
        'ai_disp': False,
        'chtr': False,
        'swf_cutoff': 2.0,
        'enable_cutoff': False,
        'enable_elpot': False,
        'disp': False,
        'ai_pol': False,
        'pol': False,
        'xr': False,
        'pol_driver': 'iterative',
        'pol_damp_tt_value': 0.6,
        'ai_xr': False,
        'elec': False,
        'pol_damp': 'tt',
        'disp_damp': 'tt',
        'enable_pbc': False,
        'ai_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'ai_qq': False,
        'qq': False,
        'lj': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0,
    }
    ans3 = asdf.set_opts({'swf_cutoff': 2, 'elec': False, 'ai_elec': True, 'disp_damp': 'TT'}, append='append')
    assert compare_recursive(ref3, ans3, sys._getframe().f_code.co_name + ': append setting', atol=1.e-6, return_message=True), 'FAILED'

    ref4 = {
        'ai_elec': False,
        'elec_damp': 'off',
        'ai_disp': False,
        'chtr': False,
        'swf_cutoff': 0.0,
        'enable_elpot': False,
        'enable_cutoff': False,
        'disp': False,
        'ai_pol': False,
        'pol': False,
        'xr': False,
        'pol_driver': 'iterative',
        'pol_damp_tt_value': 0.6,
        'ai_xr': False,
        'elec': True,
        'pol_damp': 'tt',
        'disp_damp': 'overlap',
        'enable_pbc': False,
        'ai_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'ai_qq': False,
        'qq': False,
        'lj': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0,
    }
    ans4 = asdf.set_opts({
        'elec_damp': 'OFF',
        'swf_cutoff': 0.0,
        'elec': True,
        'enable_cutoff': False
    },
                         append='libefp')
    assert compare_recursive(ref4, ans4, sys._getframe().f_code.co_name + ': reset setting', atol=1.e-6, return_message=True), 'FAILED'


def test_opts_fail_1():
    asdf = system_1()

    ans = asdf.set_opts({'nonsense_key': 'harmless'})
    with pytest.raises(pylibefp.EFPSyntaxError) as e_info:
        ans = asdf.set_opts({'elec_damp': 'nonsense'})


def test_opts_fail_2():
    asdf = system_1()

    with pytest.raises(pylibefp.EFPSyntaxError) as e_info:
        ans = asdf.set_opts({'elec': 'yEs'})


def test_opts_psi():
    asdf = system_1()

    ref = {
        'qm_elst': False,
        'elst_damping': 'screen',
        'qm_disp': False,
        'chtr': False,
        'swf_cutoff': 0.0,
        'enable_cutoff': False,
        'enable_elpot': False,
        'disp': False,
        'qm_ind': False,
        'ind': False,
        'exch': False,
        'ind_driver': 'iterative',
        'qm_exch': False,
        'elst': False,
        'ind_damping': 'tt',
        'disp_damping': 'overlap',
        'pol_damp_tt_value': 0.6,
        'enable_pbc': False,
        'qm_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'qm_qq': False,
        'charge_charge': False,
        'lennard-jones': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0
    }


    ans = asdf.set_opts({}, label='psi')
    assert compare_recursive(ref, ans, sys._getframe().f_code.co_name + ': psi blank', atol=1.e-6, return_message=True), 'FAILED'

    ref = {
        'qm_elst': True,
        'elst_damping': 'off',
        'qm_disp': False,
        'chtr': False,
        'swf_cutoff': 1.0,
        'enable_cutoff': False,
        'enable_elpot': False,
        'disp': False,
        'qm_ind': False,
        'ind': False,
        'exch': False,
        'ind_driver': 'iterative',
        'qm_exch': False,
        'elst': True,
        'ind_damping': 'tt',
        'disp_damping': 'overlap',
        'pol_damp_tt_value': 0.6,
        'enable_pbc': False,
        'qm_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'qm_qq': False,
        'charge_charge': False,
        'lennard-jones': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0
    }
    ans = asdf.set_opts(
        {
            'elst_damping': 'OFF',
            'swf_cutoff': 1.0,
            'elst': True,
            'qm_elst': True,
            'enable_cutoff': False,
        }, label='psi')
    assert compare_recursive(ref, ans, sys._getframe().f_code.co_name + ': psi setting', atol=1.e-6, return_message=True), 'FAILED'

    ref = {
        'qm_elst': True,
        'elst_damping': 'off',
        'qm_disp': False,
        'chtr': False,
        'swf_cutoff': 2.0,
        'enable_cutoff': False,
        'enable_elpot': False,
        'disp': False,
        'qm_ind': False,
        'ind': False,
        'exch': False,
        'ind_driver': 'iterative',
        'qm_exch': False,
        'elst': False,
        'ind_damping': 'tt',
        'disp_damping': 'tt',
        'pol_damp_tt_value': 0.6,
        'enable_pbc': False,
        'qm_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'qm_qq': False,
        'charge_charge': False,
        'lennard-jones': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0
    }
    ans = asdf.set_opts({
        'swf_cutoff': 2,
        'elst': False,
        'qm_elst': True,
        'disp_damping': 'TT'
    },
                        append='append',
                        label='psi')
    assert compare_recursive(ref, ans, sys._getframe().f_code.co_name + ': psi append setting', atol=1.e-6, return_message=True), 'FAILED'

    ref = {
        'qm_elst': False,
        'elst_damping': 'off',
        'qm_disp': False,
        'chtr': False,
        'swf_cutoff': 0.0,
        'enable_cutoff': False,
        'enable_elpot': False,
        'disp': False,
        'qm_ind': False,
        'ind': False,
        'exch': False,
        'ind_driver': 'iterative',
        'qm_exch': False,
        'elst': True,
        'ind_damping': 'tt',
        'pol_damp_tt_value': 0.6,
        'disp_damping': 'overlap',
        'enable_pbc': False,
        'qm_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'qm_qq': False,
        'charge_charge': False,
        'lennard-jones': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0
    }
    ans = asdf.set_opts({
        'elst_damping': 'OFF',
        'swf_cutoff': 0.0,
        'elst': True,
        'enable_cutoff': False,
    },
                        append='libefp',
                        label='psi')
    assert compare_recursive(ref, ans, sys._getframe().f_code.co_name + ': psi reset setting', atol=1.e-6, return_message=True), 'FAILED'


def test_opts_psi_dflt():
    asdf = system_1()

    ref = {
        'qm_elst': True,
        'elst_damping': 'screen',
        'qm_disp': False,
        'chtr': False,
        'swf_cutoff': 0.0,
        'enable_cutoff': False,
        'enable_elpot': False,
        'disp': True,
        'qm_ind': True,
        'ind': True,
        'exch': True,
        'ind_driver': 'iterative',
        'qm_exch': False,
        'elst': True,
        'ind_damping': 'tt',
        'disp_damping': 'overlap',
        'pol_damp_tt_value': 0.6,
        'enable_pbc': False,
        'qm_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'qm_qq': False,
        'charge_charge': False,
        'lennard-jones': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0
    }
    ans = asdf.set_opts({}, label='psi', append='psi')
    assert compare_recursive(ref, ans, sys._getframe().f_code.co_name + ': psi default blank', atol=1.e-6, return_message=True), 'FAILED'

    ref = {
        'qm_elst': False,
        'elst_damping': 'off',
        'qm_disp': False,
        'chtr': False,
        'swf_cutoff': 1.0,
        'enable_cutoff': False,
        'enable_elpot': False,
        'disp': True,
        'qm_ind': True,
        'ind': True,
        'exch': True,
        'ind_driver': 'iterative',
        'qm_exch': False,
        'elst': True,
        'ind_damping': 'tt',
        'disp_damping': 'overlap',
        'pol_damp_tt_value': 0.6,
        'enable_pbc': False,
        'qm_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'qm_qq': False,
        'charge_charge': False,
        'lennard-jones': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':0.0
    }
    ans = asdf.set_opts(
        {
            'elst_damping': 'OFF',
            'swf_cutoff': 1.0,
            'elst': True,
            'qm_elst': False,
            'enable_cutoff': False,
        },
        label='psi',
        append='append')
    assert compare_recursive(ref, ans, sys._getframe().f_code.co_name + ': psi default append setting', atol=1.e-6, return_message=True), 'FAILED'

    ref = {
        'qm_elst': True,
        'elst_damping': 'overlap',
        'qm_disp': False,
        'chtr': False,
        'swf_cutoff': 2.0,
        'enable_cutoff': True,
        'enable_elpot': False,
        'disp': True,
        'qm_ind': True,
        'ind': True,
        'exch': True,
        'ind_driver': 'iterative',
        'qm_exch': False,
        'elst': False,
        'ind_damping': 'tt',
        'pol_damp_tt_value': 0.6,
        'disp_damping': 'overlap',
        'enable_pbc': False,
        'qm_chtr': False,
        'enable_pairwise': False,
        'ligand': -100,
        'symmetry': False,
        'symm_frag': 'frag',
        'spec_elec': False,
        'spec_pol': False,
        'spec_disp': False,
        'spec_xr': False,
        'spec_chtr': False,
        'qm_qq': False,
        'charge_charge': False,
        'lennard-jones': False,
        'special_fragment': -100,
        'spec_qq': False,
        'spec_lj': False,
        'print': 0,
        'xr_cutoff':2.0,
    }
    ans = asdf.set_opts({
        'elst_damping': 'OVERlap',
        'swf_cutoff': 2.0,
        'elst': False,
        'enable_cutoff': True,
    },
                        append='psi',
                        label='psi')
    assert compare_recursive(ref, ans, sys._getframe().f_code.co_name + ': psi default reset setting', atol=1.e-6, return_message=True), 'FAILED'

if __name__ == '__main__':

    functions = [    test_opts_libefp,
                     test_opts_fail_1,
                     test_opts_fail_2,
                     test_opts_psi,
                     test_opts_psi_dflt
                     ]
    for f in functions:
        print(f'\nComputing {f.__name__}')
        f()
