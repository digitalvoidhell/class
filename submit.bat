@echo off
:: Get current date and time for the commit message
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do set mydate=%%c-%%a-%%b
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set mytime=%%a-%%b
set TIMESTAMP=%date% %time%

echo === Starting Git Push (%TIMESTAMP%) ===

:: Stage all changes
git add .

:: Commit with the timestamp message
git commit -m "Backup: %TIMESTAMP%"

:: Push to the remote repository
git push origin main

echo === Done! ===
pause
