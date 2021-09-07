$Base64Encoded = Read-Host "Please enter the encoded base64 text:"
$Base64Encoded > ~\Desktop\Encoded.b64
cmd.exe /c "certutil -decode %userprofile%\Desktop\Encoded.b64 %userprofile%\Desktop\Decode.txt" | Out-Null
$Base64Decoded = Get-Content ~\Desktop\Decode.txt

Write-Host "Base64 Decoded:"
Write-Host $Base64Decoded
Remove-Item -path ~\Desktop\Encoded.b64 -Force
Remove-Item -path ~\Desktop\Decode.txt -Force

