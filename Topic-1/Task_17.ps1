# ST_DevOps2_2019_Viktar_Tsybulko_2_1

#17.	Выведите дату и время, когда был запущен процесс «explorer». Получите какой это день недели

cls
$exp = Get-Process explorer
"Start Time: " + $exp.StartTime + " or " + $exp.StartTime.DateTime
"Start Day: " + $exp.StartTime.DayOfWeek

