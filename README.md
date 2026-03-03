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

  

  
