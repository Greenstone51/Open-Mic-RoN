#MaxThreadsPerHotkey 1

; Defaults
userToggleKey := "v"
ingamePTTKey := "j"

MsgBox, Welcome. You can customize your keys next. Please use lowercase single letters only.

; Ask for toggle key
InputBox, userToggleKeyInput, Toggle Key, Enter the key you want to use to toggle Voicechat. (default: V), , 300, 150,,, , %userToggleKey%
if (!ErrorLevel && userToggleKeyInput != "") {
    userToggleKey := userToggleKeyInput
}

; Ask for PTT key
InputBox, ingamePTTKeyInput, In-Game PTT Key, Enter the keybind used in-game to activate voice. (default: J), , 300, 150,,, , %ingamePTTKey%
if (!ErrorLevel && ingamePTTKeyInput != "") {
    ingamePTTKey := ingamePTTKeyInput
}

msg := "Thank you! '" . userToggleKey . "' will toggle '" . ingamePTTKey . "'. Press Ctrl+" . ingamePTTKey . " to immediately stop the script if needed. Close this message to start."
MsgBox, %msg%

; Initializing
Menu, Tray, Tip, Mic Status: OFF
toggle := false

; Create dynamic hotkeys
Hotkey, % "$" . userToggleKey, TogglePTT, On
Hotkey, ^%ingamePTTKey%, PanicExit, On
return

TogglePTT:
    toggle := !toggle
    if (toggle) {
        Send, {%ingamePTTKey% down}
        Menu, Tray, Tip, Mic Status: ON
    } else {
        Send, {%ingamePTTKey% up}
        Menu, Tray, Tip, Mic Status: OFF
    }
return

PanicExit:
    Send, {%ingamePTTKey% up}
    Menu, Tray, Tip, Mic Status: OFF
    MsgBox, Cya! Thanks for using. :3 © 2025 Greenstone51
    ExitApp
return
