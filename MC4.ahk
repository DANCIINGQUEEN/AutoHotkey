#Persistent
SetBatchLines, -1  ; Improves script performance by not checking the script's line count during execution

; Modifier keys setup
^+!i::MouseMoveUp(true)
^+!j::MouseMoveLeft(true)
^+!k::MouseMoveDown(true)
^+!l::MouseMoveRight(true)

^+!u::MouseLeftClick()
^+!o::MouseRightClick()

MouseMoveUp(state) {
    static distance = 1
    While GetKeyState("i", "P") {
        MouseMove, 0, -distance, 0, R
        distance += 0.7  ; Increase the distance for acceleration
        Sleep, 10  ; Adjust the speed of movement
    }
    distance := 5  ; Reset distance when key is released
}

MouseMoveLeft(state) {
    static distance = 1
    While GetKeyState("j", "P") {
        MouseMove, -distance, 0, 0, R
        distance += 0.7
        Sleep, 10
    }
    distance := 5
}

MouseMoveDown(state) {
    static distance = 1
    While GetKeyState("k", "P") {
        MouseMove, 0, distance, 0, R
        distance += 0.7
        Sleep, 10
    }
    distance := 5
}

MouseMoveRight(state) {
    static distance = 1
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
