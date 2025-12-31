function Test-LeapYear {
    [CmdletBinding()]
    param([int]$Year)
    ($Year % 4 -eq 0) -and ($Year % 100 -ne 0 -or $Year % 400 -eq 0)
}