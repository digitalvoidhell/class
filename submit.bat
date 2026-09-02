@echo off
:: 1. SET YOUR GITHUB CONFIGURATION VARIABLES
set GITHUB_USER=digitalvoidhell
set GITHUB_TOKEN=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
set REPO_OWNER=digitalvoidhell
set REPO_NAME=class
set BRANCH_NAME=main

:: 2. Get current date and time for the commit message
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do set mydate=%%c-%%a-%%b
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set mytime=%%a-%%b
set TIMESTAMP=%date% %time%

echo === Starting Git Push (%TIMESTAMP%) ===

:: 3. Temporarily update the URL to embed your token
git remote set-url origin https://%GITHUB_USER%:%GITHUB_TOKEN%@://github.com

:: 4. Stage and commit all changes
git add .
git commit -m "Backup: %TIMESTAMP%"

:: 5. Push to GitHub
git push origin %BRANCH_NAME%

:: 6. Clean up the URL in local settings so your token stays safe
git remote set-url origin https://://github.com

echo === Done! ===
pause
