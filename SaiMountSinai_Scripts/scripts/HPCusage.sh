#!/bin/bash

#get list of users and no of files and space used by specific users
#```
#for i in `cat /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/HPCList.txt`;

#do
#   showquota -p "$i" > /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/"$i".txt

#done
#```

#get list of minerva user names from userfile
#```
#awk '{print $2}' /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/ipm.txt > /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/ipmusers.txt
#```
#get list of minerva user names for all the project files along with space used by specific User

#for i in `cat /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/HPCList.txt`

#do 
#   awk '{print $3}'  "$i" > /sc/arion/projects/ipm/HPCUsage/analysis/UserHPCStorage.txt 

#done 


#extract names of the specific users by using Minerva Usernames 

for i in `cat /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/AllusersHPCUsage.txt`

do 
   finger "$i" | awk '{print $2,$3,$4}'

#   awk '{print $1,$2}' | finger  

done

#for i in `cat /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/HPCList.txt`

#do 
#   awk '{print $2,$3}' "$i" | finger

#done

awk -F, -vOFS=, '(NR==FNR){a[$1]=$0; next}
                   {
                                            if(a[$1]){print $0,a[$1]}
                                                                     else{print $0,"no match"}
                                                                                           }' /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/HPCUserlist.txt /sc/arion/projects/ipm/gottas01/HPCUsage/analysis/UserUsage.txt 
