# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#12.	Удалить созданный диск и папку С:\M2T2_ФАМИЛИЯ

$MyRootFolder = "C:\M2T2_Tsybulko"

Get-PSDrive | Format-Table
Remove-PSDrive -PSProvider FileSystem -Name MyDrive
Get-PSDrive
Remove-Item -Path $MyRootFolder -Recurse
