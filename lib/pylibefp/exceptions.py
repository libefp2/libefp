#
# @BEGIN LICENSE
#
#   pylibefp/wrapper/exceptions.py:
#
#   Copyright (c) 2017-2019 The Psi4 Developers
#
#   All rights reserved. Use of this source code is governed by a
#   BSD-style license that can be found in the LICENSE file.
#
# @END LICENSE
#
"""Module with non-generic exceptions classes."""
from . import extras


class EFPException(Exception):
    """Error class for pylibefp."""
    extras._success_flag_ = False


class Fatal(EFPException):
    """Fatal error has occurred."""
    def __init__(self, msg):
        EFPException.__init__(self, msg)
        self.message = r"""\nEFPException: Fatal error has occurred. {}\n\n""".format(repr(msg))


class NoMemory(EFPException):
    """Insufficient memory."""
    def __init__(self, msg):
        EFPException.__init__(self, msg)
        self.message = r"""\nEFPException: Insufficient memory. {}\n\n""".format(repr(msg))


class FileNotFound(EFPException):
    """File not found."""
    def __init__(self, msg):
        EFPException.__init__(self, msg)
        self.message = r"""\nEFPException: File not found. {}\n\n""".format(repr(msg))


class EFPSyntaxError(EFPException):
    """Syntax error."""
    def __init__(self, msg):
        EFPException.__init__(self, msg)
        self.message = r"""\nEFPException: Libefp syntax error. {}\n\n""".format(repr(msg))


class UnknownFragment(EFPException):
    """Unknown EFP fragment."""
    def __init__(self, msg):
        EFPException.__init__(self, msg)
        self.message = r"""\nEFPException: Unknown EFP fragment. {}\n\n""".format(repr(msg))


class PolNotConverged(EFPException):
    """Polarization SCF procedure did not converge."""
    def __init__(self, msg):
        EFPException.__init__(self, msg)
        self.message = r"""\nEFPException: Polarization SCF procedure did not converge. {}\n\n""".format(repr(msg))


class PyEFPSyntaxError(EFPException):
    """Syntax error."""
    def __init__(self, msg):
        EFPException.__init__(self, msg)
        self.message = r"""\nEFPException: Pylibefp syntax error. {}\n\n""".format(repr(msg))
