#!/bin/bash

ulimit -s unlimited

# distribute the number of threads 
# reasonable in the OpenMP section
export OMP_NUM_THREADS=4,1

# deactivate nested OMP constructs
# export OMP_MAX_ACTIVE_LEVES=1

# shared memory OpenMP parallelisation,
# to calculate larger systems an appropriate OMP stacksize
# must be provided, chose a reasonable large number
export OMP_STACKSIZE=6G

# By default xtb uses gfn2
# xtb --gfnff --input xtb.inp pyralid4.xyz --opt --verbose >check.out

xtb linker.xyz --sp > check.out

# gbsa means optimization in solvent (not necessary)
# crest opt.xyz --gfn2 --gbsa h2o > crest.out

# xtb --gfn1 --input xtb.inp OPTIMIZED.xyz --opt > check.out