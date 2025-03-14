#!/bin/bash

#BSUB -J MyJob34
#BSUB -P acc_ipm
#BSUB -q express
#BSUB -n 1 
#BSUB -W 8:00
#BSUB -R rusage[mem=4000]
#BSUB -R span[hosts=1]   
#BSUB -o cramcraitransfer.log
#BSUB -eo cramcraitransfer.stderr
#BSUB -L /bin/bash 

ml python/3.7.3

#rsync -av --inplace -W /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/resequenced_samples_WES_v7/data/*/*.cram /sc/arion/projects/regeneron/Sema4/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet1_2/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet2_1/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet2_2/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet7/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet3_1/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet3_2/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet4_1/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet4_2/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet5_1/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet5_2/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet6_1/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMSet6_2/data/*.bam /sc/arion/projects/regeneron/BAM/

#rsync -av --inplace -W /sc/arion/projects/ipm/gottas01/RegeneronBAMbaifiles/* /sc/arion/projects/regeneron/BAM/

#/sc/arion/projects/ipm/gottas01/Regeneron_BAMArchive/scripts/bagit.py --contact-name 'Sai Gottam' /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/October_2022_additional_WES_v7

#tar -cvf RegeneronBAMSet1.tar /sc/arion/projects/ipm/gottas01/RegeneronBAMSet1/

#gzip BAMFiles.tar

#split -n 4 RegeneronBAMSet1.tar RegeneronBAMSet1.tar.part

#tar -xvf RegeneronBAMSet1.tar


