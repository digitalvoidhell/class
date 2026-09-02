@echo off

:: ১. টাইমস্ট্যাম্প সেট করা
set TIMESTAMP=%date% %time%
echo === Starting Git Push (%TIMESTAMP%) ===

:: ২. ফাইল যুক্ত ও সেভ করা
git add .
git commit -m "Backup: %TIMESTAMP%"

:: ৩. আপনার গিটহাব ইউজারনেম এবং পাসওয়ার্ড হিসেবে টোকেন দিয়ে সরাসরি পুশ
git push https://github.com main

echo === Done! ===
pause
