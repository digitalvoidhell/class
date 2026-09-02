@echo off

:: ১. কমিত মেসেজের জন্য বর্তমান সময় সেট করা
set TIMESTAMP=%date% %time%

echo === Starting Git Push (%TIMESTAMP%) ===

:: ২. সব ফাইল স্টেজিং এ যুক্ত করা
git add .

:: ৩. টাইমস্ট্যাম্প সহ কমিত করা
git commit -m "Backup: %TIMESTAMP%"

:: ৪. কোনো ভ্যারিয়েবল ছাড়া সরাসরি টোকেন সহ পুশ করা (এটি উইন্ডোজের সব এরর দূর করবে)
git push https://github.com main

echo === Done! ===
pause

