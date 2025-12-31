function Add-Gigasecond {
    [CmdletBinding()]
    param([DateTime]$Time)
    $gigasecond = 1e9          
    $Time.AddSeconds($gigasecond)
}