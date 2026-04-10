import sys
import pytest
import pylibefp
from systems import *

from qcelemental.testing import compare


def test_grad_fail():
    asdf = system_1()
    asdf.compute(do_gradient=False)

    with pytest.raises(pylibefp.Fatal) as e_info:
        grad = asdf.get_gradient()


#def test_frag_file_fail():
#    asdf = pylibefp.core.efp()
#
#    with pytest.raises(pylibefp.FileNotFound) as e_info:
#        #print('a', e_info)
#        asdf.add_potential('buckyball')
#        print('b', e_info)


def test_frag_missing_fail():
    asdf = pylibefp.core.efp()

    with pytest.raises(pylibefp.UnknownFragment) as e_info:
        asdf.add_fragment('h2o')


def test_multifrag_fail():
    asdf = pylibefp.core.efp()

    asdf.add_potential(['nh3', 'nh3'])
    with pytest.raises(pylibefp.Fatal) as e_info:
        asdf.add_potential('nh3')


def test_multifrag_pass():
    asdf = pylibefp.core.efp()

    asdf.add_potential(['nh3', 'nh3'])
    asdf.add_potential('nh3', duplicates_ok=True)
    asdf.add_fragment(['nh3'] * 5)
    asdf.prepare()
    assert compare(5, asdf.get_frag_count(), sys._getframe().f_code.co_name + ': nfrag')


def test_frag_fail_1():
    asdf = system_1()

    with pytest.raises(pylibefp.PyEFPSyntaxError) as e_info:
        asdf.get_frag_multiplicity(3)


def test_frag_fail_2():
    asdf = system_1()

    with pytest.raises(pylibefp.PyEFPSyntaxError) as e_info:
        asdf.get_frag_name(-1)
