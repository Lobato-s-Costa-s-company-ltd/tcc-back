$TargetFolder = 'C:\Users\joao-\Documents\Service Server Files\target'
$BackupFolder = 'C:\Users\joao-\Documents\Service Server Files\backup'

if(Test-Path -Path $TargetFolder){
    Move-Item -Path 'C:\Users\joao-\Documents\Service Server Files\target' -Destination 'C:\Users\joao-\Documents\Service Server Files\backup' -Force
}

Copy-Item -Path 'C:\Users\joao-\Documents\tcc\actions-runner\_work\tcc-back\tcc-back\target' -Destination 'C:\Users\joao-\Documents\Service Server Files' -Recurse -Force

Start-Service MyApp

Start-Sleep -Seconds 10

$isServiceRunning = Get-Service MyApp | Where-Object {$_.Status -eq "Running"}

if (-Not $isServiceRunning) {
    Remove-Item 'C:\Users\joao-\Documents\Service Server Files\target' -Force -Recurse
    if(Test-Path -Path $BackupFolder){
        Move-Item -Path 'C:\Users\joao-\Documents\Service Server Files\backup\target' -Destination 'C:\Users\joao-\Documents\Service Server Files' -Force
        Remove-Item 'C:\Users\joao-\Documents\Service Server Files\backup' -Force -Recurse
    }
    Stop-Service MyApp
    Start-Service MyApp
    Write-Error 'There was a problem during application deployment. All changes were reverted and the server was restarted'
    Write-Error 'Follow the output log to check the errors'
    throw "Application wasn't sucessfully initialized"
}

if(Test-Path -Path $BackupFolder){
    Remove-Item 'C:\Users\joao-\Documents\Service Server Files\backup' -Force -Recurse
}

exit $LASTEXITCODE
