#!/bin/bash

Outdir=$(pwd)/rmsf_av_results
mkdir -p "$Outdir"

for dir in 134_7 168_7 208_4 299_4 407_4 166_2 169_4 208_6 346_4 424_4 166_4 169_6 247_4 382_4 77_4; do
    cd $dir/gromacs || exit

    gmx trjcat -f md_1.pbc.xtc md_2.pbc.xtc md_3.pbc.xtc -o md_all.pbc.xtc
    echo "1 1" | gmx rmsf -f md_all.pbc.xtc -s md_1.tpr -o "$Outdir/${dir}_rmsf.xvg" -fit -oq "$Outdir/${dir}_rmsf.pdb" -res
    cd ../..
done
