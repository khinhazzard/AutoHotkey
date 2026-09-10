; --- AUTO-EXECUTE SECTION ---
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

#NoEnv
SetTitleMatchMode, 2
SetNumLockState, On
bToggle := 0
return

; --- HOTKEYS SECTION ---
#IfWinActive Warcraft

; 1. Disable Mouse Scrolling
*WheelDown::return
*WheelUp::return

; 2. Block Game Mute/Sound
~^s::return
~^m::return

; 3. Town Hall Cycling (Backspace Remap)
*!`::Send {Backspace}

; 4. Inventory Remaps (Fixed Alt-Modifier logic)
!q::Send {Numpad7}
!w::Send {Numpad8}
!a::Send {Numpad4}
!s::Send {Numpad5}
!z::Send {Numpad1}
!x::Send {Numpad2}

; 5. Health Bar Toggle (Original "No-Blink" logic)
*CapsLock::
    bToggle := !bToggle
    if (bToggle) {
        Send {Raw}[
        Send {Raw}]
        Send {[ Down}
        Send {] Down}
    } else {
        Send {[ Up}
        Send {] Up}
    }
    SetCapsLockState, AlwaysOff
return

#IfWinActive
