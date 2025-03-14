#!/bin/bash 

ml awscli

aws s3 cp s3://s4-bio-me-delivery-prod/WES_v7/ . --exclude "*" --include "*/*.alignmentQcSummary.tsv" --recursive --profile sema4 --dryrun > file1.txt 

aws s3 cp s3://s4-bio-me-delivery-prod/WES_v7/ . --exclude "*" --include "*/*.fastq.gz" --recursive --profile sema4 --dryrun > file2.txt 

aws s3 cp s3://s4-bio-me-delivery-prod/WES_v7/ . --exclude "*" --include "*/*.bam" --recursive --profile sema4 --dryrun > file3.txt 


