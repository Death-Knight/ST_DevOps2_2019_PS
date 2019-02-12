# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#8.	Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp

Get-ChildItem -Path "C:\Windows" -Recurse -Exclude "*.tmp" -Force `
    -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum
