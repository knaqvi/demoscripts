@echo off
set /p adminuser=Enter your AD username: 
set /p password=Enter your AD password: 

net user %adminuser% /domain

:: Adding Sales Group
dsadd group "CN=Sales,CN=Users,DC=talabs,DC=local"

:: Adding Managers
dsadd user "CN=AJ Aquino,CN=Users,DC=talabs,DC=local" -pwd Password2 -mustchpwd yes -title "Senior Sales Engineer" -office "Los Angeles" -memberof "Sales" -dept "Enterprise Sales"
dsadd user "CN=Brad Hirsch,CN=Users,DC=talabs,DC=local" -pwd Password1 -mustchpwd yes -title "Senior Account Executive" -office "Los Angeles" -memberof "Sales" -dept "Enterprise Sales"

:: Adding Sales Team
dsadd user "CN=Kashif Naqvi,CN=Users,DC=talabs,DC=local" -pwd Password2 -mustchpwd yes -title "Senior Sales Engineer" -office "Los Angeles" -mgr "AJ Aquino" -memberof "Sales" -dept "Enterprise Sales"
dsadd user "CN=Randy Jurdi,CN=Users,DC=talabs,DC=local" -pwd Password1 -mustchpwd yes -title "Senior Account Executive" -office "Los Angeles" -mgr "Brad Hirsch" -memberof "Sales" -dept "Enterprise Sales"

:: Adding Entire team to Sales Group
dsmod group "CN=Sales,CN=Users,DC=talabs,DC=local" -addmbr "CN=Kashif Naqvi,CN=Users,DC=talabs,DC=local"
dsmod group "CN=Sales,CN=Users,DC=talabs,DC=local" -addmbr "CN=Randy Jurdi,CN=Users,DC=talabs,DC=local"
