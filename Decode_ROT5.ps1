$encoded = Read-Host "Enter ROT5 encoded num/string"

$ROT5array = @{
"1" = "6"
"2" = "7"
"3" = "8"
"4" = "9"
"5" = "0"
"6" = "1"
"7" = "2"
"8" = "3"
"9" = "4"
"0" = "5"
}


$plaintext = $encoded.ToCharArray() | ForEach-Object {
if ($_ -like "1" -or 
$_ -like "2" -or 
$_ -like "3" -or 
$_ -like "4" -or 
$_ -like "5" -or 
$_ -like "6" -or 
$_ -like "7" -or 
$_ -like "8" -or 
$_ -like "9" -or 
$_ -like "0") {
$ROT5array."$_"
} ELSE {
 $_
}
}
-join $plaintext
