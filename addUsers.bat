@echo off
set /p adminuser=Enter your AD username: 
set /p password=Enter your AD password: 

net user %adminuser% /domain

dsadd group "CN=Sales,CN=Users,DC=talabs,DC=local"
dsadd user "CN=Kashif Naqvi,CN=Users,DC=talabs,DC=local" -pwd Password2 -mustchpwd yes
dsadd user "CN=Randy Jurdi,CN=Users,DC=talabs,DC=local" -pwd Password1 -mustchpwd yes

dsmod group "CN=Sales,CN=Users,DC=talabs,DC=local" -addmbr "CN=Kashif Naqvi,OU=Users,DC=talabs,DC=local"
dsmod group "CN=Sales,CN=Users,DC=talabs,DC=local" -addmbr "CN=Randy Jurdi,OU=Users,DC=talabs,DC=local"
