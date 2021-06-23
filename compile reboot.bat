@PATH C:\Program Files\AutoHotkey\Compiler;C:\windows\system32
@if not exist "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" goto notins

@echo -------------------------------------------------
Ahk2Exe.exe /in "Reboot.ahk" /out "Reboot.exe" /icon "SharedIcons/Ico_Reboot.ico" /mpress "0"
@echo -------------------------------------------------
@exit

:notins
@echo -------------------------------------------------
@echo Ahk is not installed.
@echo -------------------------------------------------
@pause

:exit
@echo -------------------------------------------------
@exit