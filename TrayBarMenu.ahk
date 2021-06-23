;;--- Head --- AHK ---

;; Stand alone version , exe working everywhere but need ico in folder C:\Program Files\Common Files

;;--- Softwares options ---

	#SingleInstance Force
	#Persistent
	#NoEnv

	SetWorkingDir, %A_ScriptDir%

	SetEnv, title, Menu Tray Icon
	SetEnv, mode, For Shutdown Reboot
	SetEnv, Author, LostByteSoft
	SetEnv, version, Version 2021-06-20
	SetEnv, icofolder, C:\Program Files\Common Files
	SetEnv, logoicon, ico_HotKeys.ico
	SetENv, debug, 0

	;; Specific Icons (or files)
	FileInstall, SharedIcons\ico_HotKeys.ico, %icofolder%\ico_HotKeys.ico, 0

	;; Common ico
	FileInstall, SharedIcons\ico_about.ico, %icofolder%\ico_about.ico, 0
	FileInstall, SharedIcons\ico_lock.ico, %icofolder%\ico_lock.ico, 0
	FileInstall, SharedIcons\ico_options.ico, %icofolder%\ico_options.ico, 0
	FileInstall, SharedIcons\ico_reboot.ico, %icofolder%\ico_reboot.ico, 0
	FileInstall, SharedIcons\ico_shut.ico, %icofolder%\ico_shut.ico, 0
	FileInstall, SharedIcons\ico_debug.ico, %icofolder%\ico_debug.ico, 0
	FileInstall, SharedIcons\ico_pause.ico, %icofolder%\ico_pause.ico, 0
	FileInstall, SharedIcons\ico_loupe.ico, %icofolder%\ico_loupe.ico, 0
	FileInstall, SharedIcons\ico_folder.ico, %icofolder%\ico_folder.ico, 0
	FileInstall, SharedIcons\ico_veille.ico, %icofolder%\ico_veille.ico, 0
	FileInstall, SharedIcons\Ico_Session.ico, %icofolder%\Ico_Session.ico, 0

;;--- Menu Tray options ---

	Menu, Tray, NoStandard
	Menu, tray, add, ---=== %title% ===---, about
	Menu, Tray, Icon, ---=== %title% ===---, %icofolder%\%logoicon%
	Menu, tray, add, Show logo, GuiLogo
	Menu, tray, add, Secret MsgBox, secret					; Secret MsgBox, just show all options and variables of the program.
	Menu, Tray, Icon, Secret MsgBox, %icofolder%\ico_lock.ico
	Menu, tray, add, About && ReadMe, author				; infos about author
	Menu, Tray, Icon, About && ReadMe, %icofolder%\ico_about.ico
	Menu, tray, add, Author %author%, about					; author msg box
	menu, tray, disable, Author %author%
	Menu, tray, add, %version%, about					; version of the software
	menu, tray, disable, %version%
	Menu, tray, add, Open project web page, webpage				; open web page project
	Menu, Tray, Icon, Open project web page, %icofolder%\ico_HotKeys.ico
	Menu, tray, add,
	Menu, tray, add, --== Control Computer ==--, about
	Menu, Tray, Icon, --== Control Computer ==--, %icofolder%\ico_options.ico
	Menu, tray, add, Session, session
	Menu, Tray, Icon, Session, %icofolder%\ico_Session.ico
	Menu, tray, add, Sleep, sleep
	Menu, Tray, Icon, Sleep, %icofolder%\ico_veille.ico
	Menu, tray, add, Reboot, reboot
	Menu, Tray, Icon, Reboot, %icofolder%\ico_reboot.ico
	Menu, tray, add, Shutdown, shutdown
	Menu, Tray, Icon, Shutdown, %icofolder%\ico_shut.ico
	Menu, tray, add,
	Menu, tray, add, Exit %title%, ExitApp					; Close exit program
	Menu, Tray, Icon, Exit %title%, %icofolder%\ico_shut.ico
	Menu, tray, add, Refresh (Ini mod), doReload 				; Reload the script.
	Menu, Tray, Icon, Refresh (Ini mod), %icofolder%\ico_reboot.ico
	Menu, tray, add, Pause (Toggle), pause					; pause the script
	Menu, Tray, Icon, Pause (Toggle), %icofolder%\ico_pause.ico
	Menu, tray, add,
	Menu, tray, add, --== Options ==--, about
	Menu, Tray, Icon, --== Options ==--, %icofolder%\ico_options.ico
	;;Menu, tray, add, No options, about					; author msg box
	;;menu, tray, disable, No options
	menu, tray, add, Show Gui (Same as click),  menugui
	Menu, Tray, Icon, Show Gui (Same as click), %icofolder%\ico_loupe.ico
	Menu, Tray, Default, Show Gui (Same as click)
	Menu, Tray, Click, 1
	menu, tray, add,
	Menu, Tray, Tip, %title% %mode%

;;--- Software start here ---

start:
	sleep, 10000
	goto, start

menugui:
	;; A menu gui for options
	Gui, Add, Text, x25 y15 w350 h50 , Select option or press X. LostByteSoft. Computer does ?
	Gui, Add, Button, x25 y40 w100 h60 , Session
	Gui, Add, Button, x135 y40 w100 h60 , Sleep
	Gui, Add, Button, x245 y40 w100 h60 , Reboot
	Gui, Add, Button, x355 y40 w100 h60 , Shutdown
	Gui, Show, w475 , Menu Tray Icon
return

ButtonSession:
session:
	Shutdown, 0
	ExitApp

ButtonSleep:
sleep:
	DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
	ExitApp

ButtonReboot:
reboot:
	Shutdown, 6
	ExitApp

ButtonShutdown:
shutdown:
	Shutdown, 5
	ExitApp

;;--- Debug ---

debug:
	IfEqual, debug, 0, goto, debug1
	IfEqual, debug, 1, goto, debug0

	debug0:
	SetEnv, debug, 0
	TrayTip, %title%, Deactivated ! debug=%debug%, 1, 2
	Goto, sleep2

	debug1:
	SetEnv, debug, 1
	TrayTip, %title%, Activated ! debug=%debug%, 1, 2
	Goto, sleep2

;;--- Pause ---

pause:
	Ifequal, pause, 0, goto, paused
	Ifequal, pause, 1, goto, unpaused

	paused:
	SetEnv, pause, 1
	goto, sleep1

	unpaused:	
	Menu, Tray, Icon, %icofolder%\%logoicon%
	SetEnv, pause, 0
	Goto, start

	sleep1:
	Menu, Tray, Icon, %icofolder%\ico_pause.ico
	sleep2:
	sleep, 500000
	goto, sleep2

;;--- Quit ---

ButtonQuit:
	Gui, destroy
	goto, sleep2

ButtonReload:
doReload:
	Gui, destroy
	Reload
	sleep, 500

ButtonExit:
ExitApp:
	Gui, destroy
	ExitApp

GuiClose:
	Gui, destroy
	Goto, sleep2


;;--- Tray Bar (must be at end of file) ---

about:
	TrayTip, %title%, %mode%, 2, 1
	Return

version:
	TrayTip, %title%, %version%, 2, 2
	Return

author:
	MsgBox, 64, %title%, %title% %mode% %version% %author%. This software is usefull to remove the annoying box that serve nothing.`n`n`tGo to https://github.com/LostByteSoft
	Return

secret:
	MsgBox, 0, %title% - SECRET MsgBox, title=%title%`nmode=%mode%`nversion=%version%`nauthor=%author%`nLogoIcon=%logoicon%`n`nDebug=%debug%`nA_ScriptDir=%A_ScriptDir%\`nA_WorkingDir=%A_WorkingDir%\`nIcoFolder=%icofolder%\`n`nClipboard (if text)=%clipboard%
	Return

GuiLogo:
	Gui, 4:Add, Picture, x25 y25 w400 h400, %icofolder%\%logoicon%
	Gui, 4:Show, w450 h450, %title% Logo
	Gui, 4:Color, 000000
	Gui, 4:-MinimizeBox
	Sleep, 500
	Return

	4GuiClose:
	Gui 4:Cancel
	return

A_WorkingDir:
	IfEqual, debug, 1, msgbox, run, explorer.exe "%A_WorkingDir%"
	run, explorer.exe "%A_WorkingDir%"
	Return

webpage:
	run, https://github.com/LostByteSoft
	Return

;;--- End of script ---
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   Version 3.14159265358979323846264338327950288419716939937510582
;                          March 2017
;
; Everyone is permitted to copy and distribute verbatim or modified
; copies of this license document, and changing it is allowed as long
; as the name is changed.
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
;
;              You just DO WHAT THE FUCK YOU WANT TO.
;
;		     NO FUCKING WARRANTY AT ALL
;
;	As is customary and in compliance with current global and
;	interplanetary regulations, the author of these pages disclaims
;	all liability for the consequences of the advice given here,
;	in particular in the event of partial or total destruction of
;	the material, Loss of rights to the manufacturer's warranty,
;	electrocution, drowning, divorce, civil war, the effects of
;	radiation due to atomic fission, unexpected tax recalls or
;	    encounters with extraterrestrial beings 'elsewhere.
;
;              LostByteSoft no copyright or copyleft.
;
;	If you are unhappy with this software i do not care.
;
;;--- End of file ---