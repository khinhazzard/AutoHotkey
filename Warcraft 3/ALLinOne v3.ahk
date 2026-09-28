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

; 2. Block Game Mute AND Trigger Numpad5 Item + 'Y' Ability
^s::
    Send {Numpad5}
    Send, y
return

~^m::return

; 3. Town Hall Cycling (Backspace Remap)
*!`::Send {Backspace}

; 4. Inventory Remaps (Shifted Top 4 to Ctrl to free up WASD Camera)
^q::Send {Numpad7}
^w::Send {Numpad8}
^a::Send {Numpad4}
; Note: Ctrl+S is handled right above in Section 2 to do both Numpad5 and Y!

!z::Send {Numpad1}
!x::Send {Numpad2}

; HARD BLOCK: Intercepts and blocks Alt+Q to prevent accidental game quits!
!q::Return

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

; 6. Camera Panning (Smooth Alt + WASD + Shift Compatibility)
~LAlt::Return
~RAlt::Return

!w::
+!w::
Send {Up down}
Return

!w up::
+!w up::
Send {Up up}
Return

!a::
+!a::
Send {Left down}
Return

!a up::
+!a up::
Send {Left up}
Return

!s::
+!s::
Send {Down down}
Return

!s up::
+!s up::
Send {Down up}
Return

!d::
+!d::
Send {Right down}
Return

!d up::
+!d up::
Send {Right up}
Return

#IfWinActive
