$script:ColorCode = @('black','brown','red','orange','yellow',
                       'green','blue','violet','grey','white')
function Get-ColorCode {
    param([string]$Color)
    $idx = $script:ColorCode.IndexOf($Color.ToLower())
    if ($idx -eq -1) { 
        throw "Invalid color: $Color" 
        }
    $idx
}
function Get-ResistorLabel {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string[]]$Colors
    )
    if ($Colors.Count -lt 3) { 
        throw 'Exactly three colours required' 
        }
    $main  = (Get-ColorCode $Colors[0]) * 10 + (Get-ColorCode $Colors[1])
    $zeros = (Get-ColorCode $Colors[2])
    $raw   = $main * [Math]::Pow(10, $zeros)
    if ($raw -eq 0) { 
        return '0 ohms' 
        }
    $result = switch ([math]::Floor([math]::Log10($raw) / 3)) {
        0 { "{0} ohms"       -f $raw }
        1 { "{0} kiloohms"   -f ($raw / 1000) }
        2 { "{0} megaohms"   -f ($raw / 1000000) }
        3 { "{0} gigaohms"   -f ($raw / 1000000000) }
    }
    $result
}