;==========================================
; Title:    Replace-Empty-Spaces.ahk
; Author:   https://github.com/ConnerWill
; Website:  https://connerwill.com
; Description:  
;   This script is a collection of smaller snippets/hotkeys
;		that provide various functions to remove/convert/transform/format
;		white spaces "spaces" in plain text.
;		Descriptions for each hotkey are located above the code snippet
;==========================================
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
ToolTip,

;~ Replace Spaces With Under_Scores
; eg. "The quick brown fox jumps over the lazy dog" > "The_quick_brown_fox_jumps_over_the_lazy_dog"
;~ HotKey: CTRL + SHFT + - (Hyphen/Underscore)
^+-::
	;~ Copy the selected text 
	Send, ^c
	;~ Save Clipboard to Variable
	UnformattedString := Clipboard
	;~ Format the variable text
	FormattedString = % RegExReplace(UnformattedString, A_Space "{1,}", "`_") ; change "1" to "2" if you want to retain single spaces, as of the moment this will replace all spaces with specified character.
	;~ Save Variable to Clipboard
	Clipboard := FormattedString 
	;~ Paste the Formatted text
	Send, ^v
return


;~ Replace Spaces With Hyphens
; eg. "The quick brown fox jumps over the lazy dog" > "The-quick-brown-fox-jumps-over-the-lazy-dog"
;~ HotKey: CTRL + - (Hyphen/Underscore)
^-::
	;~ Copy the selected text 
	Send, ^c
	;~ Save Clipboard to Variable
	UnformattedString := Clipboard
	;~ Format the variable text
	FormattedString = % RegExReplace(UnformattedString, A_Space "{1,}", "`-") ; change "1" to "2" if you want to retain single spaces, as of the moment this will replace all spaces with specified character.
	;~ Save Variable to Clipboard
	Clipboard := FormattedString 
	;~ Paste the Formatted text
	Send, ^v
return


;~ Replace Single Spaces with "-", Replace more than one single space with "_"
;~ HotKey: CTRL + SHFT + ALT -
^+!-::
	;~ Copy the selected text 
	Send, ^c
	;~ Save Clipboard to Variable
	UnformattedString := Clipboard
	;~ Format the variable text
	FormattedString = % RegExReplace(UnformattedString, A_Space "{2,}", "`_") ; change "1" to "2" if you want to retain single spaces, as of the moment this will replace all spaces with specified character.
	Sleep 5
	FormattedString = % RegExReplace(FormattedString, A_Space "{1,}", "`-") ; change "1" to "2" if you want to retain single spaces, as of the moment this will replace all spaces with specified character.
	;~ Save Variable to Clipboard
	Clipboard := FormattedString 
	;~ Paste the Formatted text
	Send, ^v
return


;~ Replace Empty Characters with no spaces 
;~ HotKey: CTRL + SHFT + Space Bar
^+Space::
	;~ Copy the selected text 
	Send, ^c
	;~ Save Clipboard to Variable
	UnformattedString := Clipboard
	;~ Format the variable text
	FormattedString  = % RegExReplace(UnformattedString, A_Space "{1,}", "") ; change "1" to "2" if you want to retain single spaces, as of the moment this will replace all spaces with specified character.
	;~ Save Variable to Clipboard
	Clipboard := FormattedString 
	;~ Paste the Formatted text
	Send, ^v
return


; Format Phone Numbers 
; Strip Phone Number Down to Only Digits.
; eg. "(651) 888-8888" > "6518888888"
;~ HotKey: CTRL + ALT + N
^!n::
	;~ Copy the selected text 
	Send, ^c
	;~ Save Clipboard to Variable
	PhoneNumberUnformatted := Clipboard
	;~ Remove from string: ()-Spaces
	FormattedPhoneNumber = % RegExReplace(PhoneNumberUnformatted, "^\(|\)|-|","") ; change "1" to "2" if you want to retain singl spaces, as of the moment this will
	FormattedPhoneNumber = % RegExReplace(FormattedPhoneNumber, A_Space "{1,}", "") ; change "1" to "2" if you want to retain singl spaces, as of the moment this will
	;~ Save Variable to Clipboard
	Clipboard := FormattedPhoneNumber
	;~ Paste the Formatted text
	Send, ^v
return
