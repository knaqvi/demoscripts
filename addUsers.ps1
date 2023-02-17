# Prompt user for AD credentials
$credential = Get-Credential

# Connect to AD
Import-Module ActiveDirectory
Connect-ADDirectoryServer -Credential $credential

# Create new group
New-ADGroup -Name "Sales" -GroupCategory Security -GroupScope Global -Path "CN=Groups,DC=talabls,DC=local"

# Create new users
New-ADUser -Name "Kashif Naqvi" -UserPrincipalName "kashif.naqvi@talabs.local" -Path "CN=Users,DC=talabls,DC=local" -AccountPassword (ConvertTo-SecureString "Password2" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Randy Jurdi" -UserPrincipalName "randy.jurdi@talabs.local" -Path "CN=Users,DC=talabls,DC=local" -AccountPassword (ConvertTo-SecureString "Password1" -AsPlainText -Force) -Enabled $true

# Add users to group
Add-ADGroupMember -Identity "Sales" -Members "Randy Jurdi", "Kashif Naqvi"
