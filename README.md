I am a Masters by Research student at the University of Bristol, studying how DSFF quorum-sensing molecules interact with essential Candida auris proteins.

My project includes three phases: 
1. HTS screening using Boltz-2 
2. MD simulations
3. qPCR experimental validation

This page includes all the scripts used in the first two phases of my project. 

  PHASE 1: Boltz-2 Screening
  
    boltz_example.yaml

  Example protein–ligand input file for Boltz-2 high-throughput screening.
  (Protein: 137, Ligand: 4)
  
  Format: YAML configuration file defining protein sequence and ligand structure

  How to use:
  
  (1) Replace the FASTA sequence with your target protein sequence.
  (2) Replace the SMILES string with your ligand structure. 
  (3) Adjust any simulation or scoring parameters as required for your screening batch.

  This file serves as a template for generating batch input files during the HTS phase.

    boltz_run_multi. sh 

  This script runs all .yaml files in Boltz-2. Boltz-2 is an AI co-folding software which predicts and scores the protein-ligand model. 

  Input: see boltz_example.yaml 
  
  Output: Predicted model PDB and Scores: Affinity, Binary, and iPTM.   
  
  Boltz-2 must be installed for this script. 

    gnina_rescore.sh 

  This script scores the Boltz-2 model using GNINA. This allows further evaluation of the Boltz-2 prediction using more traditional scoring metrics. 

  How this script works: (1) It splits the Boltz-2 model into protein.pdb and ligand.pdb. (2) Uses obabel to turn the ligand .pdb into .cif to comply to GNINA input requirements. (3) Scores the Boltz pose using its own metrics (--only_score applied) 

  Input: Boltz-2 output model PDB 

  Output: Minimised afinity score and CNN score 

  GNINA must be installed for this script. 

    gnina_redock.sh 

  This script redocks the Boltz-2 prediction. Docking is more physics based compared to AI which is based on training data. 
  
  How it works: (1) It takes the Boltz-2 PDB and splits the protein and ligand into seperate PDBs. (2) Uses obabel to turn the ligand.pdb into .cif to comply to GNINA input requirements. (3) Re-docks the ligand to the protein, using --auto_box to define the docking box around the original Boltz-2 prediction. 

  PHASE 2: MD simulations 

  System and parameters were set up using Charmm-gui ligand reader and solution builder. 

    md_equilibrate.sh 

  Bash script to prepare production MD run in GROMACs from charmm-gui systems. 

  This script: 
  (1) Loops through all system directories 
  (2) Enters each gromacs/ folder 
  (3) Runs the CHARMM-GUI solvent setup script
  (4) Generates three production input files (md_1.tpr, md_2.tpr, md_3.tpr) using gmx grompp

  It automates the transition from: step4.1_equilibration.gro → step5_production.mdp

  Requirements
  (1) GROMACS (gmx) installed
  (2) CHARMM-GUI generated directory structure
  (3) Valid path to: ~/MM_KIT/CHARMM/run_charmm_gui.soluble.csh

  
