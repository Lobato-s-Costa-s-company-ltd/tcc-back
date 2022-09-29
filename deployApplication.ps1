$TargetFolder = 'C:\Users\mloba\Documents\Service Server Files\target'
$BackupFolder = 'C:\Users\mloba\Documents\Service Server Files\backup'

function RollbackServerFiles {
    Write-Output 'An error occured during server initialization'
    Write-Output 'Reverting changes...'
    Remove-Item 'C:\Users\mloba\Documents\Service Server Files\target' -Force -Recurse
    if(Test-Path -Path $BackupFolder){
        Move-Item -Path 'C:\Users\mloba\Documents\Service Server Files\backup' -Destination 'C:\Users\mloba\Documents\Service Server Files\target' -Force
    }
    Write-Output 'Restarting server...'
    Stop-Service MyApp
    Start-Sleep -Seconds 5
    Start-Service MyApp
    Write-Error 'There was a problem during application deployment. All changes were reverted and the server was restarted'
    Write-Error 'Follow the output log to check the errors'
    throw "Application wasn't sucessfully initialized"
}

Write-Output 'Stopping Service'
Stop-Service MyApp

Write-Output 'Awaiting 5s to service completety stop'
Start-Sleep -Seconds 5

if(Test-Path -Path $TargetFolder){
    Move-Item -Path 'C:\Users\mloba\Documents\Service Server Files\target' -Destination 'C:\Users\mloba\Documents\Service Server Files\backup' -Force
}

Write-Output 'Moving new files to server directory'
Copy-Item -Path 'C:\Users\mloba\Documents\tcc\actions-runner\_work\tcc-back\tcc-back\target' -Destination 'C:\Users\mloba\Documents\Service Server Files' -Recurse -Force

try {
    Write-Output 'Trying to initialize server'
    Start-Service MyApp
}
catch {
    RollbackServerFiles
}

Start-Sleep -Seconds 10

Write-Output 'Checking if service is up and healthy'
$isServiceRunning = Get-Service MyApp | Where-Object {$_.Status -eq "Running"}

if (-Not $isServiceRunning) {
    RollbackServerFiles
}

if(Test-Path -Path $BackupFolder){
    Write-Output 'Removing old backup files'
    Remove-Item 'C:\Users\mloba\Documents\Service Server Files\backup' -Force -Recurse
}

Write-Output 'Deployment sucessfully completed!'

exit $LASTEXITCODE
