WinLockScreen:
	TrayTip, LostByteSoft, Sleep computer in 2 seconds (Escape will CANCEL)., 1, 2
	sleep, 2000

{
Sleep, 200
DllCall("LockWorkStation")
Sleep, 200
}

exitapp

escape::
	ExitApp