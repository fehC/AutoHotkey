;=====================================================================
;	  Title:	GridyDynamic
;	Version:	v2019.08.14.1 Beta
;	 Author:	fehC ( fehc@megamail.me )
;		URL:	https://github.com/fehC
;		URL:	https://github.com/fehC/AutoHotkey/tree/master/GridyDynamic
;
;
;	Help:
;
;			   Ctrl + Windows Key + <Numpad1-9> = Save size and position of most active window relative to screen ( percentage )
;		Windows Key + Alt         + <Numpad1-9> = Restore
;
;	Note:
;
;		Early release, code should be rewitten from scratch, I just tweaked the code to be dynamic and also save alwaysOnTop state.
;
;	Credit:
;
;   	Danny Ben Shitrit (Sector-Seven) 2015
;   	http://sector-seven.net/
;   	db@sector-seven.net
;
;=====================================================================
script_title	:= "GridyDynamic"
script_version	:= "2019.08.14.1"
script_author	:= "fehC"
script_ini		:= A_ScriptDir "\" script_title ".ini"

;---------------------------------------------------------------------
;
;
;     Startup
;
;
;---------------------------------------------------------------------

;---------------------------------------------------------------------
; Global Settings
;---------------------------------------------------------------------
#noTrayIcon
#SingleInstance force
CoordMode Mouse, Window
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

;---------------------------------------------------------------------
; Files
;---------------------------------------------------------------------
; INI Handling
;---------------------------------------------------------------------
IniRead ModifierKey,           %script_ini%, General, ModifierKey, None
IniRead DisableKey,            %script_ini%, General, DisableKey, Shift ;"
IniRead GridSizeX,             %script_ini%, General, GridSizeX, 32
IniRead GridSizeY,             %script_ini%, General, GridSizeY, 32
IniRead GridSizes,             %script_ini%, General, GridSizes, % "4,8,16,32,64,128"
IniRead SnapNonResizables,     %script_ini%, General, SnapNonResizables, 0
IniRead SizeNonResizables,     %script_ini%, General, SizeNonResizables, 0
IniRead ShowWelcomeTip,        %script_ini%, General, ShowWelcomeTip, 1
IniRead HomeW,                 %script_ini%, General, HomeW, 320
IniRead HomeH,                 %script_ini%, General, HomeH, 320
IniRead TransLevel,            %script_ini%, General, TransLevel, 180
IniRead DisableExitKey,        %script_ini%, General, DisableExitKey, 0
IniRead PresetKeys,            %script_ini%, General, PresetKeys, Numpad
IniRead EdgeBehavior,          %script_ini%, General, EdgeBehavior, Block
IniRead MoveLeftKey,           %script_ini%, Hotkeys, MoveLeftKey, #Left
IniRead MoveRightKey,          %script_ini%, Hotkeys, MoveRightKey, #Right
IniRead MoveUpKey,             %script_ini%, Hotkeys, MoveUpKey, #Up
IniRead MoveDownKey,           %script_ini%, Hotkeys, MoveDownKey, #Down
IniRead SizeLeftKey,           %script_ini%, Hotkeys, SizeLeftKey, #+Left
IniRead SizeRightKey,          %script_ini%, Hotkeys, SizeRightKey, #+Right
IniRead SizeUpKey,             %script_ini%, Hotkeys, SizeUpKey, #+Up
IniRead SizeDownKey,           %script_ini%, Hotkeys, SizeDownKey, #+Down
IniRead StoreWinSizeKey,       %script_ini%, Hotkeys, StoreWinSizeKey, #+Home
IniRead RestoreWinSizeKey,     %script_ini%, Hotkeys, RestoreWinSizeKey, #Home
IniRead ToggleAlwaysOnTopKey,  %script_ini%, Hotkeys, ToggleAlwaysOnTopKey, #F12
IniRead ToggleAltTabIconKey,   %script_ini%, Hotkeys, ToggleAltTabIconKey, #F11
IniRead ToggleTransparencyKey, %script_ini%, Hotkeys, ToggleTransparencyKey, #F10
IniRead MinimizeAllButMeKey,   %script_ini%, Hotkeys, MinimizeAllButMeKey, #PgDn
IniRead PresetRestoreKey,      %script_ini%, Hotkeys, PresetRestore, #!
IniRead PresetStoreKey,        %script_ini%, Hotkeys, PresetStore, #^
Loop 12
{
	IniRead Position%A_Index%, %script_ini%, Positions, Position%A_Index%, % "0,0,500,500"
}

;---------------------------------------------------------------------
; Menus
;---------------------------------------------------------------------

; Sub Menus ----------------------------------------------------------
Menu ModifierKey, Add,	 None, 	ChangeModifierKey
Menu ModifierKey, Add,    Win,	ChangeModifierKey
Menu ModifierKey, Add,	 Ctrl, 	ChangeModifierKey
Menu ModifierKey, Add,	Shift,	ChangeModifierKey
Menu ModifierKey, Add,	  Alt,	ChangeModifierKey

Menu PresetKeys, Add,  Numpad,  ChangePresetKeys
Menu PresetKeys, Add, Numbers,  ChangePresetKeys
Menu PresetKeys, Add,  F Keys,  ChangePresetKeys

Menu DisableKey, Add,    None,	ChangeDisableKey
Menu DisableKey, Add,	  Win,  ChangeDisableKey
Menu DisableKey, Add,    Ctrl, 	ChangeDisableKey
Menu DisableKey, Add,   Shift,	ChangeDisableKey
Menu DisableKey, Add,     Alt,  ChangeDisableKey

Loop Parse, GridSizes, `,
{
	Menu GridSizeX, Add, %A_LoopField%,  ChangeGridSizeX
	Menu GridSizeY, Add, %A_LoopField%,  ChangeGridSizeY
}

Loop 21
{
	Menu Transparency, Add, % 260 - (A_Index*10), ChangeTransLevel
}

Menu EdgeBehavior, Add, Ignore, ChangeEdgebehavior
Menu EdgeBehavior, Add, Block, ChangeEdgebehavior
Menu EdgeBehavior, Add, Shrink, ChangeEdgebehavior


; Main Menu ----------------------------------------------------------
Menu Tray, NoStandard

Menu Tray, Add, Modifier Key, :ModifierKey
Menu Tray, Add, Disable Key,  :DisableKey
Menu Tray, Add, Preset Keys,  :PresetKeys
Menu Tray, Add, X Grid Size,    :GridSizeX
Menu Tray, Add, Y Grid Size,    :GridSizeY
Menu Tray, Add, Transparency Level, :Transparency
Menu Tray, Add, Edge Behavior, :EdgeBehavior

Menu Tray, Add ; seperator
Menu Tray, Add, Help..., Help
Menu Tray, Add ; seperator
Menu Tray, Add, Reload Gridy, Reload
Menu Tray, Add, Exit Gridy, Exit

Menu Tray, Default, Help...
Menu Tray, Tip, %script_title% %script_version%

; Check the sub menu items, after reading them from INI --------------
Menu GridSizeX, Add, %GridSizeX%,ChangeGridSizeX
Menu GridSizeY, Add, %GridSizeY%,ChangeGridSizeY

Menu ModifierKey, Check, %ModifierKey%
Menu DisableKey , Check, %DisableKey%
Menu PresetKeys , Check, %PresetKeys%
Menu GridSizeX  , Check, %GridSizeX%
Menu GridSizeY  , Check, %GridSizeY%
Menu Transparency, Check, %TransLevel%
Menu EdgeBehavior, Check, %EdgeBehavior%
If( !DisableExitKey )
	Hotkey #ESC, Exit

FirstCallToHelp := true

; Startup Traytip ----------------------------------------------------
If( ShowWelcomeTip ){
	TrayTip %script_title% Tray Menu, Double-Click for Help`nRight-Click for Options,, 1
	SetTimer RemoveTrayTip, 8000
	If( ShowWelcomeTip == 1 )
		IniWrite 0, %script_ini%, General, ShowWelcomeTip
}

;---------------------------------------------------------------------
; Set Dynamic Hotkeys
;---------------------------------------------------------------------
RoutineString := "MoveLeft,MoveRight,MoveUp,MoveDown,SizeLeft,SizeRight,SizeUp,SizeDown,RestoreWinSize,StoreWinSize,ToggleAlwaysOnTop,ToggleAltTabIcon,ToggleTransparency,MinimizeAllButMe"
Loop Parse, RoutineString, `,
{
	ThisRoutine := A_LoopField
	ThisKey      = %ThisRoutine%Key
	ThisKey     := %ThisKey%
	Hotkey %ThisKey%, %ThisRoutine%, UseErrorLevel

	If ErrorLevel
	{
		MsgBox 48, Error in INI file, Unable to set hotkey for %ThisRoutine%.`nThe hotkey %Thiskey% is invalid.`n`nPlease fix the INI file or restore the original one.
		ExitApp
	}
}

Loop 12
{
	If ( PresetKeys != "F Keys" ) and ( A_Index > 9 )
		Break
	PresetKeySet := ( PresetKeys == "Numpad" ? "Numpad" : PresetKeys == "F Keys" ? "F" : "" )
	Hotkey %PresetRestoreKey%%PresetKeySet%%A_Index%, RestorePresetKey
	Hotkey %PresetStoreKey%%PresetKeySet%%A_Index%, StorePresetKey
}

;--- END OF AUTO-EXECUTING SECTION -----------------------------------
Return
;--- END OF AUTO-EXECUTING SECTION -----------------------------------

;---------------------------------------------------------------------
;
;
;     Keyboard Hooks
;
;
;---------------------------------------------------------------------

;---------------------------------------------------------------------
; Snapping by Mouse
;---------------------------------------------------------------------
; Capture all possible modifier key + mouse click combinations, and act
; accordingly. If we captured the DisableKey, return with no action, else
; if we captured the ModifierKey, its time to do some (possible) snapping.

~LButton::
	if ( ModifierKey <> "None" ) or ( DisableKey == "None" )
		Return
	Gosub StartResize
Return

~#LButton::
	if ( ModifierKey <> "Win" ) or ( DisableKey == "Win" )
		Return
	Gosub StartResize
Return

~!LButton::
	if ( ModifierKey <> "Alt" ) or ( DisableKey == "Alt" )
		Return
	Gosub StartResize
Return

~+LButton::
	if ( ModifierKey <> "Shift" ) or ( DisableKey == "Shift" )
		Return
	Gosub StartResize
Return

~^LButton::
	if ( ModifierKey <> "Ctrl" ) or ( DisableKey == "Ctrl" )
		Return
	Gosub StartResize
Return

;---------------------------------------------------------------------
; Moving by Keyboard
;---------------------------------------------------------------------
MoveLeft:
	MoveWindow( -1, 0 )
Return

MoveRight:
	MoveWindow( 1, 0 )
Return

MoveUp:
	MoveWindow( 0, -1 )
Return

MoveDown:
	MoveWindow( 0, 1 )
Return

;---------------------------------------------------------------------
; Resizing by Keyboard
;---------------------------------------------------------------------
SizeLeft:
	SizeWindow( -1, 0 )
Return

SizeRight:
	SizeWindow( 1, 0 )
Return

SizeUp:
	SizeWindow( 0, -1 )
Return

SizeDown:
	SizeWindow( 0, 1 )
Return


;---------------------------------------------------------------------
; Store / Restore Position and/or Size
;---------------------------------------------------------------------
RestoreWinSize:
	If( HomeH <> "" ) and ( HomeW <> "" )
		SizeWindow()
Return

StoreWinSize:
	StoreWindowSize()
Return

RestorePresetKey:
	PresetId := RegExReplace(A_ThisHotkey, "\D")
	RestorePreset( PresetId )
Return

StorePresetKey:
	PresetId := RegExReplace(A_ThisHotkey, "\D")
	StorePreset( PresetId )
Return


;---------------------------------------------------------------------
; Toggle Always On Top
;---------------------------------------------------------------------
ToggleAlwaysOnTop:
	WinSet AlwaysOnTop,,A
	WinGet ExStyle, ExStyle, A

	if (ExStyle & 0x8)
		ToolTip Always On Top ON
	else
		ToolTip Always On Top OFF
	SetTimer, RemoveToolTip, 1000
Return

;---------------------------------------------------------------------
; Toggle Alt-Tab Icon
;---------------------------------------------------------------------
ToggleAltTabIcon:
	WinSet, ExStyle, ^0x80, A    ; 0x80 is WS_EX_TOOLWINDOW

	WinGet Style, ExStyle, A

	if (Style & 0x80)
		ToolTip Alt Tab OFF
	else
		ToolTip Alt Tab ON
	SetTimer, RemoveToolTip, 1000
Return

;---------------------------------------------------------------------
; Transparent
;---------------------------------------------------------------------
ToggleTransparency:
	WinID := WinExist( "A" )
	WinGet WinTrans, Transparent, ahk_id %WinID%
	If( WinTrans <> TransLevel )
	{
		WinSet Transparent, OFF, ahk_id %WinID%
		WinSet Transparent, %TransLevel%, ahk_id %WinID%
	}
	Else
	{
		WinSet Transparent, 255, ahk_id %WinID%
		WinSet Transparent, OFF, ahk_id %WinID%
	}
Return

;---------------------------------------------------------------------
; Minimize All but Me
;---------------------------------------------------------------------
MinimizeAllButMe:
	WinGetTitle ActiveTitle, A
	WinMinimizeAll
	WinRestore %ActiveTitle%
	WinActivate %ActiveTitle%
Return




;---------------------------------------------------------------------
;
;
;     Mouse Snapping Routines
;
;
;---------------------------------------------------------------------
; Here, we already know that the correct button was pressed.
; Now, we work in two stages: First, do some basic filtering to see if we need
; to do further actions, and if so, start a timer, to allow us to constantly
; monitor the mouse movement, while the user moves or resizes a window.

;---------------------------------------------------------------------
; Start Resize - Capture Initial Click
;---------------------------------------------------------------------
; This routine first captures the original state of the window and remembers
; it for the next phase. If the window is non resizable, and the INI file
; asks that we will not handle non resizable windows, we do not waste time
; and return with no action.
; Once we understand it is time to start monitoring the window position, we
; will start a time that will constantly call the second phase routine
; (WatchCursor).

StartResize:
	; tooltip, % a_sec
	; ; Get mouse position, and window under mouse cursor
	; MouseGetPos OMX, OMY, MWinID, OMControl, 1

	; ; Get window dimensions and ID
	; WinGetPos OWX, OWY, OWWidth, OWHeight, ahk_id %MWinID%

	; ; Check if window is resizable
	; WindowIsResizable := IsWindowResizable( MWinID )

	; If( !WindowIsResizable and !SnapNonResizables )
		; Return

	; SetTimer, WatchCursor, 10

Return

;---------------------------------------------------------------------
; WatchCursor - Timer Routine
;---------------------------------------------------------------------
; Here we already know that the modifier was triggered.
; If any of the window's dimensions were changed, it means that the user
; resized the window - we will then snap it to the grid, as soon as the
; mouse button is unpressed.
; When this happens, we will turn off the timer, and wait until someone
; presses the modifer again - this will trigger StartResize, which will in
; turn, call us.
WatchCursor:

	;MouseGetPos MX, MY, MWinID, MControl, 1
	WinGetPos WX, WY, WWidth, WHeight, ahk_id %MWinID%

	; This condition makes Gridy ignore windows that instantly closed, like
	; menus and dialogs that had their X button clicked
	IfWinNotExist ahk_id %MWinID%
	{
		SetTimer WatchCursor, Off
		Return
	}

	; Calculate new dimensions, assuming we will snap
	NewWWidth  := Round( WWidth  / GridSizeX ) * GridSizeX
	NewWHeight := Round( WHeight / GridSizeY ) * GridSizeY
	NewWX      := Round( WX      / GridSizeX ) * GridSizeX
	NewWY      := Round( WY      / GridSizeY ) * GridSizeY

	; If the mouse button was released, it is time to see if we need to snap or
	; not
	GetKeyState LeftButton, LButton
	If( LeftButton = "U" )
	{
		SetTimer WatchCursor, Off

		; If there is a control under the mouse, abort the snapping
		; Allow snapping only when the control is a status bar
		;If( OMControl <> "" and !InStr( OMControl, "statusbar" ) )
		; Return

		; If nothing was changed, return
		If( OWX == WX and OWY == WY and OWWidth == WWidth and OWHeight == WHeight )
			Return

		; Check if window is maximized, at the last possible moment in order
		; to also catch windows that are in the process of being maximized
		WinGet MinMax, MinMax, ahk_id %MWinID%

		; Finally, all filters are ok, now check that the window is not
		; maximized, and snap it.
		If( MinMax = 0 )
	{
			HandleEdge( NewWX, NewWY, NewWWidth, NewWHeight )
			If( !WindowIsResizable )
				WinMove ahk_id %MWinID%,, NewWX, NewWY
			Else
				WinMove ahk_id %MWinID%,, NewWX, NewWY, NewWWidth, NewWHeight
		}

	}

Return

;---------------------------------------------------------------------
;
;
;     Keyboard Snapping Routines
;
;
;---------------------------------------------------------------------
MoveWindow( XOffset, YOffset ){
	Global GridSizeX, GridSizeY

	WinGetPos WX, WY, WWidth, WHeight, A

	WinGet MinMax, MinMax, A
	if ( MinMax <> 0 )
		Return

	NewWX      := Round( WX / GridSizeX ) * GridSizeX + ( GridSizeX*XOffset )
	NewWY      := Round( WY / GridSizeY ) * GridSizeY + ( GridSizeY*YOffset )
	NewWWidth  := WWidth
	NewWHeight := WHeight

	HandleEdge( NewWX, NewWY, NewWWidth, NewWHeight )
	WinMove A,,%NewWX%, %NewWY%, %NewWWidth%, %NewWHeight%
}

SizeWindow( XOffset="", YOffset="" ){
	Global GridSizeX, GridSizeY, HomeW, HomeH

	WinGet WinID, ID, A

	WinGet MinMax, MinMax, A
	If( MinMax <> 0 or !IsWindowResizable( WinID ) )
		Return

	WinGetPos WX, WY, WWidth, WHeight, A
	NewWX := WX
	NewWY := WY

	; Resize to Home size
	If( XOffset = "" or YOffset = "" )
	{
		NewWWidth  := HomeW
		NewWHeight := HomeH
	}

	; Resize by one unit
	Else
	{
		NewWWidth  := Round( WWidth  / GridSizeX ) * GridSizeX + ( GridSizeX*XOffset )
		NewWHeight := Round( WHeight / GridSizeY ) * GridSizeY + ( GridSizeY*YOffset )
	}

	HandleEdge( NewWX, NewWY, NewWWidth, NewWHeight, 12 )
	WinMove A,,%NewWX%,%NewWY%,%NewWWidth%, %NewWHeight%
}

StoreWindowSize(){
	Global HomeW, HomeH, script_ini

	WinGet MinMax, MinMax, A
	If( MinMax <> 0 )
		Return

	WinGetPos ,,, HomeW, HomeH, A
	IniWrite %HomeW%, %script_ini%, General, HomeW
	IniWrite %HomeH%, %script_ini%, General, HomeH
}

; 7::
	 ; WinGet MinMax, MinMax, A
	; tooltip, % MinMax
; return

RestorePreset( presetId ){
	Global

	If( presetId < 1 or presetId > 12 )
		Return

	; Extract X,Y,W,H for that preset from the INI key PositionN
	StringSplit PresetVector, Position%presetId%, `,
	; tooltip, % PresetVector1

	; If the height or width are invalid
	; If( PresetVector3 <= 0 or PresetVector4 <= 0 )
		; Return

	WinGet WinID, ID, A
	WinGet MinMax, MinMax, A

	If( MinMax <> 0 )
	{
		WinRestore, A
		; Return
	}

	;----------------------
	; scr_w := a_screenWidth
	; win_w := 3500

	; win width percentage to screenwidth
	win_x_to_scr_w := PresetVector1
	win_y_to_scr_h := PresetVector2
	win_w_to_scr_w := PresetVector3
	win_h_to_scr_h := PresetVector4
	is_aot := PresetVector5
	; percentage of a number
	; tooltip, % "move:`n`nx:`t"

	win_x_to_scr_w := win_x_to_scr_w*a_screenWidth
	win_y_to_scr_h := win_y_to_scr_h*a_screenHeight
	win_w_to_scr_w := win_w_to_scr_w*a_screenWidth
	win_h_to_scr_h := win_h_to_scr_h*a_screenHeight

	; win_y_to_scr_w := round((win_y_to_scr_w/100)*a_screenWidth)
	; win_w_in_pixel := round((win_w_to_scr_w/100)*a_screenWidth)
	; win_h_in_pixel := round((win_h_to_scr_h/100)*a_screenHeight)
	; tooltip, % "win_w_to_scr_w:`n" win_w_to_scr_w "%" "`n`nwin_w_in_pixel:`n" win_w_in_pixel
	;----------------------

	; override dimentions that go beyond screen
	win_x_to_scr_w := win_x_to_scr_w < 0 ? 0 : win_x_to_scr_w
	win_y_to_scr_h := win_y_to_scr_h < 0 ? 0 : win_y_to_scr_h
	win_w_to_scr_w := win_w_to_scr_w > a_screenWidth ? a_screenWidth : win_w_to_scr_w
	win_h_to_scr_h := win_h_to_scr_h > a_screenHeight ? a_screenHeight : win_h_to_scr_h

	If( IsWindowResizable( WinID ) )
		; WinMove A,,%x%,%PresetVector2%,%PresetVector3%,%PresetVector4%
		WinMove A,, %win_x_to_scr_w%, %win_y_to_scr_h%,%win_w_to_scr_w%,%win_h_to_scr_h%
	Else
		WinMove A,,%win_x_to_scr_w%,%win_y_to_scr_h%
	WinSet AlwaysOnTop, % is_aot ? "on" : "off", A
}

StorePreset( presetId ){
	Local X,Y,W,H

	WinGet MinMax, MinMax, A

	If( MinMax <> 0 or presetId < 1 or presetId > 12 )
		Return

	WinGetPos X,Y,W,H,A
	; win_x_to_scr_w := (x*100)/a_screenWidth

	; win_x := round((x/a_screenWidth)*a_screenWidth)
	win_x := x/a_screenWidth
	win_y := y/a_screenHeight
	win_w := w/a_screenWidth
	win_h := h/a_screenHeight

	; win_y := round((y/a_screenHeight)*a_screenHeight)
	; win_w := round((y/a_screenWidth)*a_screenWidth)
	; win_h := round((y/a_screenHeight)*a_screenHeight)

	WinGet ExStyle, ExStyle, A
	_aot := ExStyle & 0x8 ? 1 : 0
	Position%presetId% = %win_x%,%win_y%,%win_w%,%win_h%,%_aot%


	; Position%presetId% = %X%,%Y%,%W%,%H%
	; tooltip, % "a_screenWidth:`t" a_screenWidth "`n`nx:`t" x " = " win_x "`ny:`t" y " = " win_y
	IniWrite % Position%presetId%, %script_ini%, Positions, Position%presetId%
}


;---------------------------------------------------------------------
;
;
;     General Internal Functions
;
;
;---------------------------------------------------------------------
;---------------------------------------------------------------------
; IsWindowResizable
;---------------------------------------------------------------------
; Returns true if window is resizable

IsWindowResizable( WinID ){
	Global SizeNonResizables

	WinGet Style, Style, ahk_id %WinID%

	If( Style & 0x40000 or SizeNonResizables )
		Return true
	Else
		Return false

}

;---------------------------------------------------------------------
; Help
;---------------------------------------------------------------------
Help:
	If( FirstCallToHelp )
	{
		FirstCallToHelp := false
		MyModifierKey := ModifierKey
		MyDisableKey  := DisableKey

		If ( MyModifierKey = "None" )
			MyModifierKey = Mouse Drag
		Else
			MyModifierKey = %MyModifierKey%+Mouse Drag

		If ( MyDisableKey = "None" )
			MyDisableKey = Mouse Drag
		Else
			MyDisableKey = %MyDisableKey%+Mouse Drag

		; Title
		;Gui Font, s10 bold
		;Gui Add, Text, center w380  ,

		; Keys Combination
		Gui Font, s8 Bold
		Gui Add, Text, right w180 x20 y14 , %script_title% %script_version%
		Gui Add, Text, right wp xp  y+20 , %MyModifierKey%
		Gui Add, Text, right wp xp  y+2 , %MyDisableKey%
		Gui Add, Text, right wp xp  y+2 , % GetFriendlyKeyName(MoveLeftKey) . "Arrow Keys"
		Gui Add, Text, right wp xp  y+2 , % GetFriendlyKeyName(SizeLeftKey) . "Arrow Keys"
		Gui Add, Text, right wp xp  y+10 , % GetFriendlyKeyName(StoreWinSizeKey, True)
		Gui Add, Text, right wp xp  y+2 , % GetFriendlyKeyName(RestoreWinSizeKey, True)
		Gui Add, Text, right wp xp  y+10 , % GetFriendlyKeyName(PresetStoreKey) . PresetKeySet . "1-9"
		Gui Add, Text, right wp xp  y+2 , % GetFriendlyKeyName(PresetRestoreKey) . PresetKeySet . "1-9"
		Gui Add, Text, right wp xp  y+10 , % GetFriendlyKeyName(MinimizeAllButMeKey, True)
		Gui Add, Text, right wp xp  y+10 , % GetFriendlyKeyName(ToggleTransparencyKey, True)
		Gui Add, Text, right wp xp  y+2 , % GetFriendlyKeyName(ToggleAltTabIconKey, True)
		Gui Add, Text, right wp xp  y+2 , % GetFriendlyKeyName(ToggleAlwaysOnTopKey, True)
		Gui Add, Text, right wp xp  y+10 , Right-Click on Tray Icon
		If( !DisableExitKey )
			Gui Add, Text, right wp xp  y+2 , Win+Esc

		; Description
		Gui Font, s8 Norm
		Gui Add, Text, x210 y14 , by %script_author%
		Gui Add, Text, xp   y+20, Snap moved/resized windows to grid
		Gui Add, Text, xp   y+2 , Disable snapping of moved/resized windows
		Gui Add, Text, xp   y+2 , Move active window and snap to grid
		Gui Add, Text, xp   y+2 , Resize active window and snap to grid
		Gui Add, Text, xp   y+10 , Store size of Active Window
		Gui Add, Text, xp   y+2 , Resize active window to stored size
		Gui Add, Text, xp   y+10 , Store size and position into slot 1-9
		Gui Add, Text, xp   y+2 , Restore size and position from slot 1-9
		Gui Add, Text, xp   y+10 , Minimize all windows except active one
		Gui Add, Text, xp   y+10 , Toggle Transparency for Active Window
		Gui Add, Text, xp   y+2 , Toggle Alt-Tab Icon for Active Window
		Gui Add, Text, xp   y+2 , Toggle Always On Top for Active Window
		Gui Add, Text, xp   y+10 , Configure common settings
		If( !DisableExitKey )
			Gui Add, Text, xp   y+2 , Exit %script_title%

		; Buttons
		Gui Add, Button, x20  yp+40 w228 gOpenIni, Open INI File
		Gui Add, Button, x+4 yp w228 gOpenReadme, Open Readme File
		Gui Add, Button, x20  y+4 w460 gOpenSite, Visit Sector-Seven.net

	}
	Gui Show, w500, %script_title% Help

Return

OpenIni:
	Run %script_ini%
Return

OpenReadme:
	Run %A_ScriptDir%\Readme.txt
Return

OpenSite:
	Run http://sector-seven.net
Return

GuiClose:
GuiEscape:
	Gui Hide
Return


;---------------------------------------------------------------------
; Sub Menu Commands
;---------------------------------------------------------------------
ChangeTransLevel:
	IniWrite %A_ThisMenuItem%, %script_ini%, General, TransLevel
	Reload
Return

ChangeModifierKey:
	IniWrite %A_ThisMenuItem%, %script_ini%, General, ModifierKey
	Reload
Return

ChangePresetKeys:
	IniWrite %A_ThisMenuItem%, %script_ini%, General, PresetKeys
	Reload
Return

ChangeDisableKey:
	IniWrite %A_ThisMenuItem%, %script_ini%, General, DisableKey
	Reload
Return

ChangeGridSizeX:
	IniWrite %A_ThisMenuItem%, %script_ini%, General, GridSizeX
	Reload
Return

ChangeGridSizeY:
	IniWrite %A_ThisMenuItem%, %script_ini%, General, GridSizeY
	Reload
Return

ChangeEdgeBehavior:
	IniWrite %A_ThisMenuItem%, %script_ini%, General, EdgeBehavior
	Reload
Return


;---------------------------------------------------------------------
; Reloads
;---------------------------------------------------------------------
Reload:
	Reload
Return

;---------------------------------------------------------------------
; Exit
;---------------------------------------------------------------------
Exit:
	Shutdown Traytip
	TrayTip %script_title%, Good Bye.,, 1
	Sleep 2000
	ExitApp
Return


;---------------------------------------------------------------------
; Error Handler
;---------------------------------------------------------------------
Error( ErrCode ){
	MsgBox 16,Error,An error has occured.`n%ErrCode%
	ExitApp
}

;---------------------------------------------------------------------
; Service: Remove tooltip / traytip
;---------------------------------------------------------------------
RemoveToolTip:
	SetTimer RemoveToolTip, Off
	ToolTip
Return

RemoveTrayTip:
	SetTimer RemoveTrayTip, Off
	TrayTip
Return

; 7::tooltip, % GetMonitorUnderMouse()

;---------------------------------------------------------------------
; Service: Fix coordinates and dimensions if beyond screen edges
; Flag provides further flexibility:
; 1=Modify X, 2=Modify Y, 4=Modify W, 8=Modify H
;---------------------------------------------------------------------
HandleEdge( ByRef MyX, ByRef MyY, ByRef MyW, ByRef MyH, Flag=15 ){
	Global EdgeBehavior

	MonitorNumber := GetMonitorUnderMouse()

	SysGet MonitorWorkArea, MonitorWorkArea, %MonitorNumber%

	If( EdgeBehavior == "Ignore" )
		Return

	WinGet WinID, ID, A
	WindowIsResizable := IsWindowResizable( WinID )

	; Bottom
	Exceed := (MyY + MyH) - MonitorWorkAreaBottom
	If( Exceed > 0 ){
		If( EdgeBehavior == "Shrink" and WindowIsResizable ){
			If( Flag & 8 )
				MyH -= Exceed
		}
		Else { ; "Block"
			If( Flag & 2 )
				MyY -= Exceed
			If( Flag & 8 )
				MyH := MonitorWorkAreaBottom - MyY
		}
	}

	; Right
	Exceed := (MyX + MyW) - MonitorWorkAreaRight
	If( Exceed > 0 )
	{
		If( EdgeBehavior == "Shrink" and WindowIsResizable )
		{
			If( Flag & 4 )
				MyW -= Exceed
		}
		Else
		{ ; "Block"
			If( Flag & 1 )
				MyX -= Exceed
			If( Flag & 4 )
				MyW := MonitorWorkAreaRight - MyX
		}
	}

	; Top
	Exceed := MonitorWorkAreaTop - MyY
	If( Exceed > 0 )
	{
		If( EdgeBehavior == "Shrink" and WindowIsResizable )
		{
			MyH -= Exceed
			MyY := MonitorWorkAreaTop
		}
		Else ; "Block"
			MyY := MonitorWorkAreaTop
	}

	; Left
	Exceed := MonitorWorkAreaLeft - MyX
	If( Exceed > 0 )
	{
		If( EdgeBehavior == "Shrink" and WindowIsResizable )
		{
			MyW -= Exceed
			MyX := MonitorWorkAreaLeft
		}
		Else ; "Block"
			MyX := MonitorWorkAreaLeft
	}
}

;---------------------------------------------------------------------
; Service: Get monitor number under mouse
;---------------------------------------------------------------------
GetMonitorUnderMouse(){
	SysGet MonitorCount, MonitorCount
	If( MonitorCount == 1 )
		Return 1

	;WinGetPos WX, WY, WW, WH, A    ; Alternative way, using the corner of the window
	CoordMode Mouse, Screen
	MouseGetPos WX, WY
	CoordMode Mouse, Window

	Loop %MonitorCount% {
		SysGet Mon, MonitorWorkArea, %A_Index%
		If( WX >= MonLeft and WX < MonRight and WY >= MonTop and WY < MonBottom )
			Return A_Index
	}

	; If we are here, something went wrong, use primary monitor
	Return 1
}

;---------------------------------------------------------------------
; Service: Convert autohotkey key string to human readable string
;---------------------------------------------------------------------
GetFriendlyKeyName(KeyString, Full=false){
	If(Full)
		Result := KeyString
	Else
		Result := RegExReplace(KeyString, "[^+#!\^]")
	Result := StrReplace(Result, "+", "Shift+")
	Result := StrReplace(Result, "#", "Win+")
	Result := StrReplace(Result, "!", "Alt+")
	Result := StrReplace(Result, "^", "Ctrl+")
	Return Result
}
