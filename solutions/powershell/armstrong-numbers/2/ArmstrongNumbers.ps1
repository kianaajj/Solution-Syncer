Function Invoke-ArmstrongNumbers {
    [CmdletBinding()]
    Param([Int64]$Number)
    $exp = $Number.ToString().Length
    $sum = $Number.ToString().ToCharArray() |
           ForEach-Object { [Math]::Pow($_ - 48, $exp) } |
           Measure-Object -Sum |
           Select-Object -ExpandProperty Sum
    $sum -eq $Number
}