library(tidyverse)
library(parallel)
library(batchtools)

chr <- tibble(CHR=seq(22))

param_df <- crossing(chr) %>% arrange(CHR)

paramls <- split(param_df,seq(nrow(param_df)))

null <- mclapply(paramls,function(x){

                    setwd("/sc/arion/projects/ipm/gottas01/MaskedMRNSlist")
                    cmd <- paste0("ml bcftools

                                  bcftools query -f '%CHROM %POS\n' /sc/private/regen/data/Regeneron/SINAI_Freeze_Two_pVCF/data/pVCF/QC_passed/freeze2-ontarget/biallelic/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.biallelic.chr",x$CHR,".vcf.gz > Biallelicchr",x$CHR,".txt
                                 bcftools query -f '%CHROM %POS\n' /sc/private/regen/data/Regeneron/SINAI_Freeze_Two_pVCF/data/pVCF/QC_passed/freeze2-ontarget/multiallelic/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.multiallelic.chr",x$CHR,".vcf.gz > Multiallelicchr",x$CHR,".txt
                                 bcftools query -f '%CHROM %POS\n' /sc/private/regen/data/Regeneron/SINAI_Freeze_Two_pVCF/data/pVCF/QC_passed/freeze2-ontarget/multiallelic.normalized/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.multiallelic.normalized.chr",x$CHR,".vcf.gz > Multiallelic_Normalizedchr",x$CHR,".txt")
                        
                    system(cmd)
}
,
mc.cores=22,
mc.preschedule = FALSE

           )
