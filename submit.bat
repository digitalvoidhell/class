@echo off
:: Get current date and time for the commit message
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do set mydate=%%c-%%a-%%b
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set mytime=%%a-%%b
set TIMESTAMP=%date% %time%

echo === Starting Git Push (%TIMESTAMP%) ===

:: 1. Force Git to use Windows native OpenSSH (which has your running service)
git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"

:: 2. Stage all changes
git add .

:: 3. Commit with the timestamp message
git commit -m "Backup: %TIMESTAMP%"

:: 4. Push to the remote repository
git push origin main

echo === Done! ===
pause
