import sys
import pylibefp
from systems import *

from qcelemental.testing import compare, compare_recursive, compare_values


def test_elec_1c():
    asdf = system_1()

    opts = asdf.set_opts({
        'elec': True,
        'elec_damp': 'off',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 6.0 * a2b,
    })
    import pprint
    pprint.pprint(opts)
    asdf.set_periodic_box([20.0 * a2b, 20.0 * a2b, 20.0 * a2b])
    box = asdf.get_periodic_box()

    asdf.compute()
    ene = asdf.get_energy()
    pprint.pprint(ene)
    print(asdf.energy_summary())
    assert compare_values(20.0 * a2b, box[2], sys._getframe().f_code.co_name + ': pbc', atol=1.e-6)
    assert compare_values(0.0002839577, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_disp_1c():
    asdf = system_1()

    opts = asdf.set_opts({
        'disp': True,
        'disp_damp': 'off',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 6.0 * a2b,
    })
    asdf.set_periodic_box([20.0 * a2b, 20.0 * a2b, 20.0 * a2b])
    box = asdf._efp_get_periodic_box()

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0000980020, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_qm_1a():
    asdf = system_qm1()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'overlap',
        'disp_damp': 'tt',
        'ai_elec': True,
        'ai_pol': True,
    })
    ptc = [1., 8., 2., 1.]
    coords = [ 3.2,   1.8,  -2.3,
              -2.9,  -6.2,  -2.5,
               5.0,   4.3,   0.2,
               4.9,   0.0,   4.7 ]  # yapf: disable
    coords = [c * a2b for c in coords]
    asdf.set_point_charges(ptc, coords)

    asdf.compute()
    ene = asdf.get_energy()
    ptc_info = {
        'n': asdf.get_point_charge_count(),
        'xyz': asdf.get_point_charge_coordinates(),
        'val': asdf.get_point_charge_values()
    }
    nptc = 4
    assert compare_recursive({
        'n': nptc,
        'xyz': coords,
        'val': ptc
    },
                             ptc_info,
                             sys._getframe().f_code.co_name + ': ptc',
                             atol=1.e-6)
    assert compare_values(-0.0787829370, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)
    ptc_x2 = [c * 2 for c in ptc]
    coords_x2 = [c * 2 for c in coords]
    asdf.set_point_charge_values(ptc_x2)
    asdf.set_point_charge_coordinates(coords_x2)
    ptc_info_x2 = {
        'n': asdf.get_point_charge_count(),
        'xyz': asdf.get_point_charge_coordinates(),
        'val': asdf.get_point_charge_values()
    }
    assert compare_recursive({
        'n': nptc,
        'xyz': coords_x2,
        'val': ptc_x2
    },
                             ptc_info_x2,
                             sys._getframe().f_code.co_name + ': ptc reset',
                             atol=1.e-6)


def test_qm_1b():
    asdf = system_qm1()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'overlap',
        'disp_damp': 'tt',
        'ai_elec': True,
        'ai_pol': True,
        'pol_driver': 'direct',
    })
    ptc = [1., 8., 2., 1.]
    coords = [ 3.2,   1.8,  -2.3,
              -2.9,  -6.2,  -2.5,
               5.0,   4.3,   0.2,
               4.9,   0.0,   4.7 ]  # yapf: disable
    coords = [c * a2b for c in coords]
    asdf.set_point_charges(ptc, coords)

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0787829370, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)

    assert compare_values(382.798972923,
                          asdf.nuclear_repulsion_energy(use_efp_frags=True, use_point_charges=True),
                          sys._getframe().f_code.co_name + ': NRE qmefp',
                          atol=1.e-6)
    assert compare_values(1.90431498139,
                          asdf.nuclear_repulsion_energy(use_efp_frags=False, use_point_charges=True),
                          sys._getframe().f_code.co_name + ': NRE qm',
                          atol=1.e-6)
    assert compare_values(321.754522402,
                          asdf.nuclear_repulsion_energy(use_efp_frags=True, use_point_charges=False),
                          sys._getframe().f_code.co_name + ': NRE efp',
                          atol=1.e-6)


def test_qm_2a():
    asdf = system_qm2()

    ptc = [7., 10., 1., 2., 2.]
    coords = [  4.0,   5.0,   5.0,
                8.0,   5.0,   6.0,
                5.0,   8.0,   5.0,
                8.0,   9.0,   8.0,
                5.0,   8.0,   8.0 ]  # yapf: disable
    asdf.set_point_charges(ptc, [c * a2b for c in coords])
    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'screen',
        'disp_damp': 'overlap',
        'ai_elec': True,
        'ai_pol': True,
    })

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.2314262632, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_qm_2b():
    asdf = system_qm2()

    ptc = [7., 10., 1., 2., 2.]
    coords = [4.0, 5.0, 5.0, 8.0, 5.0, 6.0, 5.0, 8.0, 5.0, 8.0, 9.0, 8.0, 5.0, 8.0, 8.0]
    asdf.set_point_charges(ptc, [c * a2b for c in coords])
    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'screen',
        'disp_damp': 'overlap',
        'ai_elec': True,
        'ai_pol': True,
        'pol_driver': 'direct',
    })

    asdf.compute()
    ene = asdf.get_energy()
    print(asdf.geometry_summary(units_to_bohr=0.529177))
    assert compare_values(-0.2314262632, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_total_5a():
    asdf = system_5()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'off',
        'disp_damp': 'off',
        'pol_damp': 'off',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 6.0 * a2b,
    })
    asdf.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0001206197, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_total_5b():
    asdf = system_5()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'screen',
        'disp_damp': 'tt',
        'pol_damp': 'tt',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 6.0 * a2b,
    })
    asdf.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0001206296, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_total_5c():
    asdf = system_5()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'overlap',
        'disp_damp': 'overlap',
        'pol_damp': 'tt',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 6.0 * a2b,
    })
    asdf.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0001205050, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_total_5d():
    asdf = system_5()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'overlap',
        'disp_damp': 'overlap',
        'pol_damp': 'tt',
        'pol_driver': 'direct',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 6.0 * a2b
    })
    asdf.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(0.0001205050, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_total_6a():
    asdf = system_6()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'off',
        'disp_damp': 'off',
        'pol_damp': 'off',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 5.0 * a2b,
    })
    asdf.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0054950567, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_total_6b():
    asdf = system_6()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'overlap',
        'disp_damp': 'tt',
        'pol_damp': 'tt',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 5.0 * a2b,
    })
    asdf.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0051253344, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_total_6c():
    asdf = system_6()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'screen',
        'disp_damp': 'overlap',
        'pol_damp': 'off',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 5.0 * a2b,
    })
    asdf.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0064013486, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)


def test_total_6d():
    asdf = system_6()

    opts = asdf.set_opts({
        'elec': True,
        'pol': True,
        'disp': True,
        'xr': True,
        'elec_damp': 'overlap',
        'disp_damp': 'tt',
        'pol_damp': 'tt',
        'enable_pbc': True,
        'enable_cutoff': True,
        'swf_cutoff': 5.0 * a2b,
    })
    asdf.set_periodic_box([15.0 * a2b, 15.0 * a2b, 15.0 * a2b])

    asdf.compute()
    ene = asdf.get_energy()
    assert compare_values(-0.0051253344, ene['total'], sys._getframe().f_code.co_name + ': total', atol=1.e-6)
