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
$shift_13 = @{
    "a" = "n"
    "b" = "o"
    "c" = "p"
    "d" = "q"
    "e" = "r"
    "f" = "s"
    "g" = "t"
    "h" = "u"
    "i" = "v"
    "j" = "w"
    "k" = "x"
    "l" = "y"
    "m" = "z"
    "n" = "a"
    "o" = "b"
    "p" = "c"
    "q" = "d"
    "r" = "e"
    "s" = "f"
    "t" = "g"
    "u" = "h"
    "v" = "i"
    "w" = "j"
    "x" = "k"
    "y" = "l"
    "z" = "m"
}
# If Manual shift, change $(0..26) to custom #
$plaintext = foreach ($shift in 13) {
$CharNUMBERString = $encoded.ToCharArray() | Foreach-Object {
if ($_ -match "^[a-zA-Z-]+$") {
if ($_ -eq "-") {
$_
}
if ([char]::IsUpper($_)) {
((Get-Variable -Name "shift_$shift").Value)."$_".ToUpper() # Lower to UPPER case
} else {
((Get-Variable -Name "shift_$shift").Value)."$_"    # Lower case letters
}
} else {
$_ #Symbols
}
}
$plaintext = ""
$CharNumberString | ForEach-Object {
$plaintext += $_
}
$plaintext
}
$plaintext = $plaintext.ToCharArray() | ForEach-Object {
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
} else {
 $_
}
}
-join $plaintext