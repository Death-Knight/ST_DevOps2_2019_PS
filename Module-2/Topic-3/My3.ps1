# ST_DevOps2_2019_Viktar_Tsybulko_2_3
# 
#3.	Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.

[CmdletBinding()]
# Parameter help description

Param (
    #[Parameter(Mandatory=$true)]
    [string]$VirtualDiskName = 'MyName'
)

$RootFolder = "C:\M2T2_Tsybulko"
New-Item -Path $RootFolder -ItemType Directory
New-PSDrive -Name $VirtualDiskName -PSProvider FileSystem -Root $RootFolder -Scope Global
Get-PSDrive | Format-Table
