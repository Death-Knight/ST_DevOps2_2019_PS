# ST_DevOps2_2019_Viktar_Tsybulko_2_2
# 
#7.	Вывести список названий и занятую виртуальную память (в Mb) каждого процесса,
#  разделённые знаком тире, при этом если процесс занимает более 100Mb – 
#  выводить информацию красным цветом, иначе зелёным.

Get-Process | Sort-Object VirtualMemorySize -Descending| ForEach-Object {
    if (($_.VirtualMemorySize/1024/1024) -gt 100) {
        Write-Host -f "Red" $_.Name, (($_.VirtualMemorySize)/1024/1024), Mb -Separator " - "
    }
    else {
        Write-Host -f "Green" $_.Name, (($_.VirtualMemorySize)/1024/1024), Mb -Separator " - "
    }
}
