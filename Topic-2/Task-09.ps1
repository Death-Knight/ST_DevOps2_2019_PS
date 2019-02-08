# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#9.	Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.

Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft | Export-Csv -Path C:\temp\key.csv
# работает только с админправами