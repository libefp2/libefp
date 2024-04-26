import pytest


@pytest.fixture(scope="session", autouse=True)
def set_up_overall(request):
    pass


@pytest.fixture(scope="function", autouse=True)
def set_up():
    pass


def tear_down():
    pass
