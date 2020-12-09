$maxId = 0
Get-Content "2020_Day5.txt" | % { 
    $row = 0
    for($i=0; $i -lt 7; $i+=1)
    {
        if($_[$i] -eq "B")
        {
            $row += (1 -shl (6-$i))
        }
    }
    $seat = 0
    for($i= 0;$i -lt 3; $i += 1)
    {
        if($_[$i+7] -eq "R")
        {
            $col += 1 -shl (2-$i)
        }
    }
    
    Write-host "$_ - $row - $col $(($row * 8) + $col)"
    $maxId = [Math]::Max($maxId, ($row * 8) + $col)
    $row = 0
    $col = 0
}
$maxID