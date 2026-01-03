function Invoke-BinarySearch {
    param([int[]]$Array, [int]$Value)

    if ($Array.Count -eq 0) { throw 'error: value not in array' }

    $map = @{}
    0..($Array.Count-1) | ForEach-Object { $map[$Array[$_]] = $_ }

    $pattern = '^(' + ($Array -join '|') + ')$'

    switch -Regex ($Value) {
        $pattern { return $map[[int]$Value] }
        default  { throw 'error: value not in array' }
    }
}