#!/bin/bash
 ml regenie/2.2.4

cd ../analysis 
#echo "started at"; date; /usr/bin/time -v
regenie \
    --step 1 \
       --bed /sc/arion/projects/ipm/gottas01/GWAS_material/TOPMED/AA \
       --extract /sc/arion/projects/ipm/lees117/T2D_AM/data/snp_lists/AA.snplist \
       --covarFile /sc/arion/projects/ipm/lees117/T2D_AM/data/AA_regeniecovariate.txt \
        --phenoFile /sc/arion/projects/ipm/lees117/T2D_AM/data/AA_regeniephenofile.txt \
             --phenoCol TYP \
             --covarCol AGE,GENDER,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
             --bsize 100 \
             --bt --lowmem \
                     --lowmem-prefix AA_tmp_rg \
                     --out /sc/arion/projects/ipm/gottas01/T2D/analysis/AA_out

#echo "finished at"; date' > AA.lsf; "bsub -q premium -J AAregeniePart1 -P acc_ipm -W 45:00 -R rusage[mem=10000] -n 1 -o AAregenielsf.log < AAregenlsf"

#for CHR in {01..22}; do
#regenie \
#     --step 2 \
#       --bgen /sc/private/regen/data/Regeneron/GSA/imputed_TOPMED/bgen/TOPMED_chr"$CHR".8bit.bgen \
#           --covarFile /sc/arion/projects/ipm/gottas01/T2D/data/EA_regeniecovariate.txt \
#             --phenoFile /sc/arion/projects/ipm/gottas01/T2D/data/EA2.txt \
#             --sample /sc/private/regen/data/Regeneron/GSA/imputed_TOPMED/bgen/TOPMED_MRN.sample \
#                   --bsize 200 \
#                     --bt \
#                       --firth --approx \
#                         --pThresh 0.01 \
#                           --pred EA_out_pred.list \
#                             --out 1_EAchr"$CHR"_bin_out_firth
#done






























