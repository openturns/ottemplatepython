#!/usr/bin/env python

from __future__ import print_function
import openturns as ot
import ottemplate

a = ottemplate.MyClass()
print(a)

p = ot.Point([2, 3])
print(p)

squared_p = a.square(p)
print(squared_p)
