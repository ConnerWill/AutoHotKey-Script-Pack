;==========================================
; Title:    HorizontalScrolling.ahk
; Author:   https://github.com/ConnerWill
; Website:  https://connerwill.com
; Description:  
;		This script provides a convenient scrolling feature...scrolling horizontally.
;		Yes, I know horizontal scrolling is already a thing, this script provides some
;		extra features as well. Using this script you will be able to automatically
;		toggle the horizontal scrolling speed and a press of a button.
;==========================================
#SingleInstance, Force 
SetWorkingDir %A_ScriptDir%

;~ TrayTip, Horizontal Scrolling,`rLeft-Shift + Scroll Up = Left `rLeft-Shift + Scroll Down = Right, 3

; SHIFT ( Default ) 
~RShift & WheelUp:: ; Scroll left. 
	ControlGetFocus, control, A 
	SendMessage, 0x114, 0, 0, %control%, A ; 0x114 is WM_HSCROLL 
return 

~RShift & WheelDown:: ; Scroll right. 
	ControlGetFocus, control, A 
	SendMessage, 0x114, 1, 0, %control%, A ; 0x114 is WM_HSCROLL 
return

; Control ( FAST ) 
~LControl & WheelUp::  ; Scroll left.
ControlGetFocus, fcontrol, A
Loop 25 ; <-- Increase this value to scroll faster.
    SendMessage, 0x0114, 0, 0, %fcontrol%, A  ; 0x0114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
return

~LControl & WheelDown::  ; Scroll right.
ControlGetFocus, fcontrol, A
Loop 25 ; <-- Increase this value to scroll faster.
    SendMessage, 0x0114, 1, 0, %fcontrol%, A  ; 0x0114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.
return

; Backup 

;~ ; SHIFT ( FAST ) 
;~ ~RShift & WheelUp:: ; Scroll left. 
	;~ ControlGetFocus, control, A 
	;~ SendMessage, 0x114, 0, 0, %control%, A ; 0x114 is WM_HSCROLL 
;~ return 

;~ ~RShift & WheelDown:: ; Scroll right. 
	;~ ControlGetFocus, control, A 
	;~ SendMessage, 0x114, 1, 0, %control%, A ; 0x114 is WM_HSCROLL 
;~ return
