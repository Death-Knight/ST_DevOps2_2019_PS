# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#5.	Просуммировать все числовые значения переменных текущего сеанса.

Function Is-Numeric ($Value) {
    Return $Value -match "^[\d\.]+$"
}

$NumericVars = Get-Variable | Where-Object {Is-Numeric($_.Value) -eq $true}
$summ = 0
Write-Host Digital Variables Value:
foreach ($item in $NumericVars) {
    Write-Host $item.Name, $item.Value -Separator " - "
    $summ += $item.Value
}
Write-Host Total sum of Numeric: $summ
