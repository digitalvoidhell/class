@echo off

:: ১. কমিত মেসেজের জন্য বর্তমান সময় নেওয়া
set TIMESTAMP=%date% %time%
echo === Starting Git Push (%TIMESTAMP%) ===

:: ২. ফাইল যুক্ত ও লোকালি সেভ করা
git add .
git commit -m "Backup: %TIMESTAMP%"

:: ৩. লোকাল গিটের ভেতর আপনার টোকেনটি সাময়িকভাবে পুশ করার জন্য সেট করা
git config --local credential.helper ""
git remote set-url origin https://github.com

:: ৪. গিটহাবে পুশ করা (এখানে উইন্ডোজ আর ইউআরএল কাটতে পারবে না)
git push origin main

:: ৫. কাজ শেষে লোকাল ইউআরএল আবার সাধারণ অবস্থায় ফিরিয়ে নেওয়া
git remote set-url origin https://github.com

echo === Done! ===
pause
