# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#1.	Получите справку о командлете справки
Get-Help Get-Help
# или
Get-Help Help

#2. Пункт 1, но детальную справку, затем только примеры
Get-Help -Full
Get-Help -Examples

#3.	Получите справку о новых возможностях в PowerShell 4.0 (или выше)
#Get-Help about
Get-Help about_Windows_PowerShell_5.0

#4.	Получите все командлеты установки значений
# Get-Help -Name "Set-" -Category Cmdlet
Get-Command set* -CommandType Cmdlet

#5.	Получить список команд работы с файлами
# Get-Help -Name "file" -Category Cmdlet
Get-Command *file* -CommandType Cmdlet

#6.	Получить список команд работы с объектами
Get-Command *object* -CommandType Cmdlet

#7.	Получите список всех псевдонимов
Get-Alias

