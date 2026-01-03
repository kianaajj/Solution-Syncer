function Invoke-Darts {
    param([double]$X, [double]$Y)

    $d = [math]::Sqrt($X*$X + $Y*$Y).ToString('0.00000', [cultureinfo]::InvariantCulture)

    switch -Regex ($d) {
        '^(0\.[0-9]{5}|1\.00000)$'                                                        { return 10 }  
        '^(1\.[0-9]{5}|2\.[0-9]{5}|3\.[0-9]{5}|4\.[0-9]{5}|5\.00000)$'                    { return 5 }
        '^(5\.[0-9]{5}|6\.[0-9]{5}|7\.[0-9]{5}|8\.[0-9]{5}|9\.[0-9]{5}|10\.00000)$'       { return 1 }
        default                                                                           { return 0 }
    }
}