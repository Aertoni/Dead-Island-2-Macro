#Requires AutoHotkey v2.0
A_MenuMaskKey := "vkE8"  ; Change the mask key to a non-functional virtual key

#HotIf WinActive("Dead Island 2") or WinActive("ahk_exe DeadIsland-Win64-Shipping.exe")

IsRunning := false

*XButton1:: {
    global IsRunning
    if IsRunning
        return

    IsRunning := true
    while GetKeyState("XButton1", "P") {
        FastAttack()
    }

    IsRunning := false
}

*XButton2:: {
    global IsRunning
    if IsRunning
        return

    IsRunning := true
    while GetKeyState("XButton2", "P") {
        PerformBigJump()
    }

    IsRunning := false
}

PerformBigJump() {
    Send "{Shift down}"
    Sleep 80
    Send "{Shift up}"
    Send "{Ctrl down}"
    Sleep 80
    Send "{Ctrl up}{Space down}{RButton down}"
    Sleep 200
    Send "{Space up}{RButton up}"
    Sleep 500
}

FastAttack() {
    Send "{LAlt Down}"
    Sleep 30
    Send "{LButton Down}"
    Sleep 30
    Send "{LAlt Up}"
    Sleep 30
    Send "{LButton Up}"

    Sleep GetKeyState("CapsLock", "T") ? 360 : 220  ;
}

SendKey(Key, Count := 1, Delay := 30) {
    loop Count {
        Send("{Blind}{" Key " down}")
        Sleep Delay
        Send("{Blind}{" Key " up}")
        Sleep Delay
    }
}

; Exit script
Del:: ExitApp