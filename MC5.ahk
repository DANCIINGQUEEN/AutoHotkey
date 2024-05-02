#Persistent
SetBatchLines, -1  ; Improves script performance by not checking the script's line count during execution

; Modifier keys setup
^+!i::
^+!j::
^+!k::
^+!l::
    HandleMovement()
return

; ^+!u::MouseLeftDoubleClick()
; ^+!u::MouseLeftClick()
^+!u::
    if (A_PriorHotkey = A_ThisHotkey && A_TimeSincePriorHotkey < 300){
        Click, 2
        isDoubleClick := true  
        SetTimer, ClearDoubleClick, Off  
    }else {
        isDoubleClick := false
        SetTimer, ClearDoubleClick, -300 
    }
return

ClearDoubleClick:
    if (!isDoubleClick) Click
    isDoubleClick := false  
return

#IfWinActive  
    ~LButton::  
        if (!A_TimeSincePriorHotkey || A_TimeSincePriorHotkey > 300)
            isDoubleClick := false  
return
#IfWinActive

^+!o::MouseRightClick()



HandleMovement() {
    static lastTime = 0
    ; Avoid processing too frequently
    if (A_TickCount - lastTime < 10)
        return
    lastTime := A_TickCount ; Update last time

    ; Determine direction
    x := y := 0
    if(GetKeyState("i", "P") and GetKeyState("j", "P"))
        MouseMoveDiagonal(-1, -1, "i", "j")
    if(GetKeyState("i", "P") and GetKeyState("l", "P"))
        ; MouseMoveUpAndRight(true)
        MouseMoveDiagonal(1, -1, "i", "l")
    if(GetKeyState("k", "P") and GetKeyState("j", "P"))
        ; MouseMoveDownAndLeft(true)
        MouseMoveDiagonal(-1, 1, "k", "j")
    if(GetKeyState("k", "P") and GetKeyState("l", "P"))
        ; MouseMoveDownAndRight(true)
        MouseMoveDiagonal(1, 1, "k", "l")
    if (GetKeyState("i", "P"))
        MouseMove(0, -1, "i")
    if (GetKeyState("k", "P"))
        MouseMove(0, 1, "k")
    if (GetKeyState("j", "P"))
        MouseMove(-1, 0, "j")
    if (GetKeyState("l", "P"))
        MouseMove(1, 0, "l")
    

    ; Move mouse
    if (x != 0 or y != 0)
        MouseMove, x, y, 0, R
}

MouseMove(xFactor, yFactor, key) {
    static distance = 10
    While GetKeyState(key, "P") {
        MouseMove, xFactor * distance, yFactor * distance, 0, R
        distance += 1
        Sleep, 10
    }
    distance := 5
}

MouseMoveDiagonal(xFactor, yFactor, k1, k2) {
    static distance = 10
    While GetKeyState(k1, "P") and GetKeyState(k2, "P"){
        MouseMove, xFactor * distance, yFactor * distance, 0, R
        distance += 1
        Sleep, 10
    }
    distance := 5
}

MouseLeftClick() {
    MouseClick, left
}
MouseLeftDoubleClick() {
    Click, 2
}

MouseRightClick() {
    MouseClick, right
}
