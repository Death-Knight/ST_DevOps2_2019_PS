# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#2.	Создать, переименовать, удалить каталог на локальном диске

$MyRootFolder = "d:\DevOp2019"
$MyFolder = $MyRootFolder + "\1\2"
$myNewName = "New-Devops"

New-Item -Path $MyFolder -ItemType Directory
Rename-Item -Path $MyRootFolder -NewName $myNewName
Remove-Item -Path D:\$myNewName -Recurse
