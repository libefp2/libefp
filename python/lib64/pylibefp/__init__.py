#
# @BEGIN LICENSE
#
#   pylibefp/__init__.py:
#
#   Copyright (c) 2017-2019 The Psi4 Developers
#
#   All rights reserved. Use of this source code is governed by a
#   BSD-style license that can be found in the LICENSE file.
#
# @END LICENSE
#

import os
pylibefp_module_loc = os.path.dirname(os.path.abspath(__file__))

# Init core
from . import core

# Load driver and version paraphernalia
from .wrapper import from_dict, to_dict
from .exceptions import EFPException, Fatal, NoMemory, FileNotFound, EFPSyntaxError, UnknownFragment, PolNotConverged, PyEFPSyntaxError
__version__ = "1.8.0"

# A few extraneous functions
from .extras import test
