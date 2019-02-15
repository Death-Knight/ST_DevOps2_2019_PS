# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#1.	Просмотреть содержимое ветви реeстра HKCU

Get-ChildItem -Path HKCU:

#2.	Создать, переименовать, удалить каталог на локальном диске

$MyRootFolder = "d:\DevOp2019"
$MyFolder = $MyRootFolder + "\1\2"
$myNewName = "New-Devops"

New-Item -Path $MyFolder -ItemType Directory
Rename-Item -Path $MyRootFolder -NewName $myNewName
Remove-Item -Path D:\$myNewName -Recurse

#3.	Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.

$MyRootFolder = "C:\M2T2_Tsybulko"
New-Item -Path $MyRootFolder -ItemType Directory
Set-Location $MyRootFolder
New-PSDrive -Name MyDrive -PSProvider FileSystem -Root $MyRootFolder
New-Item -Path .\MyDrive\1 -ItemType Directory
New-Item -Path .\MyDrive\qzx.txt -ItemType File
Get-PSDrive | Format-Table
# Remove-PSDrive - Task 12

#4.	Сохранить в текстовый файл на созданном диске список запущенных(!) служб. 

Get-PSDrive 
Get-Service | Where-Object {$_.Status -eq "Running"} | Sort-Object Name | Out-File .\MyDrive\run_ser.txt

#5.	Просуммировать все числовые значения переменных текущего сеанса.

Function Is-Numeric ($Value) {
    Return $Value -match "^[\d\.]+$"
}

$NumericVars = Get-Variable | Where-Object {Is-Numeric($_.Value) -eq $true}
$summ = 0
Write-Output "Digital Variables Value:"
foreach ($item in $NumericVars) {
    Write-Output ($item.Name + " - " + $item.Value)
    $summ += $item.Value
}
Write-Output ("Total sum of Numeric: " + $summ)

#6.	Вывести список из 6 процессов занимающих дольше всего процессор.

Get-Process | Sort-Object CPU -Descending | Select-Object -First 6

#7.	Вывести список названий и занятую виртуальную память (в Mb) каждого процесса,
#  разделённые знаком тире, при этом если процесс занимает более 100Mb – 
#  выводить информацию красным цветом, иначе зелёным.

Get-Process | Sort-Object VirtualMemorySize -Descending | ForEach-Object {
    if (($_.VirtualMemorySize/1024/1024) -gt 100) {
        Write-Host -f "Red" $_.Name, (($_.VirtualMemorySize)/1024/1024), Mb -Separator " - "
    }
    else {
        Write-Host -f "Green" $_.Name, (($_.VirtualMemorySize)/1024/1024), Mb -Separator " - "
    }
}

#8.	Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp

Get-ChildItem -Path "C:\Windows" -Recurse -Exclude "*.tmp" -Force `
    -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum

#9.	Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.

Get-ChildItem -Path 'HKLM:\SOFTWARE\Microsoft' -ErrorAction SilentlyContinue | Export-Csv -Path C:\temp\key.csv    

#10.	Сохранить в XML -файле историческую информацию о командах выполнявшихся в текущем сеансе работы PS.

Get-History | Export-Clixml -Path "c:\TEMP\history.xml"

#11.	Загрузить данные из полученного в п.10 xml-файла
# и вывести в виде списка информацию о каждой записи, в виде 5 любых (выбранных Вами) свойств.

$myHistory = Import-Clixml -Path "c:\TEMP\history.xml"
$myHistory | Select-Object ID, CommandLine, StartExecutionTime, ExecutionStatus, EndExecutionTime | Format-List

#12.	Удалить созданный диск и папку С:\M2T2_ФАМИЛИЯ

$MyRootFolder = "C:\M2T2_Tsybulko"
Get-PSDrive | Format-Table
Remove-PSDrive -PSProvider FileSystem -Name MyDrive
Get-PSDrive
Remove-Item -Path $MyRootFolder -Recurse
