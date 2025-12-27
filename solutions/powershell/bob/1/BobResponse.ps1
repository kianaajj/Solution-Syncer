function Get-BobResponse($HeyBob) {
    $s = $HeyBob.Trim()
    if (!$s) { "Fine. Be that way!" }
    elseif ($s -ceq $s.ToUpper() -and $s -match '[A-Z]') { 
        if ($s.EndsWith('?')) { "Calm down, I know what I'm doing!" } else { "Whoa, chill out!" }
    }
    elseif ($s.EndsWith('?')) { "Sure." }
    else { "Whatever." }
}