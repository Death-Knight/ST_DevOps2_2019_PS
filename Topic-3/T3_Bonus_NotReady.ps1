# ST_DevOps2_2019_Viktar_Tsybulko_2_3
#
# Расшифровка http://www.pythonchallenge.com/pc/def/ocr.html
#
# <!--
# find rare characters in the mess below: (смволы в файле code.txt)
# -->
# 
 
$srt2 = ""
$srt = Get-Content -Path "C:\temp\c1.txt" | ForEach-Object { $srt2 += $_ } 
$srt2
$srt2.Length

$strx = Get-Content -Path "C:\temp\code.txt"
$strx[0]
$strx.Length
$strx[1].Length

