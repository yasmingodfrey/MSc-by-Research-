#!/bin/bash

Outdir=$(pwd)/rmsf_lig_results
mkdir -p "$Outdir"

for dir in 134_7 168_7 208_4 299_4 407_4 166_2 169_4 208_6 346_4 424_4 166_4 169_6 247_4 382_4 77_4; do
    cd $dir/gromacs || exit
    
    for run in 1 2 3; do
        echo "13 3" | gmx rmsf -f md_${run}.pbc.xtc -s md_${run}.tpr -o "$Outdir/${dir}_rmsf_${run}.xvg" -fit -oq "$Outdir/${dir}_rmsf_${run}.pdb"
    done
    cd ../..
done
