# ST_DevOps2_2019_Viktar_Tsybulko_2_4
# 
# 1.	Вывести список всех классов WMI на локальном компьютере. 

Get-WmiObject -List | Sort-Object -Property Name

# 2.	Получить список всех пространств имён классов WMI.  NameSpace

Get-WMIobject -Namespace "root" -Class "__namespace" | Format-Table Name

# 3.	Получить список классов работы с принтером.

Get-WmiObject -List -Class *Printer* 

# 4.	Вывести информацию об операционной системе, не менее 10 полей.


