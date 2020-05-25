echo off
echo Install version 1.0
taskkill /im "TrayBarMenu.exe"
copy "SharedIcons\*.ico" "C:\Program Files (x86)\Common Files\"
copy "Reboot.exe" "C:\Program Files (x86)\"
copy "Session.exe" "C:\Program Files (x86)\"
copy "Shutdown.exe" "C:\Program Files (x86)\"
copy "Sleep.exe" "C:\Program Files (x86)\"
copy "WinLockScreen.exe" "C:\Program Files (x86)\"
copy "TrayBarMenu.exe" "C:\Program Files (x86)\"
echo "You must close this command windows"
"C:\Program Files (x86)\TrayBarMenu.exe"
pause
exit