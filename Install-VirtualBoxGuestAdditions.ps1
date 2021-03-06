# install Guest Additions.

Write-Host 'Importing the Oracle (for VirtualBox) certificate as a Trusted Publisher...'
E:\cert\VBoxCertUtil.exe add-trusted-publisher E:\cert\vbox-sha1.cer
if ($LASTEXITCODE) {
    throw "failed to import certificate with exit code $LASTEXITCODE"
}
#Get-ChildItem Cert:\LocalMachine\TrustedPublisher

Write-Host 'Installing the VirtualBox Guest Additions...'
$p = Start-Process -Wait -NoNewWindow -PassThru -FilePath E:\VBoxWindowsAdditions-amd64.exe -ArgumentList '/S'
$p.WaitForExit()
if ($p.ExitCode) {
    throw "failed to install with exit code $($p.ExitCode). Check the logs at C:\Program Files\Oracle\VirtualBox Guest Additions\install.log."
}

Write-Host 'Ejecting the VirtualBox Guest Additions media...'

$ejectVolumeMediaExeUrl = 'https://github.com/rgl/EjectVolumeMedia/releases/download/v1.0.0/EjectVolumeMedia.exe'

$ejectVolumeMediaExe = "$env:TEMP\EjectVolumeMedia.exe"

Invoke-WebRequest $ejectVolumeMediaExeUrl -OutFile $ejectVolumeMediaExe

&$ejectVolumeMediaExe E