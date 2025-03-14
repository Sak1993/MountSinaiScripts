
library(tidyverse)
library(ggplot2)
library(parallel)
library(batchtools)

setwd("/sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/")

#List some samples
#samples <- tibble(ANC=c("12000020_11","12000022_11","12000025_11","12000467_11","12000508_11","12000514_11","12002662_11","12002679_11","12002681_11"))

#sample <- 
#samples1 <- read.table("/sc/arion/projects/ipm/gottas01/resequenced_samples.txt")

#samples2 <- read.table("/sc/arion/projects/ipm/gottas01/additional_samples_WES_v7.txt")

#samples3 <- read.table("/sc/arion/projects/ipm/gottas01/October_2022_additional_WES_v7.txt")i

#samples6 <- read.table("/sc/arion/projects/ipm/gottas01/Octobersamplesset1.txt")

samples4 <- read.table("/sc/arion/projects/ipm/gottas01/bamretrieve.txt")
param_ls <- split(samples4,seq(nrow(samples4)))

param_ls
compression84 <- function(x){
#nul968 <- mclapply(param_ls, function(x){
                   # cmd <- paste0("ml samtools/1.9
#                                   date; samtools view -C -T /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/pVcf_March_2023/genome.fa -o /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/resequenced_samples_WES_v7/",x$V1,"/",x$V1,".dedup.recal.cram /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/resequenced_samples_WES_v7/",x$V1,"/",x$V1,".dedup.recal.bam; date")
                  #  cmd <- paste0("ml samtools/1.9
                   #                date; samtools view -C -T /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/pVcf_March_2023/genome.fa -o /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/additional_samples_WES_v7/",x$V1,"/",x$V1,".dedup.recal.cram /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/additional_samples_WES_v7/",x$V1,"/",x$V1,".dedup.recal.bam; date")
                  #cmd <- paste0("ml samtools/1.9 
                  #                 date; samtools view -C -T /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/pVcf_March_2023/genome.fa -o /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/October_2022_additional_WES_v7/",x$V1,"/",x$V1,".dedup.recal.cram /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/October_2022_additional_WES_v7/",x$V1,"/",x$V1,".dedup.recal.bam; date")
                cmd <- paste0("ml samtools/1.9
                                  date; samtools view -b -T /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/pVcf_March_2023/genome.fa -o /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/",x$V1,"/",x$V1,".dedup.recal.bam /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/",x$V1,"/",x$V1,".dedup.recal.cram; date") 
                 #  cmd <- paste0("ml awscli
                  #               date; aws s3 cp s3://s4-bio-me-delivery-prod/WES_v7/",x$V1,"/",x$V1,".dedup.recal.bam /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/",x$V1,"/ --profile sema4; date")
#                                cmd <- paste0("rm -rf /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/",x$V1,"/",x$V1,".dedup.recal.bam")
#                   cmd <- paste0("rm -rf /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/",x$V1,"/",x$V1,".dedup.recal.bam")                
#                    cmd <- paste0("ml samtools/1.9
#                                   date; samtools index -b /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/Sema4_032823/Sema4WESRawData/WES_v7/",x$V1,"/",x$V1,".dedup.recal.cram; date")               
                                   system(cmd)

     
#mc.cores=20
#mc.preschedule=FALSE
}
                    unlink('~/compression84/',recursive=TRUE)
                    reg <- makeRegistry('~/compression84')
                    batchMap(compression84,param_ls)
                    submitJobs(resources = list(queue = 'express', walltime = '8:00',memory=1000,project = 'acc_ipm',n_cpu=1))
