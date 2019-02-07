# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#8.	Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках)
# за исключением файлов *.tmp
$Global:allsumm = 0

function Get-AllFilesSize ($folder) {
    foreach ($i in $folder)
    {
        $files = $i | Get-ChildItem -File |  Where-Object {$_.Name -notlike "*.tmp"}  
        $files      
        foreach ($ii in $files)
        {
            $Global:allsumm += $ii.Length
            ($Global:allsumm)
        }
        $summ1 = 0
        if ($i.GetDirectories().Count -gt 0) {
            $summ1 = Get-AllFilesSize($i.GetDirectories())
            ($summ1)
            $Global:allsumm += $summ1
            Write-Host "folder " $i.GetDirectories().Count $i.GetDirectories()
        }      
        else {
            Write-Host "no dirs"
        }
    }
    return $Global:allsumm
}
Get-AllFilesSize (Get-Item C:\TEMP)

