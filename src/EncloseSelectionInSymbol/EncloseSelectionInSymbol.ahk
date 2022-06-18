;==========================================
; Title:    EncloseSelectionInSymbol.ahk
; Author:   https://github.com/ConnerWill
; Website:  https://connerwill.com
; Description:  
;		This script makes it dummy easy to enclose your current selection in your symbol of choice
;   Descriptions of hotkeys/functions are located above the code snippets.
;==========================================
#SingleInstance Force ; The script will Reload if launched while already running
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases
#KeyHistory 0 ; Ensures user privacy when debugging is not needed
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
;#Persistent
;~ =================================================================
;~                             ENCLOSE 
;~ ================================================================= 
; ---------------------------------
; Enclose in quotes
; ---------------------------------
^'::EncQuote("'")
^+'::EncQuote("""")
; Enclose selected text in quotation mark
EncQuote(q)
{
  Symbol = quote
  Action = Enclose
  oldClipboard = %clipboard%
  Clipboard := 
  SendInput ^c
  Sleep 100
  if (Clipboard = "")
  {  
    TrayTip, %Action% in %Symbol% , Nothing copied - aborting
	SetTimer,, 2000

  }
  else
  {
    Clipboard = %q%%clipboard%%q%
    Sleep 100
    SendInput ^v
    ;SendInput %q%%clipboard%%q%
  }
  Clipboard = %oldClipboard%
}

; ---------------------------------
; Enclose in Percent
; ---------------------------------
^%::EncPercent("%")
^+%::EncPercent("%")
; Enclose selected text in Percent symbols
EncPercent(q)
{
  Symbol = Percent
  Action = Enclose
  oldClipboard = %clipboard%
  Clipboard := 
  SendInput ^c
  Sleep 100
  if (Clipboard = "")
  {  
    TrayTip, %Action% in %Symbol% , Nothing copied - aborting
    Exit
	SetTimer,, 2000

  }
  else
  {
    Clipboard = %q%%clipboard%%q%
    Sleep 100
    SendInput ^v
    ;SendInput %q%%clipboard%%q%
  }
  Clipboard = %oldClipboard%
}

; ---------------------------------
; Enclose in stars
; ---------------------------------
^*::EncStar("*")
^+*::EncStar("*")
; Enclose selected text in star symbols
EncStar(q)
{
  Symbol = Star
  Action = Enclose
  oldClipboard = %clipboard%
  Clipboard := 
  SendInput ^c
  Sleep 100
  if (Clipboard = "")
  {  
    TrayTip, %Action% in %Symbol% , Nothing copied - aborting
    Exit
	SetTimer,, 2000

  }
  else
  {
    Clipboard = %q%%clipboard%%q%
    Sleep 100
    SendInput ^v
    ;SendInput %q%%clipboard%%q%
  }
  Clipboard = %oldClipboard%
}

;~ =================================================================
;~                            PREPEND
;~ ================================================================= 
; ---------------------------------
; Prepend Dollar
; ---------------------------------
^$::PrependDollar("$")
^+$::PrependDollar("$")
PrependDollar(q)
{
  Symbol = Dollar
  Action = Prepend
  oldClipboard = %clipboard%
  Clipboard := 
  SendInput ^c
  Sleep 100
  if (Clipboard = "")
  {  
    TrayTip, %Action% in %Symbol% , Nothing copied - aborting
    Exit
	SetTimer,, 2000

  }
  else
  {
    Clipboard = %q%%clipboard%
    Sleep 100
    SendInput ^v
    ;SendInput %q%%clipboard%%q%
  }
  Clipboard = %oldClipboard%
}

; ---------------------------------
; Prepend Colon
; ---------------------------------
^;::PrependColon("; ")
^+;::PrependColon(":: ")
PrependColon(q)
{
  Symbol = Colon
  Action = Prepend
  oldClipboard = %clipboard%
  Clipboard := 
  SendInput ^c
  Sleep 100
  if (Clipboard = "")
  {  
    TrayTip, %Action% in %Symbol% , Nothing copied - aborting
    Exit
	SetTimer,, 2000

  }
  else
  {
    Clipboard = %q% %clipboard%
    Sleep 100
    SendInput ^v
    ;SendInput %q%%clipboard%%q%
  }
  Clipboard = %oldClipboard%
}

; ---------------------------------
; Prepend Hashtag
; ---------------------------------
^#::PrependHashtag("#")
^+#::PrependHashtag("#")
PrependHashtag(q)
{
  Symbol = Hashtag
  Action = Prepend
  oldClipboard = %clipboard%
  Clipboard := 
  SendInput ^c
  Sleep 100
  if (Clipboard = "")
  {  
    TrayTip, %Action% in %Symbol% , Nothing copied - aborting
    Exit
	SetTimer,, 2000

  }
  else
  {
    Clipboard = %q%%clipboard%
    Sleep 100
    SendInput ^v
    ;SendInput %q%%clipboard%%q%
  }
  Clipboard = %oldClipboard%
}
