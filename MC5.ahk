#Persistent
SetBatchLines, -1  ; Improves script performance by not checking the script's line count during execution

; Modifier keys setup
^+!i::
^+!j::
^+!k::
^+!l::
    HandleMovement()
return

^+!u::MouseLeftClick()
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
        MouseMoveUpAndLeft(true)
    if(GetKeyState("i", "P") and GetKeyState("l", "P"))
        MouseMoveUpAndRight(true)
    if(GetKeyState("k", "P") and GetKeyState("j", "P"))
        MouseMoveDownAndLeft(true)
    if(GetKeyState("k", "P") and GetKeyState("l", "P"))
        MouseMoveDownAndRight(true)
    if (GetKeyState("i", "P"))
        MouseMoveUp(true)
    if (GetKeyState("k", "P"))
        MouseMoveDown(true)
    if (GetKeyState("j", "P"))
        MouseMoveLeft(true)
    if (GetKeyState("l", "P"))
        MouseMoveRight(true)
    

    ; Move mouse
    if (x != 0 or y != 0)
        MouseMove, x, y, 0, R
}

MouseMoveFunction(direction, state){
    static distance=10
    
}

MouseMoveUpAndLeft(state){
    static distance = 10
    While GetKeyState("i", "P") and GetKeyState("j", "P") {
        MouseMove, -distance, -distance, 0, R
        distance += 0.7  ; Increase the distance for acceleration
        Sleep, 10  ; Adjust the speed of movement
    }
    distance := 5  ; Reset distance when key is released
}
MouseMoveUpAndRight(state){
    static distance = 10
    While GetKeyState("i", "P") and GetKeyState("l", "P") {
        MouseMove, distance, -distance, 0, R
        distance += 0.7  ; Increase the distance for acceleration
        Sleep, 10  ; Adjust the speed of movement
    }
    distance := 5  ; Reset distance when key is released
}
MouseMoveDownAndLeft(state){
    static distance = 10
    While GetKeyState("k", "P") and GetKeyState("j", "P") {
        MouseMove, -distance, distance, 0, R
        distance += 0.7  ; Increase the distance for acceleration
        Sleep, 10  ; Adjust the speed of movement
    }
    distance := 5  ; Reset distance when key is released
}
MouseMoveDownAndRight(state){
    static distance = 10
    While GetKeyState("k", "P") and GetKeyState("l", "P") {
        MouseMove, distance, distance, 0, R
        distance += 0.7  ; Increase the distance for acceleration
        Sleep, 10  ; Adjust the speed of movement
    }
    distance := 5  ; Reset distance when key is released
}


MouseMoveUp(state) {
    static distance = 10
    While GetKeyState("i", "P") {
        MouseMove, 0, -distance, 0, R
        distance += 0.7  
        Sleep, 10  
    }
    distance := 5  
}
MouseMoveLeft(state) {
    static distance = 10
    While GetKeyState("j", "P") {
        MouseMove, -distance, 0, 0, R
        distance += 0.7
        Sleep, 10
    }
    distance := 5
}

MouseMoveDown(state) {
    static distance = 10
    While GetKeyState("k", "P") {
        MouseMove, 0, distance, 0, R
        distance += 0.7
        Sleep, 10
    }
    distance := 5
}

MouseMoveRight(state) {
    static distance = 10
    While GetKeyState("l", "P") {
        MouseMove, distance, 0, 0, R
        distance += 0.7
        Sleep, 10
    }
    distance := 5
}

MouseLeftClick() {
    MouseClick, left
}

MouseRightClick() {
    MouseClick, right
}
