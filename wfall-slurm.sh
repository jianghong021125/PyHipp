#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --cpus-per-task=1   # number of CPUs for this task
#SBATCH -J "wfall"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o wfall-slurm.%N.%j.out # STDOUT
#SBATCH -e wfall-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -c "import PyHipp as pyh; \
import DataProcessingTools as DPT; \
wfall = DPT.objects.processDirs(dirs=None, exclude=['*eye*', '*mountains*', '*array04*'], objtype=pyh.Waveform); \ 
wfall.save();"

aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:692260005363:awsnotify --message "WFJobDone"
