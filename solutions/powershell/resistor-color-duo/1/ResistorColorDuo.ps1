$script:ColorValue = @(
'black','brown','red','orange','yellow',
'green','blue','violet','grey','white'
)

function Get-ColorCodeValue {
    param([string[]]$Colors)
    if ($Colors.Count -lt 2) { 
    throw 'At least two colours required' 
    }
    
    $first  = $script:ColorValue.IndexOf($Colors[0].ToLower())
    $second = $script:ColorValue.IndexOf($Colors[1].ToLower())
    
    if ($first -eq -1 -or $second -eq -1) { 
    throw 'Invalid colour supplied' 
    }
    
    $first * 10 + $second
}