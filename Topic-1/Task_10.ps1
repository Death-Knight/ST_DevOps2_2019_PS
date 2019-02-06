# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#10.	Просмотреть список методов и свойств объекта типа строка

cls
$str = "DevOps"
$str | Get-Member -MemberType Method | Sort-Object Name
"===Separator==="
$str | Get-Member -MemberType Properties | Sort-Object Name

