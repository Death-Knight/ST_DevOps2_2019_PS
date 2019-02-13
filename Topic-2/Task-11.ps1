# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#11.	Загрузить данные из полученного в п.10 xml-файла
# и вывести в виде списка информацию о каждой записи, в виде 5 любых (выбранных Вами) свойств.

$myHistory = Import-Clixml -Path "c:\TEMP\history.xml"

$myHistory | Select-Object ID, CommandLine, StartExecutionTime, ExecutionStatus, EndExecutionTime | Format-List
