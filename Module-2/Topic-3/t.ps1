[CmdletBinding()]
Param (
    [Parameter(Mandatory=$false)]
    [string]$s='www'
)
'Hallo! ' + $s

# простейший тест
# запуск из директории скрипта
# .\t.ps1 -s vasya [работает]
# .\t.ps1           [не работает]
# если мандатори $true то значение по умолчанию не присваивается для $s !!!
