# Set the CRAN mirror
#options(repos = "https://cran.case.edu")


library("data.table")    
library("tidyverse")
library("dplyr")
#install.packages("fs")
library("fs")

#setwd("/sc/arion/projects/ipm/gottas01/HPCUsage/results")

#Get Project login and Size 
file_list  <- list.files( pattern = "txtsize") 
file_ls <- lapply(file_list, read.table)
file_df <- Reduce(rbind, file_ls)
file_df <- file_df %>%
   rename(Project = V1,
          Login = V2,
          Size = V3)

file_df$Size_In_Bytes <- fs_bytes(file_df$Size)

#Get Usernames 
filenames_list <- list.files( pattern = "HPCnamelogin_")
filename_ls <- lapply(filenames_list, fread)
filename_df <- Reduce(rbind, filename_ls)
filenames_df <- filename_df %>%
   select(V1, V4) 
filenames_df <- filenames_df %>%
   rename(Login = V1,
          Name = V4)

#Merge two data frames based on Login Column and remove duplicates 
Merged_data <- merge(file_df,filenames_df,by="Login",all=FALSE)
merged_df <- Merged_data[!duplicated(Merged_data), ]

# Reorder columns
merged_df <- merged_df %>%
   select(Login,Name,Project,Size,Size_In_Bytes)

#Summarize the size based on Login
final_df <- merged_df %>% 
   group_by(Login) %>% 
   summarize(Total_Size = fs_bytes(sum(Size_In_Bytes, na.rm = TRUE))) %>%
   arrange(Login)


#Merge Total Size Column  to the merged Data
FinalData<- left_join(merged_df, final_df, by =c ("Login")) %>%
  arrange(Total_Size) 
#   select(-Size_In_Bytes)


#Write final result to a csv file
file <- write.csv(FinalData,"HPCDataTotalSize.csv")


