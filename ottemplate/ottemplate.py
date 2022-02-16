import numpy as np
import openturns as ot

class MyClass(object):
    """
    Class test
    Applying power on

    Parameters
    ----------
    value : array-like or float
        The considered value.
    
    Notes
    -----
    Objects of type :py:class:`openturns.Sample` or :py:class:`openturns.Point` are also accepted.
    """
    def __init__(self, value):
        # set attribute
        self.value = value

    def power(self, n):
        """
        Method that returns value**n.

        Returns
        -------
        y : float
            The cube value.
        """
        return np.power(self.value, n)