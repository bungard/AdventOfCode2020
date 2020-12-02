$validPws = 0
foreach($pwLine in Get-Content "G:\My Drive\AdventForCode\2020_Day2_p1.txt")
{
    $p = Get-PWParts $pwLine
    $pwLength = 0
    for($i=0;$i -lt $p.pw.Length;$i+=1)
    {
        if($p.pw[$i] -eq $p.letter)
        {
            $pwLength +=1
        }
    }
    #write-host "$pwLength - $pwLine"
    if($pwLength -ge $p.minCount -and $pwLength -le $p.maxCount)
    {
        $validPws +=1
    }
}

function Get-PWParts($line)
{
    $parts = $line.split(" ")
    $minCount = $parts[0].split("-")[0]
    $maxCount = $parts[0].split("-")[1]
    $letter = $parts[1][0]
    $pw = $parts[2]
    return [PSObject]@{"minCount"=$minCount;"maxCount"=$maxCount;"letter"=$letter;"pw"=$pw}

}
