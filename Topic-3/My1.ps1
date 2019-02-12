# ST_DevOps2_2019_Viktar_Tsybulko_2_3
# 
#1.	Просмотреть содержимое ветви реeстра HKCU

[CmdletBinding()]
# Parameter help description

Param (
    #[Parameter(Mandatory=$true)]
    [string]$RegPath = "HKCU:"
)
Get-ChildItem -Path $RegPath
