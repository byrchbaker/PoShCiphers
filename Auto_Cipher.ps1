<#
  - You enter encoded text, this will find the answer
  - This script will not work with multiple layers of encryption. not yet atleast >:)
  - The functions may say cipher when really not a cipher, i blame my ocd
  - When you find the way to see if a string matches a dictionary or is english, add it to the CEASAR CIPHER AND ROT47 (change the rot47
  - The Vigenere Cipher automatic key is coming soon. I am currently working on an algorithm. 
#>

$englishDictionary = (Invoke-WebRequest -uri "https://raw.githubusercontent.com/dwyl/english-words/master/words.txt").Content 


$encoded = Read-Host "Enter your encrypted text"
# In the future, you will not need a key >:) 


function Ceasar_Cipher() {

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
$plaintext = foreach ($shift in $(0..26)) {
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
}

function Binary_Cipher() {
[string]$binary = $encoded
$ErrorActionPreference = "SilentlyContinue"
$binary_value = foreach ($byte in $($binary -split " ")) {
$asciiText = '';
ForEach($line in $byte) { 
$asciiText += [char][byte]"0x$([Convert]::ToString([Convert]::ToInt32($line, 2), 16))"
}
$asciiText -join "`n"
}
(($binary_value -join '')).Trim()
}

function Base64_Cipher() {
$Base64Encoded = $encoded
$Base64Encoded > ~\Desktop\Encoded.b64
cmd.exe /c "certutil -decode %userprofile%\Desktop\Encoded.b64 %userprofile%\Desktop\Decode.txt" | Out-Null
$Base64Decoded = Get-Content ~\Desktop\Decode.txt
Write-Host $Base64Decoded
Remove-Item -path ~\Desktop\Encoded.b64 -Force
Remove-Item -path ~\Desktop\Decode.txt -Force



}

function MorseCode_Cipher() {
# Decrypts, but still needs some fixing
$charArray = $null
	
$morseArray = @(".-","-...","-.-.","-..",".","..-.","--.",
"....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",
".-.","...","-","..-","...-",".--","-..-","-.--","--..",".----",
"..---","...--","....-",".....","-....","--...","---..","----.",
"-----",".-.-.-","--..--","..--..","..--.","---...","-...","-.-.--","---...")
$letterArray = @("a","b","c","d","e","f","g","h","i","j","k","l",
"m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2",
"3","4","5","6","7","8","9","0",".",",","?","=","!",":") 

"$encoded" | ForEach-Object {$_.Split(" ")} | ForEach-Object {$_.Replace("_","-")} | ForEach-Object {$_.Replace(" / "," ")} | ForEach-Object {$_.Replace(" | "," ")} | ForEach-Object {

 $index = $morseArray.indexof("$_")
 $charArray += $letterArray[$index]

 }
 $charArray.replace(":"," ")
}

function Reverse_Cipher() {
$backwardstext = $encoded.ToCharArray()

[array]::Reverse($backwardstext)

-join $backwardstext
}

function NATO_Cipher() {
$NATOarray = @{
"Alpha" = "A"
"Alfa" = "A"
"Bravo" = "B"
"Charlie" = "C"
"Delta" = "D"
"Echo" = "E"
"Foxtrot" = "F"
"Golf" = "G"
"Hotel" = "H"
"India" = "I"
"Juliett" = "J"
"Kilo" = "K"
"Lima" = "L"
"Mike" = "M"
"November" = "N"
"Oscar" = "O"
"Papa" = "P"
"Quebec" = "Q"
"Romeo" = "R"
"Sierra" = "S"
"Tango" = "T"
"Uniform" = "U"
"Victor" = "V"
"Whiskey" = "W"
"Xray" = "X"
"Yankee" = "Y"
"Zulu" = "Z"
"(space)" = " "
"Stop" = "."
}
$plaintext = ""
$encoded.split(" ") | ForEach-Object {
    
    $plaintext += $NATOarray."$_"
    

}
$plaintext
}

function ROT5_Cipher() {

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

}

function ROT13_Cipher() {

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

$plaintext
}

function ROT18_Cipher() {
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
}

function ROT47_Cipher() {
###############################################################################################################
# CREDIT::::::::::
# Language     :  PowerShell 4.0
# Filename     :  Convert-ROT47.ps1
# Autor        :  BornToBeRoot (https://github.com/BornToBeRoot)
# Description  :  Rotate ascii chars by n places (Caesar cipher)
# Repository   :  https://github.com/BornToBeRoot/PowerShell
###############################################################################################################


function Convert-Rot47() {


[CmdletBinding(DefaultParameterSetName='Decrypt')]
param (
    [Parameter(
        Position=0,
        Mandatory=$true,
        HelpMessage='String which you want to encrypt or decrypt')]    
    [String]$Text,

    [Parameter(
        Position=1,
        HelpMessage='Specify which rotation you want to use (Default=1..47)')]
    [ValidateRange(1,47)]
    [Int32[]]$Rot=1..47,

    [Parameter(
        ParameterSetName='Encrypt',
        Position=2,
        HelpMessage='Encrypt a string')]
    [switch]$Encrypt,
    
    [Parameter(
        ParameterSetName='Decrypt',
        Position=2,
        HelpMessage='Decrypt a string')]
    [switch]$Decrypt,

    [Parameter(
        Position=3,
        HelpMessage='Use complete ascii table 0..255 chars (Default=33..126)')]
    [switch]$UseAllAsciiChars
)

Begin{
    [System.Collections.ArrayList]$AsciiChars = @()
     
    $CharsIndex = 1
    
    $StartAscii = 33
    $EndAscii = 126

    # Use all ascii chars (useful for languages like german)
    if($UseAllAsciiChars)
    {
        $StartAscii = 0
        $EndAscii = 255

        Write-Host "Warning: Parameter -UseAllAsciiChars will use all chars from 0 to 255 in the ascii table. This may not work properly, but could be usefull to encrypt or decrypt languages like german with umlauts!" -ForegroundColor Yellow
    }

    # Add chars from ascii table
    foreach($i in $StartAscii..$EndAscii)
    {
        $Char = [char]$i

        [pscustomobject]$Result = @{
            Index = $CharsIndex
            Char = $Char
        }   

        [void]$AsciiChars.Add($Result)

        $CharsIndex++
    }

    # Default mode is "Decrypt"
    if(($Encrypt -eq $false -and $Decrypt -eq $false) -or ($Decrypt)) 
    {        
        $Mode = "Decrypt"
    }    
    else 
    {
        $Mode = "Encrypt"
    }

    Write-Verbose -Message "Mode is set to: $Mode"
}

Process{
    foreach($Rot2 in $Rot)
    {        
        $ResultText = [String]::Empty

        # Go through each char in string
        foreach($i in 0..($Text.Length -1))
        {
            $CurrentChar = $Text.Substring($i, 1)

            if(($AsciiChars.Char -ccontains $CurrentChar) -and ($CurrentChar -ne " ")) # Upper chars
            {
                if($Mode -eq  "Encrypt")
                {                    
                    [int]$NewIndex = ($AsciiChars | Where-Object {$_.Char -ceq $CurrentChar}).Index + $Rot2 
                    
                    if($NewIndex -gt $AsciiChars.Count)
                    {
                        $NewIndex -= $AsciiChars.Count                     
                    
                        $ResultText +=  ($AsciiChars | Where-Object {$_.Index -eq $NewIndex}).Char
                    }
                    else 
                    {
                        $ResultText += ($AsciiChars | Where-Object {$_.Index -eq $NewIndex}).Char    
                    }
                }
                else 
                {
                    [int]$NewIndex = ($AsciiChars | Where-Object {$_.Char -ceq $CurrentChar}).Index - $Rot2 

                    if($NewIndex -lt 1)
                    {
                        $NewIndex += $AsciiChars.Count                     
                    
                        $ResultText +=  ($AsciiChars | Where-Object {$_.Index -eq $NewIndex}).Char
                    }
                    else 
                    {
                        $ResultText += ($AsciiChars | Where-Object {$_.Index -eq $NewIndex}).Char    
                    }
                }   
            }
            else 
            {
                $ResultText += $CurrentChar  
            }
        } 
    
        $ResultText
        
    }
}

End{

}
        }

       Convert-Rot47 -Text $encoded -Decrypt
}

function A1Z26_Cipher() {


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

}

function Atbash_Cipher() {


$AtBasharray = @{
    "a" = "z"
    "b" = "y"
    "c" = "x"
    "d" = "w"
    "e" = "v"
    "f" = "u"
    "g" = "t"
    "h" = "s"
    "i" = "r"
    "j" = "q"
    "k" = "p"
    "l" = "o"
    "m" = "n"
    "n" = "m"
    "o" = "l"
    "p" = "k"
    "q" = "j"
    "r" = "i"
    "s" = "h"
    "t" = "g"
    "u" = "f"
    "v" = "e"
    "w" = "d"
    "x" = "c"
    "y" = "b"
    "z" = "a"

};




# If Manual shift, change $(0..26) to custom #


$CharNUMBERString = $encoded.ToCharArray() | Foreach-Object {

if ($_ -match "^[a-zA-Z-]+$") {
if ($_ -eq "-") {
$_
}

if ([char]::IsUpper($_)) {

$AtBasharray."$_".ToUpper() # Lower to UPPER case

} else {
   $AtBasharray."$_"    # Lower case letters

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
# Make string uppercase = "string".ToUpper()
# See if character is uppercase =   if ([Char]::IsUpper($character))
##### MAKE ARRAY 
### ASCII CODE -> Corresponding Ascii Letter (maybe)
# Minus the shift to reverse the encrypted ceasar cipher
# This is part of code for auto shifting 
}

function Vigenere_Cipher() {

# All Credit for the vigenere cipher decryption goes to @StackCrash (Github) PoshCipher repository
# https://github.com/StackCrash/PoshCiphers/tree/master/PoshCiphers

Function Get-PCVigenereFilter 
{
    <# 
        .Synopsis
        Returns an array of numbers representing the vigenere key.

        .Description
        Returns an array of numbers representing the vigenere key.

        .Parameter Key
        The key to use.

        .Example
        Get-PCVigenereFilter -Key "password"
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True, Position=0, ValueFromPipeline=$True)]
        [String] $Key
    )
    Begin
    {
        $KeyArray = New-Object System.Collections.ArrayList
    }
    Process
    {
        ForEach ($Character in $Key.ToCharArray())
        {
            Switch ([Byte]$Character)
            {
                #Uppercase characters
                {$_ -ge 65 -and $_ -le 90} { $KeyArray.Add((($_ - 65) % 26)) | Out-Null }
                #Lowercase characters
                {$_ -ge 97 -and $_ -le 122} { $KeyArray.Add((($_ - 97) % 26)) | Out-Null }
                #Ignore symbols and numbers
                Default { Out-Null }
            }
        }
    }
    End
    {
        Return $KeyArray
    }
}

Function Invoke-PCKasiskiExam
{
    <# 
        .Synopsis
        Performs Kasiski examination on supplied ciphertext and returns the factors.

        .Description
        Performs Kasiski examination on supplied ciphertext and returns the factors.

        .Parameter Ciphertext
        Ciphertext to examine.

        .Example
        Invoke-PCKasiskiExam -Ciphertext 'TpczwxviXzkxfitvgkwevvhtnitpwbetnvgbhlgixasxkjqhvitrxxdcfzjyagwcxygvcecnfmpkigvifgeklmgjxhvieztawv'
        2
        3
        6
        7
        14
        21
        42
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True, Position=0, ValueFromPipeline=$True)]
        [String] $Ciphertext
    )
    Begin
    {
        #Remove anything that is not a letter
        $Ciphertext = [Regex]::Replace($Ciphertext,'[^a-zA-Z]','').ToUpper()
        $Repeats = New-Object System.Collections.ArrayList
    }
    Process
    {
        $Series = New-Object System.Collections.ArrayList
        #Get all unique three letter words that repeat
        ForEach ($Index in 0..($Ciphertext.Length - 2))
        {
            $Letters = $Ciphertext[$Index..($Index + 2)] -join ''
            If ($Letters -notin $Series -and $Letters.Length -eq 3) { $Series.Add($Letters) | Out-Null }
        }
        #Loop through each set of letters
        ForEach ($Letters in $Series)
        {
            #Get all the matches of the letters
            $Matched = [Regex]::Matches($Ciphertext,$Letters)
            #If the letters repeated
            If ($Matched.Count -gt 1)
            {
                $Spaces = New-Object System.Collections.ArrayList
                $Factors = New-Object System.Collections.ArrayList
                #Gets the index of each repeat
                $Indexes = $Matched | Select-Object -ExpandProperty Index
                #Generates a negative version of the index for use later
                $NegList = $Indexes | ForEach-Object { -$_ }
                #Gets the spaces between repeats by adding the negative version to each index
                ForEach ($Index in $Indexes)
                {
                    ForEach ($Neg in $NegList)
                    {
                        #Only keeping positive results
                        If ($Index + $Neg -gt 0)
                        {
                            $Spaces.Add(($Index + $Neg)) | Out-Null
                        }
                    }
                }
                #Gets the factors for the spaces that are greater than 2
                ForEach ($Space in $Spaces)
                {
                    2..$Space | ForEach-Object {
                        If ($Space % $_ -eq 0)
                        {
                            $Factors.Add($_) | Out-Null
                        }
                    }
                }
                $Result = [PSCustomObject]@{
                    'Letters' = $Letters
                    'Spaces' = $Spaces
                    'Factors' = $Factors
                }
                $Repeats.Add($Result) | Out-Null
            }
        }
        #Counts how many sets of factors are generated
        $Count = $Repeats | Measure-Object | Select-Object -ExpandProperty Count
        #$Repeats
        $Factors = New-Object System.Collections.ArrayList
        If ($Count)
        {
            If ($Count -gt 1)
            {
                #Gets all factors that repeated more than once
                $CommonFactors = $Repeats.Factors | Group-Object |
                                Where-Object {$_.Count -gt 1} |
                                Select-Object Count,Name
            }
            ElseIf ($Count -eq 1)
            {
                #Gets the entire set of factors
                $CommonFactors = $Repeats.Factors | Group-Object |
                Select-Object Count,Name
            }
        }
        If ($CommonFactors)
        {
            #Gets the total of the factor counts
            $Total = ($CommonFactors | Select-Object -ExpandProperty Count) -join '+' |
                    Invoke-Expression
            ForEach ($Factor in $CommonFactors)
            {
                #Creates an object with the factor, its count and a weight multiplier
                $Factors.Add(([PSCustomObject]@{
                    'Factor' = $Factor | Select-Object -ExpandProperty Name
                    'Count' = $Factor | Select-Object -ExpandProperty Count
                    'Weight' = ($Factor | Select-Object -ExpandProperty Count) / $Total * 1.10
                })) | Out-Null
            }
        }
    }
    End
    {
        Return $Factors
    }
}


Function Invoke-PCBruteForceKey
{
    <# 
        .Synopsis
        Brute forces the best vigenere cipher key for a given keylength.

        .Description
        Brute forces the best vigenere cipher key for a given keylength.

        .Parameter Ciphertext
        Ciphertext to brute force the key from.

        .Parameter KeyLength
        Key length to brute force

        .Example
        Invoke-PCBruteForceKey -Ciphertext 'TpczwxviXzkxfitvgkwevvhtnitpwbetnvgbhlgixasxkjqhvitrxxdcfzjyagwcxygvcecnfmpkigvifgeklmgjxhvieztawv' -KeyLength 6
        SECRET

        .NOTES
        The length of the ciphertext is important because shorter ciphertext will increase the chance of an inaccurate result.
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True, Position=0, ValueFromPipeline=$True)]
        [String] $Ciphertext,
        [Parameter(Mandatory = $True, Position=1, ValueFromPipeline=$True)]
        [ValidateRange(2,99)]
        [Int] $KeyLength
    )
    Begin
    {
        #Remove anything that is not a letter
        $Ciphertext = [Regex]::Replace($Ciphertext,'[^a-zA-Z]','').ToUpper()
        #Array list to store the key in
        $Key = New-Object System.Collections.ArrayList
        #Bigram square with entropy values to use when generating entropy
        $BigramSqaure = Get-PCBigramSquare
        #Array with alphabet to generate bigrams from
        $Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ToCharArray()
    }
    Process
    {
        #Object to hold the best bigram and its entropy
        $Best = [PSCustomObject]@{
            'First' = ''
            'Second' = ''
            #Generates a large entrpoy initially so any pair will be better initially
            'Entropy' = [Math]::Pow(10,10)
        }
        #Loop through each index in the key
        ForEach ($KeyIndex in 0..($KeyLength - 1))
        {
            #Reset best entropy
            $Best.Entropy = [Math]::Pow(10,10)
            #Loop through the first half of the bigrams
            ForEach ($First in $Alphabet)
            {
                #Loop through the second half of the bigrams
                ForEach ($Second in $Alphabet)
                {
                    $Bigram = $First + $Second
                    $Entropy = 0
                    #Gets an array with the ciphertext start for a vigenere square
                    $Filter = Get-PCVigenereFilter -Key $Bigram | ForEach-Object { (26 - $_) % 26 }
                    
                    #Generates the starting indexes for the current key index
                    $Sequence = For ($i = $KeyIndex; $i -lt ($Ciphertext.Length - 1); $i += $KeyLength) { $i }
                    ForEach ($Index in $Sequence)
                    {
                        #Gets the plaintext value for the first part of the bigram at a given index
                        $FirstPlain = ([Byte]$Ciphertext[$Index] - 65 + $Filter[0]) % 26
                        #Gets the plaintext value for the second part of the bigram at a given index
                        $SecondPlain = ([Byte]$Ciphertext[$Index + 1] - 65 + $Filter[1]) % 26
                        #Adds the entropy for the plaintext bigram to the key bigram's entropy
                        $Entropy += $BigramSqaure[$FirstPlain][$SecondPlain]
                    }
                    #Checks if the key bigram's entropy is best entropy
                    If ($Entropy -lt $Best.Entropy)
                    {
                        $Best.First = $First
                        $Best.Second = $Second
                        $Best.Entropy = $Entropy
                    }
                }
            }
            If ($KeyIndex -eq 0)
            {
                #Object to hold the first index of the key
                $Zero = [PSCustomObject]@{
                    'First' = $Best.First
                    'Second' = $Best.Second
                    'Entropy' = $Best.Entropy
                }
                #Push the first letter of the key to the key array
                $Key.Add($Zero.First) | Out-Null
            }
            ElseIf ($KeyIndex -eq ($KeyLength - 1))
            {
                #If last index in key add the first best
                $Key.Add($Best.First) | Out-Null
            }
            Else
            {
                #Checks if previous is better then current and stores previous is true
                If ($Previous.Entropy -le $Best.Entropy) { $Key.Add($Previous.Second) | Out-Null }
                Else { $Key.Add($Best.First) | Out-Null }
            }
            #Object to hold the previous best bigram
            $Previous =  [PSCustomObject]@{
                'First' = $Best.First
                'Second' = $Best.Second
                'Entropy' = $Best.Entropy
            }   
        }
        #Checks if last best bigram is better then key index zero
        If ($Best.Entropy -lt $Zero.Entropy) { $Key[0] = $Best.Second }
    }
    End
    {
        [String]$Key = $Key -join ''
        Return $Key
    }
}


Function Get-PCModulus 
{
    <# 
        .Synopsis
        Returns the modulus of a dividend and divisor.

        .Description
        Returns the modulus of a dividend and divisor.

        .Parameter Dividend
        The dividend to use.

        .Parameter Divisor
        The divisor to use.

        .Example
        Get-PCModulus -Dividend 5 -Divisor 2
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True, Position=0, ValueFromPipeline=$True)]
        [Int] $Dividend,
        [Parameter(Mandatory = $True, Position=1, ValueFromPipeline=$True)]
        [Int] $Divisor
    )
    Process
    {
        $Modulus = ($Dividend % $Divisor + $Divisor) % $Divisor
    }
    End
    {
        #Returns the Modulus of the dividend and divisor
        Return $Modulus 
    }
}


Function Get-PCBigramSquare
{
    <# 
        .Synopsis
        Returns a multidimensional array of bigram logs.

        .Description
        Returns a multidimensional array of bigram logs.
        Bigram frequencies taken from http://practicalcryptography.com/media/cryptanalysis/files/english_bigrams_1.txt and normalized through logarithms.

        .Example
        Get-PCBigramSquare
    #>
    Param
    ()
    Begin
    {
        $BigramSquare = @(
            @(3.40008157684157,2.69262260305957,2.38293189544025,2.46337633776572,3.72422806569787,2.87982813518528,2.69095880781716,3.28851581870791,2.49054923237858,3.69624851126805,2.9251626741056,2.05370349068739,2.43243099636807,1.79219757243754,3.76108865282038,2.70373380444589,4.13749423559963,2.00901166690972,2.05870695840607,1.95218017166687,2.94710793783851,2.71740241745513,3.04272770098262,3.81581140989685,2.57431729135585,3.75033434908219), #A,A-Z
            @(2.68809924465431,3.79757972976293,4.13023313468313,4.4843693365975,2.34656628562577,4.7588037478416,5.0282719692697,4.44700096971362,2.99676460155375,4.18471408013958,5.2046473770358,2.79447373428197,4.35303407902197,4.61008082847895,2.72354918231502,4.57459310431446,5.89451053925169,2.97115504465397,3.48678045819694,4.00417479391998,2.7267025491786,4.55642423580126,4.48918459389718,6.15574780645768,2.91722465391391,5.72570116176496), #B,A-Z
            @(2.33637480293287,4.16160503422881,3.15495900146205,4.08148812124111,2.33915396934263,4.20836373764191,4.37680660309874,2.33199543104726,2.70924313537199,5.01757843210656,2.77825906142505,2.8813052862996,4.17962058123979,4.36163443192204,2.20878421511598,4.05278707900799,4.43849115056166,2.89440444035591,3.4955136924453,2.56076226398864,2.97275897195214,4.66173699475536,4.22553808366734,5.91162266213017,3.57697320390025,4.87311496994152), #C,A-Z
            @(2.3907794982485,2.85009059528792,3.05812177656009,3.0337001310947,2.20405513711652,3.03017577239264,3.24812815254184,2.9744867364217,2.29995950277439,3.7331528595687,3.91512420668598,3.15146415313208,3.08629393072488,3.18250037446987,2.51795403807035,3.13827194410068,4.18363049595913,2.87988053485536,2.61761892853379,2.43835132973027,2.86790376615884,3.54297972839846,2.94509893600899,5.19794196564964,3.28992915780662,4.64450408877784), #D,A-Z
            @(1.99911174706151,2.64739317384422,2.22468641212529,1.9670658757195,2.36877511834204,2.51360966534181,2.71752933620732,2.75742608545672,2.43104859811146,3.5365656725572,3.25358623325524,2.27243231875864,2.37713452246012,1.94577978073059,2.50478739668409,2.48901495388631,3.47111873048118,1.74865052742196,1.87948721193091,2.11906511068871,3.07074401305354,2.61165877387098,2.4663297163577,2.88389905049225,2.75919919159084,3.96801056832909), #E,A-Z
            @(2.71379985420777,3.68740976666134,3.43978012745797,3.76198125774432,2.70498570176465,2.8516009090294,3.83124261664974,3.45761125067452,2.55694053422631,4.20475196911783,4.27624325260515,3.17487462662503,3.5385329222899,3.90806296507988,2.35889082484959,3.55677338567711,4.95916835147899,2.71476497628451,3.32469243887351,2.49930231105726,3.13912105169195,4.24729118525167,3.63334242834289,5.35004879123752,3.73829288082392,5.14193885717678), #F,A-Z
            @(2.58514041189457,3.56240856671014,3.52210854586017,3.69151852313723,2.47678201744114,3.46997494599249,3.46908787388654,2.64112404868185,2.78444815720697,4.38805532782321,4.42150510047575,3.22482001094793,3.56456489122869,3.25093094383129,2.72268314678783,3.55124934133782,4.85956062211078,2.79142365483197,3.0425376882975,2.76972997513526,3.05973807923104,4.36457513621844,3.44055496615139,5.46628286950821,3.64475932362189,5.18084038646378), #G,A-Z
            @(2.07993586662078,3.6298588635438,3.47721737236327,3.71747237014816,1.6329153697023,3.71458461701965,4.00282718260416,3.51204754383877,2.19663940572037,4.35735984542613,4.31288375941207,3.56791018896634,3.50460041414714,3.49477562126702,2.34079288658352,3.64527157506193,4.63054210551403,3.05122803425739,3.24460589678436,2.71413139418868,3.1931319408294,4.34024568081807,3.48877183720043,5.75933431774711,3.47559480566542,5.06692281032666), #H,A-Z
            @(2.63581116047045,3.2211851701076,2.30409861049654,2.52541700453045,2.53879587368039,2.87695531678389,2.65677947395458,3.8500827013191,3.85262113058005,4.29520065682408,3.22341715210596,2.38358931574512,2.61287575316426,1.69302770075723,2.3093545870779,3.11103253525796,4.17105888796049,2.56840538361185,2.06360814650584,2.056817986623,3.87496138266966,2.67546428784301,3.67113982048792,3.69173182502354,4.64307559633005,3.36503297745977), #I,A-Z
            @(3.40220125919924,5.34854475901621,5.24197252514512,5.29539492857051,3.46348593792481,5.53415145778459,5.55588568462303,5.31450725341927,4.08252895531604,5.42947746649297,5.49079539858458,5.55135799966947,5.28685424512892,5.47597057883497,3.20111492854056,5.09782774468779,6.77736133416132,4.73025913346373,5.04121875685114,5.32609808612922,3.16980013037945,5.68529030694673,5.42953146978599,6.76257792991556,5.87827478582257,6.17968437637297), #J,A-Z
            @(3.18364613190885,3.97516582779286,4.01263166310263,4.19188185650987,2.60852160300311,3.90564774428833,4.31519985863287,3.82292170591723,2.87139683791022,4.75044684310587,4.56104188049533,3.7083695723642,3.94960465004563,3.35626899701162,3.39087941395432,4.06111167022497,5.49272753853078,3.9308734408033,3.12705475300162,3.47633584989004,3.93121791563727,4.7714823888043,3.77878746128577,5.92977842202825,3.89294100119547,5.58699083024719), #K,A-Z
            @(2.27081663350065,3.24431194216414,3.26890380309754,2.62536202537249,2.15326413308802,3.20412929369776,3.66906623320205,3.53071274129643,2.2687072451066,4.29672146833102,3.5698761593893,2.24431291169335,3.2902280529855,3.75949823338669,2.4428766728765,3.23038876548593,4.74857385992184,3.45833548437839,2.69760642048799,2.80228784591505,2.99215576447413,3.54307721816893,3.37183406017194,5.44649244620173,2.49784760782051,4.87763781237971), #L,A-Z
            @(2.29687706591741,3.02081540999177,3.59382453892281,3.9536397049647,2.20072757337131,3.78153964892094,4.18085104823936,3.78411201074682,2.55064563919286,4.50794218480869,4.59041516748431,3.95599117710039,3.06413055606849,3.88895545536611,2.52360300823475,2.74184999706151,5.30633794955565,3.8159474714938,3.04229627607751,3.15075285594682,3.06119214261962,4.50135806980304,3.66387120600704,5.48208366738643,3.34605794857322,5.37413621412134), #M,A-Z
            @(2.26395328352164,3.07927139656317,2.45363733619669,1.97131008485837,2.19923228383023,2.94126411760583,2.04967856372443,3.04312128604849,2.39405073937517,3.50790822225938,3.15256803647364,3.06852098807415,3.0564661699083,2.92149340579594,2.3595720692899,3.16341619848542,4.29859504536064,3.25685058435923,2.30738802760524,1.93088128698962,3.06388684730124,3.29455621795666,3.0110013289036,4.7617415416322,2.99807970370536,4.21026487830924), #N,A-Z
            @(2.81937745057988,2.8426312911117,2.75241016760461,2.7545016623832,3.21820966255784,2.15101664385662,3.01647897641069,3.12339303872727,2.90863257777146,3.81564319941812,3.10473011848226,2.49833900207673,2.31231323581397,1.8806698686428,2.62862643434737,2.61638947594339,4.54713538472843,1.97574300347484,2.50247891105705,2.33296079428663,2.14296663723472,2.76961036541997,2.47123556359971,3.82293306287694,3.34969094315217,4.27690590495624), #O,A-Z
            @(2.55423771599674,4.0684768903693,4.03350426233248,4.19947824791528,2.44351737994808,4.01454773604498,4.31134241307122,3.18482719879445,2.89088545184268,4.96340352219388,4.71673149658133,2.64413098919798,3.66684390504337,4.5164941628855,2.55971209567272,2.94806709657595,5.36622217410109,2.51561481934774,3.25986277260145,3.05469152721812,3.04951964840482,4.95370831274684,3.91128600956621,5.8024964024991,4.03804216034473,5.6492611361208), #P,A-Z
            @(4.7694516851938,5.19962454140491,5.60785623664021,5.69747888593776,5.85630204047313,5.692502955222,6.22647266305951,5.54694779751292,4.7702793972685,6.50814601589798,6.32990264896015,5.65349160286716,5.54546411555584,6.05520159201852,5.66304797588373,5.85328259969935,6.23813227560451,5.85956062211078,5.31685496533184,5.40765220547571,3.01582246977877,6.01141016921751,5.09595721677618,6.75223709657734,5.97721950314851,7.18874050038874), #Q,A-Z
            @(2.1788409571826,3.11134507941016,2.79241266548641,2.68042066898458,1.8511129736733,3.09981605383648,2.96882512188395,3.16333134151109,2.19444467323949,3.92143716213475,2.98351679707418,2.95436370197172,2.76796052833853,2.78680880313743,2.17005827599218,3.08102334227985,4.44018425474087,2.8653254414161,2.30880006819118,2.30434857699622,2.90912594008007,3.20575169123372,3.11111243382228,5.04870408941346,2.69198184743931,4.58116294222739), #R,A-Z
            @(2.1576188084399,2.8913173666085,2.60244920187753,3.05131291246292,2.13714326756364,2.85242410165172,3.32546651177081,2.41128449642076,2.2249722133626,3.78805329030672,3.27005726471561,2.93997822924649,2.88920557470141,3.01701509121604,2.25743465574143,2.61179782443343,3.73262075298263,3.09012050445746,2.35907620601241,1.90335682333027,2.63455408484325,3.69038907954013,2.6977174681104,4.92854129728078,3.29066795567573,4.73367800345164), #S,A-Z
            @(2.21846681538926,3.05435174063892,2.92016110782507,3.26547501188348,2.00960115445041,3.10846816863768,3.45119432773408,1.56772067295514,2.00355599348556,3.88811939928295,3.85033167933877,2.90325255223735,3.06072674213543,3.38496183129058,1.9720545482444,3.14869975532593,4.43419832647682,2.43665839742363,2.35891951289511,2.34882559496127,2.70763098942628,3.79194978937491,2.68600844730956,5.18632757519975,2.73232468460678,4.18872964316241), #T,A-Z
            @(2.97408613004639,3.16010128557916,2.87680622518484,3.09188819033792,2.94324219766617,3.78962823927694,2.9517423964821,4.10526219640642,3.09413437760809,4.69058754234863,3.92419841375974,2.62842950835358,2.99346171224808,2.4529791413055,3.82304798529341,2.91105369950457,5.26694258638545,2.39680643705044,2.4400167770491,2.45585387206508,4.83626166017387,4.30945820686422,4.08845367089247,4.47508798210162,3.910019554384,4.44912295459786), #U,A-Z
            @(3.02191144098729,5.17063468137437,4.86486989384823,4.70336896176901,2.16872015370459,5.18734679252938,5.22791311042282,5.15584844908052,2.66369398025337,5.57777631594804,5.57637297899227,4.9454189233869,5.0915327875071,5.11630677442035,3.28308105693053,4.83948379290602,6.4632956005211,4.65174942173769,4.3260704222305,4.83716503991494,4.71771087037203,5.28702925801942,4.97685750373488,6.13183564905227,4.26838979575871,6.21544767262489), #V,A-Z
            @(2.40958754776808,4.03949938755697,3.98423873910224,3.99976583890228,2.51581457674915,4.10928402988773,4.4901118615568,2.56207358158696,2.45368315260711,4.63835925365775,4.46281720620725,3.81781654675524,3.93201674262449,3.0736514788346,2.67654002934018,4.12838537534249,5.42517881604996,3.54714069497979,3.33732336174425,3.52152343812366,4.37849837846442,4.83019382729709,3.80684575711817,5.96583831425782,3.89266558074789,4.91296860022381), #W,A-Z
            @(3.67965900576622,4.66258129311373,3.79204622011093,4.85701683359063,3.82035597995143,4.58270096185316,5.04162755662261,4.41422614147763,3.62528653805716,5.60940612467812,5.500734065074,4.86076158805001,4.53041559766576,5.09514373178051,4.31126014201977,3.37091646317492,5.90221987605387,4.68143410626348,4.44740033909268,3.45693050050874,4.4670093580952,5.14290081186605,4.55917800761012,5.09118572870978,4.66125330130775,6.31741780655644), #X,A-Z
            @(2.77618707979261,3.20505204679329,3.1406244288353,3.30908418627499,2.82303161367312,3.27318163139997,3.61508909620118,3.27582169425258,2.98644547531517,4.05762731015119,4.04266453885442,3.33185221961693,3.23514077414625,3.4639805628124,2.67740646353394,3.22396533792238,4.69164787427943,3.33013048253483,2.75854901633142,2.80890742750747,3.79359390424858,4.02154241251668,3.10710211427284,5.40685695855756,4.11348951271837,4.74224216681822), #Y,A-Z
            @(3.66782719046757,4.93130193352892,5.02272292746024,5.11862343836115,3.40293518514083,5.17865265339021,5.21480487151343,4.60392887735217,3.82698906205153,5.78056112726142,5.2509719333388,4.73259687776872,4.97281981835226,5.25134800016724,4.00851628697642,5.15318212258973,5.87449697423233,5.12155004242902,4.65820692826717,4.88036667553548,4.58075729197908,5.47937966698393,4.79789997990926,6.24443411989185,4.61112151652201,4.29096618231055) #Z,A-Z
        )
    }
    End
    {
        #Returns the bigram square
        Return $BigramSquare
    }
}


Function Get-PCBigramEntropy
{
    <# 
        .Synopsis
        Returns the bigram entropy for the supplied text compared to English bigram frequancies.

        .Description
        Returns the bigram entropy for the supplied text compared to English bigram frequancies.

        .Parameter Plaintext
        Text to generate entropy based on.

        .Example
        Get-PCBigramEntropy -Plaintext "Example"
        16.535234171974
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True, Position=0, ValueFromPipeline=$True)]
        [String] $Plaintext
    )
    Begin
    {
        [Double]$Entropy = 0
        $Bigrams = Get-PCBigramSquare
    }
    Process
    {
        #Remove anything that is not a letter
        $Plaintext = [Regex]::Replace($Plaintext,'[^a-zA-Z]','').ToUpper()
        #Loop though each pair in the text
        ForEach ($Start in 0..($Plaintext.Length - 2))
        {
            #Create the pair to use
            $Pair = $Plaintext[$Start..($Start + 1)]
            #Calculate the entropy
            $Entropy += $Bigrams[($Pair[0] - 65)][($Pair[1] - 65)]
        }   
    }
    End
    {
        Return [Double]$Entropy
    }
}

Function Invoke-PCBruteForceVigenere
{
    <# 
        .Synopsis
        Brute forces the best vigenere cipher key for a given keylength range.

        .Description
        Brute forces the best vigenere cipher key for a given keylength range.

        .Parameter Ciphertext
        Ciphertext to brute force the key from.

        .Parameter MinKeyLength
        Minimum key length to brute force.
            Default value is 3.

        .Parameter MaxKeyLength
        Maximum key length to brute force.
            Default value is 30.

        .Parameter Return
        The number of potential matches returned. 
            Default value is 1.

        .Parameter Strip
        Removes whitespaces from the ciphertext message(s).

        .Example
        Invoke-PCBruteForceVigenere -Ciphertext 'Zls tnsogs wuv sebborj pwvy fkxkvkr lvsvjss ebu nevtwekwy ebu lsx xvv mvkeh sapq st dgrqmbu nevtwekwy mg skxzif' -Return 2

        PlainText                                Ciphertext                               Key                                                     Entropy
        ---------                                ----------                               ---                                                     -------
        The choice for mankind lies between      Zls tnsogs wuv sebborj pwvy fkxkvkr      GEORGE                                                  184.669755696769
        freedom and happiness and for the great  lvsvjss ebu nevtwekwy ebu lsx xvv mvkeh
        bulk of mankind happiness is better      sapq st dgrqmbu nevtwekwy mg skxzif
        The cibmue lor nanaind liet oilwken      Zls tnsogs wuv sebborj pwvy fkxkvkr      GEORFRCMOLGEFEOBGE                                      185.186639807148
        greudom and inthitest ant for the heist  lvsvjss ebu nevtwekwy ebu lsx xvv mvkeh
        hull of cankind inthitest is retter      sapq st dgrqmbu nevtwekwy mg skxzif

        .Example
        Invoke-PCBruteForceVigenere -Ciphertext 'Zls tnsogs wuv sebborj pwvy fkxkvkr lvsvjss ebu nevtwekwy ebu lsx xvv mvkeh sapq st dgrqmbu nevtwekwy mg skxzif' -MaxKeyLength 10

        PlainText                                Ciphertext                               Key                                                     Entropy
        ---------                                ----------                               ---                                                     -------
        The choice for mankind lies between      Zls tnsogs wuv sebborj pwvy fkxkvkr      GEORGE                                                  184.669755696769
        freedom and happiness and for the great  lvsvjss ebu nevtwekwy ebu lsx xvv mvkeh
        bulk of mankind happiness is better      sapq st dgrqmbu nevtwekwy mg skxzif

        .Example
        Invoke-PCBruteForceVigenere -Ciphertext 'Zls tnsogs wuv sebborj pwvy fkxkvkr lvsvjss ebu nevtwekwy ebu lsx xvv mvkeh sapq st dgrqmbu nevtwekwy mg skxzif' -Strip

        PlainText                                Ciphertext                               Key                                                     Entropy
        ---------                                ----------                               ---                                                     -------
        Thechoiceformankindliesbetweenfreedomand Zlstnsogswuvsebborjpwvyfkxkvkrlvsvjssebu GEORGE                                                  184.669755696769
        happinessandforthegreatbulkofmankindhapp nevtwekwyebulsxxvvmvkehsapqstdgrqmbunevt
        inessisbetter                            wekwymgskxzif

        .NOTES
        The length of the ciphertext is important because shorter ciphertext will increase the chance of an inaccurate result.
        Too high of a maximum key length can also cause an inaccurate result.

        .LINK
        https://github.com/stackcrash/PoshCiphers
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True, Position=0, ValueFromPipeline=$True)]
        [String[]] $Ciphertext,
        [Parameter(Mandatory = $False, Position=1, ValueFromPipeline=$True)]
        [ValidateRange(2,99)]
        [Int] $MinKeyLength = 3,
        [Parameter(Mandatory = $False, Position=2, ValueFromPipeline=$True)]
        [ValidateRange(2,99)]
        [Int] $MaxKeyLength = 30,
        [Parameter(Mandatory = $False, Position=3)]
        [ValidateRange(1,99)]
        [Int] $Return = 1,
        [Parameter(Mandatory = $False)]
        [Switch]$Strip
    )
    Begin
    {
        #Check if MaxKeyLength is less than MinKeyLength
        If ($MaxKeyLength -lt $MinKeyLength)
        {
            Write-Error -Message "MaxKeyLength must be equal to or greater than MinKeyLength."
            Break
        }
        #Create an array list to store results in
        $DecipheredMessages = New-Object System.Collections.ArrayList
    }
    Process
    {
        #Loop through each ciphertext
        ForEach ($Message in $Ciphertext)
        {
            $CipherLen = [Regex]::Replace($Message,'[^a-zA-Z]','').Length
            If ($CipherLen -lt $MaxKeyLength) { $MaxKeyLength = $CipherLen}
            #Create an array list to store deciphered characters in
            $DecipheredArray = New-Object System.Collections.ArrayList
            #Create an array list to store deciphered characters in
            If ($Strip)
            {
                #Remove whitespaces
                $Message = $Message -replace '\s', ''
            }
            $Factors = Invoke-PCKasiskiExam -Ciphertext $Message | Sort-Object -Property Factor
            #If Kasiski examination returned factors
            If ($Factors)
            {
                #Removes any factors greater than the max key length
                $Factors = $Factors | Where-Object { [Int]$_.Factor -le $MaxKeyLength }
                Foreach ($Factor in $Factors)
                {
                    $KeyLength = $Factor | Select-Object -ExpandProperty Factor
                    $Key = Invoke-PCBruteForceKey -Ciphertext $Message -KeyLength $KeyLength
                    $PlainText = Invoke-PCVigenereDecipher -Ciphertext $Message -Key $Key | Select-Object -ExpandProperty PlainText
                    $Entropy = Get-PCBigramEntropy -Plaintext $PlainText
                    #Adjust the entropy based on the factor's weight
                    $Entropy = $Entropy - $Entropy * $Factor.Weight

                    $Result = [PSCustomObject]@{
                        'Plaintext' = $PlainText
                        'Ciphertext' = $Message
                        'Key' = $Key
                        'Entropy' = $Entropy
                    }
                    $Result.PSObject.TypeNames.Insert(0,'PoshCiphers.Vigenere.Brute')
                    #Add results to a the $DecipheredArray
                    $DecipheredArray.Add($Result) | Out-Null
                }
            }
            #If Kasiski examination did not return factors
            Else
            {
                ForEach ($KeyLength in $MinKeyLength..($MaxKeyLength + 1))
                {
                    $Key = Invoke-PCBruteForceKey -Ciphertext $Message -KeyLength $KeyLength
                    $PlainText = Invoke-PCVigenereDecipher -Ciphertext $Message -Key $Key | Select-Object -ExpandProperty PlainText
                    $Entropy = Get-PCBigramEntropy -Plaintext $PlainText

                    $Result = [PSCustomObject]@{
                        'Plaintext' = $PlainText
                        'Ciphertext' = $Message
                        'Key' = $Key
                        'Entropy' = $Entropy
                    }
                    $Result.PSObject.TypeNames.Insert(0,'PoshCiphers.Vigenere.Brute')
                    #Add results to a the $DecipheredArray
                    $DecipheredArray.Add($Result) | Out-Null
                }
            }
            #Add the number of desired returns after sorting the $DecipheredArray
           $DecipheredMessages.Add(($DecipheredArray | Sort-Object -Property Entropy | Select-Object -First $Return)) | Out-Null
        }
    }
    End
    {
        #Return the results
        Return $DecipheredMessages
    }
}

Function Invoke-PCVigenereDecipher
{
    <# 
        .Synopsis
        Deciphers message(s) that has been enciphered with a Vigenere cipher.

        .Description
        Deciphers message(s) that has been enciphered with a Vigenere cipher.

        .Parameter Ciphertext
        The enciphered message(s) to be deciphered.

        .Parameter Key
        The key to use in the deciphering.
        Note: The key is case-insensitive.
        
        .Parameter Strip
        Removes whitespaces from the ciphertext message(s).

        .Example
        Invoke-PCVigenereDecipher -Ciphertext "Txselzv" -Key "password"

        Plaintext Ciphertext Key
        --------- ---------- ---
        Example   Txselzv    password

        .Example
        Invoke-PCVigenereDecipher -Ciphertext "Txse lzvZ xtzK loth h" -Key "password" -Strip

        Plaintext         Ciphertext        Key
        ---------         ----------        ---
        ExampleWithSpaces TxselzvZxtzKlothh password

        .LINK
        https://github.com/stackcrash/PoshCiphers
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $True, Position=0, ValueFromPipeline=$True)]
        [String[]] $Ciphertext,
        [Parameter(Mandatory = $True, Position=1)]
        [String] $Key,
        [Parameter(Mandatory = $False, Position=2)]
        [String] $Spacing = 0,
        [Parameter(Mandatory = $False)]
        [Switch]$Strip
    )
    Begin
    {
        #Create an array list to store results in
        $DecipheredMessages = New-Object System.Collections.ArrayList
    }
    Process
    {
        #Loop through each ciphertext
        ForEach ($Message in $Ciphertext)
        {
            #Create an array list to store deciphered characters in
            $Deciphered = New-Object System.Collections.ArrayList
            #Get the Vigenere table for the key
            $Filter = Get-PCVigenereFilter -Key $Key | ForEach-Object { (26 - $_) % 26 }
            #Set the index value to use with the filter
            $FilterIndex = 0
            If ($Strip)
            {
                #Remove whitespaces
                $Message = $Message -replace '\s', ''
            }
            #Loop though each character in the message
            ForEach ($Character in $Message.ToCharArray())
            {
                #Convert the character to ASCII code
                Switch ([Byte]$Character)
                {
                    #Decipher uppercase characters
                    {$_ -ge 65 -and $_ -le 90}
                    {
                        $Deciphered.Add([Char](($_ - 65 + $Filter[$FilterIndex % $Filter.Length]) % 26 + 65)) | Out-Null
                        $FilterIndex += 1
                    }
                    #Decipher lowercase characters
                    {$_ -ge 97 -and $_ -le 122}
                    {
                        $Deciphered.Add([Char](($_ - 97 + $Filter[$FilterIndex % $Filter.Length]) % 26 + 97)) | Out-Null
                        $FilterIndex += 1
                    }
                    #Pass through symbols and numbers
                    Default { $Deciphered.Add($Character) | Out-Null }
                }
            }#Join the results of the decipher
            $Plaintext = $Deciphered -join ""
            #Check is spacing is used
            If ($Spacing -ge 1)
            {
                #Remove existing whitespaces
                $Plaintext = $Plaintext -replace '\s', ''
                #Split the plaintext into the desired spacing
                $Plaintext = ([RegEx]::Matches($Plaintext, ".{1,$Spacing}") | ForEach-Object { $_.Value }) -join ' '
            }
            $Result = [PSCustomObject]@{
                'Plaintext' = $Plaintext
                'Ciphertext' = $Message
                'Key' = $Key
            }
            $Result.PSObject.TypeNames.Insert(0,'PoshCiphers.Vigenere')
            #Add results of the decipher
            $DecipheredMessages.Add($Result) | Out-Null
        }
    }
    End
    {
        #Return the results
        Return $DecipheredMessages
    }
}

(Invoke-PCBruteForceVigenere -Ciphertext $encoded).plaintext
}

function All_Cipher() {
Ceasar_Cipher
Binary_Cipher
Base64_Cipher
MorseCode_Cipher
Reverse_Cipher
NATO_Cipher
ROT5_Cipher
ROT13_Cipher
ROT18_Cipher
ROT47_Cipher
A1Z26_Cipher
Atbash_Cipher
Vigenere_Cipher
}


$plaintext = All_Cipher

# Auto Solve functionality 
$ErrorActionPreference = "SilentlyContinue"
$plaintext = $plaintext | ForEach-Object {
$isEnglish = $null
$_.split(" ") | Foreach {
if ($englishDictionary -match "$_*") {
$isEnglish += "True`n" 
} else {
$isEnglish += "False`n"
}
}
if ($isEnglish -notmatch "False") {
return $_
break
} 
}

$plaintext.Trim() | ForEach-Object {
if ($_ -eq "") {

} else {

Write-Host "BEST MATCH: $_"

}
}

<#

The way to get all "decrypted text"
to a variable. Then, find the string 
which has correct english:

$

#>