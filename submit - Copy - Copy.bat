@echo off
setlocal

echo ==============================
echo Git SSH Push/Pull Automation
echo ==============================

REM Check Git repository
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo ERROR: This folder is not a Git repository.
    pause
    exit /b 1
)

REM Configure SSH remote
echo.
echo [0/4] Checking SSH repository...
git remote set-url origin git@github.com:digitalvoidhell/class.git

if errorlevel 1 (
    echo ERROR: Could not configure GitHub SSH remote.
    pause
    exit /b 1
)

echo Remote:
git remote get-url origin

REM Test GitHub SSH connection
echo.
echo Testing GitHub SSH connection...
ssh -T git@github.com 2>&1 | findstr /C:"successfully authenticated" /C:"Hi digitalvoidhell"

if errorlevel 1 (
    echo.
    echo ERROR: SSH authentication failed.
    echo.
    echo Make sure your SSH key is added to GitHub:
    echo https://github.com/settings/keys
    echo.
    pause
    exit /b 1
)

REM Pull latest changes
echo.
echo [1/4] Pulling latest changes...
git pull origin main

if errorlevel 1 (
    echo ERROR: Git pull failed.
    pause
    exit /b 1
)

REM Add changes
echo.
echo [2/4] Adding changes...
git add .

REM Check for changes
git diff --cached --quiet

if errorlevel 1 (
    echo.
    echo [3/4] Committing changes...
    git commit -m "Auto commit"

    if errorlevel 1 (
        echo ERROR: Git commit failed.
        pause
        exit /b 1
    )
) else (
    echo.
    echo [3/4] No changes to commit.
)

REM Push changes
echo.
echo [4/4] Pushing changes...
git push origin main

if errorlevel 1 (
    echo ERROR: Git push failed.
    pause
    exit /b 1
)

echo.
echo ==============================
echo Git sync completed successfully!
echo ==============================

pause
