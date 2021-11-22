$encoded = Read-Host "Enter backward text"
$backwardstext = $encoded.ToCharArray()
[array]::Reverse($backwardstext)
-join $backwardstext
