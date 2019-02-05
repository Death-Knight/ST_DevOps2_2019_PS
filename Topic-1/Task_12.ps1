# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#12.	Получить список всех сервисов, данные об определённом сервисе

cls
Get-Service | Sort-Object Name

Get-Service | Sort-Object Status -Descending 

$ser = Get-Service
$ser[10].DisplayName 
$ser[10].Status

Get-Service | Where-Object {$_.Status -eq "Stopped"}

Get-Service wuauserv | Select Displayname,Status,Start,ServiceName,Can*
