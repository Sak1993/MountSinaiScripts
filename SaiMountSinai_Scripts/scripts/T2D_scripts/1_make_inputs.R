library(tidyverse)
library(parallel)
library(data.table)

file <- fread("../data/phenofile.csv",header=T)

param_df <- tibble(ANC=c("AA","EA","HA","ESA","SA"))
param_ls <- split(param_df,seq(nrow(param_df)))

null <- mclapply(param_ls, function(x){
#browser()
fam <- fread(paste0("/sc/arion/projects/ipm/gottas01/GWAS_material/TOPMED/",x$ANC,".fam"),header=F)
fam <- fam %>% select(V1)

merged_fam <- merge(file,fam,by.x="MM",by.y="V1")

pheno <-  data.table(merged_fam)[, .(MM, MM, TYP)]
names(pheno)[1] <- "FID"
names(pheno)[2] <- "IID"
pheno <- pheno %>% distinct(FID,.keep_all=T)



covar <- data.table(merged_fam)[, .(MM,MM,AGE,GENDER,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10)]
names(covar)[1] <- "FID"
names(covar)[2] <- "IID"
covar <- covar %>% distinct(FID,.keep_all=T)
covar <- covar %>% filter(!grepl('Unknown',GENDER))

write.csv(pheno,paste0("../data/",x$ANC,"_regeniephenofile.txt"),row.names=F)
write.csv(covar,paste0("../data/",x$ANC,"_regeniecovariate.txt"),row.names=F)
            
}
,
                mc.cores=5,
                mc.preschedule = FALSE
                )


cmd <- 'cd ../data/
ml plink2
for ANC in {"AA","EA","ESA","HA","SA"};do
plink2 --bfile /sc/arion/projects/ipm/gottas01/GWAS_material/TOPMED/$ANC --mac 5 --write-snplist --out /sc/arion/projects/ipm/gottas01/T2D/data/snp_lists/${ANC}
done
'

system(cmd)
