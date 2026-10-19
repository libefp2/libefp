#!/usr/bin/env python3
"""
Generate the fragment files of the parser regression tests (parse_labels_*.in) from fraglib/pentacene.efp.

pentacene_2x.efp     one fragment made of two pentacene molecules: the original one and a copy shifted by
                     +400 bohr along z. The polarizable and dynamic polarizable points of the far copy are
                     listed first, so the points of the original molecule get the labels CT52 ... CT102
                     (labels with three digits are five characters long). Exchange-repulsion data are dropped.
                     With 'coord points' on its first three atoms, the original molecule is placed exactly as
                     a pentacene_l fragment; the far copy contributes nothing measurable, so elec/pol/disp
                     energies must equal those of the same system with pentacene_l.
pentacene_shift.efp  pentacene with its internal frame shifted by -500 bohr along x, written with the GAMESS
                     formats: every x is a negative number that fills its F15.10 field and runs into the label
                     ("CT1-495.2951596447"), and full 8-character labels run into the coordinates
                     ("A01CXXXX-493.1287504085"). The energies must equal those with pentacene_l.
pentacene_3x.efp     one fragment made of three pentacene molecules (the original one and copies at -15 and +15 bohr
                     along z, 108 atoms, center of mass at the origin) with GAMESS bond mid-point labels BO<i><j>
                     renumbered for the copies, e.g. BO10074 (atoms 100 and 74). Used with 'coord atoms', where
                     bond mid-points are recomputed from the atom positions; the energy must equal the one with
                     'coord points' (rigid placement). Exchange-repulsion data are dropped.
h2o_shuffled.efp     water with the points of the MONOPOLES, DIPOLES, QUADRUPOLES, OCTUPOLES and SCREEN sections
                     listed in reverse order: the parser matches them to the COORDINATES points by label (through
                     a hash index since the linear search was too slow for large fragments). The energy must
                     equal the one with h2o_l.
h2o_dipquad.efp      water with an additional DIPOLE-QUADRUPOLE DYNAMIC POLARIZABLE POINTS section placed
                     before the DYNAMIC POLARIZABLE POINTS section (the parser used to write these points at
                     index n_dynamic_polarizable_pts - 1, i.e. out of bounds when no dynamic points were read
                     yet). The section is not used for energies, so energies must equal those with h2o_l.

Usage (from the tests directory):  python3 tools/make_parse_test_fragments.py ../fraglib
"""

import os
import re
import sys

COORD_SECTIONS = ('COORDINATES', 'POLARIZABLE POINTS', 'DYNAMIC POLARIZABLE POINTS', 'PROJECTION BASIS SET',
                  'LMO CENTROIDS')


def read_sections(path):
    """header lines, list of (title line, body lines) up to ' $END'"""
    lines = open(path).read().split('\n')
    head, sections, cur = [], [], None
    for l in lines:
        s = l.strip()
        if s.upper() == '$END':
            break
        is_title = (re.match(r'^[A-Z][A-Z -]+[A-Z]', s) and not re.match(r'^(A\d|B[OF]\d|CT|STOP)', s)
                    and not re.match(r'^[SLPDF]\s+\d', s))
        if cur is None and not s.startswith('COORDINATES'):
            head.append(l)
            continue
        if is_title and (cur is None or cur[0].strip() != 'PROJECTION BASIS SET' or s.startswith(
                ('MULTIPLICITY', 'PROJECTION WAVEFUNCTION'))):
            cur = (l, [])
            sections.append(cur)
            continue
        cur[1].append(l)
    return head, sections


def title(sec):
    return sec[0].strip()


def ct(i, xyz, w=None, dynamic=False):
    if dynamic:
        s = 'CT%3d' % i + ''.join('%15.10f' % v for v in xyz)
        return s + (' -- FOR W=%9.6fI A.U.' % w if w is not None else '')
    fmt = 'CT%1d' if i < 10 else 'CT%2d' if i < 100 else 'CT%3d'
    return fmt % i + ''.join('%15.10f' % v for v in xyz)


def parse_pts(body):
    """polarizable points: list of (xyz, tensor lines, freq or None)"""
    pts, i = [], 0
    while i < len(body):
        l = body[i]
        if l.startswith('CT'):
            m = re.match(r'CT\s*\d+\s+(\S+)\s+(\S+)\s+(\S+)(.*FOR W=\s*(\S+)I)?', l)
            xyz = [float(m.group(k)) for k in (1, 2, 3)]
            w = float(m.group(5)) if m.group(5) else None
            tensor = []
            i += 1
            while i < len(body) and not body[i].startswith('CT') and body[i].strip() != 'STOP':
                tensor.append(body[i]); i += 1
            pts.append((xyz, tensor, w))
            continue
        i += 1
    return pts


def write_pts(pts, dynamic):
    out = []
    per_w = len(pts) // 12 if dynamic else len(pts)
    for k, (xyz, tensor, w) in enumerate(pts):
        idx = k % per_w + 1
        out.append(ct(idx, xyz, w if dynamic and idx == 1 else None, dynamic))
        out += tensor
    return out


def shift_xyz(xyz, d):
    return [a + b for a, b in zip(xyz, d)]


def coord_line(label, xyz, rest):
    return '%-8s' % label + ''.join('%15.10f' % v for v in xyz) + rest


def records(rows):
    """group the lines of a labelled section into records (label line + continuation lines)"""
    recs = []
    for l in rows:
        if l.strip()[0].isalpha():
            recs.append([l])
        else:
            recs[-1].append(l)
    return recs


def pentacene_2x(src, dst):
    head, secs = read_sections(src)
    d = (0.0, 0.0, 400.0)
    out = head[:]
    out[[k for k, l in enumerate(out) if l.strip().startswith('$')][0]] = ' $pentacene_2x'
    keep = ('COORDINATES', 'MONOPOLES', 'DIPOLES', 'QUADRUPOLES', 'OCTUPOLES', 'POLARIZABLE POINTS',
            'DYNAMIC POLARIZABLE POINTS', 'SCREEN2')
    atoms = 0
    for t, body in secs:
        name = t.strip()
        if not name.startswith(keep):
            continue
        rows = [l for l in body if l.strip() and l.strip() != 'STOP']
        if name.startswith(('POLARIZABLE POINTS', 'DYNAMIC POLARIZABLE POINTS')):
            dyn = name.startswith('DYNAMIC')
            pts = parse_pts(body)
            far = [(shift_xyz(x, d), t_, w) for x, t_, w in pts]
            if dyn:
                n = len(pts) // 12
                merged = []
                for f in range(12):
                    merged += far[f * n:(f + 1) * n] + pts[f * n:(f + 1) * n]
            else:
                merged = far + pts
            out += [t] + write_pts(merged, dyn) + ['STOP']
            continue
        recs = records(rows)
        if name.startswith('COORDINATES'):
            atoms = sum(1 for r in recs if r[0].startswith('A'))

        def rename(lab):
            m = re.match(r'A(\d+)(\D.*)?$', lab)
            if m:
                return 'A%02d%s' % (int(m.group(1)) + atoms, m.group(2) or '')
            return 'BF' + lab[2:] if lab.startswith('BO') else lab

        def far_rec(r):
            p = r[0].split()
            if name.startswith('COORDINATES'):
                xyz = shift_xyz([float(v) for v in p[1:4]], d)
                return [coord_line(rename(p[0]), xyz, '%12.7f%5.1f' % (float(p[4]), float(p[5])))]
            return [r[0].replace(p[0], rename(p[0]), 1)] + r[1:]
        is_atom = lambda r: r[0].strip().startswith('A')
        order = ([r for r in recs if is_atom(r)] + [far_rec(r) for r in recs if is_atom(r)] +
                 [r for r in recs if not is_atom(r)] + [far_rec(r) for r in recs if not is_atom(r)])
        out += [t] + [l for r in order for l in r] + ['STOP']
    out += [' $END', '']
    open(dst, 'w').write('\n'.join(out))


def pentacene_3x(src, dst):
    head, secs = read_sections(src)
    shifts = [(0.0, 0.0, 0.0), (0.0, 0.0, -15.0), (0.0, 0.0, 15.0)]
    out = head[:]
    out[[k for k, l in enumerate(out) if l.strip().startswith('$')][0]] = ' $pentacene_3x'
    keep = ('COORDINATES', 'MONOPOLES', 'DIPOLES', 'QUADRUPOLES', 'OCTUPOLES', 'POLARIZABLE POINTS',
            'DYNAMIC POLARIZABLE POINTS', 'SCREEN2')
    coords = records([l for l in next(b for t, b in secs if t.strip().startswith('COORDINATES'))
                      if l.strip() and l.strip() != 'STOP'])
    atoms = [[float(v) for v in r[0].split()[1:4]] for r in coords if r[0].startswith('A')]
    natom = len(atoms)
    # bond mid-point label -> (i, j), found from the coordinates
    pair = {}
    for r in coords:
        p = r[0].split()
        if not p[0].startswith('BO'):
            continue
        xyz = [float(v) for v in p[1:4]]
        for i in range(natom):
            for j in range(i):
                mid = [(a + b) / 2 for a, b in zip(atoms[i], atoms[j])]
                if max(abs(a - b) for a, b in zip(mid, xyz)) < 1e-6:
                    pair[p[0]] = (i + 1, j + 1)

    def rename(lab, c):
        if c == 0:
            return lab
        m = re.match(r'A(\d+)(\D.*)?$', lab)
        if m:
            return 'A%02d%s' % (int(m.group(1)) + c * natom, m.group(2) or '')
        if lab in pair:
            i, j = pair[lab]
            return 'BO%d%d' % (i + c * natom, j + c * natom)
        return lab
    for t, body in secs:
        name = t.strip()
        if not name.startswith(keep):
            continue
        rows = [l for l in body if l.strip() and l.strip() != 'STOP']
        if name.startswith(('POLARIZABLE POINTS', 'DYNAMIC POLARIZABLE POINTS')):
            dyn = name.startswith('DYNAMIC')
            pts = parse_pts(body)
            copies = [[(shift_xyz(x, d), t_, w) for x, t_, w in pts] for d in shifts]
            if dyn:
                n = len(pts) // 12
                merged = []
                for f in range(12):
                    for c in copies:
                        merged += c[f * n:(f + 1) * n]
            else:
                merged = [p for c in copies for p in c]
            out += [t] + write_pts(merged, dyn) + ['STOP']
            continue
        recs = records(rows)

        def copy_rec(r, c):
            p = r[0].split()
            if name.startswith('COORDINATES'):
                xyz = shift_xyz([float(v) for v in p[1:4]], shifts[c])
                return [coord_line(rename(p[0], c), xyz, '%12.7f%5.1f' % (float(p[4]), float(p[5])))]
            return [r[0].replace(p[0], rename(p[0], c), 1)] + r[1:]
        is_atom = lambda r: r[0].strip().startswith('A')
        order = ([copy_rec(r, c) for c in range(3) for r in recs if is_atom(r)] +
                 [copy_rec(r, c) for c in range(3) for r in recs if not is_atom(r)])
        out += [t] + [l for r in order for l in r] + ['STOP']
    out += [' $END', '']
    open(dst, 'w').write('\n'.join(out))


def pentacene_shift(src, dst):
    head, secs = read_sections(src)
    d = (-500.0, 0.0, 0.0)
    out = head[:]
    out[[k for k, l in enumerate(out) if l.strip().startswith('$')][0]] = ' $pentacene_shift'

    def lab8(lab):
        # atom labels to the full A8 width (A01C -> A01CXXXX); bond mid-points keep their names
        return (lab + 'X' * 8)[:8] if lab.startswith('A') else lab
    for t, body in secs:
        name = t.strip()
        if name.startswith(('POLARIZABLE POINTS', 'DYNAMIC POLARIZABLE POINTS')):
            dyn = name.startswith('DYNAMIC')
            pts = [(shift_xyz(x, d), t_, w) for x, t_, w in parse_pts(body)]
            out += [t] + write_pts(pts, dyn) + [body[-1] if body and body[-1].strip() == 'STOP' else 'STOP']
            continue
        new = []
        for l in body:
            p = l.split()
            if name.startswith('COORDINATES') and p and p[0] != 'STOP':
                xyz = shift_xyz([float(v) for v in p[1:4]], d)
                new.append(coord_line(lab8(p[0]), xyz, '%12.7f%5.1f' % (float(p[4]), float(p[5]))))
            elif name.startswith('PROJECTION BASIS') and re.match(r'^A\d', l):
                xyz = shift_xyz([float(v) for v in p[1:4]], d)
                new.append('%-8s%-2s' % (p[0], '') + ''.join('%15.10f' % v for v in xyz) + ' %6.1f' % float(p[4]))
            elif name.startswith('LMO CENTROIDS') and l.startswith('CT'):
                k = int(re.match(r'CT\s*(\d+)', l).group(1))
                new.append(ct(k, shift_xyz([float(v) for v in l[len(re.match(r'CT\s*\d+', l).group(0)):].split()], d)))
            elif name.startswith(('MONOPOLES', 'DIPOLES', 'QUADRUPOLES', 'OCTUPOLES', 'SCREEN')) and p and \
                    p[0].startswith('A'):
                new.append(l.replace(p[0], lab8(p[0]), 1))
            else:
                new.append(l)
        out += [t] + new
    out += [' $END', '']
    open(dst, 'w').write('\n'.join(out))


def h2o_shuffled(src, dst):
    head, secs = read_sections(src)
    out = head[:]
    out[[k for k, l in enumerate(out) if l.strip().startswith('$')][0]] = ' $h2o_shuffled'
    for t, body in secs:
        name = t.strip()
        if name.startswith(('MONOPOLES', 'DIPOLES', 'QUADRUPOLES', 'OCTUPOLES', 'SCREEN')):
            rows = [l for l in body if l.strip() and l.strip() != 'STOP']
            stop = [l for l in body if l.strip() == 'STOP']
            out += [t] + [l for r in reversed(records(rows)) for l in r] + stop
        else:
            out += [t] + body
    out += [' $END', '']
    open(dst, 'w').write('\n'.join(out))


def h2o_dipquad(src, dst):
    head, secs = read_sections(src)
    out = head[:]
    out[[k for k, l in enumerate(out) if l.strip().startswith('$')][0]] = ' $h2o_dipquad'
    for t, body in secs:
        if t.strip().startswith('DYNAMIC POLARIZABLE POINTS'):
            pts = parse_pts(body)
            dq = [' DIPOLE-QUADRUPOLE DYNAMIC POLARIZABLE POINTS']
            n = len(pts) // 12
            for k, (xyz, _, w) in enumerate(pts):
                idx = k % n + 1
                dq.append(ct(idx, xyz, w if idx == 1 else None, dynamic=True))
                vals = [0.001 * (k + 1) * (j + 1) for j in range(27)]
                for r in range(0, 27, 4):
                    dq.append(''.join('%16.10f' % v for v in vals[r:r + 4]) + (' >' if r + 4 < 27 else ''))
            out += dq + ['STOP']
        out += [t] + body
    out += [' $END', '']
    open(dst, 'w').write('\n'.join(out))


def main():
    fraglib = sys.argv[1] if len(sys.argv) > 1 else '../fraglib'
    here = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    pentacene_2x(os.path.join(fraglib, 'pentacene.efp'), os.path.join(here, 'pentacene_2x.efp'))
    pentacene_shift(os.path.join(fraglib, 'pentacene.efp'), os.path.join(here, 'pentacene_shift.efp'))
    pentacene_3x(os.path.join(fraglib, 'pentacene.efp'), os.path.join(here, 'pentacene_3x.efp'))
    h2o_dipquad(os.path.join(fraglib, 'h2o.efp'), os.path.join(here, 'h2o_dipquad.efp'))
    h2o_shuffled(os.path.join(fraglib, 'h2o.efp'), os.path.join(here, 'h2o_shuffled.efp'))


if __name__ == '__main__':
    main()
