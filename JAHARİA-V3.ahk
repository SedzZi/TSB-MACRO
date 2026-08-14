#Requires AutoHotkey v2.0
#SingleInstance Force

panel := Gui("+AlwaysOnTop -Caption +Border +E0x20 +E0x80000 +ToolWindow +Owner", "")
panel.BackColor := "000000"
WinSetTransparent(90, panel.Hwnd)
WinSetAlwaysOnTop(true, panel.Hwnd)


statuspanel := Gui("+AlwaysOnTop -Caption +Border +E0x20 +E0x80000 +ToolWindow +Owner", "")
statuspanel.BackColor := "000000"
WinSetTransparent(90, statuspanel.Hwnd)
statuspanel.SetFont("s7.8 bold c00e1ff", "Segoe UI")


; |--------------------------------------------------------------|
; |-----------------JAHARİA NO GUİ TSB MACRO V3------------------|
; |--------------------------------------------------------------|
; |----------------------MADE BY @Heqs3131-----------------------|
; |--------------------------------------------------------------|





; |-----------------------------------------------------|
; |---------------VERY İMPORTANT SETTİNGS---------------|
; |-----------------------------------------------------| 

global robloxsensivity:= 0.4      ; Game Sensitivity
global hotkeypanel := 1           ; Hotkey Panel  1 = on ----- 0 = off
global statuspanel1 := 1          ; Extra Status Panel  1 = on ----- 0 = off
global robloxcheck1 := 1          ; Roblox On - Off Check For Hotkey Panel And Status Panel  1 = on ----- 0 = off
global cordcheck := 1             ; Auto Coordination For Hotkey Panel And Status Panel  1 = on ----- 0 = off  (Requires Roblox Check to be enabled)
global exitmacrohk := "F1"        ; Exit Macro Hotkey
global restartmacrohk := "F2"     ; Restart Macro Hotkey For Test Settings
global macrocontrolhk := "F3"     ; Macro Enabled - Disabled Button
global macrosEnabled := true      ; Dont Touch


; |--------------------------------------------|
; |---------------MACRO SETTİNGS---------------|
; |--------------------------------------------|

;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------

; LETHAL V1 MACRO CONTROL
global lethalv1hk := "r"          ; Lethal V1 Hotkey
global lethalv1macro := 0         ; Lethal V1 Macro  1 = on ----- 0 = off
global lethalv1shiftlock := 1     ; 1 = Shiftlock Version ----- 0 = Unshiftlock Version
global lethalv1flick := 1         ; 1 = Right Flick ----- 0 = Left Flick ----- For Shiftlock Version
global lethalv1sleep := 230       ; Wait For Flick (1000 ms = 1 second ----- 230 ms = 0.23 second)

;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------

; LETHAL V2 MACRO CONTROL
global lethalv2hk := "r"          ; Lethal V2 Hotkey
global lethalv2macro := 1         ; Lethal V2 Macro  1 = on ----- 0 = off
global lethalv2sleep := 180       ; Wait For Flick (1000 ms = 1 second ----- 180 ms = 0.18 second)
global lethalv2jump := 1          ; Press Space 1 = on ----- 0 = off

;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------

;TWİST V1 MACRO CONTROL
global twistv1hk := "e"           ; Twist V1 Hotkey
global twistv1macro := 1          ; Twist V1 Macro  1 = on ----- 0 = off

;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------

;TWİST V2 MACRO CONTROL
global twistv2hk := "c"           ; Twist V2 Hotkey
global twistv2macro := 0          ; Twist V2 Macro  1 = on ----- 0 = off
global firstdegree := -60         ; Twist V2 First Flick Degree
global tsleep := 160              ; Wait For Second Flick (1000 ms = 1 second ----- 160 ms = 0.16 second)
global seconddegree := 86         ; Twist V2 Second Flick Degree

;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------

; SİDE FRONT DASH MACRO CONTROL
global sidefrontdashhk := "z"     ; Side Front Dash Hotkey
global sidefrontdashmacro := 1    ; Side Front Dash  1 = on ----- 0 = off
global sidedash := 1              ; 1 = Right Dash ----- 0 = Left Dash

;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------

; BACKDASH CANCEL MACRO CONTROL
global backdash1hk := "x"         ; Backdash + 1 Hotkey
global backdash1macro := 0        ; Backdash + 1 Macro  1 = on ----- 0 = off

global backdash2hk := "x"         ; Backdash + 2 Hotkey
global backdash2macro := 0        ; Backdash + 2 Macro  1 = on ----- 0 = off

global backdash3hk := "c"         ; Backdash + 3 Hotkey
global backdash3macro := 1        ; Backdash + 3 Macro  1 = on ----- 0 = off

global backdash4hk := "v"         ; Backdash + 4 Hotkey
global backdash4macro := 0        ; Backdash + 4 Macro  1 = on ----- 0 = off

;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------

; SOLİTUDE DASH MACRO CONTROL (%50 Luck AND Use Saitama)
global solitudev1hk := "x"        ; Solitude Dash Hotkey
global solitudev1macro := 1       ; Solitude Dash Macro 1 = on ----- 0 = off

;------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------


; Sens Calculator For 1920x1080 Resolution :)
global r1 := 360
global r2 := -360
global r3 := -100
global r4 := 200
global r5 := -110
global r6 := 350
global L1 := r1 / robloxsensivity
global L2 := r2 / robloxsensivity
global T1 := r3 / robloxsensivity
global T2 := r4 / robloxsensivity
global T3 := r5 / robloxsensivity
global L3 := r6 / robloxsensivity


; Degree Calculator For 1920x1080 Resolution :)
global ref := 720
global ref2 := ref / robloxsensivity
global degree1 := (firstdegree/360) * ref2
global degree2 := (seconddegree/360) * ref2


paneltext()


if (hotkeypanel=1)
{
    panel.Show("w130 h220 x0 y810 NoActivate")
}
if (statuspanel1=1)
{
    statuspanel.Show("w130 h20 x0 y787 NoActivate")
    SetTimer(duyuru, 20000)
}
if (robloxcheck1=1)
{
    SetTimer(robloxcheck, 500)
}


HotIfWinActive("ahk_exe RobloxPlayerBeta.exe")
registeredHKs := Map()
RegisterMacroHotkey(hk) {
    if (hk != "" && !registeredHKs.Has(hk)) {
        Hotkey("$~" . hk, MasterHotkeyHandler)
        registeredHKs[hk] := true
    }
}


RegisterMacroHotkey(lethalv1hk)
RegisterMacroHotkey(lethalv2hk)
RegisterMacroHotkey(twistv1hk)
RegisterMacroHotkey(twistv2hk)
RegisterMacroHotkey(sidefrontdashhk)
RegisterMacroHotkey(backdash1hk)
RegisterMacroHotkey(backdash2hk)
RegisterMacroHotkey(backdash3hk)
RegisterMacroHotkey(backdash4hk)
RegisterMacroHotkey(solitudev1hk)
HotIf()
Hotkey("~" . exitmacrohk, exitmacro)
Hotkey("~" . restartmacrohk, restartmacro)
Hotkey("~" . macrocontrolhk, ToggleMacros)


MasterHotkeyHandler(HotkeyName)
{
    if (!macrosEnabled)
        return
    pressedHK := StrReplace(HotkeyName, "$~", "")
    if (pressedHK = lethalv1hk && lethalv1macro = 1) {
        lethalv1()
        st1("LETHAL V1")
        return
    }
    if (pressedHK = lethalv2hk && lethalv2macro = 1) {
        lethalv2()
        st1("LETHAL V2")
        return
    }
    if (pressedHK = twistv1hk && twistv1macro = 1) {
        twistv1()
        st1("TWIST V1")
        return
    }
    if (pressedHK = twistv2hk && twistv2macro = 1) {
        twistv2()
        st1("TWIST V2")
        return
    }
    if (pressedHK = sidefrontdashhk && sidefrontdashmacro = 1) {
        sidefrontdash()
        st1("SIDE FRONT DASH")
        return
    }
    if (pressedHK = backdash1hk && backdash1macro = 1) {
        backdash1()
        st1("BACKDASH + 1")
        return
    }
    if (pressedHK = backdash2hk && backdash2macro = 1) {
        backdash2()
        st1("BACKDASH + 2")
        return
    }
    if (pressedHK = backdash3hk && backdash3macro = 1) {
        backdash3()
        st1("BACKDASH + 3")
        return
    }
    if (pressedHK = backdash4hk && backdash4macro = 1) {
        backdash4()
        st1("BACKDASH + 4")
        return
    }
    if (pressedHK = solitudev1hk && solitudev1macro = 1)
    {
        solitude()
        st1("SOLİTUDE")
        return
    }
}


lethalv1()
{
    if (lethalv1macro = 1)
    {
        if (lethalv1shiftlock = 1)
        {
            if (lethalv1flick = 1)
            {
                Send("{q}")
                Sleep(lethalv1sleep)
                DllCall("mouse_event", "UInt", 1, "Int", L1, "Int", 0)
            }
            else if (lethalv1flick = 0)
            {
                Send("{q}")
                Sleep(lethalv1sleep)
                DllCall("mouse_event", "UInt", 1, "Int", L2, "Int", 0)
            }
        }
        else
        {
            Send("{q}")
            Sleep(lethalv1sleep)
            Send("{Shift}")
        }
    }
}


lethalv2()
{
    if (lethalv2macro = 1 && lethalv2jump = 0)
    {
        DllCall("mouse_event", "UInt", 1, "Int", L1, "Int", 0)
        Send("{q}")
        Sleep(lethalv2sleep)
        DllCall("mouse_event", "UInt", 1, "Int", L3, "Int", 0)
    }
    else if (lethalv2macro = 1 && lethalv2jump = 1)
    {
        DllCall("mouse_event", "UInt", 1, "Int", L1, "Int", 0)
        Send("{Space Down}")
        Send("{q}")
        Sleep(lethalv2sleep)
        DllCall("mouse_event", "UInt", 1, "Int", L3, "Int", 0)
        Send("{Space Up}")
    }
}

twistv1()
{
    if (twistv1macro = 1)
    {
        DllCall("mouse_event", "UInt", 1, "Int", T1, "Int", 0)
        Send("{q}")
        Sleep(170)
        DllCall("mouse_event", "UInt", 1, "Int", T2, "Int", 0)
        Sleep(90)
        DllCall("mouse_event", "UInt", 1, "Int", T3, "Int", 0)
    }
}


twistv2()
{
    if (twistv2macro = 1)
    {
        DllCall("mouse_event", "UInt", 1, "Int", degree1, "Int", 0)
        Send("{q}")
        Sleep(tsleep)
        DllCall("mouse_event", "UInt", 1, "Int", degree2, "Int", 0)
    }
}


sidefrontdash()
{
    if (sidefrontdashmacro = 1 && sidedash = 1)
    {
        Send("{q}")
        Send("{d Down}")
        Sleep(10)
        Send("{q}")
        Send("{d Up}")
    }
    if (sidefrontdashmacro = 1 && sidedash = 0)
    {
        Send("{q}")
        Send("{a Down}")
        Sleep(10)
        Send("{q}")
        Send("{a Up}")
    }
}


backdash1()
{
    Send("{1}")
    Send("{s Down}")
    Sleep(5)
    Send("{LButton}")
    Sleep(10)
    Send("{q}")
    Send("{s Up}")
    Send("{1}")
}


backdash2()
{
    Send("{2}")
    Send("{s Down}")
    Sleep(5)
    Send("{LButton}")
    Sleep(10)
    Send("{q}")
    Send("{s Up}")
    Send("{2}")
}


backdash3()
{
    Send("{3}")
    Send("{s Down}")
    Sleep(5)
    Send("{LButton}")
    Sleep(10)
    Send("{q}")
    Send("{s Up}")
    Send("{3}")
}


backdash4()
{
    Send("{4}")
    Send("{s Down}")
    Sleep(5)
    Send("{LButton}")
    Sleep(10)
    Send("{q}")
    Send("{s Up}")
    Send("{4}")
}


solitude()
{
    Sleep(60)
    Send("{LButton}")
    Sleep(110)
    Send("{Space Down}")
    Sleep(400)
    Send("{LButton}")
    Sleep(375)
    Send("{Space Up}")
    Send("{q}")
    Sleep(254)
    DllCall("mouse_event", "UInt", 1, "Int", L2, "Int", 0)
}


exitmacro(hk)
{
    ExitApp()
}


restartmacro(hk)
{
    Reload()
}


ToggleMacros(hk)
{
    global macrosEnabled
    macrosEnabled := !macrosEnabled
    st()
}


robloxcheck()
{
    if (robloxcheck1 = 1 && cordcheck = 0)
    {
        if (WinActive("ahk_exe RobloxPlayerBeta.exe"))
        {
            if (hotkeypanel = 1)
            {
                panel.Show("w130 h220 x0 y810 NoActivate")
            }
            if (statuspanel1 = 1)
            {
                statuspanel.Show("w130 h20 x0 y787 NoActivate")
            }
        }
        else
        {
            panel.Hide()
            statuspanel.Hide()
        }
    }
    if (robloxcheck1 = 1 && cordcheck = 1)
    {
        if (WinActive("ahk_exe RobloxPlayerBeta.exe"))
        {
            if (hotkeypanel = 1)
            {
                WinGetPos(&winX, &winY, &winW, &winH, "ahk_exe RobloxPlayerBeta.exe")
                guiX := winX + 10
                guiY := winY + winH - 230
                panel.Show("w140 h220 x" guiX " y" guiY " NoActivate")
            }
            if (statuspanel1 = 1)
            {
                WinGetPos(&winX, &winY, &winW, &winH, "ahk_exe RobloxPlayerBeta.exe")
                guiX := winX + 10
                guiY := winY + winH - 252
                statuspanel.Show("w140 h20 x" guiX " y" guiY " NoActivate")
            }
        }
        else
        {
            panel.Hide()
            statuspanel.Hide()
        }
    }
}


paneltext()
{
    panel.SetFont("s7 norm c00FF00", "Verdana")
    firstLeft := true
    if (lethalv1macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Lethal V1 >> " "[" lethalv1hk "]")
        firstLeft := false
    }
    if (lethalv2macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Lethal V2 >> " "[" lethalv2hk "]")
        firstLeft := false
    }
    if (twistv1macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Twist V1 >> " "[" twistv1hk "]")
        firstLeft := false
    }
    if (twistv2macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Twist V2 >> " "[" twistv2hk "]")
        firstLeft := false
    }
    if (sidefrontdashmacro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Side Front Dash >> " "[" sidefrontdashhk "]")
        firstLeft := false
    }
    if (backdash1macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Backdash + 1 >> " "[" backdash1hk "]")
    }
    if (backdash2macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Backdash + 2 >> " "[" backdash2hk "]")
    }
    if (backdash3macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Backdash + 3 >> " "[" backdash3hk "]")
    }
    if (backdash4macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Backdash + 4 >> " "[" backdash4hk "]")
    }
    if (solitudev1macro=1)
    {
        posY := firstLeft ? "y5" : "y+3"
        panel.Add("Text", "x10 " posY " w280 BackgroundTrans", "Solitude (%50) >> " "[" solitudev1hk "]")
    }
    if (lethalv1macro=0 && lethalv2macro=0 && twistv1macro=0 && twistv2macro=0 && sidefrontdashmacro=0 && backdash1macro=0 && backdash2macro=0 && backdash3macro=0 && backdash4macro=0 && solitudev1macro=0)
    {
        panel.SetFont("s8 bold cff0000", "Verdana")
        panel.Add("Text", "x0 y5 w140 Center BackgroundTrans", "No Macro Selected")
    }
    panel.SetFont("s7 bold ca7a4a4", "Verdana")
    panel.Add("Text", "x10 y180 w280 BackgroundTrans", "Exit >> " "[" exitmacrohk "]")
    panel.Add("Text", "x10 y190 w282 BackgroundTrans", "Restart >> " "[" restartmacrohk "]")
    panel.Add("Text", "x10 y200 w284 BackgroundTrans", "On - Off >> " "[" macrocontrolhk "]")
    panel.SetFont("s7 bold cff0000", "Verdana")
    global status := panel.Add("Text", "x10 y165 w280 BackgroundTrans", "MACRO ENABLED")
    global statustext := statuspanel.Add("Text", "x0 y0 w130 h20 Center 0x200 +BackgroundTrans", "Made By Sedz")
    SetTimer(() => (statustext.Value := "Macro Enabled"), -1000)
    statustext.Value := "Macro Enabled"
}


duyuru()
{
    statustext.SetFont("s7.8 bold cd0ff00", "Segoe UI")
    statustext.Value := "This Macro Was"
    SetTimer(() => statustext.Value := "Made By Sedz", -2000)
    SetTimer(st, -4000)
}


st()
{
    statustext.SetFont("s7.8 bold c00e1ff", "Segoe UI")
    if (macrosEnabled)
    {
        statustext.Value := "Macro Enabled"
        status.Value := "MACRO ENABLED"
    }
    else
    {
        statustext.Value := "Macro Disabled"
        status.Value := "MACRO DISABLED"
    }
}


st1(macrotxt)
{
    if (statustext.Value = "This Macro Was" || statustext.Value = "Made By Sedz")
    {
        return
    }
    else
    {
        statustext.SetFont("s8 bold c00ff00", "Segoe UI")
        statustext.Value := macrotxt
        SetTimer(() => st(), -2000)
    }
}
