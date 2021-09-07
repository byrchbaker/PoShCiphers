﻿$encoded = Read-Host "Enter encrypted text"
$key = Read-Host "Enter key"
$englishDictionary = (Invoke-WebRequest -uri "https://raw.githubusercontent.com/dwyl/english-words/master/words.txt").Content 

$shift_0 = @{
    "a" = "a"
    "b" = "b"
    "c" = "c"
    "d" = "d"
    "e" = "e"
    "f" = "f"
    "g" = "g"
    "h" = "h"
    "i" = "i"
    "j" = "j"
    "k" = "k"
    "l" = "l"
    "m" = "m"
    "n" = "n"
    "o" = "o"
    "p" = "p"
    "q" = "q"
    "r" = "r"
    "s" = "s"
    "t" = "t"
    "u" = "u"
    "v" = "v"
    "w" = "w"
    "x" = "x"
    "y" = "y"
    "z" = "z"

};
$shift_1 = @{
    "a" = "z"
    "b" = "a"
    "c" = "b"
    "d" = "c"
    "e" = "d"
    "f" = "e"
    "g" = "f"
    "h" = "g"
    "i" = "h"
    "j" = "i"
    "k" = "j"
    "l" = "k"
    "m" = "l"
    "n" = "m"
    "o" = "n"
    "p" = "o"
    "q" = "p"
    "r" = "q"
    "s" = "r"
    "t" = "s"
    "u" = "t"
    "v" = "u"
    "w" = "v"
    "x" = "w"
    "y" = "x"
    "z" = "y"

};
$shift_2 = @{
    "a" = "y"
    "b" = "z"
    "c" = "a"
    "d" = "b"
    "e" = "c"
    "f" = "d"
    "g" = "e"
    "h" = "f"
    "i" = "g"
    "j" = "h"
    "k" = "i"
    "l" = "j"
    "m" = "k"
    "n" = "l"
    "o" = "m"
    "p" = "n"
    "q" = "o"
    "r" = "p"
    "s" = "q"
    "t" = "r"
    "u" = "s"
    "v" = "t"
    "w" = "u"
    "x" = "v"
    "y" = "w"
    "z" = "x"

};
$shift_3 = @{
    "a" = "x"
    "b" = "y"
    "c" = "z"
    "d" = "a"
    "e" = "b"
    "f" = "c"
    "g" = "d"
    "h" = "e"
    "i" = "f"
    "j" = "g"
    "k" = "h"
    "l" = "i"
    "m" = "j"
    "n" = "k"
    "o" = "l"
    "p" = "m"
    "q" = "n"
    "r" = "o"
    "s" = "p"
    "t" = "q"
    "u" = "r"
    "v" = "s"
    "w" = "t"
    "x" = "u"
    "y" = "v"
    "z" = "w"

};
$shift_4 = @{
    "a" = "w"
    "b" = "x"
    "c" = "y"
    "d" = "z"
    "e" = "a"
    "f" = "b"
    "g" = "c"
    "h" = "d"
    "i" = "e"
    "j" = "f"
    "k" = "g"
    "l" = "h"
    "m" = "i"
    "n" = "j"
    "o" = "k"
    "p" = "l"
    "q" = "m"
    "r" = "n"
    "s" = "o"
    "t" = "p"
    "u" = "q"
    "v" = "r"
    "w" = "s"
    "x" = "t"
    "y" = "u"
    "z" = "v"

};
$shift_5 = @{
    "a" = "v"
    "b" = "w"
    "c" = "x"
    "d" = "y"
    "e" = "z"
    "f" = "a"
    "g" = "b"
    "h" = "c"
    "i" = "d"
    "j" = "e"
    "k" = "f"
    "l" = "g"
    "m" = "h"
    "n" = "i"
    "o" = "j"
    "p" = "k"
    "q" = "l"
    "r" = "m"
    "s" = "n"
    "t" = "o"
    "u" = "p"
    "v" = "q"
    "w" = "r"
    "x" = "s"
    "y" = "t"
    "z" = "u"

};
$shift_6 = @{
    "a" = "u"
    "b" = "v"
    "c" = "w"
    "d" = "x"
    "e" = "y"
    "f" = "z"
    "g" = "a"
    "h" = "b"
    "i" = "c"
    "j" = "d"
    "k" = "e"
    "l" = "f"
    "m" = "g"
    "n" = "h"
    "o" = "i"
    "p" = "j"
    "q" = "k"
    "r" = "l"
    "s" = "m"
    "t" = "n"
    "u" = "o"
    "v" = "p"
    "w" = "q"
    "x" = "r"
    "y" = "s"
    "z" = "t"

};
$shift_7 = @{
    "a" = "t"
    "b" = "u"
    "c" = "v"
    "d" = "w"
    "e" = "x"
    "f" = "y"
    "g" = "z"
    "h" = "a"
    "i" = "b"
    "j" = "c"
    "k" = "d"
    "l" = "e"
    "m" = "f"
    "n" = "g"
    "o" = "h"
    "p" = "i"
    "q" = "j"
    "r" = "k"
    "s" = "l"
    "t" = "m"
    "u" = "n"
    "v" = "o"
    "w" = "p"
    "x" = "q"
    "y" = "r"
    "z" = "s"

};
$shift_8 = @{
    "a" = "s"
    "b" = "t"
    "c" = "u"
    "d" = "v"
    "e" = "w"
    "f" = "x"
    "g" = "y"
    "h" = "z"
    "i" = "a"
    "j" = "b"
    "k" = "c"
    "l" = "d"
    "m" = "e"
    "n" = "f"
    "o" = "g"
    "p" = "h"
    "q" = "i"
    "r" = "j"
    "s" = "k"
    "t" = "l"
    "u" = "m"
    "v" = "n"
    "w" = "o"
    "x" = "p"
    "y" = "q"
    "z" = "r"

};
$shift_9 = @{
    "a" = "r"
    "b" = "s"
    "c" = "t"
    "d" = "u"
    "e" = "v"
    "f" = "w"
    "g" = "x"
    "h" = "y"
    "i" = "z"
    "j" = "a"
    "k" = "b"
    "l" = "c"
    "m" = "d"
    "n" = "e"
    "o" = "f"
    "p" = "g"
    "q" = "h"
    "r" = "i"
    "s" = "j"
    "t" = "k"
    "u" = "l"
    "v" = "m"
    "w" = "n"
    "x" = "o"
    "y" = "p"
    "z" = "q"

};
$shift_10 = @{
    "a" = "q"
    "b" = "r"
    "c" = "s"
    "d" = "t"
    "e" = "u"
    "f" = "v"
    "g" = "w"
    "h" = "x"
    "i" = "y"
    "j" = "z"
    "k" = "a"
    "l" = "b"
    "m" = "c"
    "n" = "d"
    "o" = "e"
    "p" = "f"
    "q" = "g"
    "r" = "h"
    "s" = "i"
    "t" = "j"
    "u" = "k"
    "v" = "l"
    "w" = "m"
    "x" = "n"
    "y" = "o"
    "z" = "p"

};
$shift_11 = @{
    "a" = "p"
    "b" = "q"
    "c" = "r"
    "d" = "s"
    "e" = "t"
    "f" = "u"
    "g" = "v"
    "h" = "w"
    "i" = "x"
    "j" = "y"
    "k" = "z"
    "l" = "a"
    "m" = "b"
    "n" = "c"
    "o" = "d"
    "p" = "e"
    "q" = "f"
    "r" = "g"
    "s" = "h"
    "t" = "i"
    "u" = "j"
    "v" = "k"
    "w" = "l"
    "x" = "m"
    "y" = "n"
    "z" = "o"

};
$shift_12 = @{
    "a" = "o"
    "b" = "p"
    "c" = "q"
    "d" = "r"
    "e" = "s"
    "f" = "t"
    "g" = "u"
    "h" = "v"
    "i" = "w"
    "j" = "x"
    "k" = "y"
    "l" = "z"
    "m" = "a"
    "n" = "b"
    "o" = "c"
    "p" = "d"
    "q" = "e"
    "r" = "f"
    "s" = "g"
    "t" = "h"
    "u" = "i"
    "v" = "j"
    "w" = "k"
    "x" = "l"
    "y" = "m"
    "z" = "n"

};
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

};
$shift_14 = @{
    "a" = "m"
    "b" = "n"
    "c" = "o"
    "d" = "p"
    "e" = "q"
    "f" = "r"
    "g" = "s"
    "h" = "t"
    "i" = "u"
    "j" = "v"
    "k" = "w"
    "l" = "x"
    "m" = "y"
    "n" = "z"
    "o" = "a"
    "p" = "b"
    "q" = "c"
    "r" = "d"
    "s" = "e"
    "t" = "f"
    "u" = "g"
    "v" = "h"
    "w" = "i"
    "x" = "j"
    "y" = "k"
    "z" = "l"

};
$shift_15 = @{
    "a" = "l"
    "b" = "m"
    "c" = "n"
    "d" = "o"
    "e" = "p"
    "f" = "q"
    "g" = "r"
    "h" = "s"
    "i" = "t"
    "j" = "u"
    "k" = "v"
    "l" = "w"
    "m" = "x"
    "n" = "y"
    "o" = "z"
    "p" = "a"
    "q" = "b"
    "r" = "c"
    "s" = "d"
    "t" = "e"
    "u" = "f"
    "v" = "g"
    "w" = "h"
    "x" = "i"
    "y" = "j"
    "z" = "k"

};
$shift_16 = @{
    "a" = "k"
    "b" = "l"
    "c" = "m"
    "d" = "n"
    "e" = "o"
    "f" = "p"
    "g" = "q"
    "h" = "r"
    "i" = "s"
    "j" = "t"
    "k" = "u"
    "l" = "v"
    "m" = "w"
    "n" = "x"
    "o" = "y"
    "p" = "z"
    "q" = "a"
    "r" = "b"
    "s" = "c"
    "t" = "d"
    "u" = "e"
    "v" = "f"
    "w" = "g"
    "x" = "h"
    "y" = "i"
    "z" = "j"

};
$shift_17 = @{
    "a" = "j"
    "b" = "k"
    "c" = "l"
    "d" = "m"
    "e" = "n"
    "f" = "o"
    "g" = "p"
    "h" = "q"
    "i" = "r"
    "j" = "s"
    "k" = "t"
    "l" = "u"
    "m" = "v"
    "n" = "w"
    "o" = "x"
    "p" = "y"
    "q" = "z"
    "r" = "a"
    "s" = "b"
    "t" = "c"
    "u" = "d"
    "v" = "e"
    "w" = "f"
    "x" = "g"
    "y" = "h"
    "z" = "i"

};
$shift_18 = @{
    "a" = "i"
    "b" = "j"
    "c" = "k"
    "d" = "l"
    "e" = "m"
    "f" = "n"
    "g" = "o"
    "h" = "p"
    "i" = "q"
    "j" = "r"
    "k" = "s"
    "l" = "t"
    "m" = "u"
    "n" = "v"
    "o" = "w"
    "p" = "x"
    "q" = "y"
    "r" = "z"
    "s" = "a"
    "t" = "b"
    "u" = "c"
    "v" = "d"
    "w" = "e"
    "x" = "f"
    "y" = "g"
    "z" = "h"

};
$shift_19 = @{
    "a" = "h"
    "b" = "i"
    "c" = "j"
    "d" = "k"
    "e" = "l"
    "f" = "m"
    "g" = "n"
    "h" = "o"
    "i" = "p"
    "j" = "q"
    "k" = "r"
    "l" = "s"
    "m" = "t"
    "n" = "u"
    "o" = "v"
    "p" = "w"
    "q" = "x"
    "r" = "y"
    "s" = "z"
    "t" = "a"
    "u" = "b"
    "v" = "c"
    "w" = "d"
    "x" = "e"
    "y" = "f"
    "z" = "g"

};
$shift_20 = @{
    "a" = "g"
    "b" = "h"
    "c" = "i"
    "d" = "j"
    "e" = "k"
    "f" = "l"
    "g" = "m"
    "h" = "n"
    "i" = "o"
    "j" = "p"
    "k" = "q"
    "l" = "r"
    "m" = "s"
    "n" = "t"
    "o" = "u"
    "p" = "v"
    "q" = "w"
    "r" = "x"
    "s" = "y"
    "t" = "z"
    "u" = "a"
    "v" = "b"
    "w" = "c"
    "x" = "d"
    "y" = "e"
    "z" = "f"

};
$shift_21 = @{
    "a" = "f"
    "b" = "g"
    "c" = "h"
    "d" = "i"
    "e" = "j"
    "f" = "k"
    "g" = "l"
    "h" = "m"
    "i" = "n"
    "j" = "o"
    "k" = "p"
    "l" = "q"
    "m" = "r"
    "n" = "s"
    "o" = "t"
    "p" = "u"
    "q" = "v"
    "r" = "w"
    "s" = "x"
    "t" = "y"
    "u" = "z"
    "v" = "a"
    "w" = "b"
    "x" = "c"
    "y" = "d"
    "z" = "e"

};
$shift_22 = @{
    "a" = "e"
    "b" = "f"
    "c" = "g"
    "d" = "h"
    "e" = "i"
    "f" = "j"
    "g" = "k"
    "h" = "l"
    "i" = "m"
    "j" = "n"
    "k" = "o"
    "l" = "p"
    "m" = "q"
    "n" = "r"
    "o" = "s"
    "p" = "t"
    "q" = "u"
    "r" = "v"
    "s" = "w"
    "t" = "x"
    "u" = "y"
    "v" = "z"
    "w" = "a"
    "x" = "b"
    "y" = "c"
    "z" = "d"

};
$shift_23 = @{
    "a" = "d"
    "b" = "e"
    "c" = "f"
    "d" = "g"
    "e" = "h"
    "f" = "i"
    "g" = "j"
    "h" = "k"
    "i" = "l"
    "j" = "m"
    "k" = "n"
    "l" = "o"
    "m" = "p"
    "n" = "q"
    "o" = "r"
    "p" = "s"
    "q" = "t"
    "r" = "u"
    "s" = "v"
    "t" = "w"
    "u" = "x"
    "v" = "y"
    "w" = "z"
    "x" = "a"
    "y" = "b"
    "z" = "c"

};
$shift_24 = @{
    "a" = "c"
    "b" = "d"
    "c" = "e"
    "d" = "f"
    "e" = "g"
    "f" = "h"
    "g" = "i"
    "h" = "j"
    "i" = "k"
    "j" = "l"
    "k" = "m"
    "l" = "n"
    "m" = "o"
    "n" = "p"
    "o" = "q"
    "p" = "r"
    "q" = "s"
    "r" = "t"
    "s" = "u"
    "t" = "v"
    "u" = "w"
    "v" = "x"
    "w" = "y"
    "x" = "z"
    "y" = "a"
    "z" = "b"

};
$shift_25 = @{
    "a" = "b"
    "b" = "c"
    "c" = "d"
    "d" = "e"
    "e" = "f"
    "f" = "g"
    "g" = "h"
    "h" = "i"
    "i" = "j"
    "j" = "k"
    "k" = "l"
    "l" = "m"
    "m" = "n"
    "n" = "o"
    "o" = "p"
    "p" = "q"
    "q" = "r"
    "r" = "s"
    "s" = "t"
    "t" = "u"
    "u" = "v"
    "v" = "w"
    "w" = "x"
    "x" = "y"
    "y" = "z"
    "z" = "a"

};
$shift_26 = @{
    "a" = "a"
    "b" = "b"
    "c" = "c"
    "d" = "d"
    "e" = "e"
    "f" = "f"
    "g" = "g"
    "h" = "h"
    "i" = "i"
    "j" = "j"
    "k" = "k"
    "l" = "l"
    "m" = "m"
    "n" = "n"
    "o" = "o"
    "p" = "p"
    "q" = "q"
    "r" = "r"
    "s" = "s"
    "t" = "t"
    "u" = "u"
    "v" = "v"
    "w" = "w"
    "x" = "x"
    "y" = "y"
    "z" = "z"

};



# If Manual shift, change $(0..26) to custom #
$plaintext = foreach ($shift in $key) {

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

$plaintext
# Make string uppercase = "string".ToUpper()
# See if character is uppercase =   if ([Char]::IsUpper($character))
##### MAKE ARRAY 
### ASCII CODE -> Corresponding Ascii Letter (maybe)
# Minus the shift to reverse the encrypted ceasar cipher
# This is part of code for auto shifting 