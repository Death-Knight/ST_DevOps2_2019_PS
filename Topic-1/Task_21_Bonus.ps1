# ST_DevOps2_2019_Viktar_Tsybulko_2_1
#
#21 Расшифровка http://www.pythonchallenge.com/pc/def/map.html
# 
# K -> M
# O -> Q
# E -> G
#
# g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.
#
# алгоритм расшифровки без кода реализации, признаюсь - подглядел, дальше cам

cls
$EncodedSring = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
$result = ""
$onof = 0

for ($i=0; $i -le $EncodedSring.Length - 1; $i++)
{
    $onof = 1
    switch ($EncodedSring[$i])
    {
    " " {$result += $EncodedSring[$i]
            $onof = 0
        }
    "." {$result += $EncodedSring[$i]
            $onof = 0
        }
    "'" {$result += $EncodedSring[$i]
            $onof = 0
        }
    "(" {$result += $EncodedSring[$i]
            $onof = 0
        }
    ")" {$result += $EncodedSring[$i]
            $onof = 0
        }
    }
    if ($onof -eq 1)
    {
        $j = [byte][char]$EncodedSring[$i] + 2
        if ($j -gt 122)
        {
            $j = $j - 122 + 96
        }
        $result = $result + [String][char]$j
    }
}
$result


#$EncodedSring.insert(0,"!").remove(1,1)
# рабочий способ замены буквы в строке

#if ($EncodedSring[$i] -ne (" " -or "." -or "'" -or "(" -or ")"))
# так почему-то не работает ...
# поэтому перейдем на оператор switch

#[byte][char]'a'
#[byte][char]'z'

#$b = $EncodedSring.ToCharArray()
#$b[0] = "Z"
#$b[0]
#$EncodedSring = -join $b
#$EncodedSring
#[string]$b

#[byte]$c
#$c = $b[0]
#[int]$ic
#$ic = [int]$c
#[String]([char]([byte]$b[0] + 2))

#[byte]([char]$EncodedSring[0])
#[String]([char]([byte]([char]$EncodedSring[0]) + 2))

#[string]$s = "!"
#$s + ([int]$b[0]).ToString()
#$s = "!!"
#$s + ([int]$c).ToString()

#cls
#$bb="xyz"
#$bb
#$cb = $bb.ToCharArray()
#$cb
#$cb[0] = 'a'
#$cb
#$bb = -join $cb
#$bb

