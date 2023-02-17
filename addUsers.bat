@echo off
set /p adminuser=Enter your AD username: Administrator
set /p password=Enter your AD password: 

net user %adminuser% /domain

:: Adding Sales Group
dsadd group "CN=Sales,CN=Users,DC=talabs,DC=local"

:: Adding Managers
dsadd user "CN=AJ Aquino,CN=Users,DC=talabs,DC=local" -fn AJ -ln Aquino -pwd Password2 -mustchpwd yes -title "Senior Sales Engineer" -office "Los Angeles" -memberof "CN=Sales,CN=Users,DC=talabs,DC=local" -dept "Enterprise Sales"
dsadd user "CN=Brad Hirsch,CN=Users,DC=talabs,DC=local" -fn Brad -ln Hirsch -pwd Password1 -mustchpwd yes -title "Senior Account Executive" -office "Los Angeles" -memberof "CN=Sales,CN=Users,DC=talabs,DC=local" -dept "Enterprise Sales"

:: Adding Sales Team
dsadd user "CN=Kashif Naqvi,CN=Users,DC=talabs,DC=local" -fn Kashif -ln Naqvi -pwd Password2 -mustchpwd yes -title "Senior Sales Engineer" -office "Los Angeles" -mgr "CN=AJ Aquino,CN=Users,DC=talabs,DC=local" -memberof "CN=Sales,CN=Users,DC=talabs,DC=local" -dept "Enterprise Sales"
dsadd user "CN=Randy Jurdi,CN=Users,DC=talabs,DC=local" -fn Randy -ln Jurdi -pwd Password1 -mustchpwd yes -title "Senior Account Executive" -office "Los Angeles" -mgr "CN=Brad Hirsch,CN=Users,DC=talabs,DC=local" -memberof "CN=Sales,CN=Users,DC=talabs,DC=local" -dept "Enterprise Sales"

:: Adding Entire team to Sales Group
:: dsmod group "CN=Sales,CN=Users,DC=talabs,DC=local" -addmbr "CN=Kashif Naqvi,CN=Users,DC=talabs,DC=local"
:: dsmod group "CN=Sales,CN=Users,DC=talabs,DC=local" -addmbr "CN=Randy Jurdi,CN=Users,DC=talabs,DC=local"
