# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#17.	�������� ���� � �����, ����� ��� ������� ������� �explorer�. �������� ����� ��� ���� ������

cls
$exp = Get-Process explorer
"Start Time: " + $exp.StartTime + " or " + $exp.StartTime.DateTime
"Start Day: " + $exp.StartTime.DayOfWeek
