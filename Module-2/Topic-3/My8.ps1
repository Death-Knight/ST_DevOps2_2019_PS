# ST_DevOps2_2019_Viktar_Tsybulko_2_3
# 
#8.	Подсчитать размер занимаемый файлами в папке
#  C:\windows (и во всех подпапках) за исключением файлов *.tmp

[CmdletBinding()]
# Parameter help description

Param (    
    [string]$PathTo = 'C:\Windows'
)

Get-ChildItem -Path $PathTo -Recurse -Exclude "*.tmp" -Force `
    -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum
