# ST_DevOps2_2019_Viktar_Tsybulko_2_5
# 

# поскольку на всех вм одна учетка с одинаковыми данными
# зарегистрируем учетные данные 1 раз
$myPassport = Get-Credential Administrator

$vm1_Address = 169.254.56.25
$vm2_Address = 169.254.97.95
$vm3_Address = 169.254.186.90

# 1.	При помощи WMI перезагрузить все виртуальные машины.

$r = Get-WmiObject win32_operatingsystem -Credential $myPassport -ComputerName $vm1_Address
$r.Reboot()

