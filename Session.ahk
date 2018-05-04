sessionpc:
	TrayTip, LostByteSoft, Close session in 3 seconds (Escape will CANCEL)., 1, 2
	sleep, 3000
	Shutdown, 0
	ExitApp

escape::
	ExitApp