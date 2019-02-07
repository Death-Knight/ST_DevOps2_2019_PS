# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# Test Command File

Get-Process | Where-Object {$_.Name.Length -lt 5} 

Get-Process | Get-ChildItem -

Get-Command *file* -CommandType Function
Get-Process | Select -first 10