# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#18.	�������� ����� �������� � MS Word (�� ����� ���) � �������� ��� � ������� PowerShell
# ���� ������ � �������, ������ ��� � ����� ������� ����� ����������, �� ����� ������������� �� ���,
# ���� ���� � �������� ������.

#������ ������� �������
cls
[String]$ExcelDocument = "c:\temp\new.xlsx"
Invoke-Item -Path $ExcelDocument

#[String]$ExcelDocumentFolder = New-Item -ItemType Directory "d:\temp\"
#[String]$ExcelDocument = New-Item -ItemType File ($ExcelDocumentFolder + "\new.xlsx")
#Invoke-Item -Path $ExcelDocument

$CurrentExcelProcesses = Get-Process -Name excel
Pause "Excel document opened!"
$CurrentExcelProcesses.Kill()
# ����� �������� ��������


#����� ���������� ������ (����� COM-������� ����� ��������� ��������� �����������)
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