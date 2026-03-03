#!/bin/bash

CA_GROUP=3
LIG_GROUP=13
dir="134_7"

cd "$dir/gromacs" || {
    echo "Directory $dir/gromacs not found"
    exit 1
}
        for i in 1 2 3; do
            echo "Protein RMSD md_${i}"
            printf "%d %d\n" ${CA_GROUP} ${CA_GROUP} | gmx rms -s md_${i}.tpr -f md_${i}.pbc.xtc -n rmsd.ndx -o rmsd_protein_md_${i}.xvg -tu ns

            echo "Ligand RMSD md_${i}"
            printf "%d %d\n" ${CA_GROUP} ${LIG_GROUP} | gmx rms -s md_${i}.tpr -f md_${i}.pbc.xtc -n rmsd.ndx -o rmsd_ligand_md_${i}.xvg -tu ns
        done
        cd - > /dev/null
