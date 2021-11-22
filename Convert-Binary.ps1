[string]$binary = Read-Host "Enter encoded binary text"

[string]$binary = "$binary"
$ErrorActionPreference = "SilentlyContinue"
$binary_value = foreach ($byte in $($binary -split " ")) {
$asciiText = '';
ForEach($line in $byte) { 
$asciiText += [char][byte]"0x$([Convert]::ToString([Convert]::ToInt32($line, 2), 16))"
}
$asciiText -join "`n"
}
(($binary_value -join '')).Trim()
