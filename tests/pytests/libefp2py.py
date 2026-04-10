# read libefp/efpmd input and prepares information for pylibefp input
# coordinates will be in Bohr units

def read_libefp_input(libefp_inp) :

    b2a = 0.529177
    a2b = 1.0 / b2a

    coord_type = 'points' # default
    frag_names = []
    frag_coords = []
    if_gradient = False
    periodic_box = []
    efp_options = {}
    ref_energy = 0.0
    efp_terms = []

    with open(libefp_inp,'r') as f:
        #print(f'Will work with {libefp_inp} file')
        lines = f.readlines()

    line_counter = 0
    for line in lines:
        if 'run_type' in line:
            if 'grad' in line or 'opt' in line or 'hess' in line or 'md' in line or 'gtest' in line:
                if_gradient = True

        if "coord" in line:  # read type of coordinate input
            sline = line.rsplit()
            coord_type = sline[1]
            #print(f"coord {coord_type}")

        if 'terms' in line and 'spec_terms' not in line:
            sline = line.rsplit()
            for s in sline[1:]:
                efp_terms.append(s)
                #efp_options[s] = True

        if 'spec_terms' in line:
            sline = line.rsplit()
            for s in sline[1:]:
                #spec_terms.append(s)
                efp_options[s] = True

        if 'damp' in line:
            efp_options[line.rsplit()[0]] = line.rsplit()[1]

        if "pol_driver" in line:
            efp_options["pol_driver"] = line.rsplit()[1]

        if 'enable_cutoff' in line:
            efp_options["enable_cutoff"] = line.rsplit()[1]
        if 'swf_cutoff' in line:
            efp_options["swf_cutoff"] = a2b * float(line.rsplit()[1])
        if 'xr_cutoff' in line:
            efp_options["xr_cutoff"] = a2b * float(line.rsplit()[1])
        if 'enable_pbc' in line:
            efp_options["enable_pbc"] = line.rsplit()[1]
        if 'periodic_box' in line:
            for s in line.rsplit()[1:4]:
                periodic_box.append( a2b * float(s))  # xyz
            if len(line.rsplit()) > 4:
                for s in line.rsplit()[4:]:
                    periodic_box.append(float(s))  # angles

        if 'ref_energy' in line:
            ref_energy = line.rsplit()[1]

        if 'ligand' in line:
            efp_options["ligand"] = int(line.rsplit()[1])
        if 'enable_pairwise' in line:
            efp_options["enable_pairwise"] = line.rsplit()[1]

        if 'symmetry' in line:
            efp_options["symmetry"] = line.rsplit()[1]
        if 'special_fragment' in line:
            efp_options["special_fragment"] = int(line.rsplit()[1])
        if 'symm_frag' in line:
            efp_options["symm_frag"] = line.rsplit()[1]
        if 'print' in line and 'print_pbc' not in line:
            efp_options["print"] = int(line.rsplit()[1])

        ##### fragments
        if "fragment" in line and 'special_fragment' not in line:   # read fragment name
            sline = line.rsplit()
            frag_name = sline[1]
            frag_coord = []
            if coord_type == 'atoms' or coord_type == 'points':
                for k in range(line_counter+1, len(lines)):
                    l = lines[k]
                    l = l.strip()  # Remove leading/trailing whitespace; stop reading when empty line is found
                    if not l: break
                    if "velocity" in l: break
                    if "fragment" in l: break
                    sline = l.rsplit()
                    if coord_type == 'atoms':
                        frag_coord.append(float(sline[1])*a2b)
                        frag_coord.append(float(sline[2])*a2b)
                        frag_coord.append(float(sline[3])*a2b)
                    if coord_type == 'points':
                        frag_coord.append(float(sline[0])*a2b)
                        frag_coord.append(float(sline[1])*a2b)
                        frag_coord.append(float(sline[2])*a2b)
            if coord_type == 'xyzabc':
                l = lines[line_counter+1]
                sline = l.rsplit()
                if len(sline) != 6:
                    print('Warning! bad xyzabc coordinate read', sline)

                for i in range(3):
                    frag_coord.append(float(sline[i])*a2b)
                for i in range(3):
                    frag_coord.append(float(sline[i+3]))

            # store frag info
            frag_names.append(frag_name)
            frag_coords.append(frag_coord)

        line_counter += 1

    if efp_terms:
        for term in efp_terms:
            efp_options[term] = True
    else:  # no efp terms is given. libefp default is elec, pol, disp, exrep
        efp_options['elec'] = True
        efp_options['pol'] = True
        efp_options['disp'] = True
        efp_options['xr'] = True

    #print(f"Found {len(frag_names)} fragments")
    return coord_type, frag_names, frag_coords, efp_options, if_gradient, ref_energy, periodic_box


#things = read_libefp_input('../total_1a.in')
#print(things)
