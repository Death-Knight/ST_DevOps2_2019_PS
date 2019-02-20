# 1

$err = Get-Eventlog -Log "System" -Entrytype "Error" | `
    Where-Object {$_.TimeGenerated -gt ((Get-Date).AddDays(-7))}
$err | Export-Clixml -Path "C:\Test\Last_7days_Errors.xml" 


# 2

Get-ChildItem -Path "C:\Windows" -Filter *.log | Sort-Object -Descending Name `
    | Select-Object FullName, Length, CreationTime | Format-Table


# 3

.\TwoNumbers.ps1 


# 4

$myPassport = Get-Credential Administrator

#$Ser = "ALG" #stop
$Ser = "BFE" #run

$vms = Get-Content -Path C:\ExitTask2\vms.txt
$myScript = {    
    $vmn = (Get-WmiObject Win32_OperatingSystem).CSName
    $se = Get-Service "ALG"
    #$se = Get-Service "BFE"
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


# 5

$sourDir = "C:\ExitTask2"
$destDir = "C:\BackUp"
$myZIP = "myArchive.zip"
if (Test-Path -Path $sourDir){
    Compress-Archive -Path "$sourDir\*" -DestinationPath "$destDir\$myZIP" -Force
    Write-Output "Done!"
}
else {
    Write-Output "Nothing to compress. Folder $sourDir not exist!"
}

try {
$extrDir = "C:\extract"
    Expand-Archive -Path "$destDir\$myZIP" -DestinationPath $extrDir -Force
    Write-Output "Done!"
}
catch {
    Write-Output "Can't create output folder!"
    Break
}

