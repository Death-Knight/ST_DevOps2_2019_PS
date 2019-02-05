# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#18.	Откройте любой документ в MS Word (не важно как) и закройте его с помощью PowerShell
# Буду делать с экселем, потому что в ворде открыто много документов, не охота переоткрывать их все,
# пока пишу и тестирую скрипт.

# Вариант 1
cls
[String]$ExcelDocument = "c:\temp\new.xlsx"
Invoke-Item -Path $ExcelDocument

#[String]$ExcelDocumentFolder = New-Item -ItemType Directory "d:\temp\"
#[String]$ExcelDocument = New-Item -ItemType File ($ExcelDocumentFolder + "\new.xlsx")
#Invoke-Item -Path $ExcelDocument

$CurrentExcelProcesses = Get-Process -Name excel
Pause "Excel document opened!"
$CurrentExcelProcesses.Kill()
# конец 

# Вариант 2
#Более интересный подход (через COM-объекты можно полностью управлять приложением)
cls
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
