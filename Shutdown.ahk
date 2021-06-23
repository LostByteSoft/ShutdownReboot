Shutdown:
	TrayTip, LostByteSoft, Shutdown computer in 3 seconds (Escape will CANCEL)., 1, 2
	sleep, 2000
	Shutdown, 5
	Exitapp

escape::
	ExitApp