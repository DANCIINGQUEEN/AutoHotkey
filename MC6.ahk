#Persistent
SetBatchLines, -1

; Modifier keys setup
^+!i::
^+!k::
^+!j::
^+!l::
    HandleMovement()
return

^+!u::MouseLeftClick()
^+!o::MouseRightClick()

global moveData := {}  ; Initialize movement data for each direction
moveData.up := {speed: 0, maxSpeed: 20}
moveData.down := {speed: 0, maxSpeed: 20}
moveData.left := {speed: 0, maxSpeed: 20}
moveData.right := {speed: 0, maxSpeed: 20}

HandleMovement() {
    static lastTime = 0, interval := 10
    ; Avoid processing too frequently
    if (A_TickCount - lastTime < interval)
        return
    lastTime := A_TickCount

    x := y := 0
    Accelerate("i", "up", y, -1)
    Accelerate("k", "down", y, 1)
    Accelerate("j", "left", x, -1)
    Accelerate("l", "right", x, 1)

    ; Move mouse if there's any non-zero movement
    if (x != 0 or y != 0)
        MouseMove, x, y, 0, R
}

; Function to manage acceleration for each direction
Accelerate(key, dir, ByRef value, factor) {
    if (GetKeyState(key, "P")) {
        ; Increase speed with a limit
        moveData[dir].speed := Min(moveData[dir].speed + 1, moveData[dir].maxSpeed)
        value += factor * moveData[dir].speed
    } else {
        ; Reset speed when key is released
        moveData[dir].speed := 0
    }
}

MouseLeftClick() {
    MouseClick, left
}

MouseRightClick() {
    MouseClick, right
}
