@echo off
setlocal

echo ==============================
echo Git Push/Pull Automation
echo ==============================

REM Check Git repository
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo ERROR: This folder is not a Git repository.
    pause
    exit /b 1
)

REM Set correct GitHub repository
echo.
echo Checking GitHub repository...
git remote set-url origin https://github.com/digitalvoidhell/class.git

if errorlevel 1 (
    echo ERROR: Could not configure GitHub remote.
    pause
    exit /b 1
)

echo Repository:
echo https://github.com/digitalvoidhell/class.git

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

REM Push
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
