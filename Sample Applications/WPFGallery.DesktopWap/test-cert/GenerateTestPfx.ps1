$CertificateFriendlyName = "WPF-Gallery-Test"
$Publisher = "CN=WPF-Gallery-Test"

$cert = New-SelfSignedCertificate -Type Custom `
    -Subject $Publisher `
    -KeyUsage DigitalSignature `
    -FriendlyName $CertificateFriendlyName `
    -CertStoreLocation "Cert:\CurrentUser\My" `
    -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}")

$certificateBytes = $cert.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Pkcs12)
[System.IO.File]::WriteAllBytes("$PSScriptRoot\WPF-Gallery-Test.pfx", $certificateBytes)