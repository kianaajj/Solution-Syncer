function Invoke-ArmstrongNumbers {
    param([long]$Number)

    $d   = $Number.ToString().ToCharArray()
    $p   = $d.Count
    $s   = 0

    foreach ($d in $d) {
        $s += [math]::Pow([int]::Parse($d), $p)
    }

    $s -eq $Number
}