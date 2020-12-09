$record = ""
$fieldMap = @{
    "byr"=0;
    "iyr"=1;
    "eyr"=2;
    "hgt"=3;
    "hcl"=4;
    "ecl"=5;
    "pid"=6;
    "cid"=7;
}
$fields = 0
$valid = 0
$recordError= $false
Get-Content "2020_Day4.txt" | % { 
   if(![String]::IsNullOrEmpty($_))
   {
        $_.split(" ") | %{ 
            $fields = $fields -bor (1 -shl  $fieldMap[$_.split(":")[0]])
        }        
   }
   else{   
    if($fields -eq 255 -or $fields -eq 127){ $valid +=1} 
    $fields = 0
   }
}
#Check last block
if($fields -eq 255 -or $fields -eq 127){ $valid +=1} 
$valid