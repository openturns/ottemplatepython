import ottemplate
import numpy as np
import openturns as ot
import pytest
import numpy.testing as npt
import openturns.testing as ott

@pytest.fixture(scope="session")
def data():
    """Provide some data"""
    return ot.Normal().getSample(10)


def test_class(data):
    value = data
    obj = ottemplate.MyClass(value)

    f = ot.SymbolicFunction("x", "x*x")

    ott.assert_almost_equal(obj.power(1), value)
    ott.assert_almost_equal(obj.power(2), f(value))

