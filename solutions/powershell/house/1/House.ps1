function Get-Rhyme {
    param(
        [int]$Start,
        [int]$End
    )
    $verses = @(
        "the house that Jack built.",
        "the malt that lay in",
        "the rat that ate",
        "the cat that killed",
        "the dog that worried",
        "the cow with the crumpled horn that tossed",
        "the maiden all forlorn that milked",
        "the man all tattered and torn that kissed",
        "the priest all shaven and shorn that married",
        "the rooster that crowed in the morn that woke",
        "the farmer sowing his corn that kept",
        "the horse and the hound and the horn that belonged to"
    )
    $result = @()
    for ($i = $Start; $i -le $End; $i++) {
        $verse = "This is "
        for ($j = $i - 1; $j -ge 0; $j--) {
            $verse += $verses[$j]
            if ($j -gt 0) {
                $verse += " "
            }
        }
        $result += $verse
    }
    return $result -join "`n"
}