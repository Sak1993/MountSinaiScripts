library(dplyr)
library(qqman)
library(data.table)

#change ancestry group here
setwd("/sc/arion/projects/ipm/gottas01/T2D/results")
AAout <- fread("T2DGWAS2New.HA.out",header=TRUE,sep=" ")  
AA_reformat <- AAout %>% select(rsid,CHR,POS,p.value)
names(AA_reformat)[1] <- "SNP"
names(AA_reformat)[3] <- "BP"
names(AA_reformat)[4] <- "P"

#If file is too big or you only want to look at peaks, uncomment this line
#AA_filt <- subset(AA_reformat, P < 0.00001)
AA_filtered <- AA_reformat[!AA_reformat$P %in% 0,]
AA_filtered$CHR <- gsub("chr","",AA_filtered$CHR)
AA_filtered$CHR <- as.numeric(AA_filtered$CHR)

setwd("/sc/arion/projects/ipm/gottas01/T2D/results")
#change	ancestry group here 
png("HAmaf0.01qqplot.png")
#change title here
qq(AA_reformat$P,main="Hispanic American maf(0.01) qqplot")
dev.off()

#change	ancestry group here
png("HAmaf0.01_manhattanplot.png")
#change title here 
manhattan(AA_filtered,main="Hispanic American maf(0.01) Manhattan Plot")
dev.off()

