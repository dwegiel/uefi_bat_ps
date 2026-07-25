@echo off
:: Check for administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: This script must be run as an Administrator.
    pause
    exit /b
)

echo Searching and forcing Windows Update driver installations...
echo Please wait, this may take a few minutes...

powershell -NoProfile -ExecutionPolicy Bypass -Command "$UpdateSession = New-Object -ComObject Microsoft.Update.Session; $UpdateSearcher = $UpdateSession.CreateUpdateSearcher(); $SearchCriteria = 'IsInstalled=0 and Type=''Driver'''; $SearchResult = $UpdateSearcher.Search($SearchCriteria); if ($SearchResult.Updates.Count -eq 0) { Write-Host 'No pending driver updates found.' -ForegroundColor Green; } else { Write-Host 'Found' $SearchResult.Updates.Count 'driver update(s). Downloading...' -ForegroundColor Cyan; $UpdateDownloader = $UpdateSession.CreateUpdateDownloader(); $UpdateDownloader.Updates = $SearchResult.Updates; [void]$UpdateDownloader.Download(); Write-Host 'Download complete. Installing drivers...' -ForegroundColor Cyan; $UpdateInstaller = $UpdateSession.CreateUpdateInstaller(); $UpdateInstaller.Updates = $SearchResult.Updates; $InstallationResult = $UpdateInstaller.Install(); Write-Host 'Installation Process finished.' -ForegroundColor Green; if ($InstallationResult.RebootRequired) {Write-Host 'A system reboot is required to complete driver updates.' -ForegroundColor Yellow;}}"

echo.
echo Process complete.
pause
