$hash = @{}
$targetNum = 2020
foreach($num in Get-Content "G:\My Drive\AdventForCode\2020_Day1.txt")
{
    
    if($hash.ContainsKey(($targetNum - $num).ToString()))
    {
        Write-host "Found - $num and $($targetNum - $num)"
        break
    }
    else
    {
        $hash[$num.ToString()] = $true
    }
}