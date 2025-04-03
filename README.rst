ottemplate module
=================

ottemplate is a (non official) module for OpenTURNS. It serves as a template or example to build python modules designed to interact within the openturns platform.


Template update
================
One should update the template to its needs. For the moment there is no `customize` command for that purpose but this will be available soon.
User can perform manually some changes:

- Rename `ottemplate` folder into the name of the module
- Update `setup.py` (replace `ottemplate` with the new module)
- Rename also python files in the subfolder
- Replace `ottemplate` in `doc/conf.py` by the name of the (new) module. Also the `theme` folder contains a `layout` that should be updated.
  Same operations are to be done in all doc (`user_manual`, `index`, `developer_guide`, `examples`)
- Finally perform also changes in `test` and `continuous-integration` folders


Build from source
=================

Get source:

.. code-block:: shell

    $ git clone https://www.github.com/openturns/ottemplatepython.git


The install procedure is performed as follows:

.. code-block:: shell

    $ pip install .

If you need to install the module in the user folder:

.. code-block:: shell

    $ pip install . --user

To run the tests:

.. code-block:: shell

    $ pytest

Finally to build the documentation, one of the following option could be used :

.. code-block:: shell

    $ sphinx-build doc doc/_build
    #$ python -m sphinx doc doc_build
    $ make html -C doc


This generate the documentation in the `doc/_build` folder.


Help pages
==========

Here are some links to help on how to build a python module

https://www.sphinx-doc.org/en/master/usage/quickstart.html

https://python-packaging.readthedocs.io/en/latest/minimal.html

https://github.com/efekhari27/otquickmodule
