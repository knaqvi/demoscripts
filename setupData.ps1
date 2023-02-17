# Prompt user for folder name
$folderName = Read-Host "Enter folder name"

# Create the folder
New-Item -ItemType Directory -Path $folderName

# Prompt user for file name prefix
$fileNamePrefix = Read-Host "Enter file name prefix"

# Create 10 files with 5GB size
for ($i = 1; $i -le 10; $i++) {
    $fileName = $fileNamePrefix + $i.ToString().PadLeft(2, '0') + ".txt"
    $filePath = Join-Path $folderName $fileName
    Write-Host "Creating file $fileName..."
    fsutil file createnew $filePath 5000000000
}
