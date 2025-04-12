#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan  2 11:52:04 2025

@author: lyuda

Usage: python out2xyz.py libefp_output_file_name
Output libefp_output_file_name.xyz 
"""

import sys

# total arguments
if len(sys.argv) != 2:
    sys.exit("Please provide libefp output file name!")

    
output = sys.argv[1]
xyz = output + ".xyz"
with open (output,'r') as f, open (xyz, 'w') as geom:
    print(f"Will work with {output} file")
    while True:
        line=f.readline()
        if not line: break
        if "GEOMETRY (ANGSTROMS)" in line:  # start reading geometry
            f.readline() # skip one line
            tmp = []
            natoms = 0
            while True:
                l = f.readline()
                l = l.strip()  # Remove leading/trailing whitespace; stop reading when empty line is found
                if not l: break
                sline = l.rsplit()
                if len(sline) != 4:
                    print(f"read {l} and got confused, exit")
                    break
                atom_name = sline[0][3:]
                tmp.append([str(atom_name),float(sline[1]),float(sline[2]),float(sline[3])])
                natoms += 1
            # saving new geometrry into xyz file
            print(f"{natoms}", file=geom)
            print("", file=geom)
            for t in tmp:
                print(f"{t[0]}   {t[1]:16.8f}  {t[2]:16.8f}  {t[3]:16.8f}", file=geom)

                
                
                
                
                
            
            
