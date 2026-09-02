@echo off
set GITHUB_USER=digitalvoidhell
set GITHUB_TOKEN=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
set REPO_OWNER=digitalvoidhell
set REPO_NAME=class
set BRANCH_NAME=main

set TIMESTAMP=%date% %time%
echo === Starting Git Push (%TIMESTAMP%) ===

git add .
git commit -m "Backup: %TIMESTAMP%"

:: ভ্যারিয়েবলগুলো ব্যবহার করে সরাসরি পুশ করা
git push https://%GITHUB_USER%:%GITHUB_TOKEN%@://github.com %BRANCH_NAME%

echo === Done! ===
pause
