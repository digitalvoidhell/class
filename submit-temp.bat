@echo off
setlocal



# ssh-keygen -t ed25519 -C "your_email@example.com"
# clip < ~/.ssh/id_ed25519.pub
ssh -T git@github.com




echo ==============================
echo Git SSH Push/Pull Automation
echo ==============================

REM ============================================
REM Configuration
REM ============================================

set "REPO=git@github.com:digitalvoidhell/class.git"
set "BRANCH=main"
# set "SSH_KEY=%USERPROFILE%\.ssh\id_ed25519"
set "SSH_KEY=..\id_ed25519"

REM ============================================
REM Check Git repository
REM ============================================

echo.
echo [0/5] Checking Git repository...

git rev-parse --is-inside-work-tree >nul 2>&1

if errorlevel 1 (
    echo ERROR: This folder is not a Git repository.
    pause
    exit /b 1
)

REM ============================================
REM Check SSH key
REM ============================================

echo.
echo Checking SSH key...

if not exist "%SSH_KEY%" (
    echo ERROR: SSH key not found:
    echo %SSH_KEY%
    pause
    exit /b 1
)

echo SSH key:
echo %SSH_KEY%

REM ============================================
REM Configure SSH remote
REM ============================================

echo.
echo Configuring SSH repository...

git remote set-url origin "%REPO%"

if errorlevel 1 (
    echo ERROR: Could not configure Git remote.
    pause
    exit /b 1
)

REM ============================================
REM Use SSH key directly
REM ============================================

set "GIT_SSH_COMMAND=ssh -i "%SSH_KEY%" -o IdentitiesOnly=yes"

echo.
echo SSH key configured for this session.
echo No ssh-agent service is being used.

REM ============================================
REM Test SSH connection
REM ============================================

echo.
echo [1/5] Testing GitHub SSH connection...

ssh -i "%SSH_KEY%" -o IdentitiesOnly=yes -T git@github.com 2>&1

if errorlevel 1 (
    echo.
    echo NOTE:
    echo GitHub may return exit code 1 even when authentication succeeds.
    echo Check the message above.
    echo.
)

REM ============================================
REM Pull
REM ============================================

echo.
echo [2/5] Pulling latest changes...

git pull origin "%BRANCH%"

if errorlevel 1 (
    echo ERROR: Git pull failed.
    pause
    exit /b 1
)

REM ============================================
REM Add and commit
REM ============================================

echo.
echo [3/5] Adding changes...

git add .

git diff --cached --quiet

if errorlevel 1 (
    echo.
    echo Changes detected.
    echo Creating commit...

    git commit -m "Auto commit"

    if errorlevel 1 (
        echo ERROR: Git commit failed.
        pause
        exit /b 1
    )
) else (
    echo.
    echo No changes to commit.
)

REM ============================================
REM Push
REM ============================================

echo.
echo [4/5] Pushing changes...

git push origin "%BRANCH%"

if errorlevel 1 (
    echo.
    echo ERROR: Git push failed.
    pause
    exit /b 1
)

REM ============================================
REM Finish
REM ============================================

echo.
echo [5/5] Completed.

echo.
echo ==============================
echo Git sync completed successfully!
echo ==============================

REM Clear session variable
set "GIT_SSH_COMMAND="

echo.
echo SSH configuration cleared from this BAT session.

pause
exit /b 0
