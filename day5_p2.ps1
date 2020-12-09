$sum = 0
$count = 0
#arbitrary larger number
$minId = 99999999
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
    
    for($i= 0;$i -lt 3; $i += 1)
    {
        if($_[$i+7] -eq "R")
        {
            $col += 1 -shl (2-$i)
        }
    }
    $thisRow  = ($row * 8) + $col
    #Write-host "$_ - $row - $col $thisRow"
    
    $sum +=  $thisRow
    $maxId = [Math]::Max($maxId, $thisRow)
    $minId = [Math]::Min($minId, $thisRow)
    $count += 1

    $row = 0
    $col = 0
}
#make this a natural set (less our one missing number)
$sum += (1..($minId-1) | Measure-Object -Sum).Sum
$total = ($maxId * ($maxId+1))/2
$total - $sum