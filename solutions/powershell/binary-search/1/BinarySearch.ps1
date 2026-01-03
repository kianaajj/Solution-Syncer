function Invoke-BinarySearch {
    [CmdletBinding()]
    param(
        [int[]]  $Array,
        [int]    $Value
    )
    if ($Array.Count -eq 0) {
        throw 'error: value not in array'
    }
    $l  = 0
    $r = $Array.Count - 1
    while ($l -le $r) {
        $m = $l + [math]::Floor(($r - $l) / 2)
        $mVal = $Array[$m]
        if ($mVal -eq $Value) { return $m }
        if ($mVal -gt $Value) {
            $r  =  $m - 1          
        } else {
            $l  =  $m + 1          
        }
    }
    throw 'error: value not in array'
}