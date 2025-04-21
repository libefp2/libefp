import sys
import pylibefp
from systems import *

from qcelemental.testing import compare_recursive, compare_values


def test_efpefptorque():
    asdf = system_3()
    asdf.set_opts({
        'disp': False,
        'exch': False,
        'elst_damping': 'screen',
        'ind_damping': 'off'
    },
                  label='psi',
                  append='psi')  # V equiv
    #asdf.set_opts({'elec': True, 'pol': True, 'elec_damp': 'screen', 'pol_damp': 'off', 'dertype': 'first'})            # ^ equiv
    asdf.compute(do_gradient=True)
    ene = asdf.get_energy()
    torq = asdf.get_gradient()

    ref = {
        'torque': [
        -0.0014557485,    -0.0024650113,    -0.0007420245,     0.0018487317,    -0.0065430367,    -0.0003612802,
        -0.0024798509,    -0.0002766252,     0.0029343456,    -0.0033124877,    -0.0048014449,    -0.0046442270,
         0.0021341431,     0.0023700691,     0.0015655930,    -0.0005188401,    -0.0004406075,    -0.0016388193,
        -0.0020017801,     0.0045394287,     0.0001140076,    -0.0011159049,     0.0021766586,    -0.0035556589,
        -0.0004997047,     0.0037416773,    -0.0017226579,     0.0108138324,     0.0056465424,    -0.0031926302,
        -0.0004161161,    -0.0046891120,    -0.0017098053,    -0.0023800599,     0.0042322597,     0.0105675357,
         0.0007828963,     0.0001744122,    -0.0006861146,     0.0003752826,    -0.0032331154,    -0.0011471607,
         0.0038830634,    -0.0039883720,    -0.0001194227,     0.0012427711,    -0.0026362462,    -0.0005023332,
         0.0000530976,     0.0005935332,     0.0003660789,    -0.0015382262,    -0.0048146666,     0.0026841256
        ]
    }  # yapf: disable

    assert compare_values(-0.0066095987170644, ene['total'], sys._getframe().f_code.co_name + ': ene', atol=1.e-5)
    assert compare_recursive(ref, {'torque': torq}, sys._getframe().f_code.co_name + ': torq', atol=1.e-6)


def test_efpefp_bz2():
    """psi4/test/libefp/qchem-efp-sp"""
    b2a = 0.529177
    a2b = 1.0 / b2a

    asdf = pylibefp.core.efp()

    frags = ['c6h6', 'c6h6']
    asdf.add_potential(frags)
    asdf.add_fragment(frags)
    asdf.set_frag_coordinates(
        0, 'xyzabc', [-0.30448173 * a2b, -2.24210052 * a2b, -0.29383131 * a2b, -0.642499, 1.534222, -0.568147])
    asdf.set_frag_coordinates(1, 'xyzabc',
                              [-0.60075437 * a2b, 1.36443336 * a2b, 0.78647823 * a2b, 3.137879, 1.557344, -2.568550])
    asdf.prepare()

    asdf.set_opts({'disp_damp': 'tt'}, append='psi')
    asdf.compute()
    ene = asdf.get_energy(label='psi')

    # values copied from q-chem output file
    assert compare_values(-0.006945881265, ene['elst'], sys._getframe().f_code.co_name + ': ene elst', atol=1.e-6)
    assert compare_values(0.046915489574, ene['exch'], sys._getframe().f_code.co_name + ': ene exch', atol=1.e-6)
    assert compare_values(-0.000675030191, ene['ind'], sys._getframe().f_code.co_name + ': ene ind', atol=1.e-6)
    assert compare_values(-0.021092526180, ene['disp'], sys._getframe().f_code.co_name + ': ene disp', atol=1.e-6)
    assert compare_values(0.018202051938, ene['total'], sys._getframe().f_code.co_name + ': ene', atol=1.e-6)
