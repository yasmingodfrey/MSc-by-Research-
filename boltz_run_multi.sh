#!/bin/bash

for file in `ls ../input_files/*yaml`
do
        echo $file
        boltz predict $file --use_msa_server --recycling_steps 5 --use_potentials
done
