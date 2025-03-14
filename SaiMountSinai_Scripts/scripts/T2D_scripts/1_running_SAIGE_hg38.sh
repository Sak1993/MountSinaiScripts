#Run Part 1 and Part 2 one at a time
#Part 1!
#output=/sc/arion/projects/ipm/gottas01/T2D/analysis
#prefix=T2DNew
#for group in {"HA","EA","AA","SA","ESA"}; do echo 'ml purge; ml R/3.6.0 boost/1.58.0; echo "started at"; date; /usr/bin/time -v Rscript /sc/arion/projects/ipm/gottas01/GWAS_material1/step1_fitNULLGLMMfix.R --plinkFile=/sc/arion/projects/ipm/gottas01/GWAS_material/TOPMED/'$group' --phenoFile=/sc/arion/projects/ipm/gottas01/T2D/data/phenofile.csv --phenoCol=TYP --covarColList=GENDER,AGE,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 --sampleIDColinphenoFile=MM --traitType=binary --outputPrefix='$output'/'$prefix'.'$group' --nThreads=24 --LOCO=FALSE; echo "finished at"; date' > ${output}/${prefix}.${group}.lsf; bsub -q premium -J ${prefix}.${group}SAIGE1 -P acc_ipm -W 45:00 -R rusage[mem=10000] -n 1 -o ${output}/${prefix}.${group}.log -e ${output}/${prefix}.${group}.log < ${output}/${prefix}.${group}.lsf; done



#Part 2!
output=/sc/arion/projects/ipm/gottas01/T2D/analysis
prefix=T2DNew
for CHR in {01..22}; do
for group in {"AA","ESA","EA","HA","SA"}; do echo 'ml purge; ml R/3.6.0 boost/1.58.0; echo "started at"; date; /usr/bin/time -v Rscript /sc/arion/projects/ipm/gottas01/GWAS_material1/step2_SPAtestsfixNoDosage.R --bgenFile=/sc/private/regen/data/GSA_GDA/imputed_TOPMED_V2/bgen/GSA_GDA_TOPMED_chr'$CHR'.8bit.bgen --bgenFileIndex=/sc/private/regen/data/GSA_GDA/imputed_TOPMED_V2/bgen/GSA_GDA_TOPMED_chr'$CHR'.8bit.bgen.bgi --minMAF=0.01 --minMAC=10 --sampleFile=/sc/arion/projects/ipm/gottas01/GWAS_material1/GSA_GDA_V2_TOPMED.sample --GMMATmodelFile='$output'/'$prefix'.'$group'.rda --varianceRatioFile='$output'/'$prefix'.'$group'.varianceRatio.txt --SAIGEOutputFile='$output'/'$prefix'GWAS2.'$group'.chr'$CHR'.out --numLinesOutput=2 --IsOutputAFinCaseCtrl=TRUE; echo "finished at"; date' > ${output}/${prefix}GWAS2.${group}.lsf; bsub -q premium -J ${prefix}GWAS2.${group}SAIGE2 -P acc_ipm -W 143:00 -R rusage[mem=10000] -n 1 -o ${output}/${prefix}GWAS2.${group}.chr${CHR}.log -e ${output}/${prefix}GWAS2.${group}.chr${CHR}.log < ${output}/${prefix}GWAS2.${group}.lsf; done ; done

