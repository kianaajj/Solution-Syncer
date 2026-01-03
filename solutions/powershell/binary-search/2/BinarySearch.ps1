function Invoke-BinarySearch {
    param([int[]]$Array, [int]$Value)
    $idx = [Array]::BinarySearch($Array, $Value)   
    if ($idx -ge 0) { return $idx }                
    throw 'error: value not in array'              
}