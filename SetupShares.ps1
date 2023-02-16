# Get the current folder path
$folderPath = (Get-Location).Path

# Get the current user name
$userName = $env:USERNAME

# Create a new share
New-SmbShare -Name $folderPath -Path $folderPath -FullAccess $userName
