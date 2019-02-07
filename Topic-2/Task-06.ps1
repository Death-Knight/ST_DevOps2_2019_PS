# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#6.	Вывести список из 6 процессов занимающих дольше всего процессор.

Get-Process | Sort-Object CPU -Descending | Select-Object -First 6
