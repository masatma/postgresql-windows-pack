# ================================
# Create Self-Signed Code Signing Certificate and Export to PFX
# ================================

# --- CONFIGURATION ---
$certName   = "KaeruSign"                  # Friendly name for the certificate
$pfxPath    = "C:\Temp\KaeruSigningCert.pfx" # Output PFX file path
$pfxPass    = "<Password>"                 # Password for PFX file
$validYears = 3                            # Certificate validity in years

try {
    # Ensure output directory exists
    $dir = Split-Path $pfxPath
    if (-not (Test-Path $dir)) {
        New-Item -Path $dir -ItemType Directory -Force | Out-Null
    }

    # Create the self-signed certificate in the Current User's Personal store
    $cert = New-SelfSignedCertificate `
        -Subject "CN=$certName" `
        -Type CodeSigningCert `
        -KeyAlgorithm RSA `
        -KeyLength 2048 `
        -HashAlgorithm SHA256 `
        -CertStoreLocation "Cert:\CurrentUser\My" `
        -NotAfter (Get-Date).AddYears($validYears)

    if (-not $cert) {
        throw "Certificate creation failed."
    }

    Write-Host "Certificate created successfully: $($cert.Thumbprint)" -ForegroundColor Green

    # Export the certificate to PFX
    $securePass = ConvertTo-SecureString -String $pfxPass -Force -AsPlainText
    Export-PfxCertificate `
        -Cert $cert `
        -FilePath $pfxPath `
        -Password $securePass `
        -Force

    Write-Host "PFX exported to: $pfxPath" -ForegroundColor Green
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}
