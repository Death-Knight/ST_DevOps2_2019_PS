# ST_DevOps2_2019_Viktar_Tsybulko_2_3
# 
#2.	Создать, переименовать, удалить каталог на локальном диске

[CmdletBinding()]
# Parameter help description

Param (
    #[Parameter(Mandatory=$true)]
    [string]$DriveLetter = 'C',
    [string]$RootFolder = 'DevOp2019',
    [string]$NewNameFolder = 'New-Devops'
)

$MyFolder = $DriveLetter + ':\' + $RootFolder + '\1\2'
New-Item -Path $MyFolder -ItemType Directory
Start-Sleep 2
$MyFolder = $DriveLetter + ':\' + $RootFolder
Rename-Item -Path $MyFolder -NewName $NewNameFolder
$MyFolder = $DriveLetter + ':\' + $NewNameFolder
Start-Sleep 2
Remove-Item -Path $MyFolder -Recurse
