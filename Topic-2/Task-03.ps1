# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#3.	Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.

$MyRootFolder = "C:\M2T2_Tsybulko"

New-Item -Path $MyRootFolder -ItemType Directory
Set-Location $MyRootFolder
New-PSDrive -Name MyDrive -PSProvider FileSystem -Root $MyRootFolder
New-Item -Path .\MyDrive\1 -ItemType Directory
New-Item -Path .\MyDrive\qzx.txt -ItemType File
Get-PSDrive | Format-Table

# Remove-PSDrive -PSProvider FileSystem -Name MyDrive
# Get-PSDrive
# Remove-Item -Path $MyRootFolder -Recurse
