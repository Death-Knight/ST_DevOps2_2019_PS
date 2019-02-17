# ST_DevOps2_2019_Viktar_Tsybulko_2_3
#
# Расшифровка http://www.pythonchallenge.com/pc/def/ocr.html
#
# <!--
# find rare characters in the mess below: (смволы в файле code.txt)
# -->
# 

$my_letter = New-Object System.Collections.ArrayList
$my_count = New-Object System.Collections.ArrayList
#init
$my_letter.Add("z")
$my_count.Add(0)
# $my_letter.IndexOf("x")
# $my_letter.Count

function CheckSymbol ([string]$Symbol, [string]$SymbolLine) {
    for ($i = 0; $i -lt $SymbolLine.Length; $i++) {  # бежим по буквам в строке
        if ($my_letter.IndexOf($SymbolLine[$i]) -eq -1) { # если символа строки нет в нашем массиве
            $my_letter.Add($SymbolLine[$i]) # добавляем символ в массив
            $my_count.Add(0)
            $my_count.Add($my_count[$i--]++) # увеличиваем счетчик этого символа
        }
        


        # if ($Symbol -eq $SymbolLine[$i]) {
        #     Write-Output ("Yes")
        # }
        # else {
        #     Write-Output ("No")
        # }
    }   
} 


$filedata = Get-Content -Path "C:\temp\c1.txt"

CheckSymbol -Symbol "z" -SymbolLine $filedata[0]

$my_letter


