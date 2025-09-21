#
# @BEGIN LICENSE
#
#   pylibefp/wrapper/wrapper.py:
#
#   Copyright (c) 2017-2019 The Psi4 Developers
#
#   All rights reserved. Use of this source code is governed by a
#   BSD-style license that can be found in the LICENSE file.
#
# @END LICENSE
#

import os
import re
import sys
import math
import functools
from pathlib import Path
from typing import Dict

import qcelemental as qcel

from . import core
from .exceptions import Fatal, NoMemory, FileNotFound, EFPSyntaxError, UnknownFragment, PolNotConverged, PyEFPSyntaxError

_lbtl = {
    'libefp': {},
    'psi': {
        'elec': 'elst',
        'pol': 'ind',
        'xr': 'exch',
        'qq': 'charge_charge',
        'lj': 'lennard-jones',
        'elec_damp': 'elst_damping',
        'pol_damp': 'ind_damping',
        'disp_damp': 'disp_damping',
        'pol_driver': 'ind_driver',
        'ai_elec': 'qm_elst',
        'ai_pol': 'qm_ind',
        'ai_disp': 'qm_disp',
        'ai_xr': 'qm_exch',
        'ai_chtr': 'qm_chtr',
        'ai_qq': 'qm_qq',
    },
}


def _rekey(rawdict, label):
    newdict = rawdict.copy()
    for key in rawdict.keys():
        topic = _lbtl[label].get(key, key)
        newdict[topic] = newdict.pop(key)
    return newdict


def _result_to_error(res, msg=''):

    if res == core.efp_result.EFP_RESULT_SUCCESS:
        return
    elif res == core.efp_result.EFP_RESULT_FATAL:
        raise Fatal(msg)
    elif res == core.efp_result.EFP_RESULT_NO_MEMORY:
        raise NoMemory(msg)
    elif res == core.efp_result.EFP_RESULT_FILE_NOT_FOUND:
        raise FileNotFound(msg)
    elif res == core.efp_result.EFP_RESULT_SYNTAX_ERROR:
        raise EFPSyntaxError(msg)
    elif res == core.efp_result.EFP_RESULT_UNKNOWN_FRAGMENT:
        raise UnknownFragment(msg)
    elif res == core.efp_result.EFP_RESULT_POL_NOT_CONVERGED:
        raise PolNotConverged(msg)


def prepare(efpobj):
    """Prepare the calculation after all fragments added.

    Returns
    -------
    None

    """
    res = efpobj._efp_prepare()
    _result_to_error(res)


def compute(efpobj, do_gradient=False):
    """Perform the EFP computation.

    Parameters
    ----------
    do_gradient : bool, optional
        If True, compute the gradient in addition to energy.

    Returns
    -------
    None

    """
    # efp_compute already does pairwise, enable_pairwise just saves the pairwise info
    # 
    res = efpobj._efp_compute(do_gradient)
    _result_to_error(res)

def add_potential(efpobj, potential, fragpath='LIBRARY', duplicates_ok=False):
    """Searches for EFP fragments and adds to `efpobj`.

    Parameters
    ----------
    potential : str or list
        Single fragment name or a list of fragments, with or without
        ".efp" extension.
    fragpath : string, optional
        String with ":"-separated paths that may include absolute
        paths, relative paths, "$"-marked environment variables, and
        the word LIBRARY. Relative paths and environment variables will
        be expanded. "LIBRARY" will be expanded to the native libefp
        fragment library.
    duplicates_ok : bool, optional
        Whether to continue or to return pylibefp.Fatal if asked
        to load a duplicate potential according to libefp default
        behavior. The `potential` list is always filtered to avoid
        duplicates. Activating `duplicates_ok` additionally allows
        repeated calls to this function to add duplicate potentials.

    Returns
    -------
    None

    .. versionchanged:: 1.9
       Now handles `_L` fragments by only looking in LIBRARY paths for these.
       Also now handles "deep" library layouts. Unlike C libefp, a fragment
       without _L extension is sought in all fraglib paths, including LIBRARY,
       if present.

    """

    print('POTENTIAL ', potential)
    paths = []
    library_paths = []
    for pth in fragpath.split(os.pathsep):
        if pth == 'LIBRARY':
            for lst in [paths, library_paths]:
                for spth in '@libefp_FRAGLIB_DIRS@'.split(';'):
                    lst.append(spth)
                lst.append('/scratch/gilbreth/paulsk/ls_pylib/libefp/fraglib')
                #lst.append('/opt/anaconda1anaconda2anaconda3/share/libefp/fraglib')
                #lst.append('/opt/anaconda1anaconda2anaconda3/share/libefp/fraglib/databases')
                #lst.append('/opt/anaconda1anaconda2anaconda3/Library/share/libefp/fraglib')
                #lst.append('/opt/anaconda1anaconda2anaconda3/Library/share/libefp/fraglib/databases')
                #lst.append('/opt/anaconda1anaconda2anaconda3/Library/share/libefp/fraglib')
                #lst.append('/opt/anaconda1anaconda2anaconda3/Library/share/libefp/fraglib/databases')
                for spth in '@FRAGLIB_DATADIRS@'.split(';'):
                    lst.append(str((Path('@CMAKE_CURRENT_SOURCE_DIR@') / '..' / spth).resolve()))
        else:
            paths.append(os.path.expandvars(os.path.expanduser(pth)))

    # locate efpfrags full path name
    abspath_pots = []
    if isinstance(potential, str):
        potential = [potential]
    uniq_pots = list(set(potential))
    for pot in uniq_pots:
        pathpot = Path(pot).with_suffix('.efp')
        search_paths = []

        if pathpot.stem.upper().endswith('_L'):
            # if "frag_L", only search for "LIBRARY/frag.efp"
            file_pot_name = pathpot.with_name(str(pathpot.stem)[:-2]).with_suffix('.efp')
            for pth in library_paths:
                search_paths.append((pth / file_pot_name).resolve())
        else:
            # otherwise, search all "<fragpath>/frag.efp", possibly incl. LIBRARY
            for pth in paths:
                search_paths.append((pth / pathpot).resolve())

        for pth in search_paths:
            if pth.is_file():
                abspath_pots.append(str(pth))
                break

    # load the potentials
    for ipot, pot in enumerate(abspath_pots):
        res = efpobj._efp_add_potential(pot)
        try:
            _result_to_error(res, uniq_pots[ipot])
        except Fatal as e:
            if duplicates_ok:
                pass
            else:
                raise Fatal('Invalid fragment name (probably already added): {}'.format(uniq_pots[ipot]))

        print(r"""  EFP fragment {} read from {}""".format(uniq_pots[ipot], pot))


def add_fragment(efpobj, fragments):
    """Registers EFP fragments to `efpobj` in order.

    Parameters
    ----------
    fragments : list of str
       Names of fragments to define the EFP subsystem.

    .. versionchanged:: 1.9
       Fragments are checking `_L` extensions for library files, too.

    Returns
    -------
    None

    """
    if isinstance(fragments, str):
        fragments = [fragments]
    for frag in fragments:
        res = efpobj._efp_add_fragment(frag)
        try:
            _result_to_error(res, frag)
        except UnknownFragment as e:
            res = efpobj._efp_add_fragment(frag + "_L")
            _result_to_error(res, frag)


#def add_ligand(efpobj, ligand_index):
#    """Adds ligand to `efpobj`
#
#    Parameters
#    ----------
#    ligand_index : index of the ligand
#
#    Returns
#    -------
#    None
#
#    """
#    res = efpobj._efp_add_ligand(ligand_index)
#    _result_to_error(res)



def get_opts(efpobj, label='libefp'):
    """Returns the options state of *efpobj* as a dictionary.

    Parameters
    ----------
    label : {'libefp', 'psi'}, optional
        Returned dictionary keys are identical to libefp efp_opts struct
        names unless custom renaming requested via `label`.

    Returns
    -------
    dict
        Current options state of `efpobj` translated into bools, strings,
        and floats, rather than libefp custom datatypes.

    """
    opts = core.efp_opts()
    res = efpobj._efp_get_opts(opts)
    _result_to_error(res)

    dopts = {}

    dopts['elec'] = bool(opts.terms & core.efp_term.EFP_TERM_ELEC)
    dopts['pol'] = bool(opts.terms & core.efp_term.EFP_TERM_POL)
    dopts['disp'] = bool(opts.terms & core.efp_term.EFP_TERM_DISP)
    dopts['xr'] = bool(opts.terms & core.efp_term.EFP_TERM_XR)
    dopts['chtr'] = bool(opts.terms & core.efp_term.EFP_TERM_CHTR)
    dopts['qq'] = bool(opts.terms & core.efp_term.EFP_TERM_QQ) # SKP
    dopts['lj'] = bool(opts.terms & core.efp_term.EFP_TERM_LJ)  # SKP

    dopts['spec_elec'] = bool(opts.special_terms & core.efp_special_term.EFP_SPEC_TERM_ELEC) # SKP
    dopts['spec_pol'] = bool(opts.special_terms & core.efp_special_term.EFP_SPEC_TERM_POL) # SKP
    dopts['spec_disp'] = bool(opts.special_terms & core.efp_special_term.EFP_SPEC_TERM_DISP) # SKP
    dopts['spec_xr'] = bool(opts.special_terms & core.efp_special_term.EFP_SPEC_TERM_XR) # SKP
    dopts['spec_chtr'] = bool(opts.special_terms & core.efp_special_term.EFP_SPEC_TERM_CHTR)  # SKP
    dopts['spec_qq'] = bool(opts.special_terms & core.efp_special_term.EFP_SPEC_TERM_QQ) # SKP
    dopts['spec_lj'] = bool(opts.special_terms & core.efp_special_term.EFP_SPEC_TERM_LJ)  # SKP
 
    dopts['elec_damp'] = {
        core.EFP_ELEC_DAMP_SCREEN: 'screen',
        core.EFP_ELEC_DAMP_OVERLAP: 'overlap',
        core.EFP_ELEC_DAMP_OFF: 'off',
    }[opts.elec_damp]

    dopts['pol_damp'] = {
        core.EFP_POL_DAMP_TT: 'tt',
        core.EFP_POL_DAMP_OFF: 'off',
    }[opts.pol_damp]

    dopts['disp_damp'] = {
        core.EFP_DISP_DAMP_TT: 'tt',
        core.EFP_DISP_DAMP_OVERLAP: 'overlap',
        core.EFP_DISP_DAMP_OFF: 'off',
    }[opts.disp_damp]

    dopts['enable_pbc'] = bool(opts.enable_pbc)
    dopts['enable_cutoff'] = bool(opts.enable_cutoff)
    dopts['swf_cutoff'] = opts.swf_cutoff
    dopts['xr_cutoff'] = opts.xr_cutoff
    dopts['special_fragment'] = opts.special_fragment
    dopts['enable_pairwise'] = bool(opts.enable_pairwise) # SKP 
    dopts['symmetry'] = bool(opts.symmetry) # SKP

    dopts['symm_frag'] = {
        core.EFP_SYMM_FRAG_FRAG: 'frag',
        core.EFP_SYMM_FRAG_LIST: 'list',
    }[opts.symm_frag]

    dopts['ligand'] = opts.ligand # SKP
    dopts['print'] = opts.print

    dopts['pol_driver'] = {
        core.EFP_POL_DRIVER_ITERATIVE: 'iterative',
        core.EFP_POL_DRIVER_DIRECT: 'direct',
    }[opts.pol_driver]

    dopts['ai_elec'] = bool(opts.terms & core.efp_term.EFP_TERM_AI_ELEC)
    dopts['ai_pol'] = bool(opts.terms & core.efp_term.EFP_TERM_AI_POL)
    dopts['ai_disp'] = bool(opts.terms & core.efp_term.EFP_TERM_AI_DISP)
    dopts['ai_xr'] = bool(opts.terms & core.efp_term.EFP_TERM_AI_XR)
    dopts['ai_chtr'] = bool(opts.terms & core.efp_term.EFP_TERM_AI_CHTR)
    dopts['ai_qq'] = bool(opts.terms & core.efp_term.EFP_TERM_AI_QQ) # SKP

    return _rekey(dopts, label=label)


def set_opts(efpobj, dopts, label='libefp', append='libefp'):
    """Sets the options state of `efpobj` from dictionary `dopts`.

    Parameters
    ----------
    dopts : dict
        Input dict with keys from libefp efp_opts (see `label`) and
        values bools, strings, floats, and ints, as appropriate, rather
        than libefp custom datatypes.
    label : {'libefp', 'psi'}, optional
        Input `dopts` keys are read as libefp efp_opts struct names or
        by the custom translation set defined for `label`.
    append : {'libefp', 'psi', 'append'}, optional
        When ``libefp``, input `dopts` keys are applied to the default
        (generally OFF) efp_opts state. When ``psi``, input `dopts`
        keys are applied to the default (generally ON) Psi efp_opts
        state. When ``append``, input `dopts` keys are applied to the
        current *efpobj* opt_opts state.

    Returns
    -------
    dict
        After setting the options state, `efpobj` is queried as to the
        current options state, which is then returned.

    """
    # warn on stray dopts keys
    allowed = [
        'elec', 'pol', 'disp', 'xr', 'elec_damp', 'pol_damp', 'disp_damp', 'enable_pbc', 'enable_cutoff', 'swf_cutoff',
        'xr_cutoff',
        'pol_driver', 'ai_elec', 'ai_pol', 'enable_pairwise', 'ligand', 'symmetry', 'symm_frag',
        'spec_elec', 'spec_pol', 'spec_disp', 'spec_xr', 'spec_chtr', 'ai_qq', 'qq', 'lj', 'special_fragment',
        'spec_qq', 'spec_lj', 'print'
    ]
    label_allowed = [_lbtl[label].get(itm, itm) for itm in allowed]
    for key in dopts.keys():
        if key not in label_allowed:
            print('Warning: unrecognized key {}'.format(key))
    trues = [True, 1, 'yes', 'true', 'on']
    falses = [False, 0, 'no', 'false', 'off']

    # prepare base options state for dopts
    opts = core.efp_opts()
    # default values of parameters
    if append == 'libefp':
        opts.ligand = -100
        opts.special_fragment = -100
        #opts.terms |= core.efp_term.EFP_TERM_ELEC
        #opts.terms |= core.efp_term.EFP_TERM_POL
        #opts.terms |= core.efp_term.EFP_TERM_DISP
        #opts.terms |= core.efp_term.EFP_TERM_XR
    elif append == 'psi':
        opts.terms |= core.efp_term.EFP_TERM_ELEC
        opts.terms |= core.efp_term.EFP_TERM_POL
        opts.terms |= core.efp_term.EFP_TERM_DISP
        opts.terms |= core.efp_term.EFP_TERM_XR
        opts.elec_damp = core.EFP_ELEC_DAMP_SCREEN
        opts.pol_damp = core.EFP_POL_DAMP_TT
        opts.disp_damp = core.EFP_DISP_DAMP_OVERLAP
        opts.terms |= core.efp_term.EFP_TERM_AI_ELEC
        opts.terms |= core.efp_term.EFP_TERM_AI_POL
        opts.ligand = -100
        opts.special_fragment = -100
    #elif append == 'qchem':
    #    # q-chem and psi4 have different defaults for at least this option
    #    opts.disp_damp = core.EFP_DISP_DAMP_TT
    elif append == 'append':
        res = efpobj._efp_get_opts(opts)
        _result_to_error(res)
    else:
        raise PyEFPSyntaxError('Unrecognized opts default set: {}'.format(append))

    # apply dopts to options state
    topic = _lbtl[label].get('elec', 'elec')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_ELEC
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_ELEC
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))
    
    topic = _lbtl[label].get('pol', 'pol')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_POL
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_POL
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('disp', 'disp')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_DISP
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_DISP
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('xr', 'xr')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_XR
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_XR
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))
#========== SKP changes ======================================================================#
    topic = _lbtl[label].get('qq', 'qq')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_QQ
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_QQ
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))
 
    topic = _lbtl[label].get('lj', 'lj')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_LJ
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_LJ
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('spec_qq', 'spec_qq')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_special_term.EFP_SPEC_TERM_QQ
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_special_term.EFP_SPEC_TERM_QQ
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('spec_lj', 'spec_lj')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_special_term.EFP_SPEC_TERM_LJ
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_special_term.EFP_SPEC_TERM_LJ
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('spec_elec', 'spec_elec')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_special_term.EFP_SPEC_TERM_ELEC
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_special_term.EFP_SPEC_TERM_ELEC
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('spec_pol', 'spec_pol')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_special_term.EFP_SPEC_TERM_POL
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_special_term.EFP_SPEC_TERM_POL
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('spec_xr', 'spec_xr')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_special_term.EFP_SPEC_TERM_XR
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_special_term.EFP_SPEC_TERM_XR
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))


    topic = _lbtl[label].get('spec_disp', 'spec_disp')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_special_term.EFP_SPEC_TERM_DISP
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_special_term.EFP_SPEC_TERM_DISP
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

#================================================================================================#
    # may be enabled in a future libefp release
    # topic = _lbtl[label].get('chtr', 'chtr')

    topic = _lbtl[label].get('elec_damp', 'elec_damp')
    if topic in dopts:
        try:
            opts.elec_damp = {
                'screen': core.EFP_ELEC_DAMP_SCREEN,
                'overlap': core.EFP_ELEC_DAMP_OVERLAP,
                'off': core.EFP_ELEC_DAMP_OFF,
            }[dopts[topic].lower()]
        except KeyError:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [screen/overlap/off] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('pol_damp', 'pol_damp')
    if topic in dopts:
        try:
            opts.pol_damp = {
                'tt': core.EFP_POL_DAMP_TT,
                'off': core.EFP_POL_DAMP_OFF,
            }[dopts[topic].lower()]
        except KeyError:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [tt/off] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('disp_damp', 'disp_damp')
    if topic in dopts:
        try:
            opts.disp_damp = {
                'overlap': core.EFP_DISP_DAMP_OVERLAP,
                'tt': core.EFP_DISP_DAMP_TT,
                'off': core.EFP_DISP_DAMP_OFF,
            }[dopts[topic].lower()]
        except KeyError:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [overlap/tt/off] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('enable_pbc', 'enable_pbc')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.enable_pbc = 1
        elif dopts[topic] in falses:
            opts.enable_pbc = 0
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('symmetry', 'symmetry')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.symmetry = 1
        elif dopts[topic] in falses:
            opts.symmetry = 0
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('symm_frag', 'symm_frag')
    if topic in dopts:
        try:
            opts.symm_frag = {
                'frag': core.EFP_SYMM_FRAG_FRAG,
                'list': core.EFP_SYMM_FRAG_LIST,
            }[dopts[topic].lower()]
        except KeyError:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [frag/list] {}: {}'.format(topic, dopts[topic]))

    # PAIRWISE - SKP
    topic = _lbtl[label].get('enable_pairwise', 'enable_pairwise')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.enable_pairwise = 1
        elif dopts[topic] in falses:
            opts.enable_pairwise = 0
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))
# LIGAND NUMBER - SKP
    topic = _lbtl[label].get('ligand', 'ligand')
    if topic in dopts:
        ligand_idx = dopts[topic]
        if not isinstance(ligand_idx, int):
            raise TypeError(f"ligand value must be an integer, got: {ligand_idx}")
        if ligand_idx >= efpobj.get_frag_count():
            raise ValueError(f"Invalid ligand index: {ligand_idx}, only {efpobj.get_frag_count()} fragments present.")
        opts.ligand = ligand_idx

# SPECIAL-FRAGMENT NUMBER - SKP
    topic = _lbtl[label].get('special_fragment', 'special_fragment')
    if topic in dopts:
        special_frag_idx = dopts[topic]
        if not isinstance(special_frag_idx, int):
            raise TypeError(f"special_fragment value must be an integer, got: {special_frag_idx}")
        if special_frag_idx >= efpobj.get_frag_count():
            raise ValueError(f"Invalid special_fragment index: {special_frag_idx}, only {efpobj.get_frag_count()} fragments present.")
        opts.special_fragment = special_frag_idx

    topic = _lbtl[label].get('enable_cutoff', 'enable_cutoff')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.enable_cutoff = 1
        elif dopts[topic] in falses:
            opts.enable_cutoff = 0
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('swf_cutoff', 'swf_cutoff')
    if topic in dopts:
        opts.swf_cutoff = float(dopts[topic])

    topic = _lbtl[label].get('xr_cutoff', 'xr_cutoff')
    if topic in dopts:
        opts.xr_cutoff = float(dopts[topic])

    topic = _lbtl[label].get('print', 'print')
    if topic in dopts:
        opts.print = int(dopts[topic])

    topic = _lbtl[label].get('pol_driver', 'pol_driver')
    if topic in dopts:
        try:
            opts.pol_driver = {
                'iterative': core.EFP_POL_DRIVER_ITERATIVE,
                'direct': core.EFP_POL_DRIVER_DIRECT,
            }[dopts[topic].lower()]
        except KeyError:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [iterative/direct] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('ai_elec', 'ai_elec')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_AI_ELEC
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_AI_ELEC
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))

    topic = _lbtl[label].get('ai_pol', 'ai_pol')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_AI_POL
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_AI_POL
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))
#=================== SKP addition ===================================================#   
    topic = _lbtl[label].get('ai_qq', 'ai_qq')
    if topic in dopts:
        if dopts[topic] in trues:
            opts.terms |= core.efp_term.EFP_TERM_AI_QQ
        elif dopts[topic] in falses:
            opts.terms &= ~core.efp_term.EFP_TERM_AI_QQ
        else:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [T/F] {}: {}'.format(topic, dopts[topic]))
#======================================================================================#
    # may be enabled in a future libefp release
    # topic = _lbtl[label].get('ai_disp', 'ai_disp')
    # topic = _lbtl[label].get('ai_xr', 'ai_xr')
    # topic = _lbtl[label].get('ai_chtr', 'ai_chtr')

#   set some defaults
    if opts.xr_cutoff == 0 and opts.enable_cutoff == 1:
        opts.xr_cutoff = opts.swf_cutoff


    # set computed options state
    res = efpobj._efp_set_opts(opts)
    _result_to_error(res)

    # we need to initialize the ligand structure if pairwise calcs are requested
    # do it here - there is no other time before compute starts...
    if opts.enable_pairwise == 1 and opts.ligand >= 0:
        efpobj._efp_add_ligand(opts.ligand)

    # prepares symmetry info for symmetric crystal calculations
    res = efpobj._efp_set_symmlist()
    _result_to_error(res)

    return efpobj.get_opts(label=label)


def set_periodic_box(efpobj, xyz, alpha=90.0, beta=90.0, gamma=90.0):
    """Set periodic box size.

    Parameters
    ----------
    xyz : list
        (3,) Box sizes in three dimensions [x, y, z] in Bohr.
    alpha
        Unit cell alpha angle in degrees.
    beta
        Unit cell beta angle in degrees.
    gamma
        Unit cell gamma angle in degrees.

    Returns
    -------
    None

    .. versionchanged:: 1.9
       Parameters alpha, beta, and gamma added.

    """

    if len(xyz) == 3:
        res = efpobj._efp_set_periodic_box(xyz[0], xyz[1], xyz[2], alpha, beta, gamma)
        _result_to_error(res)
    elif len(xyz) == 6:
        res = efpobj._efp_set_periodic_box(xyz[0], xyz[1], xyz[2], xyz[3], xyz[4], xyz[5])
        _result_to_error(res)
    else :
        raise PyEFPSyntaxError('Invalid periodic box setting: {}'.format(xyz))

    (res, xyzabc) = efpobj._efp_get_periodic_box()
    _result_to_error(res)


def get_periodic_box(efpobj):
    """Get periodic box size.

    Returns
    -------
    list
        Box sizes in three dimensions [x, y, z] in Bohr.
        And box angles [alpha, beta, gamma] in degrees.

    .. versionchanged:: 1.9
       Return size extended from 3 to 6 to include angles.

    """
    (res, xyzabc) = efpobj._efp_get_periodic_box()
    _result_to_error(res)

    return xyzabc


#def opts_summary(efpobj, labels='libefp'):
#
#    opts = efpobj.get_opts()
##    py::dict opts = opts_to_dict(efp);
#
#    elec = 'Electrostatics'
#    xr = 'Exchange'
#    disp = 'Dispersion'
#    if labels == 'libefp':
#        pol = 'Polarization'
#    elif labels == 'psi4':
#        pol = 'Induction'
#
#    text = ''
#    text += '\n  ==>  EFP/EFP Setup  <==\n\n'
#    text +=   '  {:<30} {:12}\n'.format(elec + ' enabled?:', 'true' if opts["elec"] else 'false')
#    text +=   '  {:<30} {:12}\n'.format(pol + ' enabled?:', 'true' if opts["pol"] else 'false')
#    text +=   '  {:<30} {:12}\n'.format(disp + ' enabled?:', 'true' if opts["disp"] else 'false')
#    text +=   '  {:<30} {:12}\n'.format(xr + ' enabled?:', 'true' if opts["xr"] else 'false')
#    text +=   '  {:<30} {:12}\n'.format('Charge-Transfer enabled?:', 'undefined')
#
#    text += '\n  {:<30} {:12}\n'.format(elec + ' damping:', opts["elec_damp"])
#    text +=   '  {:<30} {:12}\n'.format(pol + 'damping:', opts["pol_damp"])
#    text +=   '  {:<30} {:12}\n'.format(disp + ' damping:', opts["disp_damp"])
#    text +=   '  {:<30} {:12}\n'.format(pol + ' driver:', opts["pol_driver"])
#
#    text += '\n  ==>  QM/EFP Setup  <==\n\n'
##//    sprintf(buffer, "  Number of QM fragments:  %12d\n", -1); //, nfrag_);
#    text += '  Electrostatics enabled?:   {:12}\n'.format('true' if opts["ai_elec"] else 'false')
#    text += '  Polarization enabled?:     {:12}\n'.format('true' if opts["ai_pol"] else 'false')
#    text += '  Dispersion enabled?:       {:12}\n'.format('undefined')
#    text += '  Exchange enabled?:         {:12}\n'.format('undefined')
#    text += '  Charge-Transfer enabled?:  {:12}\n'.format('undefined')
#
#    return text


def get_energy(efpobj, label='libefp'):
    """Gets the energy components from `efpobj` computation as a dictionary.

    Parameters
    ----------
    label : {'libefp', 'psi'}, optional
        Returned dictionary keys are identical to libefp efp_energy struct
        names plus elec, pol, disp, xr, & total components unless custom renaming
        requested via `label`.

    Returns
    -------
    dict
        Individual terms, summed components, and total energies.

    """
    ene = core.efp_energy()
    res = efpobj._efp_get_energy(ene)
    _result_to_error(res)

    energies = {
        'electrostatic': ene.electrostatic,
        'charge_penetration': ene.charge_penetration,
        'electrostatic_point_charges': ene.electrostatic_point_charges,
        'polarization': ene.polarization,
        'dispersion': ene.dispersion,
        'exchange_repulsion': ene.exchange_repulsion,
        'total': ene.total,
        'elec': ene.electrostatic + ene.charge_penetration + ene.electrostatic_point_charges,
        'xr': ene.exchange_repulsion,
        'pol': ene.polarization,
        'disp': ene.dispersion,
        'qq': ene.qq,
        'lj':ene.lj,
    }

    return _rekey(energies, label=label)


def print_pairwise_energies(efpobj):
    """Prints pairwise energy between ligand and all fragments."""

    ligand_index = efpobj.get_opts().get("ligand", 0)
    nfrag = efpobj.get_frag_count()

    energies = efpobj._efp_get_pairwise_energy(nfrag)

    ene_elec = 0.0
    ene_pol = 0.0
    ene_disp = 0.0
    ene_xr = 0.0
    ene_chpn = 0.0
    ene_total = 0.0
    for i in range(nfrag):
        if i == ligand_index:
            continue

        print(f"\nPAIRWISE ENERGY BETWEEN FRAGMENT {i} AND LIGAND {ligand_index}")
        energy = energies[i]
        print(f"{'ELECTROSTATIC':>40} {energy['electrostatic']:16.10f}")
        print(f"{'POLARIZATION':>40} {energy['polarization']:16.10f}")
        print(f"{'DISPERSION':>40} {energy['dispersion']:16.10f}")
        print(f"{'EXCHANGE REPULSION':>40} {energy['exchange_repulsion']:16.10f}")
        print(f"{'CHARGE PENETRATION':>40} {energy['charge_penetration']:16.10f}")
        print(f"{'TOTAL':>40} {energy['total']:16.10f}")
        print("------------------------------------------------------------")

        ene_elec += energy['electrostatic']
        ene_pol += energy['polarization']
        ene_disp += energy['dispersion']
        ene_xr += energy['exchange_repulsion']
        ene_chpn += energy['charge_penetration']
        ene_total += energy['total']

    print(f"\nTOTAL PAIRWISE ENERGY OF LIGAND {ligand_index}")
    print(f"{'ELECTROSTATIC':>40} {ene_elec:16.10f}")
    print(f"{'POLARIZATION':>40} {ene_pol:16.10f}")
    print(f"{'DISPERSION':>40} {ene_disp:16.10f}")
    print(f"{'EXCHANGE REPULSION':>40} {ene_xr:16.10f}")
    print(f"{'CHARGE PENETRATION':>40} {ene_chpn:16.10f}")
    print(f"{'TOTAL':>40} {ene_total:16.10f}")
    print("------------------------------------------------------------")
    print("------------------------------------------------------------")



def get_frag_count(efpobj):
    """Gets the number of fragments in `efpobj` computation.

    Returns
    -------
    int
        Number of fragments in calculation.

    """
    (res, nfrag) = efpobj._efp_get_frag_count()
    _result_to_error(res)

    return nfrag


def get_multipole_count(efpobj):
    """Gets the number of multipoles in `efpobj` computation.

    Returns
    -------
    int
        Total number of multipoles from electrostatics calculation.

    """
    (res, nmult) = efpobj._efp_get_multipole_count()
    _result_to_error(res)

    return nmult


def get_multipole_coordinates(efpobj, verbose=1):
    """Gets the coordinates of `efpobj` electrostatics multipoles.

    Parameters
    ----------
    verbose : int, optional
        Whether to print out the multipole coordinates. 0: no printing. 1:
        print charges and dipoles. 2: additionally print quadrupoles
        and octupoles.

    Returns
    -------
    list
        ``3 n_mult`` (flat) array of multipole locations.

    Examples
    --------

    >>> # Use with NumPy
    >>> n_mult = efpobj.get_multipole_count()
    >>> xyz_mult = np.asarray(efpobj.get_multipole_coordinates()).reshape(n_mult, 3)

    """
    nmult = efpobj.get_multipole_count()
    (res, xyz) = efpobj._efp_get_multipole_coordinates(nmult)
    _result_to_error(res)

    if verbose >= 1:
        xyz3 = list(map(list, zip(*[iter(xyz)] * 3)))

        text = '\n  ==>  EFP Multipole Coordinates  <==\n\n'
        for mu in range(nmult):
            text += '{:6d}   {:14.8f} {:14.8f} {:14.8f}\n'.format(mu, *xyz3[mu])
        print(text)

    return xyz


def get_multipole_values(efpobj, verbose=1):
    """Gets the computed per-point multipoles of `efpobj`.

    Parameters
    ----------
    verbose : int, optional
        Whether to print out the multipole arrays. 0: no printing. 1:
        print charges and dipoles. ``2``: additionally print quadrupoles
        and octupoles.

    Returns
    -------
    list
        ``20 n_mult`` (flat) array of per-point multipole values including
        charges + dipoles + quadrupoles + octupoles.
        Dipoles stored as     x, y, z.
        Quadrupoles stored as xx, yy, zz, xy, xz, yz.
        Octupoles stored as   xxx, yyy, zzz, xxy, xxz, xyy, yyz, xzz, yzz, xyz.

    Examples
    --------
    >>> # Use with NumPy
    >>> n_mult = efpobj.get_multipole_count()
    >>> val_mult = np.asarray(efpobj.get_multipole_values()).reshape(n_mult, 20)

    """
    nmult = efpobj.get_multipole_count()
    (res, mult) = efpobj._efp_get_multipole_values(nmult)
    _result_to_error(res)

    if verbose >= 1:
        mult20 = list(map(list, zip(*[iter(mult)] * 20)))

        text = '\n  ==>  EFP Multipoles: Charge & Dipole  <==\n\n'
        for mu in range(nmult):
            text += '{:6d}   {:14.8f}   {:14.8f} {:14.8f} {:14.8f}\n'.format(mu, *mult20[mu][:4])

        if verbose >= 2:
            text += '\n  ==>  EFP Multipoles: Quadrupole  <==\n\n'
            for mu in range(nmult):
                text += '{:6d}   {:12.6f} {:12.6f} {:12.6f} {:12.6f} {:12.6f} {:12.6f}\n'.format(mu, *mult20[mu][4:10])
            text += '\n  ==>  EFP Multipoles: Octupole  <==\n\n'
            for mu in range(nmult):
                text += '{:6d}   {:12.6f} {:12.6f} {:12.6f} {:12.6f} {:12.6f} {:12.6f} {:12.6f} {:12.6f} {:12.6f} {:12.6f}\n'.format(
                    mu, *mult20[mu][10:])
        print(text)

    return mult


def get_induced_dipole_count(efpobj):
    """Gets the number of polarization induced dipoles in `efpobj` computation.

    Returns
    -------
    int
        Total number of polarization induced dipoles.

    """
    (res, ndip) = efpobj._efp_get_induced_dipole_count()
    _result_to_error(res)

    return ndip


def get_induced_dipole_coordinates(efpobj, verbose=1):
    """Gets the coordinates of `efpobj` induced dipoles.

    Parameters
    ----------
    verbose : int, optional
        Whether to print out the multipole arrays. 0: no printing. 1:
        print induced dipole coordinates.

    Returns
    -------
    list
        (3 * n_dip, ) (flat) array of induced dipole locations.

    """
    ndip = efpobj.get_induced_dipole_count()
    (res, xyz) = efpobj._efp_get_induced_dipole_coordinates(ndip)
    _result_to_error(res)

    if verbose >= 1:
        xyz3 = list(map(list, zip(*[iter(xyz)] * 3)))

        text = '\n  ==>  EFP Induced Dipole Coordinates  <==\n\n'
        for mu in range(ndip):
            text += '{:6d}   {:14.8f} {:14.8f} {:14.8f}\n'.format(mu, *xyz3[mu])
        print(text)

    return xyz


def get_induced_dipole_values(efpobj, verbose=1):
    """Gets the values of polarization induced dipoles of `efpobj`.

    Parameters
    ----------
    verbose : int, optional
        Whether to print out the induced dipole arrays. 0: no
        printing. 1: print induced dipole values.

    Returns
    -------
    list
        ``3*n_dip`` (flat) array of polarization induced dipole values.

    Examples
    --------
    >>> # Use with NumPy
    >>> n_dip = efpobj.get_induced_dipole_count()
    >>> val_dip = np.asarray(efpobj.get_induced_dipole_values()).reshape(n_dip, 3)

    """
    ndip = efpobj.get_induced_dipole_count()
    (res, vals) = efpobj._efp_get_induced_dipole_values(ndip)
    _result_to_error(res)

    if verbose >= 1:
        vals3 = list(map(list, zip(*[iter(vals)] * 3)))

        text = '\n  ==>  EFP Induced Dipoles  <==\n\n'
        for mu in range(ndip):
            text += '{:6d}   {:14.8f} {:14.8f} {:14.8f}\n'.format(mu, *vals3[mu])
        print(text)

    return vals


def get_induced_dipole_conj_values(efpobj, verbose=1):
    """Gets the values of polarization conjugated induced dipoles of `efpobj`.

    Parameters
    ----------
    verbose : int, optional
        Whether to print out the induced dipole conj arrays.
        0: no printing. 1: print induced dipole values.

    Returns
    -------
    list
        3 x n_dip (flat) array of conjugate induced dipole values.

    """
    ndip = efpobj.get_induced_dipole_count()
    (res, vals) = efpobj._efp_get_induced_dipole_conj_values(ndip)
    _result_to_error(res)

    if verbose >= 1:
        vals3 = list(map(list, zip(*[iter(vals)] * 3)))

        text = '\n  ==>  EFP Conj. Induced Dipoles  <==\n\n'
        for mu in range(ndip):
            text += '{:6d}   {:14.8f} {:14.8f} {:14.8f}\n'.format(mu, *vals3[mu])
        print(text)

    return vals


def get_point_charge_count(efpobj):
    """Gets the number of set point charges `efpobj`.

    Returns
    -------
    int
        Total number of set point charges.

    """
    (res, nptc) = efpobj._efp_get_point_charge_count()
    _result_to_error(res)

    return nptc


def get_point_charge_coordinates(efpobj, verbose=1):
    """Gets the coordinates of set point charges on `efpobj`.

    Parameters
    ----------
    verbose : int, optional
        Whether to print out the point charge arrays. 0: no printing.
        1: print point charge coordinates.

    Returns
    -------
    list
        3 x n_ptc (flat) array of point charge locations.

    """
    nptc = efpobj.get_point_charge_count()
    (res, xyz) = efpobj._efp_get_point_charge_coordinates(nptc)
    _result_to_error(res)

    if verbose >= 1:
        xyz3 = list(map(list, zip(*[iter(xyz)] * 3)))

        text = '\n  ==>  EFP Point Charge Coordinates  <==\n\n'
        for mu in range(nptc):
            text += '{:6d}   {:14.8f} {:14.8f} {:14.8f}\n'.format(mu, *xyz3[mu])
        print(text)

    return xyz


def get_point_charge_values(efpobj, verbose=1):
    """Gets the values of set point charges on `efpobj`.

    Parameters
    ----------
    verbose : int, optional
        Whether to print out the point charge arrays. 0: no
        printing. 1: print point charge values.

    Returns
    -------
    list
        ``n_ptc`` array of point charge values.

    Examples
    --------
    >>> # Use with NumPy
    >>> val_ptc = np.asarray(efpobj.get_point_charge_values())

    """
    nptc = efpobj.get_point_charge_count()
    (res, vals) = efpobj._efp_get_point_charge_values(nptc)
    _result_to_error(res)

    if verbose >= 1:
        text = '\n  ==>  EFP Point Charges  <==\n\n'
        for mu in range(nptc):
            text += '{:6d}   {:14.8f}\n'.format(mu, vals[mu])
        print(text)

    return vals


def get_wavefunction_dependent_energy(efpobj):
    """Updates wavefunction-dependent energy terms for SCF.

    Returns
    -------
    float
        Wavefunction-dependent EFP energy.

    """
    (res, wde) = efpobj._efp_get_wavefunction_dependent_energy()
    _result_to_error(res)

    return wde


def get_gradient(efpobj):
    """Gets the computed per-fragment EFP energy gradient of `efpobj`.

    Returns
    -------
    list
        ``6 x n_frag`` array of per-fragment negative force and torque.

    """
    nfrag = efpobj.get_frag_count()
    (res, grad) = efpobj._efp_get_gradient(nfrag)
    _result_to_error(res)

    return grad

# SKP

def get_pairwise_energy(efpobj):
    """Gets the per-fragment pairwise energy breakdowns.

    Returns
    -------
    list of dict
        A list of `n_frag` dictionaries, each containing energy components:
        'electrostatic', 'exchange_repulsion', 'polarization',
        'dispersion', and 'total'.
    """
    nfrag = efpobj.get_frag_count()
    energies = efpobj._efp_get_pairwise_energy(nfrag)
    return energies

#SKP

#def set_pairwise_energy(efpobj, pair_energies):
#    """Sets pairwise energy values per fragment.
#
#    Parameters
#    ----------
#    pair_energies : list of dict
#        A list of dicts with energy components for each fragment, where each dict includes:
#        'electrostatic', 'exchange_repulsion', 'polarization', 'dispersion', and 'total'.
#
#    Returns
#    -------
#    None
#    """
#    nfrag = efpobj.get_frag_count()
#    if len(pair_energies) != nfrag:
#        raise PyEFPSyntaxError(f"Expected {nfrag} energy entries, got {len(pair_energies)}")
#
#    res = efpobj._efp_set_pairwise_energy(nfrag, pair_energies)
#    _result_to_error(res)

def gradient_summary(efpobj):
    """Gets the computed per-fragment EFP energy gradient of `efpobj`.

    Returns
    -------
    str
        Formatted text of the `6 x n_frag` gradient and torque.

    """
    grad = efpobj.get_gradient()
    grad6 = list(map(list, zip(*[iter(grad)] * 6)))

    text = '\n  ==>  EFP Gradient & Torque  <==\n\n'
    for fr in grad6:
        text += '{:14.8f} {:14.8f} {:14.8f}   {:14.8f} {:14.8f} {:14.8f}\n'.format(*fr)

    text += '\n'
    return text


def energy_summary(efpobj, label='libefp', scfefp=None):
    """Forms summary of EFP and SCFEFP energy components from `efpobj`.

    Parameters
    ----------
    label : {'libefp', 'psi'}, optional
        Text labels use libefp terms names unless custom renaming
        requested via `label`.
    scfefp : float, optional
        Total SCF energy (Hartrees) including EFP wavefunction dependent
        and wavefunction independent terms. Used for add'l printing.

    Returns
    -------
    str
        Summary suitable for printing indicating energy components
        (electrostatics, exchange, induction, dispersion, total), whether
        each are enabled in options, and breakdown into pure-EFP and
        QM-EFP, where available. If scfefp, includes a section on SCF
        iterated and SCF total.

    """
    opt = efpobj.get_opts()
    ene = efpobj.get_energy()

    def _enabled(tf, t='*', f='', suffix=''):
        if tf:
            return t + suffix
        else:
            return f

    elec = 'Electrostatics'
    disp = 'Dispersion'
    if label == 'libefp':
        xr = 'Exchange-Repulsion'
        indc = 'Polarization'
    elif label == 'psi':
        xr = 'Exchange'
        indc = 'Induction'

    # yapf: disable
    text = '\n'
    text += '\n    EFP Results\n'
    text +=   '  ------------------------------------------------------------\n'
    text +=   '    {:<30}{:20.12f} [Eh] {}\n'.format(elec, ene['electrostatic'] +
                                                           ene['charge_penetration'] +
                                                           ene['electrostatic_point_charges'],
                                                     _enabled(opt['elec'] or opt['ai_elec'],
                                                        suffix=(' (' + opt['elec_damp'] + ' damping)')))
    text += '      {:<28}{:20.12f} [Eh] {}\n'.format('EFP/EFP', ene['electrostatic'] +
                                                                ene['charge_penetration'],
                                                     _enabled(opt['elec']))
    text += '      {:<28}{:20.12f} [Eh] {}\n'.format('QM-Nuc/EFP',
                                                     ene['electrostatic_point_charges'],
                                                     _enabled(opt['ai_elec']))
    text += '\n    {:<30}{:20.12f} [Eh] {}\n'.format(xr, ene['exchange_repulsion'],
                                                     _enabled(opt['xr']))
    text += '      {:<28}{:20.12f} [Eh] {}\n'.format('EFP/EFP', ene['exchange_repulsion'],
                                                     _enabled(opt['xr']))
    text += '      {:<28}{:20.12f} [Eh] {}\n'.format('QM/EFP', 0.0, '')
    text += '\n    {:<30}{:20.12f} [Eh] {}\n'.format(indc, ene['polarization'],
                                                     _enabled(opt['pol'] or opt['ai_pol'],
                                                        suffix=(' (' + opt['pol_damp'] + ' damping)')))
    text += '      {:<28}{:20.12f} [Eh] {}\n'.format(_enabled(opt['ai_pol'], t='QM/EFP', f='EFP/EFP'),
                                                     ene['polarization'],
                                                     _enabled(opt['pol'] or opt['ai_pol']))
    text += '\n    {:<30}{:20.12f} [Eh] {}\n'.format(disp, ene['dispersion'],
                                                     _enabled(opt['disp'],
                                                        suffix=(' (' + opt['disp_damp'] + ' damping)')))
    text += '      {:<28}{:20.12f} [Eh] {}\n'.format('EFP/EFP', ene['dispersion'],
                                                     _enabled(opt['disp']))
    text += '      {:<28}{:20.12f} [Eh] {}\n'.format('QM/EFP', 0.0, '')
    text += '\n    {:<30}{:20.12f} [Eh]\n'.format('Total EFP', ene['total'])
    # yapf: enable
    if scfefp is not None:
        wie = ene['total'] - ene['pol']
        text += '    EFP excluding EFP {:<12}{:20.12f} [Eh]\n'.format(indc, wie)
        text += '    SCF including EFP {:<12}{:20.12f} [Eh]\n'.format(indc, scfefp - wie)
        text += '    Total SCF including Total EFP {:20.12f} [Eh]\n'.format(scfefp)

    text += '\n'
    return text


def geometry_summary(efpobj, units_to_bohr=1.0):
    """Formatted geometry and fragments for `efpobj`.

    Parameters
    ----------
    units_to_bohr : float,optional
        Conversion factor for printing; for Angstroms, approx. 0.529177.

    Returns
    -------
    str
        Summary of EFP geometry & point charges (QM atoms) suitable for printing.

    """
    text = ''
    text += '\n  ==>  EFP Geometry  <==\n\n'
    text += '    Geometry (in {} * {:12.8f}):\n\n'.format('Bohr', units_to_bohr)
    text += '       Center              X                  Y                   Z             QM/EFP\n'
    text += '    ------------   -----------------  -----------------  -----------------   ------------\n'

    mol_info = efpobj.get_atoms()
    terminal_frag = [fr[0] for fr in mol_info['fragments'][1:]]
    frag_names = efpobj.get_frag_name()

    ifr = 0
    for iat, at in enumerate(mol_info['full_atoms']):
        if iat in terminal_frag:
            text += '    --\n'
            ifr += 1
        text += '    {:8}{:4}   {:17.12f}  {:17.12f}  {:17.12f}   {}\n'.format(at['symbol'], '',
                                                                               at['x'] * units_to_bohr,
                                                                               at['y'] * units_to_bohr,
                                                                               at['z'] * units_to_bohr,
                                                                               frag_names[ifr].lower())

    # TODO move into dict?
    ptc_info = {
        'n': efpobj.get_point_charge_count(),
        'xyz': efpobj.get_point_charge_coordinates(verbose=0),
        'val': efpobj.get_point_charge_values(verbose=0)
    }

    if ptc_info['n'] > 0:
        mult3 = list(map(list, zip(*[iter(ptc_info['xyz'])] * 3)))
        text += '    ------------\n'
        for ptc in range(ptc_info['n']):
            text += '    {:8}{:4}   {:17.12f}  {:17.12f}  {:17.12f}   {}\n'.format(ptc_info['val'][ptc], '',
                                                                                   mult3[ptc][0] * units_to_bohr,
                                                                                   mult3[ptc][1] * units_to_bohr,
                                                                                   mult3[ptc][2] * units_to_bohr,
                                                                                   'point_charge')

    text += '\n'
    return text


def nuclear_repulsion_energy(efpobj, use_efp_frags=True, use_point_charges=False):
    """Computes nuclear repulsion energy for `efpobj`.

    Parameters
    ----------
    use_efp_frags : bool, optional
        If True (default), compute NRE using the efp fragment subsystem.
    use_point_charges : bool, optional
        If True (not default), include point charges (generally QM atoms)
        in NRE computation.

    Returns
    -------
    float
        Nuclear repulsion energy [E_h] for specified geometry subsystem

    """
    nre = 0.0
    loc = []

    if use_efp_frags:
        loc.extend(efpobj.get_atoms()['full_atoms'])
    if use_point_charges:
        ptc_xyz = efpobj.get_point_charge_coordinates(verbose=0)
        ptc_val = efpobj.get_point_charge_values(verbose=0)
        for ptc in range(efpobj.get_point_charge_count()):
            loc.append({
                'Z': ptc_val[ptc],
                'x': ptc_xyz[ptc * 3],
                'y': ptc_xyz[ptc * 3 + 1],
                'z': ptc_xyz[ptc * 3 + 2]
            })

    for iat1, at1 in enumerate(loc):
        for iat2, at2 in enumerate(loc):
            if iat2 < iat1:
                ZZ = at1['Z'] * at2['Z']
                dx = at1['x'] - at2['x']
                dy = at1['y'] - at2['y']
                dz = at1['z'] - at2['z']
                dist = math.sqrt(dx * dx + dy * dy + dz * dz)
                nre += ZZ / dist

    return nre


#def _frag_idx_validation(efpobj, ifr):
#    nfr = efpobj.get_frag_count()
#    if (ifr < 0) or (ifr >= nfr):
#        raise PyEFPSyntaxError('Invalid fragment index for 0-indexed {}-fragment EFP: {}'.format(nfr, ifr))


def set_frag_coordinates(efpobj, ifr, ctype, coord):
    """Set fragment orientation on `efpobj` from hint.

    Parameters
    ----------
    ifr : int
        Index of fragment (0-indexed).
    ctype : core.efp_coord_type or str {'xyzabc', 'points', 'rotmat'}
        Type of coodinates hint among ``xyzabc``, `points`, & `rotmat`.
    coord : list of floats
        6-, 9-, or 12-element hint of coordinates.

    Returns
    -------
    None

    """
    if isinstance(ctype, str):
        try:
            ctype = {
                'xyzabc': core.EFP_COORD_TYPE_XYZABC,
                'points': core.EFP_COORD_TYPE_POINTS,
                'rotmat': core.EFP_COORD_TYPE_ROTMAT,
                'atoms': core.EFP_COORD_TYPE_ATOMS,
            }[ctype.lower()]
        except KeyError:
            _result_to_error(core.efp_result.EFP_RESULT_SYNTAX_ERROR,
                             'invalid value for [xyzabc/points/rotmat/atoms] {}: {}'.format('ctype', ctype))

    efpobj.input_units_to_au = 1.0
    res = efpobj._efp_set_frag_coordinates(ifr, ctype, coord)
    _result_to_error(res)


def set_point_charge_coordinates(efpobj, xyz):
    """Reset arbitrary point charge locations (often QM atoms)
    interacting with the EFP subsystem. Must have been initially set
    with set_point_charges.

    Parameters
    ----------
    xyz : list
        ``3 * n_ptc`` array of XYZ coordinates of charge positions,
        generally QM coordinates.

    Returns
    -------
    None

    """
    n_ptc = efpobj.get_point_charge_count()
    if n_ptc == 0:
        raise PyEFPSyntaxError('Must initialize point charges with set_point_charges')
    if len(xyz) != (3 * n_ptc):
        raise PyEFPSyntaxError('Invalid point charge length: {}'.format(xyz))

    res = efpobj._efp_set_point_charge_coordinates(len(xyz), xyz)
    _result_to_error(res)


def set_point_charge_values(efpobj, ptc):
    """Reset arbitrary point charge values (often QM atoms)
    interacting with the EFP subsystem. Must have been initially set
    with set_point_charges.

    Parameters
    ----------
    ptc : list of float
        array of charge values, generally QM nuclear charges.

    Returns
    -------
    None

    """
    n_ptc = efpobj.get_point_charge_count()
    if n_ptc == 0:
        raise PyEFPSyntaxError('Must initialize point charges with set_point_charges')
    if len(ptc) != n_ptc:
        raise PyEFPSyntaxError('Invalid point charge length: {}'.format(ptc))

    res = efpobj._efp_set_point_charge_values(len(ptc), ptc)
    _result_to_error(res)


def set_point_charges(efpobj, ptc, coord):
    """Sets arbitrary point charges (often QM atoms) interacting with the
    EFP subsystem.

    Parameters
    ----------
    ptc : list
        (n_ptc, ) array of charge values, generally QM Z.
    coord : list
        (3 * n_ptc, ) or (n_ptc, 3) array (that is, flat or nested)
        of XYZ coordinates [a0] of charge positions, generally QM coordinates.

    Returns
    -------
    None

    """
    if len(ptc) == len(coord):
        coord = sum(coord, [])

    if (len(ptc) * 3) != len(coord):
        raise PyEFPSyntaxError('Invalid point charges setting: {}'.format(coord))

    res = efpobj._efp_set_point_charges(len(ptc), ptc, coord)
    _result_to_error(res)


def get_frag_name(efpobj, ifr=None):
    """Gets system name on fragment(s) of `efpobj`.

    Parameters
    ----------
    ifr : int, optional
        Index of fragment (0-indexed) if not all.

    Returns
    -------
    str, list of str
        If `ifr`, name of fragment `ifr`. Otherwise, names of all
        fragments in list.

    """
    return _get_frag_common(efpobj=efpobj, ifr=ifr, topic='name')


def _get_frag_common(efpobj, ifr, topic):
    nfr = efpobj.get_frag_count()

    fn_mapper = {
        'name': efpobj._efp_get_frag_name,
        'charge': efpobj._efp_get_frag_charge,
        'xyzabc': efpobj._efp_get_frag_xyzabc,
        'atom_count': efpobj._efp_get_frag_atom_count,
        'multiplicity': efpobj._efp_get_frag_multiplicity,
    }

    if ifr is None:
        frags = []
        for fr in range(nfr):
            (res, ftopic) = fn_mapper[topic](fr)
            _result_to_error(res)
            frags.append(ftopic)

        return frags

    else:
        if ifr in range(nfr):
            (res, ftopic) = fn_mapper[topic](ifr)
            _result_to_error(res)

            return ftopic
        else:
            raise PyEFPSyntaxError('Invalid fragment index for 0-indexed {}-fragment EFP: {}'.format(nfr, ifr))


def get_frag_charge(efpobj, ifr=None, zero=1e-8):
    """Gets total charge on fragment(s) of `efpobj`.

    Parameters
    ----------
    ifr : int, optional
        Index of fragment (0-indexed) if not all.
    zero : float, optional
        Absolute value under which to zero charge.

    Returns
    -------
    str, list of str
        If `ifr`, charge of fragment `ifr`. Otherwise, charges of all
        fragments in list.

    """
    chg = _get_frag_common(efpobj=efpobj, ifr=ifr, topic='charge')
    if ifr is None:
        return [(0.0 if math.fabs(c) < zero else c) for c in chg]
    else:
        if math.fabs(chg) < zero:
            return 0.0
        else:
            return chg


def get_frag_multiplicity(efpobj, ifr=None):
    """Gets spin multiplicity on fragment(s) of `efpobj`.

    Parameters
    ----------
    ifr : int, optional
        Index of fragment (0-indexed) if not all.

    Returns
    -------
    str, list of str
        If `ifr`, multiplicity of fragment `ifr`. Otherwise, multiplicity
        of all fragments in list.

    """
    return _get_frag_common(efpobj=efpobj, ifr=ifr, topic='multiplicity')


def get_frag_atom_count(efpobj, ifr=None):
    """Gets atom count on fragment(s) of `efpobj`.

    Parameters
    ----------
    ifr : int, optional
        Index of fragment (0-indexed) if not all.

    Returns
    -------
    str, list of str
        If `ifr`, atom count of fragment `ifr`. Otherwise, atom counts
        of all fragments in list.

    """
    return _get_frag_common(efpobj=efpobj, ifr=ifr, topic='atom_count')


def get_frag_atoms(efpobj, ifr):
    """Gets geometry information for atoms modeled by fragment in `efpobj`.

    Parameters
    ----------
    ifr : int
        Index of fragment (0-indexed).

    Returns
    -------
    list of dict
        Each atom in fragment `ifr` has position, charge, and element
        fields below in a dictionary at list index `ifr`
        ``Z`` (*float*)        nuclear charge.
        ``label`` (*str*)      atom label from EFP file, e.g., A02H2.
        ``x`` (*float*)        X coordinate of atom position.
        ``y`` (*float*)        Y coordinate of atom position.
        ``z`` (*float*)        Z coordinate of atom position.
        ``mass`` (*float*)     atom mass [amu]
        ``symbol`` (*str*)     atomic symbol extracted from label.

    """
    nfr = efpobj.get_frag_count()
    nat = efpobj.get_frag_atom_count(ifr)

    if ifr in range(nfr):
        (res, atoms) = efpobj._efp_get_frag_atoms(ifr, nat)
        _result_to_error(res)

        for at in atoms:
            mobj = re.match(r'\AA\d*(?P<symbol>[A-Z]{1,3})\d*\Z', at['label'])
            if mobj:
                at['symbol'] = mobj.group('symbol').capitalize()
        return atoms
    else:
        raise PyEFPSyntaxError('Invalid fragment index for 0-indexed {}-fragment EFP: {}'.format(nfr, ifr))


def get_atoms(efpobj):
    #enum efp_result res;
    #size_t frag_natom, natom=0;
    #double frag_chg;
    #int frag_mult;
    #py::list fr, frt, frcg, frmp, full_atoms;

    natom = 0
    frag_count = efpobj.get_frag_count()
    frag_natom = efpobj.get_frag_atom_count()
    fr = []
    full_atoms = []
    for ifr in range(frag_count):
        frat = frag_natom[ifr]

        fr.append([natom, natom + frat])
        natom += frat

        pyat = efpobj.get_frag_atoms(ifr)
        full_atoms.extend(pyat)

    mol_info = {}
    # mol_info["units"] = "Bohr"
    mol_info["input_units_to_au"] = 1.0
    mol_info["fix_com"] = True
    mol_info["fix_orientation"] = True
    mol_info["fix_symmetry"] = "c1"

    mol_info['fragments'] = fr
    mol_info['fragment_types'] = ['Real'] * frag_count
    mol_info['fragment_charges'] = efpobj.get_frag_charge()
    mol_info['fragment_multiplicities'] = efpobj.get_frag_multiplicity()
    mol_info['full_atoms'] = full_atoms

    return mol_info


def to_viz_dict(efpobj):

    pyat = efpobj.get_atoms()
    for at in pyat['full_atoms']:
        at['ghosted'] = False
        at['at_type'] = 'efpxyz'
        mobj = re.match(r'\AA\d*(?P<symbol>[A-Z]{1,3})\d*\Z', at['label'])
        if mobj:
            at['symbol'] = mobj.group('symbol').capitalize()
        at['charge'] = at['Z']
        #pyat['molecule']['fragment_charges'].append(efpobj.get_frag_charges(fr)
        #pyat['molecule']['fragment_multiplicities'].append(efpobj.get_frag_multiplicity(fr)

    return pyat


def get_frag_xyzabc(efpobj, ifr=None):
    """Get the XYZABC coordinates hint on fragment(s) from `efpobj`.

    Parameters
    ----------
    ifr : int, optional
        Index of fragment (0-indexed) if not all.

    Returns
    -------
    list, list of list
        If `ifr`, hint for fragment `ifr`. Otherwise, hints of all
        fragments in list. Note that fragments inputted through POINTS
        will still be returned as XYZABC. Also, fragments inputted
        through XYZABC will have the angles standardized to (-pi, pi].

    """
    return _get_frag_common(efpobj=efpobj, ifr=ifr, topic='xyzabc')


def to_dict(efpobj, dtype='psi4'):
    molrec = {}

    nfr = efpobj.get_frag_count()
    fnat = efpobj.get_frag_atom_count()
    frs = functools.reduce(lambda c, x: c + [c[-1] + x], fnat,
                           [0])[1:]  # np.cumsum(fnat)  https://stackoverflow.com/a/33034961
    nat = frs[-1]

    molrec['units'] = 'Bohr'
    molrec['fix_com'] = True
    molrec['fix_orientation'] = True

    atommajor = efpobj.get_atoms()['full_atoms']
    geom = []
    for at in atommajor:
        xyz = [at['x'], at['y'], at['z']]
        geom.extend(xyz)
    molrec['geom'] = geom
    molrec['elea'] = [-1] * nat
    molrec['elez'] = [int(at['Z']) for at in atommajor]
    molrec['elem'] = [at['symbol'] for at in atommajor]
    molrec['mass'] = [at['mass'] for at in atommajor]
    molrec['real'] = [True] * nat
    molrec['elbl'] = ['_' + at['label'].lower() for at in atommajor]

    molrec['fragment_separators'] = frs[:-1]
    molrec['fragment_charges'] = efpobj.get_frag_charge()
    molrec['fragment_multiplicities'] = efpobj.get_frag_multiplicity()

    def _high_spin_sum(mult_list):
        mm = 1
        for m in mult_list:
            mm += m - 1
        return mm

    molrec['molecular_charge'] = sum(molrec['fragment_charges'])
    molrec['molecular_multiplicity'] = _high_spin_sum(molrec['fragment_multiplicities'])
    molrec['provenance'] = provenance_stamp(__name__ + '.' + sys._getframe().f_code.co_name)

    molrec['fragment_files'] = [fl.lower() for fl in efpobj.get_frag_name()]
    molrec['hint_types'] = ['xyzabc'] * nfr
    molrec['geom_hints'] = efpobj.get_frag_xyzabc()

    return qcel.molparse.to_schema(molrec, dtype=dtype)


def old_to_dict(efpobj):
    pysys = {}
    pysys['full_fragments'] = []

    for fr in range(efpobj.get_frag_count()):
        pysys['full_fragments'].append({
            'coordinates_hint': efpobj.get_frag_xyzabc(fr),
            'efp_type': 'xyzabc',
            'fragment_file': efpobj.get_frag_name(fr).lower(),
        })

    #pysys['molecule'] = {
    #    'fix_com': True,
    #    'fix_orientation': True,
    #    'fix_symmetry': 'c1',
    #    'fragment_charges': [],
    #    'fragment_multiplicities': [],
    #    'fragment_types': [],
    #    'fragments': [],
    #    'full_atoms': [],
    #    #'input_units_to_au': 1.8897261328856432,
    #    'name': 'default',
    #    'input_units_to_au': 1.0}
    #    #'units': 'Bohr'}
    pysys['molecule'] = {'input_units_to_au': efpobj.input_units_to_au}

    return pysys


# only wrapped to throw Py exceptions
core.efp.prepare = prepare
core.efp.compute = compute

core.efp.add_potential = add_potential
core.efp.add_fragment = add_fragment
#core.efp.add_ligand = add_ligand
core.efp.get_opts = get_opts
core.efp.set_opts = set_opts
core.efp.get_frag_count = get_frag_count
core.efp.get_energy = get_energy
core.efp.get_gradient = get_gradient
core.efp.get_pairwise_energy = get_pairwise_energy
#core.efp.set_pairwise_energy = set_pairwise_energy
core.efp.print_pairwise_energies = print_pairwise_energies
core.efp.energy_summary = energy_summary
core.efp.nuclear_repulsion_energy = nuclear_repulsion_energy
core.efp.to_viz_dict = to_viz_dict
core.efp.to_dict = to_dict
core.efp.get_frag_name = get_frag_name
core.efp.get_frag_charge = get_frag_charge
core.efp.get_frag_multiplicity = get_frag_multiplicity
core.efp.set_frag_coordinates = set_frag_coordinates
core.efp.set_point_charges = set_point_charges
core.efp.set_point_charge_coordinates = set_point_charge_coordinates
core.efp.set_point_charge_values = set_point_charge_values
core.efp.get_point_charge_count = get_point_charge_count
core.efp.get_point_charge_coordinates = get_point_charge_coordinates
core.efp.get_point_charge_values = get_point_charge_values
core.efp.get_multipole_count = get_multipole_count
core.efp.get_multipole_coordinates = get_multipole_coordinates
core.efp.get_multipole_values = get_multipole_values
core.efp.get_induced_dipole_count = get_induced_dipole_count
core.efp.get_induced_dipole_coordinates = get_induced_dipole_coordinates
core.efp.get_induced_dipole_values = get_induced_dipole_values
core.efp.get_induced_dipole_conj_values = get_induced_dipole_conj_values
core.efp.get_frag_atom_count = get_frag_atom_count
core.efp.get_wavefunction_dependent_energy = get_wavefunction_dependent_energy
core.efp.set_periodic_box = set_periodic_box
core.efp.get_periodic_box = get_periodic_box
core.efp.get_frag_xyzabc = get_frag_xyzabc

core.efp.get_frag_atoms = get_frag_atoms
core.efp.get_atoms = get_atoms
core.efp.geometry_summary = geometry_summary
core.efp.gradient_summary = gradient_summary


def process_units(molrec):
    """From any (not both None) combination of `units` and
    `input_units_to_au`, returns both quantities validated. The degree
    of checking is unnecessary if coming from a molrec (prevalidated and
    guaranteed to have "units"), but function is general-purpose.

    """
    units = molrec.get('units', None)
    input_units_to_au = molrec.get('input_units_to_au', None)

    b2a = qcel.constants.bohr2angstroms
    a2b = 1. / b2a

    def perturb_check(candidate, reference):
        return (abs(candidate, reference) < 0.05)

    if units is None and input_units_to_au is not None:
        if perturb_check(input_units_to_au, 1.):
            funits = 'Bohr'
            fiutau = input_units_to_au
        elif perturb_check(input_units_to_au, a2b):
            funits = 'Angstrom'
            fiutau = input_units_to_au
        else:
            raise PyEFPSyntaxError("""No big perturbations to physical constants! {} !~= ({} or {})""".format(
                input_units_to_au, 1.0, a2b))

    elif units in ['Angstrom', 'Bohr'] and input_units_to_au is None:
        funits = units

        if funits == 'Bohr':
            fiutau = 1.
        elif funits == 'Angstrom':
            fiutau = a2b

    elif units in ['Angstrom', 'Bohr'] and input_units_to_au is not None:
        expected_iutau = a2b if units == 'Angstrom' else 1.

        if perturn_check(input_units_to_au, expected_iutau):
            funits = units
            fiutau = input_units_to_au
        else:
            raise PyEFPSyntaxError("""No big perturbations to physical constants! {} !~= {}""".format(
                input_units_to_au, expected_iutau))

    else:
        raise PyEFPSyntaxError('Insufficient information: {} & {}'.format(units, input_units_to_au))

    return funits, fiutau


def from_dict(efp_init):
    """Instantiate an EFP object from `efp_init`.

    Parameters
    ----------
    efp_init : nested dict
        Dictionary of prescribed format to specify EFP fragments (no QM hints).

    Returns
    -------
    :py:class:`pylibefp.core.efp`
        New EFP instance with fragments defined and finished off through
        :py:func:`pylibefp.core.efp.prepare`.

    """
    efpobj = core.efp()

    units, input_units_to_au = process_units(efp_init)

    def hint_to_au(hint, htype, iutau):
        if htype == 'xyzabc':
            return [(h * iutau if idx < 3 else h) for idx, h in enumerate(hint)]
        elif htype == 'points':
            return [h * iutau for h in hint]
        elif htype == 'atoms':
            return [(h * iutau if idx % 4 != 0 else h) for idx, h in enumerate(hint)]

    for ifr, (fl, ht, gh) in enumerate(zip(efp_init['fragment_files'], efp_init['hint_types'],
                                           efp_init['geom_hints'])):
        efpobj.add_potential(fl, duplicates_ok=True)
        efpobj.add_fragment(fl)
        hint = hint_to_au(gh, ht, input_units_to_au)
        efpobj.set_frag_coordinates(ifr, ht, hint)

    #efpobj.input_units_to_au = efp_init['input_units_to_au']
    efpobj.input_units_to_au = input_units_to_au
    efpobj.prepare()
    return efpobj


def provenance_stamp(routine: str) -> Dict[str, str]:
    """Return dictionary satisfying QCSchema,
    https://github.com/MolSSI/QCSchema/blob/master/qcschema/dev/definitions.py#L23-L41
    with PylibEFP's credentials for creator and version. The
    generating routine's name is passed in through `routine`.

    """
    from pylibefp import __version__
    return {'creator': 'PylibEFP', 'version': __version__, 'routine': routine}
