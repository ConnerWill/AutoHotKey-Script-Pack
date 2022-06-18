/*
The AutoStartupToggle.ahk script creates Windows shortcuts in the StartUp folder
for files selected in Windows File Explorer. Select the .exe or .ahk file in Windows
File Explorer and use the Hotkey combination CTRL+WIN+3 to either add a shortcut
to the target file in the StartUp folder, or, if it already exists, remove the shortcut
from the StartUp folder.

To add the feature to a Menu, replace the Hotkey with a Label name and call it with
a Menu item.

CTRL+WIN+4 displays a message box of all currently loaded Startup folder shortcuts.

*/

; Menu, Tray, NoIcon

^#3::                 ; Activates with CTRL+WIN+3
  Clipboard =    ; Empties Clipboard
  Send, ^c          ; Copies filename and path
  ClipWait 0       ; Waits for copy
  SplitPath, Clipboard, Name, Dir, Ext, Name_no_ext, Drive
  IfExist, %A_Startup%\%Name_no_ext%.lnk
  {
    MsgBox, 4, Add to Startup Folder, %Name% exists in Startup folder! Remove?
    IfMsgBox Yes
        FileDelete, %A_Startup%\%Name_no_ext%.lnk
    else
        Return
     MsgBox, %Name% removed from the Startup folder.
  }
  Else
  {
    FileCreateShortcut, "%clipboard%"
           , %A_Startup%\%Name_no_ext%.lnk
           , %Dir%   ; Line-wrapped using AutoHotkey line continuation
    MsgBox, %Name% added to Startup folder for auto-launch with Windows.
  }
Return

^#4::
	files := ""
	Loop %A_Startup%\*.*
	{
		FileGetShortcut, %A_LoopFileFullPath%, Location
		If ErrorLevel
			Continue
		; msgbox % ext
;		If A_LoopFileExt = ""
			files = %files%`n%Location%`n%A_LoopFileName%
	}
	MsgBox %files%

Return
