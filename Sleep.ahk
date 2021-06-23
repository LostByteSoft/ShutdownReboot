sleeppc:
	TrayTip, LostByteSoft, Sleep computer in 3 seconds (Escape will CANCEL)., 1, 2
	sleep, 2000
	DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
	Exitapp

escape::
	ExitApp