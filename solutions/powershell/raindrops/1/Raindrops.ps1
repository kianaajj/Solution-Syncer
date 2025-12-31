function Get-Raindrops {
    [CmdletBinding()]
    param([int]$Rain)
    $s = ''
    foreach ($n in 3,5,7) {
        if ($Rain % $n -eq 0) { $s += @{3='Pling';5='Plang';7='Plong'}[$n] }
    }
    if ($s -eq '') { $s = $Rain.ToString() }
    $s
}