echo off
pushd "%~dp0
@echo -------------------------------------
echo LostByteSoft
echo Install version 2.1 2021-06-23
echo Architecture: x64
echo Compatibility : w7 w8 w8.1 w10 w11

echo ShutdownReboot
@echo -------------------------------------
taskkill /im "TrayBarMenu.exe"
@echo -------------------------------------
@echo copy "SharedIcons\*.ico" "C:\Program Files\Common Files\"
@echo -------------------------------------
taskkill /im "TrayBarMenu.exe"
copy "TrayBarMenu.exe" "C:\Program Files\"
copy "Reboot.exe" "C:\Program Files\"
copy "Session.exe" "C:\Program Files\"
copy "Shutdown.exe" "C:\Program Files\"
copy "Sleep.exe" "C:\Program Files\"
copy "WinLockScreen.exe" "C:\Program Files\"
@echo -------------------------------------
copy "*.lnk" "C:\Users\Public\Desktop\"
@echo -------------------------------------
echo "You must close this command windows"
"C:\Program Files\TrayBarMenu.exe"
@echo -------------------------------------
pause
exit
