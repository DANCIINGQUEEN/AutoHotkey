#Persistent
SetBatchLines, -1  

^+!i::
^+!j::
^+!k::
^+!l::
    HandleMovement()
return

^+!u::HandleClick("left")
^+!o::HandleClick("right")

HandleMovement() {
    static lastTime := 0
    if (A_TickCount - lastTime < 10)
        return
    lastTime := A_TickCount 

    PerformMovement("i", "j", -1, -1)
    PerformMovement("i", "l", 1, -1)
    PerformMovement("k", "j", -1, 1)
    PerformMovement("k", "l", 1, 1)
    SingleDirectionMove()
}

PerformMovement(k1, k2, dx, dy) {
    if (GetKeyState(k1, "P") and GetKeyState(k2, "P"))
        MouseMove(dx, dy, k1, k2)
}

SingleDirectionMove() {
    static directions := {"i": [0, -1], "k": [0, 1], "j": [-1, 0], "l": [1, 0]}
    for key, dir in directions
        if (GetKeyState(key, "P"))
            MouseMove(dir[1], dir[2], key)
}

MouseMove(dx, dy, k1, k2 := "") {
    static distance := 10
    while (k2 ? (GetKeyState(k1, "P") and GetKeyState(k2, "P")) : GetKeyState(k1, "P")) {
        MouseMove, dx * distance, dy * distance, 0, R
        distance += 1
        Sleep, 10
    }
    distance := 5
}
HandleClick(d){
    MouseClick, %d%
}