#!/bin/bash

CHARMM_SCRIPT=~/MM_KIT/CHARMM/run_charmm_gui.soluble.csh

for dir in */ ; do
    if [ -d "${dir}/gromacs" ]; then
        echo "Entering ${dir}gromacs"
        cd "${dir}/gromacs" || exit 1

        csh "$CHARMM_SCRIPT"

        gmx grompp -f step5_production.mdp -c step4.1_equilibration.gro -p topol.top -n index.ndx -o md_1.tpr
        gmx grompp -f step5_production.mdp -c step4.1_equilibration.gro -p topol.top -n index.ndx -o md_2.tpr
        gmx grompp -f step5_production.mdp -c step4.1_equilibration.gro -p topol.top -n index.ndx -o md_3.tpr

        cd - > /dev/null
    fi
done
