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

  
