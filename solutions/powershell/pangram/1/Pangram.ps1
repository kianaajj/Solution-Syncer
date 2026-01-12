function Invoke-Panagram {   
    [CmdletBinding()]
    param([string]$Sentence)
    $letters = [char[]]$Sentence.ToLower() |
               Where-Object { $_ -ge 'a' -and $_ -le 'z' } |
               Sort-Object -Unique
    $letters.Count -eq 26
}