#!/bin/bash

gnina.1.3 \
  -r ERG6.pdbqt \
  -l drugclip_ligands.sdf \
  --autobox_ligand drugclip_ligands.sdf \
  --num_modes 10 \
  --exhaustiveness 16 \
  --cnn_scoring none \
  -o gnina_screen.sdf \
  --log gnina_screen.log
