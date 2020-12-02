$validPws = 0
foreach($pwLine in Get-Content "G:\My Drive\AdventForCode\2020_Day2_p1.txt")
{
    $p = Get-PWParts $pwLine
    if($p.pw[$p.first-1] -eq $p.letter -xor $p.pw[$p.Second-1] -eq $p.letter)
    {
        $validPws +=1
    }
}
$validPws
function Get-PWParts($line)
{
    $parts = $line.split(" ")
    $First = $parts[0].split("-")[0]
    $Second = $parts[0].split("-")[1]
    $letter = $parts[1][0]
    $pw = $parts[2]
    return [PSObject]@{"First"=$First;"Second"=$second;"letter"=$letter;"pw"=$pw}
}
