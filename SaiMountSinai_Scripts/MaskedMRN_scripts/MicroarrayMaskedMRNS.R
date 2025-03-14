library(tidyverse)
library(parallel)
library(openxlsx)

#Masked MRN list for 1kg Imputed combined V2
M05 <- read.delim('/sc/arion/projects/ipm/gottas01/GSA_GDA_V2.sample',sep = "")

names(M05) <- NULL

M05 <- M05[-1,]

M05_1 <-  as.data.frame(M05[,1], drop=false)

#Masked MRN List for 1kg Imputed combined V2 chrX
M06 <- read.delim('/sc/arion/projects/ipm/gottas01/GSA_GDA_CHR23_V2.sample',sep= "")

names(M06) <- NULL

M06 <- M06[-1,]

M06_1 <- as.data.frame(M06[,1], drop=false)

#Masked MRN List for TOPMed imputed combined V2
M07 <- read.delim('/sc/arion/projects/ipm/gottas01/GSA_GDA_V2_TOPMED.sample',sep = "")

names(M07) <- NULL

M07 <- M07[-1,]

M07_1 <- as.data.frame(M07[,1], drop=false) 

#Masked MRN List for TOPMed imputed combined V2 chrX
M08 <- read.delim('/sc/arion/projects/ipm/gottas01/GSA_GDA_V2_CHR23_TOPMED.sample',sep = "")

names(M08) <- NULL

M08 <- M08[-1,]

M08_1 <- as.data.frame(M08[,1], drop=false)

#Masked MRN List for Genotyped combined V2
M09 <- read.delim('/sc/arion/projects/ipm/gottas01/MaskedMRNSlist/GSA_GDA_genotyped.fam',sep= "")

#names(M09) <- NULL

M09 <- M09[-1,]

M09_1 <- as.data.frame(M09[,1], drop=false)

#Creating an excel file with all Masked MRNS List for the MicroArray Data
require(openxlsx)
list_of_datasets <- list("Genotyped combined V2" = M09_1, "1kg Imputed combined V2" = M05_1, "1kg Imputed combined V2 chrX" = M06_1, "TOPMed imputed combined V2" = M07_1, "TOPMed imputed combined V2 chrX" = M08_1)
Newfile <- write.xlsx(list_of_datasets, file = "MicroarrayMaskedMRNS.xlsx")
