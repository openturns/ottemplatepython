"""
Setup script for ottemplate
==========================

This script allows to install ottemplate within the python environment.

Usage
-----
::

    pip install .

"""
from setuptools import setup, find_packages


setup(
    # library name
    name='ottemplate',
    # code version
    version="0.1",
    # list libraries to be imported
    packages=find_packages(),
    # Descriptions
    description="template for python modules utilizing openturns",
    install_requires=['numpy>=1.13',
                      'openturns',
                      'matplotlib >= 1.5.1',
                      "numpydoc",
                      "sphinx_gallery",
                      "sphinx",
                      "matplotlib",
                      "openturns",
                      "pytest",
                      "pytest-runner"],
)
