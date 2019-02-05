# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#18.	Откройте любой документ в MS Word (не важно как) и закройте его с помощью PowerShell
# Буду делать с экселем, потому что в ворде открыто много документов, не охота переоткрывать их все,
# пока пишу и тестирую скрипт.

#Совсем жесткий вариант
cls
[String]$ExcelDocument = "c:\temp\new.xlsx"
Invoke-Item -Path $ExcelDocument

#[String]$ExcelDocumentFolder = New-Item -ItemType Directory "d:\temp\"
#[String]$ExcelDocument = New-Item -ItemType File ($ExcelDocumentFolder + "\new.xlsx")
#Invoke-Item -Path $ExcelDocument

$CurrentExcelProcesses = Get-Process -Name excel
Pause "Excel document opened!"
$CurrentExcelProcesses.Kill()
# конец жесткого варианта


#Более интересный подход (через COM-объекты можно полностью управлять приложением)
cls
[String]$ExcelDocument = "c:\temp\new.xlsx"
$Excel = New-Object -ComObject Excel.Application
$Excel.Visible = $True
$ExBook = $Excel.Workbooks.Open($ExcelDocument)


#$sheet = $Excel.cells(3,3).
$Exsheet = $Excel.WorkSheets.Item(1)
$Exsheet.Cells(4,1)

$ExCell = $Exsheet.ToString()
$ExCell


#$Excel.ActiveWorkbook

$Excel.Quit()






[String]$WordDocument = "C:\temp\new.docx"
Invoke-Item -Path $WordDocument

$CurrentTime = Get-Date

$CurrentWordProcesses = Get-Process -Name WINWORD
$CurrentWordProcesses