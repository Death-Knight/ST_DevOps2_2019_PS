# ST_DevOps2_2019_Viktar_Tsybulko_2_3
# 
#5.	Просуммировать все числовые значения переменных среды Windows.
#  (Параметры не нужны)

[CmdletBinding()]
# Parameter help description

Param ()

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
Write-Output ("Total sum of Numeric: $summ")
