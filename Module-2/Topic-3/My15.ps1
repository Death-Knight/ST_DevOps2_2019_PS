# ST_DevOps2_2019_Viktar_Tsybulko_2_3
# 
## 1.5.	Создать один скрипт, объединив 3 задачи:
# 1.5.1.	Сохранить в CSV-файле информацию обо всех обновлениях безопасности ОС.
# 1.5.2.	Сохранить в XML-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
# 1.5.3.	Загрузить данные из полученного в п.1.5.1 или п.1.5.2 файла и вывести в виде списка  разным разными цветами

[CmdletBinding()]
# Parameter help description

Param (    
    [string]$FullPathTo = 'C:\temp\',
    [string]$FileNameCSV = 'Hotfix.csv',
    [string]$FileNameXML = 'Hotfix.xml'
)
# Сохранить в CSV-файле информацию обо всех обновлениях безопасности ОС.
Get-HotFix | Export-Csv -Path ($FullPathTo + $FileNameCSV) 

# Сохранить в XML-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
Get-ChildItem -Path 'HKLM:\SOFTWARE\Microsoft' -ErrorAction SilentlyContinue | Export-Clixml -Path ($FullPathTo + $FileNameXML) 

# Загрузить данные из полученных в п.1.5.1 или п.1.5.2 файлов
$myCSV = Import-Csv -Path ($FullPathTo + $FileNameCSV)
foreach ($i in $myCSV) {
    Write-Host -f "Yellow" $i.CSName, $i.Description, $i.HotFixID, $i.InstalledOn    
}

$myHKLM = Import-Clixml -Path ($FullPathTo + $FileNameXML) 
foreach ($i in $myHKLM) {
    Write-Host -f "Green" $i
}
