import sys
import numpy as np

# Get the absolute path to the directory containing the module
sys.path.insert(0, '/Users/lyuda/LIBEFP/libefp_skp_may2025/lib')

import pylibefp
from systems import *

from qcelemental.testing import compare, compare_recursive, compare_values

asdf = system_3()

opts = asdf.set_opts({
    'elec': True,
    'disp': True,
    'disp_damp': 'off',
    'enable_pbc': True,
    'enable_cutoff': True,
    'swf_cutoff': 6.0 * a2b,
    'enable_pairwise': True,
    'ligand': 1,
    'symmetry': True,
})
asdf.set_periodic_box([20.0 * a2b, 20.0 * a2b, 20.0 * a2b])
box = asdf._efp_get_periodic_box()

asdf.compute()
ene = asdf.get_energy()
print(ene)
