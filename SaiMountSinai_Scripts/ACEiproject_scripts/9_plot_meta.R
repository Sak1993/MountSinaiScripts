library(dplyr)
library(qqman)
library(data.table)

#change ancestry group here
setwd("/sc/arion/projects/ipm/gottas01/ACEi_project/results/")
AA_out <- fread("final_meta.tbl",header=TRUE,sep=" ")
colnames(AA_out) <- c("MarkerName","Allele1","Allele2","Freq1","FreqSE","MinFreq","MaxFreq","Weight","Zscore","P.value","Direction","HetISq","HetChiSq","HetDf","HetPVal","A2_AC","CHR","POS")
AA_reformat <- AA_out %>% select(MarkerName,CHR,POS,P.value)
names(AA_reformat)[1] <- "SNP"
names(AA_reformat)[3] <- "BP"
names(AA_reformat)[4] <- "P"
#AA_filt <- subset(AA <- reformat, P < 0.00001)
AA_filtered <- AA_reformat[!AA_reformat$P %in% 0,]
AA_filtered$CHR <- gsub("chr","",AA_filtered$CHR)
AA_filtered$CHR <- as.numeric(AA_filtered$CHR)

setwd("/sc/arion/projects/ipm/gottas01/ACEi_project/results/")
#change ancestry group here X2
png("meta_analysis_qqplot.png")
#change title here
qq(AA_reformat$P,main="Meta-analysis ACEi qqplot")
dev.off()

#change ancestry group here
png("meta_analysis_manhattan.png")

#change title here
manhattan(AA_filtered,main="Meta Analysis ACEi Manhattan Plot")
dev.off()
