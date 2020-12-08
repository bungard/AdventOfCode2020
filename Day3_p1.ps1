$row = 0
$col = 0
$treesHit= 0
$map = Get-Content "G:\My Drive\AdventForCode\2020_Day3.txt"
while($row -lt $map.Length)
{
    if($map[$row][$col] -eq "#" -or $map[$row][$col] -eq "X")
    { 
        $treesHit += 1
        $map[$row].remove($col,1).insert($col,'X')
    }
    else {
        
        $map[$row].remove($col,1).insert($col,'O')
    }
    Write-host $map[$row]
    $row += 1
    $col += 3

    

    if($col -ge $map[$row].Length)
    {
        $col -= $map[$row].Length
    }
}
$treesHit