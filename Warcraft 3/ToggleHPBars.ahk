; Force Admin Relaunch
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

#NoEnv
SetTitleMatchMode, 2 ; Match window titles containing "Warcraft"

; Toggle logic
bToggle := 0

#IfWinActive Warcraft
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
    ; Prevent CapsLock light from turning on
    SetCapsLockState, AlwaysOff
return
#IfWinActive