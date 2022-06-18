;------------------------------------------
;
;          Conner Will 
;
;------------------------------------------


;~ "Select some text, press Ctrl-C to copy it to multiple new clipboards.
;~ Now hold down Ctrl and press V repeatedly to step through the clipboards. C steps backwards.
;~ When you've got the clipboard you want, release Ctrl to paste."
;~ When GUI appear (after ^v) while still holding CTRL click ^x and release CTRL to abort paste operation.
;~ It doesn't save clipboards on hdd (unlike ClipStep) and it cycle through [1, MaxClipboards] clips, and then wrap around to the beginning erasing latest one. Thats why there isn't delete clip/all clips feature.

#Persistent
MaxClipboards = 5
usedClipboards = 0
ClipIndex = 0
guiActive = false

$^x:: ;CUT/EXIT
if guiActive = true ; if GUI is activated then deactivate it, and send EXIT tooltip
{
guiActive = false
ToolTip, Exit
gosub, HOLD
}
else ; if GUI isn't activated then just CUT
{
Send ^x
}
return

$^c:: ;COPY/PREV
if guiActive = true ; if GUI is activated then move to previous clipboard and show it
{
if ClipIndex = 0 ; No saved clipboards yet.
return
ClipIndex -= 1 ; Move backward through the list.
if ClipIndex <= 0 ; Wrap around to the tail end of list.
ClipIndex := usedClipboards
gosub, SHOWCLIPBOARD
}
else ; if GUI isn't activated then just COPY
{
Send ^c
}
return

$^v:: ;PASTE/NEXT
if guiActive = true ; if GUI is activated then move to next clipboard and show it
{
if ClipIndex = 0 ; No saved clipboards yet.
return
ClipIndex += 1 ; Move forward through the list.
if ClipIndex > %usedClipboards% ; Wrap around to beginning or list.
ClipIndex := 1
gosub, SHOWCLIPBOARD
}
else ; if GUI isn't activated then activate GUI and show first element in clipboard
{
guiActive = true
gosub, SHOWCLIPBOARD
}
return

OnClipboardChange:
if (A_EventInfo = 0 OR NoSaveClipboard)
return ; Empty or the hotkey told us not to save its own change to the clipboard.
; Check if what's on the clipboard now exactly matches the previously saved item. If it
; does, don't save it. This solves the fact that some apps save each clipboard twice.
if ClipIndex > 0
{
ClipSavedTemp := ClipboardAll ; ...because can't compare directly to ClipboardAll.
if ClipSaved%ClipIndex% = %ClipSavedTemp% ; Must be old-style if-statement.
return
}
usedClipboards := (usedClipboards + 1 > MaxClipboards) ? MaxClipboards : usedClipboards+1
ClipIndex += 1 ; Move to the next slot.
if (ClipIndex > MaxClipboards) ; Wrap back around to the beginning.
ClipIndex = 1
ClipIndex := ClipIndex ; Reset the hotkey's bookmark each time a save occurs.
ClipSaved%ClipIndex% := ClipboardAll ; Save the current contents of the clipboard.
ToolTip, Added %ClipIndex%/%usedClipboards% `n%Clipboard%
gosub, HOLD
return

SHOWCLIPBOARD:
{
if StrLen(ClipSaved%ClipIndex%) = 0 ; Nothing saved, so don't do it.
{
ToolTip, Restored Clipboard #%ClipIndex% is empty.
gosub, HOLD
return
}
NoSaveClipboard := true ; Tell OnClipboardChange not to save our clipboard change.
Clipboard := ClipSaved%ClipIndex%
ToolTip, Restored Clipboard #%ClipIndex%:`n%Clipboard%
gosub, HOLD
Sleep 30 ; This gives the OnClipboardChange subroutine an opportunity to run.
NoSaveClipboard := false
}

HOLD:
{
GetKeyState,state,CTRL
if state = d ; While holding CTRL gui won't dissapear
SetTimer,HOLD,100
else
{
ToolTip,
if guiActive = true ; Only way to activate GUI is put ^v, so after release CTRL we want to deactivate GUI and PASTE
{
guiActive = false
Send ^v
}
SetTimer,HOLD,off
}
return
}