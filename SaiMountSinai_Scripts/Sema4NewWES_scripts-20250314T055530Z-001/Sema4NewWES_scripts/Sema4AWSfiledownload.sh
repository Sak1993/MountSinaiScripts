#!/bin/bash


#BSUB -J MyJob1
#BSUB -P acc_ipm
#BSUB -q premium
#BSUB -n 8
#BSUB -W 24:00
#BSUB -R rusage[mem=4000]
#BSUB -R span[hosts=1]
#BSUB -o Sema4bamcramcompression.log
#BSUB -eo Sema4bamcramcompression.stderr
#BSUB -L /bin/bash

#Download files from Sema4 AWS Bucket
ml awscli
ml samtools/1.9

for i in `cat /sc/arion/projects/ipm/gottas01/WESdownloadSamples1.txt`;

#for i in `/sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/resequenced_samples_WES_v7/*/*.bam`;

do 
#aws s3 cp s3://s4-bio-me-delivery-prod/"$i"/ /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/"$i"/  --recursive --profile sema4 --exclude "*" --include "*.bam" --include "*.bai" --include "*.tsv" --include "*.gvcf.gz" --include "*.vcf.gz" 
   
aws s3 cp s3://s4-bio-me-delivery-prod/WES_v7/"$i"/"$i".dedup.recal.bam /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/"$i"/  --profile sema4

#aws s3 sync s3://s4-bio-me-delivery-prod/WES_v7/ . /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/ --profile sema4 --exclude "*" --include "12014*_10" --include "*.bam" --include "*.bai" --include "*.tsv" --include "*.gvcf.gz" --include "*.vcf.gz"
#do aws s3 cp s3://s4-bio-me-delivery-prod/"$i"/ /sc/arion/projects/ipm/gottas01/Sema4NewWES/data/"$i"/ --recursive --profile sema4 --exclude "*" --include "*.bam" --include "*.bai" --include "*.tsv" --include "*.gvcf.gz" --include "*.vcf.gz" --endpoint-url https://s4-bio-me-delivery-prod.s3.amazonaws.com/"$i"/ 

#Compress bam files to cram
#date; samtools view -C -T /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/pVcf_March_2023/genome.fa -o /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/additional_samples_WES_v7/12010362_10/12010362_10.dedup.recal.cram /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/additional_samples_WES_v7/12010362_10/12010362_10.dedup.recal.bam; date
done 
#do
#rm -f /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/"$i"/"$i".dedup.recal.bam

#done
