WinLockScreen:
	TrayTip, LostByteSoft, Sleep computer in 3 seconds (Escape will CANCEL)., 1, 2
	sleep, 3000

{
Sleep, 200
DllCall("LockWorkStation")
Sleep, 200
}

exitapp

escape::
	ExitApp