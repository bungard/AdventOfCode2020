$inputs = Get-Content "G:\My Drive\AdventForCode\2020_Day1.txt"
$inputs = $inputs | % { [int]$_} | sort
$targetNum = 2020
$hash = @{}
$smallestTwo = $inputs[0] + $inputs[1]

#Set first Pass hash
foreach($num in $inputs)
{
    $diff = $targetNum - $num
    #If this diff is smaller than the two smallest in the set, nix these
    if($diff -ge $smallestTwo){
        $hash[$diff] = $num 
    }
}

$secondHash = @{}
foreach($remaining in $hash.keys)
{
    foreach($num in $hash.Values | sort)
    {
        #can't reuse numbers
        if($num -eq $hash[$remaining]) { continue }
        $diff = $remaining - $num
        if($diff -ge $inputs[0])
        {
            if($hash.Values | ? { $_ -eq $diff})
            {
                $answer =  [PSCustomObject]@{"First"=$hash[$remaining];"Second"=$num;"Third"=($hash.Values | ? { $_ -eq $diff})}
                Write-host "$answer ==> $($answer.First * $answer.Second * $answer.Third)"
                return
            }
        }
    }
}
