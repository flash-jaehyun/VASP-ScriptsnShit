#!/bin/bash -l

# Batch script to run an MPI parallel job on Legion with the upgraded software
# stack under SGE with Intel MPI.

# 1. Force bash as the executing shell.
#$ -S /bin/bash

# 2. Request wallclock time (format hours:minutes:seconds).
#$ -l h_rt=03:00:00

# 3. Request RAM per process.
#$ -l mem=1G

# 4. Request TMPDIR space per node (default is 10 GB)
#$ -l tmpfs=10G

# 5. Set the name of the job.
#$ -N vasp_econv

# 6. Select the MPI parallel environment and number of processes.
#$ -pe mpi 12

# 7. Set the Current Working Directory
#$ -cwd

# 8. Load the correct modules for this version of VASP. This also outputs some information about
# what you have loaded and the source dir - you can remove those lines if you wish.
module load vasp/5.4.4-18apr2017/intel-2017-update1
module list
VASP_SRC_DIR=$PWD
echo "VASP_SRC_DIR: "$VASP_SRC_DIR

# 9. Run our MPI job. GERun is a wrapper that launches MPI jobs on Legion.
# \time --verbose gerun vasp_std > vasp_output.$JOB_ID
./auto_encut_conv_test.sh
