# Convert A1Z26 with Powershell
$encoded = Read-Host "Enter A1Z26 text"

$A1Z26 = @{
"1" = "a"
"2" = "b"
"3" = "c"
"4" = "d"
"5" = "e"
"6" = "f"
"7" = "g"
"8" = "h"
"9" = "i"
"10" = "j"
"11" = "k"
"12" = "l"
"13" = "m"
"14" = "n"
"15" = "o"
"16" = "p"
"17" = "q"
"18" = "r"
"19" = "s"
"20" = "t"
"21" = "u"
"22" = "v"
"23" = "w"
"24" = "x"
"25" = "y"
"26" = "z"
}

$plaintext = $encoded.split(" ")| ForEach-Object {
if ($_ -like "1" -or 
$_ -like "2" -or 
$_ -like "3" -or 
$_ -like "4" -or 
$_ -like "5" -or 
$_ -like "6" -or 
$_ -like "7" -or 
$_ -like "8" -or 
$_ -like "9" -or 
$_ -like "10" -or 
$_ -like "11" -or 
$_ -like "12" -or
$_ -like "13" -or 
$_ -like "14" -or 
$_ -like "15" -or 
$_ -like "16" -or 
$_ -like "17" -or
$_ -like "18" -or 
$_ -like "19" -or 
$_ -like "20" -or 
$_ -like "21" -or 
$_ -like "22" -or
$_ -like "23" -or 
$_ -like "24" -or
$_ -like "25" -or 
$_ -like "26") {
$A1Z26."$_"
}
}
-join $plaintext
