$script:ColorValue = @(
    'black','brown','red','orange','yellow',
    'green','blue','violet','grey','white'
    )
$script:Tolerance = @{
    grey   = 0.05
    violet = 0.1
    blue   = 0.25
    green  = 0.5
    brown  = 1
    red    = 2
    gold   = 5
    silver = 10
}
function Get-ColorCode {
    param([string]$Color)
    $idx = $script:ColorValue.IndexOf($Color.ToLower())
    if ($idx -eq -1) { 
    throw "Invalid colour: $Color" 
    }
    $idx
}
function Get-ResistorLabel {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string[]]$Colors
    )
    if ($Colors.Count -eq 1) {
        if ($Colors[0] -ne 'black') { 
        throw "Single-band resistor must be black" 
        }
        return '0 ohms'
    }
    if ($Colors.Count -notin 4,5) { 
    throw 'Supply 1, 4 or 5 colours' 
    }
    
    $valueBands = $Colors[0..($Colors.Count-3)]         
    $multiplier = Get-ColorCode $Colors[-2]             
    $tolerance  = $script:Tolerance[$Colors[-1].ToLower()]
    
    if ($null -eq $tolerance) { 
    throw 'Invalid tolerance band' 
    }
    
    $value = 0
    foreach ($b in $valueBands) { 
    $value = $value * 10 + (Get-ColorCode $b) 
    }
    
    $raw = $value * [Math]::Pow(10, $multiplier)
    $bucket = [math]::Floor([math]::Log10($raw) / 3)
    $prefix = @(
        'ohms','kiloohms','megaohms','gigaohms'
        )[$bucket]
        
    $scaled = $raw / [Math]::Pow(1000, $bucket)
    $fmt = if ($scaled -eq [math]::Round($scaled)) {
    '{0:0}' 
    } else { 
    '{0:0.##}' 
    }
    
    $main = $fmt -f $scaled
    "$main $prefix ±$tolerance%"
}