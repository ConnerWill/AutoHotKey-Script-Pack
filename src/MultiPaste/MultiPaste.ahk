/*
MultiPaste.ahk by Jack Dunning June 20, 2019   Updated July 5, 2019

Many Windows users will find this AutoHotkey script handy for copying data-sets and breaking
them up into its component parts for pasting into form fields. You can use the app to copy and 
parse portions of Web tables, groups of cells in a spreadsheet, single-line street addresses, 
and many other pieces of data then insert those items into individual fields in another window. 

After selecting a section of a page (left-click, hold, and drag), activate the Hotkey combination 
CTRL+ALT+F to open a MsgBox window displaying the parsed information in its components. 
The MsgBox stays always-on-top while you move to your input screen.

Next, select the target input field and press the Hotkey combination CTR:+ALT+WIN+W to activate
the Input command. You have five seconds to press one of the number keys (0-9). AutoHotkey inserts 
the text next to the pressed number key in the MsgBox into the selected field.

This script parses text in the Windows Clipboard based upon the tab `t character, new lines, commas in 
single-line addresses, plus US and UK postal codes, for placement in the variable array listed in the 
MsgBox. This script works in a wide variety of situations although Web formatting may limit its usefulness.

The script uses Regular Expressions in a number of places to recognize dates and postal codes. Script discussion
begins with the blog:

https://jacksautohotkeyblog.wordpress.com/brute-force-data-set-copy-and-paste-autohotkey-clipboard-technique/

July 5, 2019 Replaced tab removal loop with a single-line RegExReplace() function and corrected date
identifying conditional.

July 27, 2019 Changed date RegEx to include dates separated by dashes and dots, as well as, forward slashes.

September 9, 2019 Added conditional Hotkeys Alt+1 throught Alt+0 for pasting items. Only active with
MsgBox titled "Multi Paste" open.

Per suggestion, Clipboard contents transferred to variable (ClipboardCopy) before manipulation.

October 1, 2020 Hotkeys changed to $ plus digit (0-9). This makes single key Hotkeys. The $ prevents 
internal re-firing of digits with SendInput command.
*/


^!F::         ; Hotkey combination CTRL+ALT+F
  OldClipboard := ClipboardAll
  Clipboard = ;clears the Clipboard
  SendInput, ^c
  ClipWait 0 ; pause for Clipboard data
  If ErrorLevel
  {
    MsgBox, Error message for non-selection
  }

  ClipboardCopy := Clipboard
; Replace all new paragraph marks with tabs for parsing
  ClipboardCopy := StrReplace(ClipboardCopy, "`r`n" , "`t")
; Just in case the data-set includes a stray `r or`n 
  ClipboardCopy := StrReplace(ClipboardCopy, "`r" , "`t") 
  ClipboardCopy := StrReplace(ClipboardCopy, "`n" , "`t") 

; For single-line addresses replace commas
  ClipboardCopy := StrReplace(ClipboardCopy, "`, " , "`t")

;  To parse US zip codes
  ClipboardCopy := RegExReplace(ClipboardCopy, "\s(\d\d\d\d\d)", "`t$1")

;  To parse UK postal codes
  ClipboardCopy := RegExReplace(ClipboardCopy, "\s([A-Za-z][A-Za-z]?\d\w?)", "`t$1")

; Designed to removes excess tabs, replaced this loop with the one-line RegEx
; which follows. Loop doesn't work if a space appears between tabs the 
; RegEx does.

;  Loop 
;  {
;   ClipboardCopy := StrReplace(ClipboardCopy, "`t`t" , "`t")
;    If ! InStr(Clipboard, "`t`t")
;      Break
;  }

ClipboardCopy := RegExReplace(ClipboardCopy, "`t\s*`t" , "`t")

; Sparse data-set
  Transaction := StrSplit(ClipboardCopy , "`t", , MaxParts := -1) ; [v1.1.28} 

; Display MsgBox always-on-top (4096) for pasting into target fields 
; Word-wrapped using line continuation techniques
  MsgBox, 4096,Multi Paste , % "[1] " . Transaction[1] . "`r" 
     . "[2] " . Transaction[2] . "`r" 
     . "[3] " . Transaction[3] . "`r" 
     . "[4] " . Transaction[4] . "`r" 
     . "[5] " . Transaction[5] . "`r" 
     . "[6] " . Transaction[6] . "`r" 
     . "[7] " . Transaction[7] . "`r" 
     . "[8] " . Transaction[8] . "`r" 
     . "[9] " . Transaction[9] . "`r" 
     . "[0] " . Transaction[10]
  Clipboard := OldClipboard
Return

^!#w::
  Input, SingleKey, L2 T5, ,1,2,3,4,5,6,7,8,9,0
; Special action for date fields
  If SingleKey = 0
     SingleKey := 10

; Check for date format to parse
If (Transaction[SingleKey] ~= "\d\d?[/\-.]\d\d?[/\-.]\d\d(\d\d)?")
{
  If InStr(Transaction[SingleKey],"/")
    date := StrSplit(Transaction[SingleKey],"/")
  If InStr(Transaction[SingleKey],"-")
    date := StrSplit(Transaction[SingleKey],"-")
  If InStr(Transaction[SingleKey],".")
    date := StrSplit(Transaction[SingleKey],".")

  SendInput, % date[1]
  SendInput, /
  SendInput, % date[2]
  SendInput, /
  SendInput, % date[3]

; msgbox, % date[1] date[2] date[3]
; For date field tabbing use the following:
; SendInput, % date[1] . "`t" . date[2] . "`t" . date[3]
}
Else If SingleKey != ""
  SendInput, % Transaction[SingleKey]
Return

#If WinExist("Multi Paste")
  $1::SendInput, % Transaction[1]
  $2::SendInput, % Transaction[2]
  $3::SendInput, % Transaction[3]
  $4::SendInput, % Transaction[4]
  $5::SendInput, % Transaction[5]
  $6::SendInput, % Transaction[6]
  $7::SendInput, % Transaction[7]
  $8::SendInput, % Transaction[8]
  $9::SendInput, % Transaction[9]
  $0::SendInput, % Transaction[10]
#If

