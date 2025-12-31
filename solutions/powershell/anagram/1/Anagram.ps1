function Invoke-Anagram {
    [CmdletBinding()]
    param(
        [string]$Subject,
        [string[]]$Candidates
    )
    $canonical = ($Subject.ToLower().ToCharArray() | Sort-Object) -join ''
    foreach ($word in $Candidates) {
        if ($word -eq $Subject) { continue }
        if (($word.ToLower().ToCharArray() | Sort-Object) -join '' -eq $canonical) {
            $word         
        }
    }
}