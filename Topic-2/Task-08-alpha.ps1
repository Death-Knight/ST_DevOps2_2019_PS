# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#8.	Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках)
# за исключением файлов *.tmp

function Get-AllFilesSize ($folder) {
    $summ = 0
    foreach ($i in $folder)
    {
        $files = $i | Get-ChildItem -File |  Where-Object {$_.Name -notlike "*.tmp"}  
        $files      
        foreach ($ii in $files)
        {
            $summ += $ii.length
            ($summ)
        }
        $summ1 = 0
        if ($i.GetDirectories().Count -gt 0) {
            $summ1 = Get-AllFilesSize($i.GetDirectories())
            ($summ1)
            $summ = $summ + $summ1
            Write-Host "folder " $i.GetDirectories().Count $i.GetDirectories()
        }      
        else {
            Write-Host "no dirs"
        }
    }
    return $summ
}
Get-AllFilesSize (Get-Item C:\TEMP)
