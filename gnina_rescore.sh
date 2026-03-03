#!/bin/bash

START=`pwd`
mkdir -p $START/gnina_outputs

for dir in boltz_results_protein*ligand*
do
        cif_file=""
        sub_dir="$START/$dir/predictions/pr*"
        cd $sub_dir
        cif_file=`ls *cif`
        if [[ ! -s $START/gnina_outputs/$cif_file.sdf ]]
        then
                ls $cif_file
                obabel -icif $cif_file -O $cif_file.pdb
                grep " A " $cif_file.pdb > protein.pdb
                grep " B " $cif_file.pdb > ligand.pdb
                obabel -ipdb ligand.pdb -O ligand.sdf
                gnina.1.3 --score_only -r protein.pdb -l ligand.sdf -o $START/gnina_outputs/$cif_file.sdf
        fi
done
cd $START
<<'END'
