$Base64Encoded = Read-Host "Please enter the encoded base64 text:"
[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($Base64Encoded))
