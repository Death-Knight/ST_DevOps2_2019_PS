# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#20.	�������� ������� ��� ����������� �������. ��������� � �� ����������

cls

function Summa ([int]$n)
{
    $summ = 0
    for ($i=1; $i -le $n; $i++)
    {
        $summ = $summ + $i
    }
    return 3*$summ
}

Summa(6)

