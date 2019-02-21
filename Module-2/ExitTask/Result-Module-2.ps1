# изначально все исходники создавались в C:\ExitTask2
# C:\ExitTask2\Result-Module-2.ps1
# C:\ExitTask2\TwoNumbers.ps1

# 1

$err = Get-Eventlog -Log "System" -Entrytype "Error" | `
    Where-Object {$_.TimeGenerated -gt ((Get-Date).AddDays(-7))}
$err | Export-Clixml -Path "C:\ExitTask2\Last_7days_Errors.xml" 


# 2

Get-ChildItem -Path "C:\Windows" -Filter *.log | Sort-Object -Descending Name `
    | Select-Object FullName, Length, CreationTime | Format-Table


# 3

.\TwoNumbers.ps1 


# 4

$myPassport = Get-Credential Administrator
$vms = Get-Content -Path C:\ExitTask2\vms.txt

$myScript = {    
    $vmn = (Get-WmiObject Win32_OperatingSystem).CSName
    $Sers = "ALG" #stop
    #$Sers = "BFE" #run
    $se = Get-Service $Sers
    if ($se.Status -eq "Running") {    
        Write-Host -f "green" $vmn, $se.Name -Separator "-"
    }
    else {
        Write-Host -f "red"  $vmn, $se.Name -Separator "-"
    }
}
foreach ($vm in $vms) {
    Invoke-Command -ComputerName $vm -ScriptBlock $myScript -Credential $myPassport
}

# ну собственно не сложно сделать и для всех процессов на каждой машине
$myScript1 = {    
    $vmn = (Get-WmiObject Win32_OperatingSystem).CSName
    $ser = Get-Service
    foreach ($se in $ser) {
        if ($se.Status -eq "Running") {    
            Write-Host -f "green" $vmn, $se.Name -Separator "-"
        }
        else {
            Write-Host -f "red"  $vmn, $se.Name -Separator "-"
        }
    }
}
foreach ($vm in $vms) {
    Invoke-Command -ComputerName $vm -ScriptBlock $myScript -Credential $myPassport
}
# Invoke-Command -ComputerName $vms -ScriptBlock $myScript1 -Credential $myPassport
# так тоже сработает, но на выходе будет каша, т.к. все запустится параллельно на всех машинах


# 5

$sourDir = "C:\ExitTask2"
$destDir = "C:\ExitTask2_temp\BackUp"
$myZIP = "myArchive.zip"
if (Test-Path -Path $sourDir) {
    if (!(Test-Path -Path $destDir)) {
        $d = New-Item -Path $destDir -ItemType Directory
    }    
    Compress-Archive -Path "$sourDir\*" -DestinationPath "$destDir\$myZIP" -Force
    Write-Output "Zip Done!"
}
else {
    Write-Output "Nothing to compress. Folder $sourDir not exist!"
    Break # выходим из скрипта
}
$extrTime = "_" + (Get-Date -Format "HH-mm-ss-ffff") + "_"
$extrDir = "C:\ExitTask2_temp\extract"
$tmps = ($extrDir -split "\\")
try {
    Expand-Archive -Path "$destDir\$myZIP" -DestinationPath $extrDir -Force
    Write-Output "Extract Done!"
}
catch {
    Write-Output "Can't create output folder!"
    Break # выходим из скрипта
}

$x_files = Get-ChildItem $extrDir
foreach ($x_file in $x_files) {
    $x_file.MoveTo($extrDir + "\" + $tmps[-1] + $extrTime + $x_file.BaseName + $x_file.Extension)
}
$out = $x_files | Measure-Object -Property Length -Sum
Write-Output ("Files renamed: " + $out.Count + ". Total size: " + $out.Sum + ".")


