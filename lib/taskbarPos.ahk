taskbarPos()
{
	WinGetPos,tbx, tby,tbw, tbh, ahk_class Shell_TrayWnd
	return tbx > 0 ? "right" : (tby > 0 ? "bottom" : (tbh > (a_screenHeight//2) ? "left" : "top"))
}
