#NoEnv
#SingleInstance Force
Critical On

LastClickTime := 0 
return

*LButton::
    ; 150ms threshold blocks the hardware glitches on the initial down press.
    TimePassed := A_TickCount - LastClickTime
    if (TimePassed > 150) {
        LastClickTime := A_TickCount
        SendInput {Blind}{LButton DownR}
    }
return

*LButton Up::
    ; If the release happens too quickly after the press, it's a slow-release bounce.
    if (A_TickCount - LastClickTime < 150) {
        SendInput {Blind}{LButton Up}
        return ; Just send the Up signal and stop, do NOT reset the clock here.
    }
    
    ; Otherwise, it's a normal release (like after dragging), so let it pass through.
    SendInput {Blind}{LButton Up}
return
