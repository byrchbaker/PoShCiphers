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
$key = Read-Host "Enter key, if you don't have key"

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

Function Get-PCVigenereFilter {
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

Function Invoke-PCVigenereDecipher {
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
            
          
            #Add results of the decipher
          
        }
    }
    End
    {
        #Return the results
        Return $Plaintext
    }
}

Invoke-PCVigenereDecipher -Ciphertext "$encoded" -key "$key"
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

$ErrorActionPreference = "SilentlyContinue"
$plaintext = All_Cipher

# Auto Solve functionality 

$plaintext | ForEach-Object {
$isEnglish = $null
$_.split(" ") | Foreach {
if ($englishDictionary -match $_) {
$isEnglish += "True`n" 
} else {
$isEnglish += "False`n"
}
}
if ($isEnglish -notmatch "False") {
$_
break
} 
}


<#

The way to get all "decrypted text"
to a variable. Then, find the string 
which has correct english:

$

#>