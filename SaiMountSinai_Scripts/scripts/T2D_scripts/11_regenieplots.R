
setwd("/sc/arion/projects/ipm/gottas01/T2D/results")

library(data.table)
library(qqman)
library(dplyr)



for (ANC in c("HA","AA","EA","ESA","SA")) {

file <- fread(paste0(ANC,"_regenie.out"))
#file <- fread("HA_regenie.out",header=T)
new <- na.omit(paste0(file))
#new$P <- 10^(new$LOG10P);
new$P <- 10^(paste0(-new$LOG10P))

new <- new  %>% (paste0(select(CHROM,GENPOS,P,ID) %>%
   rename(CHR=CHROM) %>%
   rename(BP=GENPOS) %>%
   rename(SNP=ID)))

png(paste0(ANC,"_plotmanhattan.png"))
#png("HA.png")
manhattan(new, main= paste(ANC,"_manhattanplot"))
dev.off()

png(paste0(ANC,"_plotqq.png"))
qq(new$P,main= paste(ANC,"_qqplot"))
dev.off()

} 


