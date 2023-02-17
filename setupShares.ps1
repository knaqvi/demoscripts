$folderPath = Read-Host "Enter folder path to share"
$shareName = Read-Host "Enter name for the SMB share"

# Create a new SMB share
New-SmbShare -Name $shareName -Path $folderPath -FullAccess "Everyone"

# Grant permission to share to everyone
$Acl = Get-Acl $folderPath
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone","FullControl","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl $folderPath $Acl
