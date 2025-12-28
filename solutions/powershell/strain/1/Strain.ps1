function Invoke-Keep {
    param(
        [Object[]]$Data,
        [ScriptBlock]$Predicate
    )
    $Data.Where({ & $Predicate $_ })
}
function Invoke-Discard {
    param(
        [Object[]]$Data,
        [ScriptBlock]$Predicate
    )
    $Data.Where({ -not (& $Predicate $_) })
}