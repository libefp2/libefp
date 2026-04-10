import pytest

from qcelemental.util import which_import, parse_version


def is_psi4_new_enough(version_feature_introduced):
    if which_import('psi4') is None:
        return False
    import psi4
    return parse_version(psi4.__version__) >= parse_version(version_feature_introduced)


using_psi4 = pytest.mark.skipif(
    which_import('psi4', return_bool=True) is False,
    reason='Not detecting package psi4. Install package if necessary and and to envvar PYTHONPATH')

using_psi4_efpmints = pytest.mark.skipif(
    is_psi4_new_enough("1.2a1.dev507") is False,
    reason="Psi4 does not include EFP integrals in mints. Update to development head")
