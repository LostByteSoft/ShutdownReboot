reboot:
	TrayTip, LostByteSoft, Reboot computer in 3 seconds (Escape will CANCEL)., 1, 2
	sleep, 2000
	Shutdown, 6
	Exitapp

escape::
	ExitApp