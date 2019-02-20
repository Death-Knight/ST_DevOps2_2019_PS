[CmdletBinding()]
# Parameter help description

Param (    
    [int]$A_start = 0,
    [Parameter(Mandatory=$true)]
    [int]$B_end
)

if ($A_start -eq $B_end) {
    if ($A_start%3 -eq 0) {
        Write-Output "$A_start - bingo!"
    }
    else {
        Write-Output "$A_start = $B_end , sorry."
    }
}
else {
    if ($A_start -lt $B_end){
        $internal_start = $A_start
        $internal_end = $B_end
        Write-Output "$internal_start $internal_end"
    }
    else {
        $internal_start = $B_end
        $internal_end = $A_start
        Write-Output "$internal_start $internal_end"
    }
    While ($internal_start -lt $internal_end) {
    if ($internal_start%3 -eq 0) {
        Write-Output "Bingo! ^_^ - $internal_start"
    }      
    $internal_start++
    }    
}