# Prompt user for AD credentials
$credential = Get-Credential

# Connect to AD
Import-Module ActiveDirectory
Connect-ADDirectoryServer -Credential $credential

# Create new group
New-ADGroup -Name "Sales" -GroupCategory Security -GroupScope Global -Path "OU=Groups,DC=domain,DC=com"

# Create new users
New-ADUser -Name "Randy Jurdi" -UserPrincipalName "randy.jurdi@talabs.local" -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "Password1" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Kashif Naqvi" -UserPrincipalName "kashif.naqvi@talabs.local" -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "Password2" -AsPlainText -Force) -Enabled $true

# Add users to group
Add-ADGroupMember -Identity "Sales" -Members "Randy Jurdi", "Kashif Naqvi"
