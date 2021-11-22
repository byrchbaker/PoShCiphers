$encoded = Read-Host "Enter atbash text:"

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
