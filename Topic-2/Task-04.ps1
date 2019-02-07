# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#4.	Сохранить в текстовый файл на созданном диске список запущенных(!) служб. 

Get-PSDrive 
Get-Service | Where-Object {$_.Status -eq "Running"} | Sort-Object Name | Out-File .\MyDrive\run_ser.txt
