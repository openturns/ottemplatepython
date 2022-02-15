"""
    ottemplate --- An OpenTURNS module
    ==================================

    Contents
    --------
      'ottemplate' is a module for OpenTURNS

"""

import sys
if sys.platform.startswith('win'):
    # this ensures OT dll is loaded
    import openturns

from .ottemplate import *

__version__ = '0.1'

