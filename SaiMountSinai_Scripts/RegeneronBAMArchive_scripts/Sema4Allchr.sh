#!/bin/bash 

#BSUB -J MyJob20
#BSUB -P acc_ipm
#BSUB -q premium
#BSUB -n 4
#BSUB -W 24:00
#BSUB -R rusage[mem=10000]
#BSUB -o Sema4NewAllchr.log
#BSUB -eo Sema4NewAllchr.stderr
#BSUB -L /bin/bash 

ml R/4.2.0

R CMD BATCH Sema4Allchr.R 
