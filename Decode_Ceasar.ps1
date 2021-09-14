# User enters the encrypted caesar cipher text
$encoded = Read-Host "Enter caesar cipher"
# Starts a foreach loop from 0-26 -> Number of letters in alphabet 
foreach ($shift in $(26..0)) {
# Makes a array (list) of all the letters in the alphabet
$regularAlphabet = 97..(97+25) | % { [char]$_ }
# Starts the get shift algorithm.
$shiftAlphabet = if ($shift -eq 0 -or $shift -eq 26) {
# ^ Variable to get output of the shift - ^ if then statement to see if shift is 0 or 26, if so shift is A-Z
# Regular A-Z Alphabet
$regularAlphabet[0 .. ($regularAlphabet.Length - 0 ) ]

} else {

# 1-25
# Subtracts from the shift and gets all the numbers before it separated by a comma ->
# ex: (5) - 0,1,2,3,4 <- Notice how the end number is one less than 5 
$leftOver = $("0," + 1..($shift-1) -join ",") -replace " ",","
# This below forms the shifted alphabet list by moving the letter a,b,c,... up and moving the rest with it... Shifting.
$regularAlphabet[$shift .. ($regularAlphabet.Length - 1 ) + $(Invoke-Expression $leftOver)]

}
# There is one of those errors that is about to happen that really doesn't mean anything.
$ErrorActionPreference = 'SilentlyContinue'
# Recognizes the $getShift variable as a hashtable
$getShift = @{}
# Foreach number in 0-26 get the corresponding letter -> 0:A / 1:B | 0:N / 1:O -> Depends on shift alphabet 
0..($regularAlphabet.Length) | ForEach-Object {
# Adds each corresponding letter of the number of the alphabet 0-26 -> As stated above
# and puts it into an hashtable
  $getShift.Add($shiftAlphabet[$_],$regularAlphabet[$_])
  
}
# Decoding Time!
# Making a foreach loop for each letter in encoded text assign it to the variable $encodedLetter
$CharNumberString =  foreach ($encodedLetter in $($encoded.ToCharArray())) {
# sees if letter is in the alphabet
if ($encodedLetter -match "^[a-zA-Z-]+$") {
# if symbol "-", print it.
if ($encodedLetter -eq "-") {

$encodedLetter

}
# Sees if encoded letter is uppercase
if ([char]::IsUpper($encodedLetter)) {
# Decrypt encrypted letter (uppercase)
 $getShift.keys | Where-Object {$_ -eq "$encodedLetter"} | ForEach-Object {('{1}' -f $_, $getShift[$_]).ToUpper()}

} else {
# Decrypt encrypted letter (lowercase)
   $getShift.keys | Where-Object {$_ -eq "$encodedLetter"} | ForEach-Object {'{1}' -f $_, $getShift[$_]}   # Lower case letters
   
}
   } else {
   # Print symbols
   $encodedLetter #Symbols
   
   }
}
# Make plaintext null
$plaintext = ""

$CharNumberString | ForEach-Object {
# Print letter to plaintext to make a whole sentence or string.
$plaintext += $_

}
# Print attempted decrypted string
$plaintext



}
