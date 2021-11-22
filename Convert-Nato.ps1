$encoded = Read-Host "Enter NATO phonetic alphabet"

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
