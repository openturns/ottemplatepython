import numpy as np

class MyClass(object):
    """
    Class test

    Parameters
    ----------
    value : float
        The considered value.
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
        return np.pow(self.value, n)