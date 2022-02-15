#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup, find_packages
# To use a consistent encoding
from codecs import open
from os import path

with open('ottemplate/__init__.py') as fid:
    for line in fid:
        if line.startswith('__version__'):
            version = line.strip().split()[-1][1:-1]
            break

"""
http://python-packaging.readthedocs.org/en/latest/minimal.html
"""

# Get the long description from the README file
here = path.abspath(path.dirname(__file__))
with open(path.join(here, 'README.rst'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='ottemplate',
    version=version,
    packages=find_packages(),
     extras_require = {
         'joblib':  ["joblib>=0.9.3"],
         'ipyparallel': ["ipyparallel>=5.0.1"],
         'pathos': ["pathos>=0.2.0"]
     },
    author="First Name",
    author_email="name@XXX.com",
    description="OpenTURNS python template",
    long_description=long_description,
    setup_requires=['pytest-runner'],
    tests_require=['pytest'],
    zip_safe=False
)
