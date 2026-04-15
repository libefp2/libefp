import pytest
from libefp2py import read_libefp_input 


@pytest.fixture
def pyjob_prepper():
    """Converts efpmd input into py format."""
    return read_libefp_input


@pytest.fixture(scope="session", autouse=True)
def set_up_overall(request):
    pass


@pytest.fixture(scope="function", autouse=True)
def set_up():
    pass


def tear_down():
    pass
