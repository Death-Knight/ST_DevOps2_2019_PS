# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#10.	Сохранить в XML -файле историческую информацию о командах выполнявшихся в текущем сеансе работы PS.

Get-History | Export-Clixml -Path "c:\TEMP\history.xml"
