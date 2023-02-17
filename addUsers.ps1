# Prompt user for AD credentials
$credential = Get-Credential

# Connect to AD
Import-Module ActiveDirectory
Connect-ADDirectoryService -Credential $credential

# Create new group
New-ADGroup -Name "Sales" -GroupCategory Security -GroupScope Global -Path "OU=Groups,DC=domain,DC=com"

# Create new users
New-ADUser -Name "John Smith" -UserPrincipalName "john.smith@domain.com" -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "Password1" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Jane Doe" -UserPrincipalName "jane.doe@domain.com" -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "Password2" -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Bob Johnson" -UserPrincipalName "bob.johnson@domain.com" -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "Password3" -AsPlainText -Force) -Enabled $true

# Add users to group
Add-ADGroupMember -Identity "Sales" -Members "John Smith", "Jane Doe", "Bob Johnson"
