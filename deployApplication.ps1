Remove-Item 'C:\Users\joao-\Documents\Service Server Files\target' -Force -Recurse

Copy-Item -Path 'C:\Users\joao-\Documents\tcc\actions-runner\_work\tcc-back\tcc-back\target' -Destination 'C:\Users\joao-\Documents\Service Server Files' -Recurse -Force

Start-Service MyApp

Start-Sleep -Seconds 10

$isServiceRunning = Get-Service MyApp | Where-Object {$_.Status -eq "Running"}

if (-Not $isServiceRunning) {
    throw "Application wasn't sucessfully initialized"
}

exit $LASTEXITCODE