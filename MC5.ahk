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
    static lastTime = 0
    if (A_TickCount - lastTime < 10)
        return
    lastTime := A_TickCount 

    x := y := 0
    if(GetKeyState("i", "P") and GetKeyState("j", "P"))
        MouseMoveDiagonal(-1, -1, "i", "j")
    if(GetKeyState("i", "P") and GetKeyState("l", "P"))
        MouseMoveDiagonal(1, -1, "i", "l")
    if(GetKeyState("k", "P") and GetKeyState("j", "P"))
        MouseMoveDiagonal(-1, 1, "k", "j")
    if(GetKeyState("k", "P") and GetKeyState("l", "P"))
        MouseMoveDiagonal(1, 1, "k", "l")
    if (GetKeyState("i", "P"))
        MouseMove(0, -1, "i")
    if (GetKeyState("k", "P"))
        MouseMove(0, 1, "k")
    if (GetKeyState("j", "P"))
        MouseMove(-1, 0, "j")
    if (GetKeyState("l", "P"))
        MouseMove(1, 0, "l")
    
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

HandleClick(d){
    MouseClick, %d%
}
MouseLeftClick() {
    MouseClick, left
}
MouseRightClick() {
    MouseClick, right
}
