#!/bin/bash

dir="134_7" # change this 

cd "$dir/gromacs" || {
    echo "Directory $dir/gromacs not found"
    exit 1
}
        for i in 3; do
            echo -e "1\n0" | gmx trjconv -f md_${i}.xtc -s md_${i}.tpr -pbc nojump -o md_${i}.noj.xtc -center
        done

        for i in 3; do
            echo 0 | gmx trjconv -f md_${i}.noj.xtc -s md_${i}.tpr -pbc mol -o md_${i}.pbc.xtc
        done
cd - > /dev/null
