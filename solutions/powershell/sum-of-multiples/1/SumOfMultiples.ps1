function Get-SumOfMultiples {
    [CmdletBinding()]
    param(
        [int[]]$Multiples,
        [int]$Limit
    )
    if ($Limit -le 1) { return 0 }
    $factors = $Multiples |
               Where-Object { $_ -ne 0 } |
               Sort-Object -Unique
    $set = [System.Collections.Generic.HashSet[int]]::new()
    foreach ($n in $factors) {
        for ($m = $n; $m -lt $Limit; $m += $n) {
            $null = $set.Add($m)   
        }
    }
    [int]($set | Measure-Object -Sum).Sum
}