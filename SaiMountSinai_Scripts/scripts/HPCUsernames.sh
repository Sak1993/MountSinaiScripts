#!/bin/bash
#initializing the environment with R? Probably depends on who is starting the cron job

source /usr/share/lmod/lmod/init/profile

ml showquota/1.0
ml R

# Get the current date in the desired format (YYYY-MM-DD)
current_date=$(date +%Y-%m-%d)

# Create a directory using the current date
#mkdir "/sc/arion/projects/ipm/gottas01/HPCUsage/results/$current_date"
mkdir "/sc/arion/projects/ipm/sai/HPCUsage_MonthlyReports/$current_date"
#cd /sc/arion/projects/ipm/gottas01/HPCUsage/results/$current_date/
cd /sc/arion/projects/ipm/sai/HPCUsage_MonthlyReports/$current_date/

#Get User list for specific directories along with usage
for i in `cat /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/HPCList.txt`;
do
   showquota -p "$i" > "$i".txt
done 

#get usernames using finger command 
for i in `cat /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/HPClist.txt`;
do
   cat "$i" | tail -n +2 | awk '{print $2}' | while read line; do
    finger $line | head -n1 | sed 's/*Login://' 
 done  | grep -v "finger:" | sed 's/Login://g' | sed 's/Name://g' > HPCnamelogin_"$i"   

#Get Username Size and Directory name
cat "$i" | tail -n +2 | awk '{print $1,$2,$3}' | grep -v -e "User" -e "Last" > HPC"$i"size.txt

done

Rscript /sc/arion/projects/ipm/gottas01/HPCUsage/scripts/HPCMerged.R



















