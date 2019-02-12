# ST_DevOps2_2019_Viktar_Tsybulko_2_3
# 
#5.	Вывести список из 10 процессов занимающих дольше всего процессор.
# Результат записывать в файл.

[CmdletBinding()]
# Parameter help description

Param (    
    [int32]$NumberOfProcesses = 3,
    [string]$PathTo = 'c:\Top10Process.txt'
)
$p = Get-Process | Sort-Object CPU -Descending | Select-Object -First $NumberOfProcesses
$p | Out-File -FilePath $PathTo
