function Get-TwoFer {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$Name = 'you'
    )
    "One for $Name, one for me"
}