# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# Test Command File

Get-Process | Where-Object {$_.Name.Length -lt 5} 
get-process Idle, System
Get-Process | Get-Member

Get-Command *file* -CommandType Function
Get-Process | Select-Object -first 10
Get-Process | Where-Object {$_.Name -notcontains "Idle", "System"} | Get-Item | `
    Sort-Object CreationTime -Descending | Select-Object Directory, Name, CreationTime,`
    LastWriteTime -First 10

Get-Process | Get-Item
Get-Process git-bash

Get-Process | Select-Object CPU
Get-Process | Select-Object Path, Name

write-host (2,4,6,8,10,12) -Separator ", -> " -foregroundcolor DarkGreen -backgroundcolor red

Get-Process powershell | Format-List
Get-Process powershell | Format-Table

Get-ChildItem C:\Windows | Where-Object {$_.Length -gt 500000} | Sort-Object -property length -descending 
Get-ChildItem C:\TEMP

Get-PSProvider

Get-Help Get-PSProvider -Full
Get-PSProvider f*, r* | Format-List

New-Item -Path 

Get-Help Get-Variable
Get-Variable | Where-Object  {$_.Value -lt 10}
Get-Variable | Where-Object {$_.Name -like "*mum*"}
Get-Variable PID
$f = Get-Variable PID -ValueOnly
$f.GetType().Name
$f.GetType()
$d = 3.33
$d.GetType().Name
$d.GetType()
$s = $true
$s.GetType().Name
$s.GetType()

System.ValueType Get-Member
get-help System.ValueType

Get-Process | Sort-Object VirtualMemorySize -Descending | Select-Object Name, VirtualMemorySize 

Get-ChildItem -Path C:\TEMP | Get-Member
$fo = Get-Item C:\TEMP 
$fo.GetType()
$fo.GetFiles().Count
$fo.GetDirectories().Count

$fo = Get-Item C:\TEMP\new.xlsx
$fo.GetType()
($fo.Length/1024)
Get-Member $fo

Get-Item C:\TEMP | Get-ChildItem -File | Where-Object {$_.Name -notlike "*.tmp"}
Get-Item C:\TEMP | Get-ChildItem -Directory

get-help ConvertTo-Html -Examples
Get-EventLog -LogName "Windows PowerShell" | ConvertTo-Html  C:\temp\pslog.htm

Get-History | Get-Member
Get-History -Count 200
Get-History | Format-List -Property * 
Get-History -ID 7 -Count 5

ConvertTo-Xml -As "Document" -InputObject Get-Process | Out-File "C:\temp\h.xml" 
Export-Clixml -InputObject (Get-History) 

"This is a test" | Export-Clixml -Path c:\TEMP\sample.xml

Get-HotFix | Get-Member

Get-History | Export-Clixml -Path "c:\TEMP\history.xml"
$myHistory = Import-Clixml -Path "c:\TEMP\history.xml"
$myHistory | Select-Object ID, CommandLine, StartExecutionTime, ExecutionStatus, EndExecutionTime | Format-List

Get-HotFix | Export-Csv -Path "c:\TEMP\hf.csv"
$myHistory = Import-Csv -Path "c:\TEMP\hf.csv"
foreach ($i in $myHistory) {
    # Write-Host -f "Yellow" $i.CSName, $i.Description, $i.HotFixID, $i.InstalledOn
    Write-Host -f "Yellow" $i "t\"
}

Get-History | Export-Clixml -Path "c:\TEMP\history.xml"
$myHistory = Import-Clixml -Path "c:\TEMP\history.xml"
$myHistory | Select-Object ID, CommandLine, StartExecutionTime, ExecutionStatus, EndExecutionTime | Format-List

Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft -ErrorAction SilentlyContinue | Export-Clixml -Path C:\temp\key1.xml
$myHistory = Import-Clixml -Path C:\temp\key1.xml
# $myHistory
foreach ($i in $myHistory) {
    Write-Host -f "Yellow" $i.CSName, $i.Description, $i.HotFixID, $i.InstalledOn
}

Test-Path $profile

# --------------------------------------------------------------------------------------

Get-WmiObject | Get-Member
Get-WmiObject | Get-Command
Get-WmiObject -list 
Get-WmiObject  -Class "win32*"

Get-WmiObject -list | Where-Object {$_.Name -eq "__NAMESPACE"}

$o = Get-WmiObject "__NAMESPACE"
$o
$t = Get-WmiObject Win32_Service 
$t.__NAMESPACE[0]

$mycount = 0
$t = Get-WmiObject -List
$t.Count
Start-Sleep 3 
foreach ($i in $t) {
    # Write-Output  $i.__NAMESPACE    
    $mycount++
}
Write-Output $mycount
$t.Count

Get-WmiObject -List | ForEach-Object { Out-File C:\temp\z.txt ($i.__NAMESPACE).ToString() }

$t.Count
$t = Get-WmiObject -list | ForEach-Object { Write-Output $_.__NAMESPACE }
$t
$t.Count

$t | Get-Member 
$t | Where-Object {$_.Name -eq "__NAMESPACE"}

Get-WmiObject -list -namespace root\cimv2 | ForEach-Object {$_.Name}
Get-WmiObject -list -Namespace root\Microsoft | ForEach-Object {$_.Name}

Write-Output (Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, FreeSpace | Format-Table )

Get-WmiObject -List | Where-Object {$_.name -match "net"}

Get-WmiObject Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE | Select-Object -Property IPAddress

Get-WmiObject win32_logicaldisk | Select-Object -Property FreeSpace | % {$_.freespace/1GB }

# !!!
$myStartTime = Get-Date
$myTestPing = (Test-Connection -ComputerName "tut.bynn" -Count 10 -Quiet)
# -Quiet пигнует втихую без вывода ошибок
if ($myTestPing) {
    $myEndTime = Get-Date
    $myTotalPingTime = $myEndTime - $myStartTime
    Write-Output ("Total PING time: " + $myTotalPingTime.Seconds + " sec.")
    Write-Output ("Total PING time: " + $myTotalPingTime.TotalMilliseconds + " m sec.")    
}
else {
    Write-Output ("Host Unavailable.")
}
# !!!

Get-WmiObject -Class Win32_PingStatus -Filter "Address='178.172.160.5'" -ComputerName . `
    | Select-Object -Property Address,ResponseTime,StatusCode


$Query = 'SELECT * FROM Win32_ProcessStartTrace'            
$action = {            
    $e = $Event.SourceEventArgs.NewEvent 
    if($e.ProcessName -eq "excel.exe") {           
        $fmt = 'ProcessStarted: (ID={0,5}, Parent={1,5}, Time={2,20}, Name="{3}")'            
        $msg = $fmt -f $e.ProcessId, $e.ParentProcessId, $event.TimeGenerated, $e.ProcessName            
        Write-host -ForegroundColor Red $msg
        Write-host -ForegroundColor Green YOOOOOOOOOHOOOOOOOOOOOOO!!!                  
    }
}            
Register-WmiEvent -Query $Query -SourceIdentifier "ExcelStart!" -Action $Action

Get-EventSubscriber
Get-EventSubscriber -SubscriptionId 2
Get-EventSubscriber -SourceIdentifier "ExcelStart!"
Get-EventSubscriber | Unregister-Event
Unregister-Event -SourceIdentifier
Unregister-Event -SubscriptionId

(Get-Process | Where-Object {$_.Id -eq $metkaID}).Kill()
Get-Process | Where-Object {$_.ProcessName -eq "cmd"}
(Get-Process -Id 6320).Kill()
