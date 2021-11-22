<#
  - You enter encoded text, this will find the answer
  - This script will not work with multiple layers of encryption. not yet atleast >:)
  - The functions may say cipher when really not a cipher
  - When you find the way to see if a string matches a dictionary or is english, add it to the CEASAR CIPHER AND ROT47 (change the rot47
  - The Vigenere Cipher automatic key is coming soon. I am currently working on an algorithm. 
#>

$englishDictionary = (Invoke-WebRequest -uri "https://raw.githubusercontent.com/dwyl/english-words/master/words.txt").Content 


$encoded = Read-Host "Enter your encrypted text"
# In the future, you will not need a key >:) 
$key = Read-Host "Enter your key, if you dont have one, dont enter anything"

function Ceasar_Cipher() {
# Reinventing the ceasar cipher decryption brute force
# Work in progress

foreach ($shift in $(26..0)) {

    $regularAlphabet = 97..(97+25) | % { [char]$_ }
    
    $shiftAlphabet = if ($shift -eq 0 -or $shift -eq 26) {
    
    $regularAlphabet[0 .. ($regularAlphabet.Length - 0 ) ]
    
    } else {
    # 1-25
    
    $leftOver = $("0," + 1..($shift-1) -join ",") -replace " ",","
    
    $regularAlphabet[$shift .. ($regularAlphabet.Length - 1 ) + $(Invoke-Expression $leftOver)]
    
    }
    
    $ErrorActionPreference = 'SilentlyContinue'
    $getShift = @{}
    0..($regularAlphabet.Length) | ForEach-Object {
      $getShift.Add($shiftAlphabet[$_],$regularAlphabet[$_])
    }
    
    $CharNumberString =  foreach ($encodedLetter in $($encoded.ToCharArray())) {
    
    if ($encodedLetter -match "^[a-zA-Z-]+$") {
    if ($encodedLetter -eq "-") {
    $encodedLetter
    }
    if ([char]::IsUpper($encodedLetter)) {
     $getShift.keys | Where-Object {$_ -eq "$encodedLetter"} | ForEach-Object {('{1}' -f $_, $getShift[$_]).ToUpper()}
    
    } else {
       $getShift.keys | Where-Object {$_ -eq "$encodedLetter"} | ForEach-Object {'{1}' -f $_, $getShift[$_]}   # Lower case letters
    }
       } else {
       $encodedLetter #Symbols
       }
    }
    
    
    $plaintext = ""
    $CharNumberString | ForEach-Object {
    $plaintext += $_
    
    }
    
    $plaintext
    
    }
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
$Base64Decoded
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

(Invoke-PCVigenereDecipher -CipherText $encoded -Key $key).plaintext
}

function All_Cipher() {
    $ErrorActionPreference = "SilentlyContinue"
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
$ErrorActionPreference = 'SilentlyContinue'

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

$BestMatches = $plaintext.Trim() | ForEach-Object {
if ($_ -eq "") {

} else {

"BEST MATCH: $_"

}
}

$BestMatches | Get-Unique | ForEach-Object {
Write-Host "$_" -ForegroundColor Green
}

<#

The way to get all "decrypted text"
to a variable. Then, find the string 
which has correct english:

$

#>
