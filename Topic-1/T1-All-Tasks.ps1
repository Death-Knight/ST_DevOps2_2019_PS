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

#8.	Создайте свой псевдоним для любого командлета
Set-Alias -Name info -Value Get-Host
Get-Alias info
info

#9.	Просмотреть список методов и свойств объекта типа процесс
Get-Process | Get-Member -MemberType Method | Sort-Object Name
"===Separator==="
Get-Process | Get-Member -MemberType Properties

#10.	Просмотреть список методов и свойств объекта типа строка
$str = "DevOps"
$str | Get-Member -MemberType Method | Sort-Object Name
"===Separator==="
$str | Get-Member -MemberType Properties | Sort-Object Name

#11.	Получить список запущенных процессов, данные об определённом процессе
Get-Process
Get-Process -Name Skype
Get-Process -Name Skype -FileVersionInfo
Get-Process -Name Skype -Module
Get-Process -Name chrome


#12.	Получить список всех сервисов, данные об определённом сервисе
Get-Service | Sort-Object Name
Get-Service w* | Sort-Object Status
Get-Service | Sort-Object Status -Descending 
$ser = Get-Service
$ser[10].DisplayName 
$ser[10].Status
Get-Service | Where-Object {$_.Status -eq "Stopped"}
Get-Service wuauserv | Select-Object Displayname,Status,Start,ServiceName,Can*

#13.	Получить список обновлений системы
Get-HotFix

#14.	Узнайте, какой язык установлен для UI Windows
Get-Culture

#15.	Получите текущее время и дату
Get-Date

#16.	Сгенерируйте случайное число (любым способом)
Get-Random 
Get-Random -Maximum 100
Get-Random -Maximum 50
Get-Random -Minimum 30.12 -Maximum 41.98
Get-Random -InputObject 1, 7, 14, 18, 33, 28, 6, 14, 21
Get-Random -InputObject 1, 7, 14, 18, 33, 28, 6, 14, 21 -Count 3

#17.	Выведите дату и время, когда был запущен процесс «explorer». Получите какой это день недели
$exp = Get-Process explorer
"Start Time: " + $exp.StartTime + " or " + $exp.StartTime.DateTime
"Start Day: " + $exp.StartTime.DayOfWeek

#18.	Откройте любой документ в MS Word (не важно как) и закройте его с помощью PowerShell
# Буду делать с экселем, потому что в ворде открыто много документов, не охота переоткрывать их все,
# пока пишу и тестирую скрипт.

# Вариант 1
[String]$ExcelDocument = "c:\temp\new.xlsx"
Invoke-Item -Path $ExcelDocument
$CurrentExcelProcesses = Get-Process -Name excel
Pause "Excel document opened!"
$CurrentExcelProcesses.Kill()
# конец 

# Вариант 2
#Более интересный подход (через COM-объекты можно полностью управлять приложением)
[String]$ExcelDocument = "c:\temp\new.xlsx"
$Excel = New-Object -ComObject Excel.Application
$Excel.Visible = $True
$ExBook = $Excel.Workbooks.Open($ExcelDocument)
$Exsheet = $Excel.WorkSheets.Item(1)
$ExCell = $Exsheet.Cells(1,2)
$ExCell.Value2()
#$ExCell2 = $Exsheet.Cells(3,3)
#$ExCell2.Value2() = "Done!"
#$Excel.Workbooks.Application.Save()
#$Excel.Save()
Pause
$Excel.Quit()
# конец

#19.	Подсчитать значение выражения S= . N – изменяемый параметр
$n = 8
$summ = 0
for ($i=1; $i -le $n; $i++)
{
    $summ = $summ + 3*$i
    "Step " + $i + ". Summ total: " + $summ
}

#20.	Напишите функцию для предыдущего задания. Запустите её на выполнение
function Summa ([int]$n)
{
    $summ = 0
    for ($i=1; $i -le $n; $i++)
    {
        $summ = $summ + $i
    }
    return 3*$summ
}
Summa(6)

