library(tidyverse)
library(parallel)

chr <- tibble(CHR=seq(22))

param <- df <- crossing(chr) %>% arrange(CHR)

paramls <- split(param <- df,seq(nrow(param <- df)))

null <- mclapply(paramls,function(x){
  setwd("/sc/arion/projects/ipm/gottas01/MaskedMRNSlist")
  cmd <- paste0("ml tabix 
                 tabix -p vcf /sc/arion/projects/ipm/gottas01/MaskedMRNSlist/biallelic_mrn/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.biallelic_mrn.chr",x$CHR,".vcf.gz
                 tabix -p vcf /sc/arion/projects/ipm/gottas01/MaskedMRNSlist/multiallelic_mrn/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.multiallelic_mrn.chr",x$CHR,".vcf.gz
                 tabix -p vcf /sc/arion/projects/ipm/gottas01/MaskedMRNSlist/multiallelic.normalized_mrn/SINAI_Freeze_Two.GL.pVCF.PASS.onTarget.multiallelic.normalized_mrn.chr",x$CHR,".vcf.gz")
  
  system(cmd)
}
,
mc.cores=22,
mc.preschedule = FALSE

)