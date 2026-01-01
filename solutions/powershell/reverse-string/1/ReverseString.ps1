function Get-ReverseString {
    [CmdletBinding()]
    param([string]$Forward)
    $chars = $Forward.ToCharArray()
    $sb    = [System.Text.StringBuilder]::new($chars.Length)
    for ($i = $chars.Length - 1; $i -ge 0; $i--) {
        $null = $sb.Append($chars[$i])
    }
    $sb.ToString()
}