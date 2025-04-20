import sys
import pytest
import pprint
import pylibefp

from qcelemental.testing import compare, compare_recursive, compare_values

from systems import *

asdf = system_1()
asdf.set_opts({
    'elec': True,
    'elec_damp': 'screen',
    'xr': True,
    'pol': True,  # 'pol_damp': 'tt',
    'disp': True,
    'disp_damp': 'tt'
})
asdf.compute()
ene = asdf.get_energy()
pprint.pprint(ene)
print('<<< get_opts():  ', asdf.get_opts(), '>>>')
#print('<<< summary():   ', asdf.summary(), '>>>')
print('<<< get_energy():', ene, '>>>')
print('<<< get_atoms(): ', asdf.get_atoms(), '>>>')
print(asdf.energy_summary())
print(asdf.geometry_summary(units_to_bohr=b2a))
print(asdf.geometry_summary(units_to_bohr=1.0))
