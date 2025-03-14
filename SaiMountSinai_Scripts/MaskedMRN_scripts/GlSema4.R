library(tidyverse)
library(parallel)

chr <- tibble(CHR=seq(22))

param_df <- crossing(chr) %>% arrange(CHR)

paramls <- split(param_df,seq(nrow(param_df)))

null <- mclapply(paramls,function(x){
  setwd("/sc/arion/projects/ipm/gottas01/MaskedMRNSlist")
  cmd <- paste0("ml bcftools
                 bcftools query -f '%CHROM %POS\n' /sc/arion/projects/ipm/Sema4QC/WES-QC/pipeline_QC_V1/analysis/GLnexus.",x$CHR,".vcf.gz > Sema4chr",x$CHR,".txt")
  
  system(cmd)
}
,
mc.cores=22,
mc.preschedule = FALSE

)
