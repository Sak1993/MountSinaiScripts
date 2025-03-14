library(tidyverse)
library(parallel)
if (!require(devtools)) install.packages("devtools")
devtools::install <- github("gaospecial/ggVennDiagram")
install.packages("ggVennDiagram")
library("ggVennDiagram")
library(VennDiagram)


#Regeneron Data 

RegeneronData <- read.delim('/sc/arion/projects/ipm/Sema4QC/WES-QC/pipeline_QC_V1/analysis/5_GSAGDAIntersection/old/RegAllchr.txt',sep = "")

colnames(RegeneronData) <- c("CHROM","POS")

RegeneronData$CHROM_POS <- paste(RegeneronData$CHROM,RegeneronData$POS,sep = "_")

#Sema4 Data 

Sema4Data <- read.delim("/sc/arion/projects/ipm/gottas01/Sema4NewAllchr.txt", sep = "")

colnames(Sema4Data) <- c("CHROM","POS")

Sema4Data$CHROM_POS <- paste(Sema4Data$CHROM,Sema4Data$POS,sep = "_") 

#Venn Diagram 

set1 <- paste(RegeneronData$CHROM_POS)

set2 <- paste(Sema4Data$CHROM_POS)

x1 = list(set1,set2)

Venn1 <- venn.diagram(
                        x = list(set1, set2),
                          category.names = c("Regeneron" , "Sema4"),
                          filename = 'RegSema4Newvenndiagram.png',
                          print.mode = c("raw","percent"),
                            output=TRUE
                          )

VennDiagram <- ggVennDiagram(x1,category.names=c("Regeneron","Sema4"),
                             fill_color =  c("#0073C2FF", "#EFC000FF"),
                             filename = "VennDiagram.png",
                                           output=TRUE
                                           )
