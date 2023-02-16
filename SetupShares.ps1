# Prompt the user for the folder name and file names
$folderName = Read-Host "Enter the name of the folder"
$fileNamePrefix = Read-Host "Enter the prefix for the file names"

# Create the folder
New-Item -ItemType Directory -Path $folderName

# Generate 10 1GB files
for ($i = 1; $i -le 10; $i++) {
    $fileName = $fileNamePrefix + $i.ToString("00") + ".txt"
    $filePath = Join-Path $folderName $fileName
    $fileStream = New-Object IO.FileStream $filePath, Create, ReadWrite
    $fileStream.SetLength(1GB)
    $fileStream.Close()
}
