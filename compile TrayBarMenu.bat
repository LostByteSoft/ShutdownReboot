@PATH C:\Program Files\AutoHotkey\Compiler;C:\windows\system32
@if not exist "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" goto notins
@echo -------------------------------------------------
@echo Kill process "TrayBarMenu.exe"
@taskkill /F /IM "TrayBarMenu.exe"
@echo -------------------------------------------------
Ahk2Exe.exe /in "TrayBarMenu.ahk" /out "TrayBarMenu.exe" /icon "SharedIcons/ico_HotKeys.ico" /mpress "0"
@echo -------------------------------------------------
@echo You must clost this windows (or TrayBarMenu.exe).
@echo -------------------------------------------------
@TrayBarMenu.exe
@exit

:notins
@echo -------------------------------------------------
@echo Ahk is not installed.
@echo -------------------------------------------------
@pause

:exit
@echo -------------------------------------------------
@exit