function Invoke-Darts {
    param (
        [double]$X,
        [double]$Y
    )
    $distance = [math]::Sqrt( $X * $X + $Y * $Y )
    if ( $distance -le 1 ) {
        return 10
    } elseif ( $distance -le 5 ) {
        return 5
    } elseif ( $distance -le 10 ) {
        return 1
    } else {
        return 0
    }
}