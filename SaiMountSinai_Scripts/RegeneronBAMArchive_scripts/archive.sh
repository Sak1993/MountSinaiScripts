#!/bin/bash 

#BSUB -J MyJob11
#BSUB -P acc_ipm
#BSUB -q premium
#BSUB -n 4
#BSUB -W 24:00
#BSUB -R rusage[mem=4000]
#BSUB -o Archive4_16.log
#BSUB -eo Archive4_16.stderr
#BSUB -L /bin/bash 

dsmc archive -se=gottas01 /sc/arion/projects/ipm/gottas01/Regeneron_BAMArchive/BAMNew/Regfiles.tar
