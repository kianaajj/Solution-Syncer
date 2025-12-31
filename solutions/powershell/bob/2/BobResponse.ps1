Function Get-BobResponse() {
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )
    Switch ($HeyBob.Trim()) {
        { $_ -cmatch "[A-Z]{1,}(\!)?$|[A-Z0-9%^*@#`$()]+\!" } { Return 'Whoa, chill out!' }
        { $_ -cmatch "^(([A-Z]+\s{0,})+\?|\?!)" } { Return "Calm down, I know what I'm doing!" }
        { $_[-1] -eq '?' } { Return 'Sure.' }
        { $_ -match '^$|\s+$' } { Return 'Fine. Be that way!' }
        Default { Return 'Whatever.' }
    }
}