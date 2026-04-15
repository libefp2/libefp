import pytest
from libefp2py import read_libefp_input # Standard import here


@pytest.fixture
def pyjob_prepper(libefp_inp):
    """Converts efpmd input into py format."""
    return read_libefp_input(libefp_inp)


@pytest.fixture(scope="session", autouse=True)
def set_up_overall(request):
    pass


@pytest.fixture(scope="function", autouse=True)
def set_up():
    pass


def tear_down():
    pass
