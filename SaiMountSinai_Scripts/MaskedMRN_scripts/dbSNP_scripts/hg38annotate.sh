#!/bin/bash 

#BSUB -J MyJob10
#BSUB -P acc_ipm
#BSUB -q premium
#BSUB -n 16 
#BSUB -W 24:00
#BSUB -R rusage[mem=10000]
#BSUB -o dbSNPhg38vcf.log
#BSUB - dbSNPhg38vcf.stderr
#BSUB -L /bin/bash 

ml bcftools 
ml snpeff/4.3t
ml tabix

bcftools annotate --threads 48 --rename-chrs /sc/arion/projects/ipm/gottas01/dbSNP/data/dbSNP-to-UCSC-GRCh38.p12.map /sc/arion/projects/ipm/gottas01/dbSNP/data/GCF_000001405.39.gz -o dbSNP155.hg38.vcf.gz

#java -jar /hpc/packages/minerva-centos7/snpeff/4.3t/snpEff/SnpSift.jar annotate /sc/arion/projects/ipm/gottas01/dbSNP/data/GCF_000001405.39.gz /sc/arion/projects/ipm/gottas01/dbSNP/analysis/GLnexus.vcf.gz > GLnexusNewAnnotated.vcf



#java -jar /hpc/packages/minerva-centos7/snpeff/4.3t/snpEff/SnpSift.jar annotate /sc/arion/projects/ipm/gottas01/dbSNP/analysis/dbSNP155.hg38.vcf.gz /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/interim_092122/GLnexus.all-15k.NOT_FINAL.vcf.gz > GLnexus15k_Annotated.vcf 
#bgzip /sc/arion/projects/ipm/gottas01/dbSNP/analysis/dbSNP155.hg38.vcf

#java -jar /hpc/packages/minerva-centos7/snpeff/4.3t/snpEff/SnpSift.jar vcfCheck /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/interim_092122/GLnexus.all-15k.NOT_FINAL.vcf.gz 

#tabix -p vcf /sc/arion/projects/ipm/Sema4QC/WES-QC/received_data/interim_092122/GLnexus.all-15k.NOT_FINAL.vcf.gz
