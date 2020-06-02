echo off
echo Install version 1.0
taskkill /im "TrayBarMenu.exe"

copy "SharedIcons\*.ico" "C:\Program Files\Common Files\"
taskkill /im "TrayBarMenu.exe"
copy "*.exe" "C:\Program Files\"
copy "*.lnk" "C:\Users\Public\Desktop\"

echo "You must close this command windows"
"C:\Program Files\TrayBarMenu.exe"
exit