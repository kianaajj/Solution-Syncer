function Invoke-Darts {
    param([double]$X, 
          [double]$Y
    )
    $d = [math]::Sqrt( $X*$X + $Y*$Y )   
    switch ($d) {
        {$_ -le 1}  { return 10 }
        {$_ -le 5}  { return 5  }
        {$_ -le 10} { return 1  }
        default     { return 0  }
    }
}