function Invoke-FlattenArray {
    param( [ array ] $Array )          
    function f {
        param( $i )
        if( $i -is [Collections.IEnumerable] ){
            $i | % { f $_ }
        }elseif( $null -ne $i ){ $i }
    }
    [ array ] ( $Array | % { f $_ } )
}