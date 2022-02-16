import ottemplate
import numpy as np
import pytest
import numpy.testing as npt
import openturns.testing as ott

@pytest.fixture(scope="session")
def data():
    """Provide some data"""
    return 3


def test_class(data):
    value = data
    obj = otteemplat.MyClass(value)

    ott.assert_almost_equal(obj.power(1), value)
    ott.assert_almost_equal(obj.power(2), value * value)

