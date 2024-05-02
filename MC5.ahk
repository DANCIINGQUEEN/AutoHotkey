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

PerformMovement(key1, key2, xFactor, yFactor) {
    if (GetKeyState(key1, "P") and GetKeyState(key2, "P"))
        MouseMove(xFactor, yFactor, key1, key2)
}

SingleDirectionMove() {
    if (GetKeyState("i", "P"))
        MouseMove(0, -1, "i")
    if (GetKeyState("k", "P"))
        MouseMove(0, 1, "k")
    if (GetKeyState("j", "P"))
        MouseMove(-1, 0, "j")
    if (GetKeyState("l", "P"))
        MouseMove(1, 0, "l")
}
MouseMove(xFactor, yFactor, key1, key2 := "") {
    static BaseDistance := 10
    if (key2 = "") {
        ; 단일 키에 대한 처리
        While GetKeyState(key1, "P") {
            MouseMove, xFactor * BaseDistance, yFactor * BaseDistance, 0, R
            BaseDistance += 1
            Sleep, 10
        }
    } else {
        ; 두 키 조합에 대한 처리
        While GetKeyState(key1, "P") and GetKeyState(key2, "P") {
            MouseMove, xFactor * BaseDistance, yFactor * BaseDistance, 0, R
            BaseDistance += 1
            Sleep, 10
        }
    }
    BaseDistance := 5
}
HandleClick(d){
    MouseClick, %d%
}