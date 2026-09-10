; --- AUTO-EXECUTE SECTION ---
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

#NoEnv
SetTitleMatchMode, 2
bToggle := 0
return

; --- HOTKEYS SECTION ---
#IfWinActive Warcraft

; 1. Disable Mouse Scrolling (Uses SendEvent specifically for this)
*WheelDown::return
*WheelUp::return

; 2. Block Game Mute/Sound
~^s::return
~^m::return

; 3. Health Bar Toggle (Your original "No-Blink" logic)
*CapsLock::
    bToggle := !bToggle
    if (bToggle) {
        ; "Hold down" the bracket keys
        Send {Raw}[
        Send {Raw}]
        Send {[ Down}
        Send {] Down}
    } else {
        ; "Release" the bracket keys
        Send {[ Up}
        Send {] Up}
    }
    ; This works perfectly in your original, so we keep it here!
    SetCapsLockState, AlwaysOff
return

#IfWinActive