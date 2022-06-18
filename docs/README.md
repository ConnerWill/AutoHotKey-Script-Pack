# AutoHotKey-Script-Pack Docs

---

## Type-ClipBoard

```
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
```

---

## Replace-Empty-Spaces

```
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
```

---

## HorizontalScrolling

```
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
```

---

## EncloseSelectionInSymbol

```
;==========================================
; Title:    EncloseSelectionInSymbol.ahk
; Author:   https://github.com/ConnerWill
; Website:  https://connerwill.com
; Description:
;		This script makes it dummy easy to enclose your current selection in your symbol of choice
;   Descriptions of hotkeys/functions are located above the code snippets.
;==========================================
```

---

## AutoStartupToggle

```
The AutoStartupToggle.ahk script creates Windows shortcuts in the StartUp folder
for files selected in Windows File Explorer. Select the .exe or .ahk file in Windows
File Explorer and use the Hotkey combination CTRL+WIN+3 to either add a shortcut
to the target file in the StartUp folder, or, if it already exists, remove the shortcut
from the StartUp folder.
To add the feature to a Menu, replace the Hotkey with a Label name and call it with
a Menu item.
CTRL+WIN+4 displays a message box of all currently loaded Startup folder shortcuts.
```

---

## MultiPaste

```

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


```

---

## windows-desktop-switcher

An AutoHotkey script for Windows that lets a user switch virtual desktops by pressing <kbd>CapsLock</kbd> and a number row key at the sime time (e.g. <kbd>CapsLock</kbd> + <kbd>2</kbd> to switch to Desktop 2). It also provides other features, such as customizing the key combinations, creation/deletion of desktops by hotkey, etc. (see Hotkeys section below).

### Hotkeys

| Action                                                                                                                                             |                                      Keys                                       |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | :-----------------------------------------------------------------------------: |
| **Switch** to virtual desktop **1, 2, etc.**<br>_(you can also use the Numpad)_                                                                    | <kbd>CapsLock</kbd> + <kbd>1</kbd><br><kbd>CapsLock</kbd> + <kbd>2</kbd><br>... |
| **Switch back** to the last desktop used                                                                                                           |                      <kbd>CapsLock</kbd> + <kbd>Tab</kbd>                       |
| **Switch** to the virtual desktop on the **left**<br>_(auto-cycles from the first to the last desktop)_                                            |    <kbd>CapsLock</kbd> + <kbd>A</kbd><br><kbd>CapsLock</kbd> + <kbd>P</kbd>     |
| **Switch** to the virtual desktop on the **right**<br>_(auto-cycles from the last to the first desktop)_                                           |    <kbd>CapsLock</kbd> + <kbd>S</kbd><br><kbd>CapsLock</kbd> + <kbd>N</kbd>     |
| **Create** a new virtual desktop                                                                                                                   |                     **<kbd>CapsLock</kbd> + <kbd>C</kbd>**                      |
| **Delete** the current virtual desktop                                                                                                             |                       <kbd>CapsLock</kbd> + <kbd>D</kbd>                        |
| **Move** the current window to another desktop, then switch to it<br>_Keys <kbd>Q</kbd>, <kbd>W</kbd>, etc. correspond to 1st, 2nd, etc. desktops_ | <kbd>CapsLock</kbd> + <kbd>Q</kbd><br><kbd>CapsLock</kbd> + <kbd>W</kbd><br>... |

Note, <kbd>CapsLock</kbd> continues to function normally even when it is used as a modifier.

If you'd like, you can [enable the alternate configuration](https://github.com/pmb6tz/windows-desktop-switcher/issues/44), to use <kbd>Ctrl</kbd> + <kbd>Alt</kbd> as hotkey combination keys instead of <kbd>CapsLock</kbd> (e.g. use <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>1</kbd> to switch to the Desktop 1, just as you would use <kbd>CapsLock</kbd> + <kbd>1</kbd>).

Additional hotkeys, such as [pinning a window or app on all workspaces](https://github.com/pmb6tz/windows-desktop-switcher/issues/55), can be added as well.

You can also customize the hotkeys and actions as described in the section below.

### Overview

This script creates more convenient hotkeys for switching virtual desktops in Windows 10. I built this to better mirror the mapping I use on linux (with dwm), and it's always annoyed me that Windows does not have better hotkey support for this feature (for instance, there's no way to go directly to a desktop by number).

### Running

[Install AutoHotkey](https://autohotkey.com/download/) v1.1 or later, then run the `desktop_switcher.ahk` script (open with AutoHotkey if prompted). You can disable the switching animation by opening "Adjust the appearance and performance of Windows" and then unselecting the checkmark "Animate windows when minimizing and maximizing".

#### Notes about Windows 1809/1903≤ Updates

This project relies partly on [VirtualDesktopAccessor.dll](https://github.com/Ciantic/VirtualDesktopAccessor) (for moving windows to other desktops). This binary is included in this repository for convenience, and was recently updated to work with the 1809/1903≤ updates.

This may cause instability for users running older versions of Windows. If this is the case, [download the older DLL](https://github.com/pmb6tz/windows-desktop-switcher/blob/5289a0968179638f6e946a4cb69723510abd0d19/virtual-desktop-accessor.dll), rename it to `VirtualDesktopAccessor.dll`, and overwrite the previous DLL.

If a future Windows Update breaks the DLL again and updating your files from this repository doesn't work, you could try [building the DLL yourself](https://github.com/Ciantic/VirtualDesktopAccessor) (given that it was since updated by its' creators).

### Customizing Hotkeys

To change the key mappings, modify the `user_config.ahk` script and then run `desktop_switcher.ahk` (program will restart if it's already running). Note, `!` corresponds to <kbd>Alt</kbd>, `+` is <kbd>Shift</kbd>, `#` is <kbd>Win</kbd>, and `^` is <kbd>Ctrl</kbd>. A more detailed description of hotkeys can be found [here](https://autohotkey.com/docs/Hotkeys.htm). The syntax of the config file is `HOTKEY::ACTION`. Here are some examples of the customization options.

| Single line of code example                                                                                                                                            | Meaning                                                                                                                                                               |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `!n::switchDesktopToRight()`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Hotkey:** <kbd>Alt</kbd> + <kbd>N</kbd><br>**Action:** Switch to the desktop on the right                                                                           |
| `#!space::switchDesktopToRight()`                                                                                                                                      | **Hotkey:** <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Space</kbd><br>**Action:** Switch to the desktop on the right                                                      |
| `CapsLock & n::switchDesktopToRight()`                                                                                                                                 | **Hotkey:** <kbd>Capslock</kbd> + <kbd>N</kbd><br>**Action:** Switch to the desktop on the right<br>_(& is necessary when using a non-modifier key such as Capslock)_ |
| `!n::switchDesktopToRight()`                                                                                                                                           | **Hotkey:** <kbd>Alt</kbd> + <kbd>N</kbd><br>**Action:** Switch to the desktop on the right                                                                           |
| `^space::send, #{tab} `                                                                                                                                                | **Hotkey:** <kbd>Ctrl</kbd> + <kbd>Space</kbd><br>**Action:** Open Desktop Manager by sending <kbd>Win</kbd> + <kbd>Tab</kbd>                                         |

A more detailed description of hotkeys can be found here: [AutoHotkey docs](https://autohotkey.com/docs/Hotkeys.htm).<br>
You can find the explanation for the Desktop Manager hotkey [here](https://github.com/pmb6tz/windows-desktop-switcher/issues/41).<br>
After any changes to the configuration the program needs to be closed and opened again.

### Running on boot

You can make the script run on every boot with either of these methods.

#### Simple (Non-administrator method)

1. Press <kbd>Win</kbd> + <kbd>R</kbd>, enter `shell:startup`, then click <kbd>OK</kbd>
2. Create a shortcut to the `desktop_switcher.ahk` file here

#### Advanced (Administrator method)

Windows prevents hotkeys from working in windows that were launched with higher elevation than the AutoHotKey script (such as CMD or Powershell terminals that were launched as Administrator). As a result, Windows Desktop Switcher hotkeys will only work within these windows if the script itself is `Run as Administrator`, due to the way Windows is designed.

You can do this by creating a scheduled task to invoke the script at logon. You may use 'Task Scheduler', or create the task in powershell as demonstrated.

```
# Run the following commands in an Administrator powershell prompt.
# Be sure to specify the correct path to your desktop_switcher.ahk file.

$A = New-ScheduledTaskAction -Execute "PATH\TO\desktop_switcher.ahk"
$T = New-ScheduledTaskTrigger -AtLogon
$P = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
$S = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit 0
$D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
Register-ScheduledTask WindowsDesktopSwitcher -InputObject $D
```

The task is now registered and will run on the next logon, and can be viewed or modified in 'Task Scheduler'.

### Q&A

##### How to prevent cycling of desktop switching when end desktop or start desktop is reached?

Solution is described in [#66](https://github.com/pmb6tz/windows-desktop-switcher/issues/66#issuecomment-741793147).

### Credits

- Thanks to [Ciantic/VirtualDesktopAccessor](https://github.com/Ciantic/VirtualDesktopAccessor) (DLL) and [sdias/win-10-virtual-desktop-enhancer](https://github.com/sdias/win-10-virtual-desktop-enhancer) (DLL usage samples), our code can now move windows between desktops.

### Other

To see debug messages, download [SysInternals DebugView](https://technet.microsoft.com/en-us/sysinternals/debugview).

This script is intended to be lightweight in order to prioritize performance and robustness. For more advanced features (such as configuring different wallpapers on different desktops) check out https://github.com/sdias/win-10-virtual-desktop-enhancer.

---
