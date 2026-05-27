#!/bin/bash

for dir in 77_4 137_4 166_2 166_4 168_7 169_4 169_6 208_4 208_6 247_4 299_4 346_4 382_4 407_4 424_4 ;
do
       cd $dir/gromacs

       for i in {1..3};
       do
       gmx mdrun -v -deffnm md_$i -pinoffset 0 -pin on -nt 12 -nsteps 5000000
done
cd ../..
done
