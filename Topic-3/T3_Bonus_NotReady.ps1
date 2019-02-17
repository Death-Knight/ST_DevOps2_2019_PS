# ST_DevOps2_2019_Viktar_Tsybulko_2_3
#
# Расшифровка http://www.pythonchallenge.com/pc/def/ocr.html
#
# <!--
# find rare characters in the mess below: (смволы в файле code.txt)
# -->
# 

[string]$my_letter = @()
# [Int32]$my_count = @()

# $my_letter.Length
# $my_letter += "z"
# $my_letter.Length
# $my_letter[0]

function CheckSymbol ([string]$Symbol, $SymbolArray) {
    Write-Output ($Symbol)
    # Write-Output ()
    foreach ($line in $SymbolArray) {
        Write-Output ($line)
        # for ($i = 0; $i -le $line.Length - 1; $i++) {
        #      $i
        #     if ($Symbol -eq $line[$i]) {
        #         Write-Output ("EQ")
        #         return i
        #     }
        #     else {
        #         Write-Output ("NEQ")
        #         return -1
        #     }
        # }   
    } 
} 


$filedata = Get-Content -Path "C:\temp\c1.txt"

$res = CheckSymbol("z", $filedata)
Write-Output ("RES: " + $res)



# $lcount = 0
# foreach ($line in $feledata) {
#     for ($i = 0; $i -lt $line.Length; $i++) {
#         $lcount++
#     }
# }
# $lcount


# $srt2 = ""
# $srt = Get-Content -Path "C:\temp\c1.txt" | ForEach-Object { $srt2 += $_ } 
# $srt2
# $srt2.Length

# $strx = Get-Content -Path "C:\temp\code.txt"
# $strx[0]
# $strx.Length
# $strx[1].Length

