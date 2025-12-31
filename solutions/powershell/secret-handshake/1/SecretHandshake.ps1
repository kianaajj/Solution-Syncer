function Invoke-SecretHandshake {
    [CmdletBinding()]
    param([int]$Number)
    $a = @('wink','double blink','close your eyes','jump')
    $l = [System.Collections.Generic.List[string]]::new()
    for ($b = 0; $b -lt 4; $b++) {
        if ($Number -band (1 -shl $b)) {   
            $l.Add($a[$b])
        }
    }
    if ($Number -band 16) { $l.Reverse() }
    [string[]]$l
}