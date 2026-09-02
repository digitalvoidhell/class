@echo off

:: 1. Get current date and time for the commit message
set TIMESTAMP=%date% %time%

echo === Starting Git Push (%TIMESTAMP%) ===

:: 2. Set the remote URL directly with no variable concatenation
git remote set-url origin https://github.com

:: 3. Stage and commit all changes
git add .
git commit -m "Backup: %TIMESTAMP%"

:: 4. Push to GitHub
git push origin main

:: 5. Clean up the URL locally for security
git remote set-url origin https://github.com

echo === Done! ===
pause
