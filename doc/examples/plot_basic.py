"""
Example : Using ottemplatepython module
---------------------------------------
"""
# %%
# This example aims to illustrate how to use the module.

# %%
# | Loading python modules

# %%
import openturns as ot
from openturns.viewer import View
import numpy as np
import ottemplate

# %%
# | Using the module to compute power
print(ottemplate.MyClass(3).power(2))

# %%
# | Compute power using arrays
array = np.linspace(-5, 5, 101)
values = ottemplate.MyClass(array).power(2.0)

# %%
# | Use of graph objects
graph = ot.Graph('Square function', 'x1', 'x2', True, '')
graph.add(ot.Cloud(array, values))
View(graph).show()
