# read libefp input and extract geometry suitable for pylibefp input
# coordinates will be in Bohr units

def read_libefp_input(libefp_inp) :

    b2a = 0.529177
    a2b = 1.0 / b2a

    coord_type = 0
    frag_names = []
    frag_coords = []

    with open (libefp_inp,'r') as f:
        print(f"Will work with {libefp_inp} file")
        while True:
            line=f.readline()
            if not line: break
            if "coord" in line:  # read type of coordinate input
                sline = line.rsplit()
                coord_type = sline[1]
                print(f"coord {coord_type}")

            if "fragment" in line:   # read fragment name
                sline = line.rsplit()
                frag_name = sline[1]
                frag_coord = []
                if coord_type == 'atoms' or 'points':
                    while True:
                        l = f.readline()
                        l = l.strip()  # Remove leading/trailing whitespace; stop reading when empty line is found
                        if not l: break
                        if "fragment" in l or "velocity" in l: break
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
                    line=f.readline()
                    sline = line.rsplit()
                    for i in range(3):
                        frag_coord.append(float(sline[i])*a2b)
                    for i in range(3):
                        frag_coord.append(float(sline[i+3]))

                # store frag info
                frag_names.append(frag_name)
                frag_coords.append(frag_coord)
    
    print(f"Found {len(frag_names)} fragments")
    return frag_names, frag_coords



