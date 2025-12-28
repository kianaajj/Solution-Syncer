$script:ColorMap = @(
    'black','brown','red','orange','yellow',
    'green','blue','violet','grey','white'
)
function Get-ColorCode {
    param([string]$Color)
    $idx = $script:ColorMap.IndexOf($Color.ToLower())
    if ($idx -eq -1) { throw "Invalid colour: $Color" }
    $idx
}
function Get-Colors {
    $script:ColorMap
}