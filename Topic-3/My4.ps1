# ST_DevOps2_2019_Viktar_Tsybulko_2_3
# 
# 4. Сохранить в текстовый файл на созданном диске список запущенных(!) служб. 
# Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.

[CmdletBinding()]
# Parameter help description

Param (
    [Parameter(Mandatory=$true)]
    [string]$VirtualDiskName
)
New-Item -Path $VirtualDiskName -ItemType Directory
# Get-PSDrive 
$serv = Get-Service | Where-Object {$_.Status -eq "Running"} | Sort-Object Name 
$serv | Out-File ('.\' + $VirtualDiskName + '\run_ser.txt')

Get-ChildItem | Out-Host 

