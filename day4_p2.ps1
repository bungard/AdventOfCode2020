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
$fieldRules= @{
    0 = "^((19[^01]\d)|(200[0-2]))$";
    1 = "^20(1\d|20)$";
    2 = "^20((2\d)|30)$";
    3 = "^(((1([5-8]\d)|(19[0-3]))cm)|((59|6\d|7[0-6])in))$";
    4 = "^#[0-9a-f]{6}$";
    5 = "^(amb|blu|brn|gry|grn|hzl|oth)$"
    6 = "^[0-9]{9}$";
    7 = ".*"
}

$fields = 0
$valid = 0
$line = 0
$recordError= $false
Get-Content "2020_Day4.txt" | % { 
   if(![String]::IsNullOrEmpty($_))
   {       
        $_.split(" ") | %{ 
            $key,$val = $_.split(":")
            $fields = $fields -bor (1 -shl  $fieldMap[$key])
            if(![regex]::isMatch($val,$fieldRules[$fieldmap[$key]])){
                $recordError = $true
            }
        }        
   }
   else{   
    if(($fields -eq 255 -or $fields -eq 127) -and -not $recordError){ $valid +=1} 
    $fields = 0
    $recordError = $false
   }
}
#Check last block
if(($fields -eq 255 -or $fields -eq 127) -and -not $recordError){ $valid +=1} 
$valid