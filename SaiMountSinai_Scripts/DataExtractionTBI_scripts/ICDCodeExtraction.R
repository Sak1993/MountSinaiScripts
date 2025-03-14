library(data.table)



#Read the encounter diagnosis file from regen directory
#ffcd /sc/private/regen/data/BioMe/BRSPD/Files/Encounter_Diagnosis.txt

file1 <- fread("/sc/private/regen/data/BioMe/BRSPD/Encounter_Diagnosis.txt",header=TRUE, sep="|",stringsAsFactors=FALSE,quote="")

colnames(file1) <- c("Sample","rgnid","dx_code1","dx_code_type","dx_name","contact_date","dx_qualifier","primary_dx_yn","dx_chronic_yn","encounter_date") 
#disease <-file[grepl(“Z87.820"
#i#                    ,"S06.9XAA","S06.9X0S","S06.9X1S","S06.9X4A","S06.9X9S"," file$dx_code1),]

disease <- file1[grep
#Get the unique IDs of people with the ICD codes

ppl_w_disease <- unique(disease[,1])

#Write the file containing the unique IDs to your project directory

write.csv(ppl_w_disease, “/sc/projects/ipm/gottas01/ppl_w_disease.csv” ,row.names=FALSE,quote=FALSE)


