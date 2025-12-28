function Invoke-CollatzConjecture {
    param([Int64]$Number)
    if ($Number -le 0) { throw "error: Only positive numbers are allowed" }
    $steps = 0
    while ($Number -ne 1) {
        $Number = &{ if ($Number % 2 -eq 0) { $Number / 2 } else { 3*$Number + 1 } }
        $steps++
    }
    $steps
}