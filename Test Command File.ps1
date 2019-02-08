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
