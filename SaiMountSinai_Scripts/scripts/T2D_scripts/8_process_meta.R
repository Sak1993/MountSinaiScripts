setwd("/sc/arion/projects/ipm/gottas01/ACEi_project/results")
library(data.table)
library(dplyr)
AA_out <- fread("ACEiGWAS.AA.out",sep=" ",header=TRUE)
EA_out <- fread("ACEiGWASNew.EA.out",sep=" ",header=TRUE)
HA_out <- fread("ACEiGWASNew.HA.out",sep=" ",header=TRUE)


combined_out <- rbind(AA_out,EA_out,HA_out)
library(dplyr)
combined_filt <- combined_out %>% select(CHR,POS,rsid)
combined_filtered <- unique(combined_filt)

setwd("/sc/arion/projects/ipm/gottas01/ACEi_project/results")
meta_out <- fread("metal_PaulaGwas1.tbl",header=T,sep="\t")
merged_meta <- merge(meta_out,combined_filt,by.x="MarkerName",by.y="rsid",all.x=TRUE)
write.table(merged_meta,'final_meta.tbl',row.names=FALSE,quote=FALSE)
