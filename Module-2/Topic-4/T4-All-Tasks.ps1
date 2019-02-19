# ST_DevOps2_2019_Viktar_Tsybulko_2_4
# 
# 1.	Вывести список всех классов WMI на локальном компьютере. 

Get-WmiObject -List | Sort-Object -Property Name

# 2.	Получить список всех пространств имён классов WMI.  NameSpace

Get-Wmiobject -Namespace "root" -Class "__namespace" | Format-Table Name

# 3.	Получить список классов работы с принтером.

Get-WmiObject -List -Class *Printer* 

# 4.	Вывести информацию об операционной системе, не менее 10 полей.

$myComp = Get-WmiObject Win32_OperatingSystem
#$myComp.Properties
Write-Output ("Comp name: " + $myComp.CSName)
Write-Output ("OS name: " + $myComp.Caption)
Write-Output ("Service PAck: " + $myComp.CSDVersion)
Write-Output ("Version: " + $myComp.Version)
Write-Output ("Build: " + $myComp.BuildNumber)
Write-Output ("Architecture: " + $myComp.OSArchitecture)
Write-Output ("Serial: " + $myComp.SerialNumber)
Write-Output ("Manufacturer: " + $myComp.Manufacturer)
Write-Output ("Home Drive: " + $myComp.SystemDrive)
Write-Output ("Home Dir: " + $myComp.WindowsDirectory)
Write-Output ("Boot Device: " + $myComp.BootDevice)
Write-Output ("MUI: " + $myComp.MUILanguages)

# 5.	Получить информацию о BIOS.

$myBIOS = Get-WmiObject Win32_BIOS
$myBIOS.Properties | Format-Table 

# 6.	Вывести свободное место на локальных дисках. На каждом и сумму.

$myFreeSpace = 0
$myDrives = Get-WmiObject Win32_LogicalDisk
foreach ($drive in $myDrives) {
    Write-Output ("Disk " + $drive.DeviceID + " Free Space: " + ($drive.FreeSpace/1GB) + " GB")
    $myFreeSpace += $drive.FreeSpace
}
Write-Output ("Total Free Space: " + $myFreeSpace/1GB + " GB")

# 7.	Написать сценарий, выводящий суммарное время пингования компьютера (например 10.0.0.1) в сети.
# дома удобнее пинговать какой-нить сайт (все виртуалки на работе)

$myStartTime = Get-Date
# $myRemoteComp = "tut.by"
$myRemoteComp = 178.172.160.5
$myPing = Get-WmiObject Win32_PingStatus -Filter "Address='$myRemoteComp'"
if ($myPing.StatusCode -eq 0) { #Success
    $myEndTime = Get-Date
    $myTotalPingTime = $myEndTime - $myStartTime
    Write-Output ("Total PING time: " + $myTotalPingTime.Seconds + " sec.")
    Write-Output ("Total PING time: " + $myTotalPingTime.TotalMilliseconds + " m sec.")
}
else {
    Write-Output ("Host Unavailable.")
}

# 8.	Создать файл-сценарий вывода списка установленных программных продуктов
#  в виде таблицы с полями Имя и Версия.

Get-WmiObject Win32_SoftwareFeature | Select-Object ProductName, Version | Format-Table

# 9.	Выводить сообщение при каждом запуске приложения MS Word.
# сделаю это для Excel. Бунтарь =)))

$metkaID = 0

$Query = 'SELECT * FROM Win32_ProcessStartTrace'            
$action = {            
    $e = $Event.SourceEventArgs.NewEvent 
    if($e.ProcessName -eq "excel.exe") {
        $metkaID = $e.ProcessId           
        $fmt = 'ProcessStarted: (ID={0,5}, Parent={1,5}, Time={2,20}, Name="{3}")'            
        $msg = $fmt -f $e.ProcessId, $e.ParentProcessId, $Event.TimeGenerated, $e.ProcessName            
        Write-host -ForegroundColor Red $msg
        Write-host -ForegroundColor Green YOOOOOOOOOHOOOOOOOOOOOOO!!!                  
    }
}            
Register-WmiEvent -Query $Query -SourceIdentifier "ExcelStart!" -Action $Action

(Get-Process | Where-Object {$_.Id -eq $metkaID}).Kill()

Get-EventSubscriber
Get-EventSubscriber -SubscriptionId 2
Get-EventSubscriber -SourceIdentifier "ExcelStart!"
Get-EventSubscriber | Unregister-Event
Unregister-Event -SourceIdentifier
Unregister-Event -SubscriptionId
