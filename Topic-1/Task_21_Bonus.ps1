# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#21 Расшифровка http://www.pythonchallenge.com/pc/def/map.html
# 
# K -> M
# O -> Q
# E -> G
#
# g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.
#

# идею расшифровки, признаюсь - подглядел, дальше все свое

cls
$EncodedSring = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."

#$EncodedSring.insert(0,"!").remove(1,1)
#$EncodedSring


$b = $EncodedSring.ToCharArray()
$b[0] = "Z"
$b[0]
$EncodedSring = -join $b
$EncodedSring
[string]$b

#[byte]$c
#$c = $b[0]
#[int]$ic
#$ic = [int]$c
#[String]([char]([byte]$b[0] + 2))

#[byte]([char]$EncodedSring[0])


#[String]([char]([byte]([char]$EncodedSring[0]) + 2))
#[String]([char]([byte]([char]$EncodedSring[1]) + 2))
#[String]([char]([byte]([char]$EncodedSring[2]) + 2))

#[string]$s = "!"
#$s + ([int]$b[0]).ToString()
#$s = "!!"
#$s + ([int]$c).ToString()


$result = ""
#$result = $result + [String]1
#$result
#$result = $result + ([String]([char]([byte]([char]$EncodedSring[1]) + 2)))
#$result

for ($i=0; $i -le $b.Count-1; $i++)
{
    if ($b[i] -ne ' ')
    {
       # $result = $result + ([String]([char]([byte]([char]$EncodedSring[i] + 2 ))))
    }
}

$result


#for ($i=0; $i -le ($EncodedSring.Length - 1); $i++)
#{
#    if ($EncodedSring[i] -ne " ")
#    {
#        $result = $result + ([String]([char]([byte]([char]$EncodedSring[i] + 2 ))))
#    }
#}
#$result

cls
$bb="xyz"
$bb
$cb = $bb.ToCharArray()
$cb
$cb[0] = 'a'
$cb
$bb = -join $cb
$bb
