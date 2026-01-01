function Invoke-Isogram {
    [CmdletBinding()]
    param([string]$Phrase)
    $letters = [char[]]$Phrase.ToLower() -match '[a-z]'
    $unique = $letters | Sort-Object -Unique
    $letters.Count -eq $unique.Count
}