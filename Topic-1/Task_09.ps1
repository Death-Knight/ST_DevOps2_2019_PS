# ST_DevOps2_2019_Viktar_Tsybulko_1_2

#9.	Просмотреть список методов и свойств объекта типа процесс
cls
Get-Process | Get-Member -MemberType Method | Sort-Object Name
"===Separator==="
Get-Process | Get-Member -MemberType Properties


