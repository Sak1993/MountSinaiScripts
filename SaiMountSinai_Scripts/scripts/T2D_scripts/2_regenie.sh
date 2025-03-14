#!/bin/bash
ml regenie/2.2.4

for ANC in {"AA","EA","HA","ESA","SA"};do
regenie \
       --step 1 \
          --bed /sc/arion/projects/ipm/gottas01/GWAS_material/TOPMED/$ANC \
          --extract /sc/arion/projects/ipm/gottas01/T2D/data/snp_lists/${ANC}.snplist \
          --covarFile /sc/arion/projects/ipm/gottas01/T2D/data/${ANC}_regeniecovariate.txt \
          --phenoFile /sc/arion/projects/ipm/gottas01/T2D/data/${ANC}_regeniephenofile.txt \
          --phenoCol TYP \
          --covarCol AGE,GENDER,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
          --bsize 100 \
           --bt --lowmem \
          --lowmem-prefix ${ANC}_tmp_rg \
           --out /sc/arion/projects/ipm/gottas01/T2D/analysis/${ANC}_out
done






















#for ANC in {"AA","EA","HA","ESA","SA"};do
#for ANC in "ESA";do
#for CHR in {01..22}; do
#   regenie \
#           --step 2 \
#           --bgen /sc/private/regen/data/Regeneron/GSA/imputed_TOPMED/bgen/TOPMED_chr"$CHR".8bit.bgen \
#           --covarFile /sc/arion/projects/ipm/lees117/T2D_AM/data/"$ANC"_regeniecovariate.txt \
#           --phenoFile /sc/arion/projects/ipm/lees117/T2D_AM/data/"$ANC"_regeniephenofile.txt \
#           --sample /sc/private/regen/data/Regeneron/GSA/imputed_TOPMED/bgen/TOPMED_MRN.sample \
#          --bsize 200 \
#          --bt \
#          --firth --approx \
#          --pThresh 0.01 \
#          --pred ../analysis/${ANC}_out_pred.list \
#          --out ../analysis/${ANC}_chr"$CHR"_bin_out_firth
#done
#done
