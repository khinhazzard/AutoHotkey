#NoEnv
#SingleInstance Force
Critical On

LastClickTime := 0 
return

*LButton::
    ; 100ms threshold. Filters hardware glitches on your broken main click.
    TimePassed := A_TickCount - LastClickTime
    if (TimePassed > 100) {
        LastClickTime := A_TickCount
        SendInput {Blind}{LButton DownR}
    }
return

*LButton Up::
    Sleep, 40
    
    ; If your finger is still physically holding the button, ignore the glitch
    if (GetKeyState("LButton", "P")) {
        return
    }
    
    ; If you actually let go, send the Up signal to Windows
    SendInput {Blind}{LButton Up}
return
