;==========================================
; Title:    Type-ClipBoard.ahk
; Author:   https://github.com/ConnerWill
; Website:  https://connerwill.com
; Description:  
;   This short little script allows you to "paste" into windows that you 
;   normally would not be able to (e.g. Virtual Machines, Remote Connections...)
;   Instead of pasting normally, this script sends the current clipboard 'raw'; essentially 
;   looping over characters in clipboard and typing them one by one. This makes working
;   with VMs much easier as you do not need to type very long complex passwords by hand.
;==========================================
#SingleInstance, Force
#NoEnv
SendMode Input
^!v::
  Send {Raw}%Clipboard%
return
