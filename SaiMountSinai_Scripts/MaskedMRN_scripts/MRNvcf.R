library(tidyverse)
library(parallel)
library(batchtools)

chr <- tibble(CHR=seq(22))

param <- df <- crossing(chr) %>% arrange(CHR)

paramls <- split(param <- df,seq(nrow(param <- df)))

null <- mclapply(paramls,function(x){

                                        setwd("/sc/arion/projects/ipm/gottas01/MaskedMRNSlist")
                                                            cmd <- paste0("ml bcftools
                                                                   bcftools reheader --samples /sc/arion/projects/ipm/gottas01/ReheaderSample.txt /sc/private/regen/data/Regeneron/SINAI_Freeze_Two_pVCF/data/pVCF/QC_passed/freeze2-ontarget/biallelic/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.biallelic.chr",x$CHR,".vcf.gz > /sc/arion/projects/ipm/gottas01/MaskedMRNSlist/biallelic_mrn/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.biallelic_mrn.chr",x$CHR,".vcf.gz
                                                                   bcftools reheader --samples /sc/arion/projects/ipm/gottas01/ReheaderSample.txt /sc/private/regen/data/Regeneron/SINAI_Freeze_Two_pVCF/data/pVCF/QC_passed/freeze2-ontarget/multiallelic/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.multiallelic.chr",x$CHR,".vcf.gz > /sc/arion/projects/ipm/gottas01/MaskedMRNSlist/multiallelic_mrn/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.multiallelic_mrn.chr",x$CHR,".vcf.gz
                                                                   bcftools reheader --samples /sc/arion/projects/ipm/gottas01/ReheaderSample.txt /sc/private/regen/data/Regeneron/SINAI_Freeze_Two_pVCF/data/pVCF/QC_passed/freeze2-ontarget/multiallelic.normalized/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.multiallelic.normalized.chr",x$CHR,".vcf.gz > /sc/arion/projects/ipm/gottas01/MaskedMRNSlist/multiallelic.normalized_mrn/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.multiallelic.normalized_mrn.chr",x$CHR,".vcf.gz")
                                                                   system(cmd)
}
,
mc.cores=22,
mc.preschedule = FALSE

)
