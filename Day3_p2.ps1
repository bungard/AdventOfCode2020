function Get-HitTrees([int]$right, [int]$down)
{
    $row = 0
    $col = 0
    $treesHit= 0
    $map = Get-Content "G:\My Drive\AdventForCode\2020_Day3.txt"
    while($row -lt $map.Length)
    {
        if($map[$row][$col] -eq "#" )
        { 
            $treesHit += 1
        }
        $row += $down
        $col += $right


        if($col -ge $map[$row].Length)
        {
            $col -= $map[$row].Length
        }
    }
    return $treesHit
}

$treesHit = Get-HitTrees -Right 1 -down 1
$treesHit *= Get-HitTrees -Right 3 -down 1
$treesHit *= Get-HitTrees -Right 5 -down 1
$treesHit *= Get-HitTrees -Right 7 -down 1
$treesHit *= Get-HitTrees -Right 1 -down 2
$treesHit