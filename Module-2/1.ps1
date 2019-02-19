
Get-WmiObject Win32_OperatingSystem | ForEach-Object { Write-Output ("Comp name: " + $_.CSName + `
    ". OS name: " + $_.Caption + ". Service Pack: " + $_.CSDVersion + ". Version: " + $_.Version + `
    ". Build: " + $_.BuildNumber ) 
}

Get-WmiObject Win32_OperatingSystem | ForEach-Object { Write-Output ("Comp name: " + $_.CSName + `
    "`nOS name: " + $_.Caption + "`nService Pack: " + $_.CSDVersion + "`nVersion: " + $_.Version + `
    "`nBuild: " + $_.BuildNumber ) 
}