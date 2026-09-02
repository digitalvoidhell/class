@echo off

:: 1. Get current date and time for the commit message
set TIMESTAMP=%date% %time%

echo === Starting Git Push (%TIMESTAMP%) ===

:: 2. Stage all changes
git add .

:: 3. Commit with the timestamp message
git commit -m "Backup: %TIMESTAMP%"

:: 4. Push directly using the token inline (Bypasses Windows URL formatting errors)
git push https://github.com main

echo === Done! ===
pause
