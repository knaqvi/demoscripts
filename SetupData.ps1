# Prompt user for folder name
$folderName = Read-Host "Enter folder name"

# Create the folder
New-Item -ItemType Directory -Path $folderName

# Prompt user for file name
$fileName = Read-Host "Enter file name (without extension)"

# Create 10 files with the specified name and size
for ($i = 1; $i -le 10; $i++) {
    $filePath = $folderName + "\" + $fileName + $i.ToString() + ".txt"
    $stream = New-Object System.IO.FileStream($filePath, [System.IO.FileMode]::Create)
    $stream.SetLength(5GB)
    $stream.Close()
    Write-Host "Created file: " $filePath
}
