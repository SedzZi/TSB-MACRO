#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 255
A_MaxHotkeysPerInterval := 2000
SendMode("Input") 
CoordMode("Mouse", "Screen")
DllCall("timeBeginPeriod", "UInt", 1)


global macrosEnabled := true

settings := Gui("+Border ", "Jaharia")
settings.BackColor := "bcdcfc"
settings.SetFont("c080808 s10 bold", "Arial")


info := Gui("+Border -Caption", "Jaharia")
info.BackColor := "3f3e3e"
info.SetFont("cf7f1f1 s10 bold", "Arial")
dc := info.AddText("x130 y230 w140 h40 Center 0x200 Border Background333333", "DISCORD")
yt := info.AddText("x130 y280 w140 h40 Center 0x200 Border Background333333", "YOUTUBE")
back := info.AddText("x130 y330 w140 h40 Center 0x200 Border Background0f0f0f", "BACK TO MACRO")

info.AddText("x50 y60 w300 h150 Center +Wrap ", "Greetings! This macro was made by Sedz for the Roblox game The Strongest Battlegrounds. If you notice any bugs or issues, please let me know!")
info.SetFont("cf7f1f1 s13 bold", "Arial")
info.AddText("x0 y10 w400 h30 Center 0x200", "Jaharia TSB Macro")
back.OnEvent("Click", backk)
yt.OnEvent("Click", ytt)
dc.OnEvent("Click", dcc)

panel := Gui("+AlwaysOnTop -Caption +Border +E0x20 +E0x80000 +ToolWindow +Owner", "")
panel.BackColor := "000000"
WinSetTransparent(220, panel.Hwnd)

statuspanel := Gui("+AlwaysOnTop -Caption +Border +E0x20 +E0x80000 +ToolWindow +Owner", "")
statuspanel.BackColor := "000000"
WinSetTransparent(220, statuspanel.Hwnd)



global tabs := settings.AddTab3("w680 h410 x10 y10", ["General", "Lethal", "Twist", "Side Front Dash", "Backdash", "Solitude", "Downslam", "EmoteBC", "Fun"])
settings.SetFont("c080808 s11 bold", "Segoe UI")















tabs.UseTab(1)

settings.AddText("x0 y50 w700 Center +BackgroundTrans", "GENERAL SETTİNGS")
settings.AddText("x30 y100 h30 0x200", "Roblox Sensitivity :")
settings.AddText("x30 y140 h30 0x200", "Exit Macro Hotkey :")
settings.AddText("x30 y180 h30 0x200", "Macro On-Off Hotkey :")
settings.AddText("x30 y220 h30 0x200", "Hide Menu Hotkey :")
settings.AddText("x30 y260 h30 0x200", "Hotkey Panel Opacity (255 Max) :")

global robloxsensivity := settings.AddEdit("x200 y100 w110 h30 Center ", "0.4")
global exithk := settings.AddHotkey("x200 y140 w110 ", "F1")
global togglehk := settings.AddHotkey("x200 y180 w110 ", "F2")
global menutogglehk := settings.AddHotkey("x200 y220 w110 ", "F3")
global hkmenuopacity := settings.AddEdit("x280 y260 w110 h30 +Number Center ", "220")

global hotkeypanel := settings.AddCheckBox("x400 y100", "Hotkey Panel")
global robloxcheck := settings.AddCheckBox("x400 y140", "Roblox Check")
global cordcheck := settings.AddCheckBox("x400 y180", "Coordination Check")

tabs.UseTab(2)

settings.AddText("x0 y50 w700 Center +BackgroundTrans", "LETHAL MACRO V1 - V2")
settings.AddText("x30 y140 h30 0x200", "Lethal V1 Hotkey :")
settings.AddText("x30 y180 h30 0x200", "Shiftlock Version :")
settings.AddText("x30 y220 h30 0x200", "Wait For Flick :")
settings.AddText("x30 y260 h30 0x200", "Auto Jump :")
global lthtext2 := settings.AddText("x30 y300 h30 0x200", "Dash Style :")
global lthtext := settings.AddText("x30 y340 h30 0x200", "Wait For Flick :")

global lthmacro := settings.AddCheckBox("x30 y100", "Lethal V1")
global lthhk := settings.AddHotkey("x180 y140 w110 Center", "r")
global lthshiftlock := settings.AddDropDownList("x180 y180 w110 Choose1", ["Shiftlock", "Unshiftlock"])
global lthsleep := settings.AddEdit("x180 y220 w110 h30 Center +Number", "220")
global lthjump := settings.AddDropDownList("x180 y260 w110 Choose1", ["On", "Off"])
global lthdashstyle := settings.AddDropDownList("x180 y300 w110 Choose1", ["1", "2"])
global lthsleep2 := settings.AddEdit("x180 y340 w110 h30 Center +Number", "200")

settings.AddText("x380 y140 h30 0x200", "Lethal V2 Hotkey :")
settings.AddText("x380 y180 h30 0x200", "Wait For Flick :")
settings.AddText("x380 y220 h30 0x200", "Auto Jump :")
settings.AddText("x380 y260 h30 0x200", "Dash Style :")

global lthv2macro := settings.AddCheckBox("x380 y100", "Lethal V2")
global lthv2hk := settings.AddHotkey("x530 y140 w110 Center", "r")
global lthv2sleep := settings.AddEdit("x530 y180 w110 h30 Center +Number", "190")
global lthv2jump := settings.AddDropDownList("x530 y220 w110 Choose1", ["On", "Off"])
global lthv2dashstyle := settings.AddDropDownList("x530 y260 w110 Choose1", ["1", "2"])
global lthv2sleep2 := settings.AddEdit("x530 y300 w110 h30 Center +Number", "75")
global lthv2text := settings.AddText("x380 y300 h30 0x200", "Wait For Flick :") 

tabs.UseTab(3)

settings.AddText("x0 y50 w700 Center +BackgroundTrans", "TWIST V1 - V2")
settings.AddText("x30 y140 h30 0x200", "Twist V1 Hotkey :")
settings.AddText("x30 y180 h30 0x200", "Wait For Flick :")
settings.AddText("x30 y220 h30 0x200", "Wait For 2th Flick :")
settings.AddText("x30 y260 h30 0x200", "Dash Style :")
global twistv1text := settings.AddText("x30 y300 h30 0x200", "Wait For Flick :")

global twistv1macro := settings.AddCheckBox("x30 y100", "Twist V1")
global twistv1hk := settings.AddHotkey("x180 y140 w110 Center", "e")
global twistv1sleep := settings.AddEdit("x180 y180 w110 h30 Center +Number", "170")
global twistv1sleep2 := settings.AddEdit("x180 y220 w110 h30 Center +Number", "90")
global twistv1dashstyle := settings.AddDropDownList("x180 y260 w110 Choose1", ["1", "2"])
global twistv1sleep3 := settings.AddEdit("x180 y300 w110 h30 Center +Number", "110")

settings.AddText("x380 y140 h30 0x200", "Twist V2 Hotkey :")
settings.AddText("x380 y180 h30 0x200", "1th Flick Degree :")
settings.AddText("x380 y220 h30 0x200", "Wait :")
settings.AddText("x380 y260 h30 0x200", "2th Flick Degree :")

global twistv2macro := settings.AddCheckBox("x380 y100", "Twist V2")
global twistv2hk := settings.AddHotkey("x530 y140 w110 Center", "e")
global twistv2first := settings.AddEdit("x530 y180 w110 h30 Center +Number", "-60")
global twistv2sleep := settings.AddEdit("x530 y220 w110 h30 Center +Number", "190")
global twistv2second := settings.AddEdit("x530 y260 w110 h30 Center +Number", "86")

tabs.UseTab(4)

settings.AddText("x0 y50 w700 Center +BackgroundTrans", "SIDE FRONT DASH")
settings.AddText("x30 y140 h30 0x200", "Twist V1 Hotkey :")
settings.AddText("x30 y180 h30 0x200", "Dash :")

global sidefrontdashmacro := settings.AddCheckBox("x30 y100", "Side Front Dash")
global sidefrontdashhk := settings.AddHotkey("x180 y140 w110 Center", "t")
global sidedash := settings.AddDropDownList("x180 y180 w110 Choose1", ["Right", "Left"])


tabs.UseTab(5)

settings.AddText("x0 y50 w700 Center +BackgroundTrans", "BACKDASH CANCEL 1 - 2 - 3 - 4")

settings.AddText("x30 y140 h30 0x200", "Backdash 1 Hotkey :")
global backdash1macro := settings.AddCheckBox("x30 y100", " Backdash + 1")
global backdash1hk := settings.AddHotkey("x180 y140 w110 Center", "z")

settings.AddText("x30 y260 h30 0x200", "Backdash 2 Hotkey :")
global backdash2macro := settings.AddCheckBox("x30 y220", " Backdash + 2")
global backdash2hk := settings.AddHotkey("x180 y260 w110 Center", "x")

settings.AddText("x380 y140 h30 0x200", "Backdash 3 Hotkey :")
global backdash3macro := settings.AddCheckBox("x380 y100", " Backdash + 3")
global backdash3hk := settings.AddHotkey("x530 y140 w110 Center", "c")

settings.AddText("x380 y260 h30 0x200", "Backdash 4 Hotkey :")
global backdash4macro := settings.AddCheckBox("x380 y220", " Backdash + 4")
global backdash4hk := settings.AddHotkey("x530 y260 w110 Center", "v")

tabs.UseTab(6)
settings.AddText("x0 y50 w700 Center +BackgroundTrans", "SOLITUDE DASH")
settings.AddText("x30 y140 h30 0x200", "Solitude Hotkey :")
settings.AddText("x30 y180 h30 0x200", "Wait For Jump :")
settings.AddText("x30 y220 h30 0x200", "Wait For Dash :")
settings.AddText("x30 y260 h30 0x200", "Wait For Flick :")
settings.AddText("x30 y300 h30 0x200", "Dash Style :")
solitext := settings.AddText("x30 y340 h30 0x200", "Wait For Flick :")

global solitudemacro := settings.AddCheckBox("x30 y100", "Solitude (Trash Macro)")
global solitudehk := settings.AddHotkey("x180 y140 w110 Center", "t")
global solitudesleep1 := settings.AddEdit("x180 y180 w110 h30 Center +Number", "420")
global solitudesleep2 := settings.AddEdit("x180 y220 w110 h30 Center +Number", "357")
global solitudesleep3 := settings.AddEdit("x180 y260 w110 h30 Center +Number", "232")
global solitudedashstyle := settings.AddDropDownList("x180 y300 w110 Choose1", ["1", "2"])
global solitudesleep4 := settings.AddEdit("x180 y340 w110 h30 Center +Number", "232")

tabs.UseTab(7)
settings.AddText("x0 y50 w700 Center +BackgroundTrans", "TRUE DOWNSLAM")
global truedownslammacro := settings.AddCheckBox("x30 y100", "True Downslam")
settings.AddText("x30 y140 h30 0x200", "TD Hotkey :")
global truedownslamhk := settings.AddHotkey("x180 y140 w110 Center", "h")
settings.AddText("x30 y180 h30 0x200", "Wait For Jump :")
global truedownslamsleep := settings.AddEdit("x180 y180 w110 h30 Center +Number", "50")
settings.AddText("x30 y220 h30 0x200", "Hit + Jump Mode :")
global hitxjumpmode := settings.AddDropDownList("x180 y220 w110 Choose2", ["On", "Off"])
global truedownslamsleep2 := settings.AddEdit("x180 y260 w110 h30 Center +Number", "60")
global truedownslamtext := settings.AddText("x30 y260 h30 0x200", "Wait For Jump :")

tabs.UseTab(8)
settings.AddText("x0 y50 w700 Center +BackgroundTrans", "EMOTE BACKDASH")
settings.AddText("x30 y140 h30 0x200", "EmoteBC Hotkey :")

global emotebcmacro := settings.AddCheckBox("x30 y100", "Solitude")
global emotebchk := settings.AddHotkey("x180 y140 w110 Center", "t")

tabs.UseTab(9)
settings.AddText("x0 y50 w700 Center +BackgroundTrans", "FUN")
settings.AddText("x30 y140 h30 0x200", "Super Jump Hotkey :")
settings.AddText("x30 y180 h30 0x200", "Dash :")
settings.AddText("x30 y220 h30 0x200", "Tab Mode :")

global superjumpmacro := settings.AddCheckBox("x30 y100", "Super Jump")
global superjumphk := settings.AddHotkey("x180 y140 w110 Center", "z")
global superjumpdash := settings.AddDropDownList("x180 y180 w110 Choose1", ["Right", "Left"])
global tabmode := settings.AddDropDownList("x180 y220 w110 Choose2", ["On", "Off"])

tabs.UseTab()

savingbtn := settings.AddText("x10 y462 w140 h30 Center 0x200 Border Backgroundf4fd7a", "Press If Unsaved")
about := settings.AddText("x10 y430 w140 h30 Center 0x200 Border Backgroundabeafa", "About")
exitbtn := settings.AddText("x550 y430 w140 h30 Center 0x200 Border Backgroundfd7a7a", "Exit")
hidebtn := settings.AddText("x550 y462 w140 h30 Center 0x200 Border Background87ff87", "Hide Menu")
global svg := settings.AddText("x250 y450 w200 h27 Center 0x200 BackgroundTrans", "Made By Sedz")
svg.SetFont("c080808 s15 bold", "Segoe UI")

tabs.OnEvent("Change", focused)
about.OnEvent("Click", infoo)
savingbtn.OnEvent("Click", savesettings)
exitbtn.OnEvent("Click", exitmacro)
hidebtn.OnEvent("Click", hidemenu)


robloxsensivity.OnEvent("Change", savesettings)
hotkeypanel.OnEvent("Click", savesettings)
robloxcheck.OnEvent("Click", savesettings)
cordcheck.OnEvent("Click", savesettings)
exithk.OnEvent("Change", savesettings)
togglehk.OnEvent("Change", savesettings)
menutogglehk.OnEvent("Change", savesettings)
exithk.OnEvent("Change", focused)
togglehk.OnEvent("Change", focused)
menutogglehk.OnEvent("Change", focused)
hkmenuopacity.OnEvent("Change", hkopacity)
hkmenuopacity.OnEvent("Change", savesettings)

lthmacro.OnEvent("Click", savesettings)
lthhk.OnEvent("Change", focused)
lthhk.OnEvent("Change", savesettings)
lthshiftlock.OnEvent("Change", savesettings)
lthsleep.OnEvent("Change", savesettings)
lthdashstyle.OnEvent("Change", savesettings)
lthsleep2.OnEvent("Change", savesettings)

lthv2macro.OnEvent("Click", savesettings)
lthv2hk.OnEvent("Change", focused)
lthv2hk.OnEvent("Change", savesettings)
lthv2sleep.OnEvent("Change", savesettings)
lthv2jump.OnEvent("Change", savesettings)
lthv2dashstyle.OnEvent("Change", savesettings)
lthv2sleep2.OnEvent("Change", savesettings)

twistv1macro.OnEvent("Click", savesettings)
twistv1hk.OnEvent("Change", focused)
twistv1hk.OnEvent("Change", savesettings)
twistv1dashstyle.OnEvent("Change", savesettings)
twistv1sleep.OnEvent("Change", savesettings)
twistv1sleep2.OnEvent("Change", savesettings)
twistv1sleep3.OnEvent("Change", savesettings)




twistv2macro.OnEvent("Click", savesettings)
twistv2hk.OnEvent("Change", savesettings)
twistv2hk.OnEvent("Change", focused)
twistv2first.OnEvent("Change", savesettings)
twistv2sleep.OnEvent("Change", savesettings)
twistv2second.OnEvent("Change", savesettings)

sidefrontdashmacro.OnEvent("Click", savesettings)
sidefrontdashhk.OnEvent("Change", savesettings)
sidefrontdashhk.OnEvent("Change", focused)
sidedash.OnEvent("Change", savesettings)

backdash1macro.OnEvent("Click", savesettings)
backdash1hk.OnEvent("Change", savesettings)
backdash1hk.OnEvent("Change", focused)
backdash2macro.OnEvent("Click", savesettings)
backdash2hk.OnEvent("Change", savesettings)
backdash2hk.OnEvent("Change", focused)
backdash3macro.OnEvent("Click", savesettings)
backdash3hk.OnEvent("Change", savesettings)
backdash3hk.OnEvent("Change", focused)
backdash4macro.OnEvent("Click", savesettings)
backdash4hk.OnEvent("Change", savesettings)
backdash4hk.OnEvent("Change", focused)

solitudemacro.OnEvent("Click", savesettings)
solitudehk.OnEvent("Change", focused)
solitudehk.OnEvent("Change", savesettings)
solitudesleep1.OnEvent("Change", savesettings)
solitudesleep2.OnEvent("Change", savesettings)
solitudesleep3.OnEvent("Change", savesettings)
solitudedashstyle.OnEvent("Change", savesettings)
solitudesleep4.OnEvent("Change", savesettings)

truedownslamhk.OnEvent("Change", focused)
truedownslamhk.OnEvent("Change", savesettings)
truedownslammacro.OnEvent("Click", savesettings)
truedownslamsleep.OnEvent("Change", savesettings)
truedownslamsleep2.OnEvent("Change", savesettings)
hitxjumpmode.OnEvent("Change", savesettings)

emotebchk.OnEvent("Change", focused)
emotebchk.OnEvent("Change", savesettings)
emotebcmacro.OnEvent("Click", savesettings)

superjumphk.OnEvent("Change", focused)
superjumphk.OnEvent("Change", savesettings)
superjumpmacro.OnEvent("Click", savesettings)
superjumpdash.OnEvent("Change", savesettings)



global warnings := panel.AddText("x0 y10 w130 h100 Center ", "")
warnings.SetFont("s7.1 bold cf72821", "Verdana")

statuspanel.SetFont("s7.8 bold c00e1ff", "Segoe UI")
global statustext := statuspanel.Add("Text", "x0 y0 w130 h20 Center 0x200 +BackgroundTrans", "MACRO ENABLED")

panel.SetFont("s7 bold ca7a4a4", "Verdana")
global text1 := panel.Add("Text", "x10 y180 w280 BackgroundTrans", "Exit >> " "[" exithk.Text "]")
global text2 := panel.Add("Text", "x10 y200 w284 BackgroundTrans", "On - Off >> " "[" togglehk.Text "]")
panel.SetFont("s7 norm c00FF00", "Verdana")
global text3 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text4 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text5 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text6 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text7 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text8 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text9 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text10 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text11 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text12 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text13 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text14 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")
global text15 := panel.Add("Text", "x10  y5  w280 BackgroundTrans", "")


global macros := [
    { hotkey: exithk,                 function: exitmacro,              roblox: false },
    { hotkey: togglehk,               function: ToggleMacros,           roblox: false },
    { hotkey: menutogglehk,           function: menutoggle,             roblox: false },
    { hotkey: lthhk,                  function: lethalv1,               roblox: true },
    { hotkey: lthv2hk,                function: lethalv2,               roblox: true },
    { hotkey: twistv1hk,              function: twistv1,                roblox: true },
    { hotkey: twistv2hk,              function: twistv2,                roblox: true },
    { hotkey: sidefrontdashhk,        function: sidefrontdash,          roblox: true },
    { hotkey: backdash1hk,            function: backdash1,              roblox: true },
    { hotkey: backdash2hk,            function: backdash2,              roblox: true },
    { hotkey: backdash3hk,            function: backdash3,              roblox: true },
    { hotkey: backdash4hk,            function: backdash4,              roblox: true },
    { hotkey: solitudehk,             function: solitude,               roblox: true },
    { hotkey: truedownslamhk,         function: truedownslam,           roblox: true },
    { hotkey: emotebchk,              function: emotebc,                roblox: true },
    { hotkey: superjumphk,            function: superjumpp,             roblox: true }
]




paneltext()
{
    panel.SetFont("s7 norm c00FF00", "Verdana")
    currentY := 5
    spacing  := 15
    for ctrl in [warnings, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13, text14, text15]
    {
        ctrl.Value := ""
    }
    if (lthmacro.Value)
    {
        text3.Value := "Lethal V1 >> [" lthhk.Value "]"
        text3.Move(10, currentY)
        currentY += spacing
    }
    if (lthv2macro.Value)
    {
        text4.Value := "Lethal V2 >> [" lthv2hk.Value "]"
        text4.Move(10, currentY)
        currentY += spacing
    }
    if (twistv1macro.Value)
    {
        text5.Value := "Twist V1 >> [" twistv1hk.Value "]"
        text5.Move(10, currentY)
        currentY += spacing
    }
    if (twistv2macro.Value)
    {
        text6.Value := "Twist V2 >> [" twistv2hk.Value "]"
        text6.Move(10, currentY)
        currentY += spacing
    }
    if (sidefrontdashmacro.Value)
    {
        text7.Value := "Side Front Dash >> [" sidefrontdashhk.Value "]"
        text7.Move(10, currentY)
        currentY += spacing
    }
    if (backdash1macro.Value)
    {
        text8.Value := "Backdash + 1 >> [" backdash1hk.Value "]"
        text8.Move(10, currentY)
        currentY += spacing
    }
    if (backdash2macro.Value)
    {
        text9.Value := "Backdash + 2 >> [" backdash2hk.Value "]"
        text9.Move(10, currentY)
        currentY += spacing
    }
    if (backdash3macro.Value)
    {
        text10.Value := "Backdash + 3 >> [" backdash3hk.Value "]"
        text10.Move(10, currentY)
        currentY += spacing
    }
    if (backdash4macro.Value)
    {
        text11.Value := "Backdash + 4 >> [" backdash4hk.Value "]"
        text11.Move(10, currentY)
        currentY += spacing
    }
    if (solitudemacro.Value)
    {
        text12.Value := "Solitude >> [" solitudehk.Value "]"
        text12.Move(10, currentY)
        currentY += spacing
    }
    if (truedownslammacro.Value)
    {
        text13.Value := "True Downslam >> [" truedownslamhk.Value "]"
        text13.Move(10, currentY)
        currentY += spacing
    }
    if (emotebcmacro.Value)
    {
        text14.Value := "Emote BC >> [" emotebchk.Value "]"
        text14.Move(10, currentY)
        currentY += spacing
    }
    if (superjumpmacro.Value)
    {
        text15.Value := "Super Jump >> [" superjumphk.Value "]"
        text15.Move(10, currentY)
        currentY += spacing
    }
    if (!sidefrontdashmacro.Value && !twistv2macro.Value && !twistv1macro.Value && !lthv2macro.Value && !lthmacro.Value && !backdash1macro.Value && !backdash2macro.Value && !backdash3macro.Value && !backdash4macro.Value && !truedownslammacro.Value && !solitudemacro.Value && !emotebcmacro.Value && !superjumpmacro.Value)
    {
        warnings.Value := "NO MACRO SELECTED`nJAHARİA V1`nMADE`nBY`nSEDZ"
    }
    text1.Value :=  "Exit >> " "[" exithk.Value "]"
    text2.Value := "On - Off >> " "[" togglehk.Value "]"
}

global registeredGlobalHotkeys := []
global registeredRobloxHotkeys := []

ApplyHotkeys(*) {
    global registeredGlobalHotkeys
    global registeredRobloxHotkeys
    global macros

    HotIf()
    for key in registeredGlobalHotkeys {
        try Hotkey(key, "Off")
    }
    registeredGlobalHotkeys := []

    HotIfWinActive("ahk_exe RobloxPlayerBeta.exe")
    for key in registeredRobloxHotkeys {
        try Hotkey(key, "Off")
    }
    registeredRobloxHotkeys := []
    HotIf()

    ; Aynı tuşa sahip makroları grupla
    globalMap := Map()
    robloxMap := Map()

    for macro in macros {
        key := macro.hotkey.Value
        if (key = "")
            continue

        if (macro.roblox) {
            if !robloxMap.Has(key)
                robloxMap[key] := []
            robloxMap[key].Push(macro.function)
        } else {
            if !globalMap.Has(key)
                globalMap[key] := []
            globalMap[key].Push(macro.function)
        }
    }

    HotIf()
    for key, funcs in globalMap {
        RegisterGlobalHotkey(key, MakeDispatcher(funcs))
    }

    HotIfWinActive("ahk_exe RobloxPlayerBeta.exe")
    for key, funcs in robloxMap {
        RegisterRobloxHotkey(key, MakeDispatcher(funcs))
    }
    HotIf()
}

MakeDispatcher(funcs) {
    return (*) => RunAllMacros(funcs)
}

RunAllMacros(funcs) {
    for f in funcs
        f.Call()
}

RegisterGlobalHotkey(key, function) {
    global registeredGlobalHotkeys

    if (key = "")
        return

    key := "~" . key
    try {
        Hotkey(key, function, "On")
        registeredGlobalHotkeys.Push(key)
    }
}

RegisterRobloxHotkey(key, function) {
    global registeredRobloxHotkeys

    if (key = "")
        return

    key := "~" . key
    try {
        Hotkey(key, function, "On")
        registeredRobloxHotkeys.Push(key)
    }
}

exitmacro(*)
{
    ExitApp()
}

ToggleMacros(*)
{
    global macrosEnabled
    macrosEnabled := !macrosEnabled
    st()
}

menutoggle(*)
{
    if DllCall("IsWindowVisible", "Ptr", settings.Hwnd)
    {
        settings.Hide()
        return
    }

    info.Hide()
    settings.Show("w700 h500")
}

hkopacity(*)
{
    try
    {
        WinSetTransparent(Integer(hkmenuopacity.Value), panel.Hwnd)
        WinSetTransparent(Integer(hkmenuopacity.Value), statuspanel.Hwnd)
    }
    catch
    {
        hkmenuopacity.Value := 90
    }
    
}

hidemenu(*)
{
    settings.Hide()
}

infoo(*) {
    settings.Hide()
    info.Show("w400 h400")
}

ytt(*) {
    Run("https://www.youtube.com/@YTsedz")
}

backk(*) {
    info.Hide()
    settings.Show("w700 h500")
    focused()
}

dcc(*) {
    Run("https://discordapp.com/users/806619890835914833")
}

calculator(*) {
    val := robloxsensivity.Value
    sens := IsNumber(val) && Float(val) > 0 ? Float(val) : 0.4

    global r1 := 360, r2 := -360, r3 := -100, r4 := 200, r5 := -110, r6 := 350, r7 := -101.2, r8 := -102.4, r9 := 36, r10 := 38.8, r11 := -12, r12 := 36, r13 := -17.6
    global L1 := r1 / sens
    global L2 := r2 / sens
    global T1 := r3 / sens
    global T2 := r4 / sens
    global T3 := r5 / sens
    global L3 := r6 / sens
    global L4 := r7 / sens
    global S1 := r8 / sens
    global S2 := r9 / sens
    global S3 := r10 / sens
    global S4 := r11 / sens
    global S5 := r12 / sens
    global S6 := r13 / sens

    global ref := 720
    global ref2 := ref / sens
    global degree1 := (Integer(twistv2first.Value)/360) * ref2
    global degree2 := (Integer(twistv2second.Value)/360) * ref2
}

savesettings(*) {
    SetTimer(robloxcheckk, 0)
    SetTimer(coordcheck, 0)
    calculator()
    ApplyHotkeys()
    saving()
    paneltext()
    cordcheck.Visible := false
    if (twistv1dashstyle.Text = "1")
    {
        twistv1text.Visible := false
        twistv1sleep3.Visible := false
        twistv1sleep.Enabled := true
        twistv1sleep2.Enabled := true
    }
    else if (twistv1dashstyle.Text = "2")
    {
        twistv1text.Visible := true
        twistv1sleep3.Visible := true
        twistv1sleep.Enabled := false
        twistv1sleep2.Enabled := false
    }
    if (lthv2dashstyle.Text = "1")
    {
        lthv2text.Visible := false
        lthv2sleep2.Visible := false
        lthv2sleep.Enabled := true
    }
    else if (lthv2dashstyle.Text = "2")
    {
        lthv2text.Visible := true
        lthv2sleep2.Visible := true
        lthv2sleep.Enabled := false
    }
    if (hitxjumpmode.Text = "On")
    {
        truedownslamsleep.Enabled := false
        truedownslamtext.Visible := true
        truedownslamsleep2.Visible := true
    }
    else if (hitxjumpmode.Text = "Off")
    {
        truedownslamtext.Visible := false
        truedownslamsleep2.Visible := false
        truedownslamsleep.Enabled := true
    }
    if (solitudedashstyle.Text = "1")
    {
        solitext.Visible := false
        solitudesleep4.Visible := false
        solitudesleep3.Enabled := true
    }
    else if (solitudedashstyle.Text = "2")
    {
        solitext.Visible := true
        solitudesleep4.Visible := true
        solitudesleep3.Enabled := false
    }
    if (lthshiftlock.Text = "Shiftlock")
    {
        lthtext2.Visible := true
        lthdashstyle.Visible := true
        if (lthdashstyle.Text = "1")
        {
            lthsleep2.Visible := false
            lthtext.Visible := false
            lthsleep.Enabled := true
        }
        else if (lthdashstyle.Text = "2")
        {
            lthsleep2.Visible := true
            lthtext.Visible := true
            lthsleep.Enabled := false
        }
    }
    else if (lthshiftlock.Text = "Unshiftlock")
    {
        lthsleep2.Visible := false
        lthtext.Visible := false
        lthdashstyle.Visible := false
        lthtext2.Visible := false
        lthsleep.Enabled := false
    }

    if (!hotkeypanel.Value) 
    {
        panel.Hide()
        statuspanel.Hide()
        cordcheck.Visible := false
        return
    }
    if (robloxcheck.Value) 
    {
        cordcheck.Visible := true
        if (cordcheck.Value) 
        {
            SetTimer(coordcheck, 100)
        } 
        else 
        {
            SetTimer(robloxcheckk, 100)
        }
    } 
    else 
    {
        cordcheck.Visible := false
        panel.Show("w130 h220 x0 y810 NoActivate")
        statuspanel.Show("w130 h20 x0 y787 NoActivate")
    }
}

robloxcheckk(*) {
    if (robloxcheck.Value && !cordcheck.Value) {
        if (WinActive("ahk_exe RobloxPlayerBeta.exe")) {
            if (hotkeypanel.Value) {
                panel.Show("w130 h220 x0 y810 NoActivate")
                statuspanel.Show("w130 h20 x0 y787 NoActivate")
            }
        } else {
            panel.Hide()
            statuspanel.Hide()
        }
    }
}

coordcheck(*) {
    if (robloxcheck.Value = 1 && cordcheck.Value) {
        if (WinActive("ahk_exe RobloxPlayerBeta.exe")) {
            if (hotkeypanel.Value) {
                WinGetPos(&winX, &winY, &winW, &winH, "ahk_exe RobloxPlayerBeta.exe")
                guiX := winX + 10
                guiY := winY + winH - 230
                panel.Show("w140 h220 x" guiX " y" guiY " NoActivate")
                guiX := winX + 10
                guiY := winY + winH - 252
                statuspanel.Show("w140 h20 x" guiX " y" guiY " NoActivate")
            }
        } else {
            panel.Hide()
            statuspanel.Hide()
        }
    }
}

saving(*) {
    svg.Value := "SAVING..."
    SetTimer(() => svg.Value := "SAVED <3", -1000)
    SetTimer(() => svg.Value := "Made By Sedz", -4000)
}

focused(*)
{
    SendMessage(0x0128, (1 | (1 << 16)), 0, tabs.Hwnd)
    ControlFocus(settings.Hwnd)
}

st(*)
{
    if (macrosEnabled)
    {
        statustext.SetFont("s7.8 bold c00e1ff", "Segoe UI")
        statustext.Value := "MACRO ENABLED"
    }
    else
    {
        statustext.SetFont("s7.8 bold cff0000", "Segoe UI")
        statustext.Value := "MACRO DISABLED"
    }
}


preciseSleep(ms) {
    static freq := 0
    if (!freq)
        DllCall("QueryPerformanceFrequency", "Int64*", &freq)
    
    DllCall("QueryPerformanceCounter", "Int64*", &start := 0)
    target := start + (ms * freq / 1000)
    
    current := 0
    while (current < target)
        DllCall("QueryPerformanceCounter", "Int64*", &current)
}


lethalv1(*) {
    if (!lthmacro.Value || !macrosEnabled)
    {
        return
    }
    if (lthshiftlock.Text = "Shiftlock")
    {
        if(lthjump.Text = "On")
        {
            if (lthdashstyle.Text = "1")
            {
                Send("{q}")
                Send("{Space Down}")
                PreciseSleep(Integer(lthsleep.Value))
                DllCall("mouse_event", "UInt", 1, "Int", L1, "Int", 0)
                Send("{Space Up}")
                return
            }
            if (lthdashstyle.Text = "2")
            {
                Send("{q}")
                Send("{Space Down}")
                PreciseSleep(Integer(lthsleep2.Value))
                loop 4
                {
                    DllCall("mouse_event", "UInt", 1, "Int", L4, "Int", 0)
                    PreciseSleep(15)
                }
                Send("{Space Up}")
                return
            }
        }
        if(lthjump.Text = "Off")
        {
            if (lthdashstyle.Text = "1")
            {
                Send("{q}")
                PreciseSleep(Integer(lthsleep.Value))
                DllCall("mouse_event", "UInt", 1, "Int", L1, "Int", 0)
                return
            }
            if (lthdashstyle.Text = "2")
            {
                Send("{q}")
                PreciseSleep(Integer(lthsleep2.Value))
                loop 4
                {
                    DllCall("mouse_event", "UInt", 1, "Int", L4, "Int", 0)
                    PreciseSleep(15)
                }
                return
            }
        }
    }
    else
    {
        if(lthjump.Text = "On")
        {
            Send("{q}")
            Send("{Space Down}")
            PreciseSleep(Integer(lthsleep.Value))
            Send("{Shift}")
            Send("{Space Up}")
        }
        if(lthjump.Text = "Off")
        {
            Send("{q}")
            PreciseSleep(Integer(lthsleep.Value))
            Send("{Shift}")
        }
    }
}

lethalv2(*)
{
    if (!lthv2macro.Value || !macrosEnabled)
    {
        return
    }
    if (lthv2macro.Value && lthv2jump.Text = "Off" && lthv2dashstyle.Text = "1")
    {
        DllCall("mouse_event", "UInt", 1, "Int", L1, "Int", 0)
        Send("{q}")
        PreciseSleep(Integer(lthv2sleep.Value))
        DllCall("mouse_event", "UInt", 1, "Int", L3, "Int", 0)
        return
    }
    if (lthv2macro.Value && lthv2jump.Text = "On" && lthv2dashstyle.Text = "1")
    {
        DllCall("mouse_event", "UInt", 1, "Int", L1, "Int", 0)
        Send("{Space Down}")
        Send("{q}")
        PreciseSleep(Integer(lthv2sleep.Value))
        DllCall("mouse_event", "UInt", 1, "Int", L3, "Int", 0)
        Send("{Space Up}")
        return
    }
    if (lthv2macro.Value && lthv2jump.Text = "On" && lthv2dashstyle.Text = "2")
    {
        Send("{Space Down}")
        Send("{q}")
        PreciseSleep(30)
        Loop 10
        {
            DllCall("mouse_event", "UInt", 1, "Int", S2, "Int", 0)
            PreciseSleep(8)
        }
        PreciseSleep(70)
        Loop 10
        {
            DllCall("mouse_event", "UInt", 1, "Int", S3, "Int", 0)
            PreciseSleep(5)
        }
        Send("{Space Up}")
        return
    }
    if (lthv2macro.Value && lthv2jump.Text = "Off" && lthv2dashstyle.Text = "2")
    {
        Send("{q}")
        PreciseSleep(30)
        Loop 10
        {
            DllCall("mouse_event", "UInt", 1, "Int", S2, "Int", 0)
            PreciseSleep(8)
        }
        PreciseSleep(70)
        Loop 10
        {
            DllCall("mouse_event", "UInt", 1, "Int", S3, "Int", 0)
            PreciseSleep(5)
        }
        return
    }
    
}

twistv1(*)
{
    if (!twistv1macro.Value || !macrosEnabled)
    {
        return
    }
    if (twistv1macro.Value && twistv1dashstyle.Text = "1")
    {
        DllCall("mouse_event", "UInt", 1, "Int", T1, "Int", 0)
        Send("{q}")
        PreciseSleep(Integer(twistv1sleep.Value))
        DllCall("mouse_event", "UInt", 1, "Int", T2, "Int", 0)
        PreciseSleep(Integer(twistv1sleep2.Value))
        DllCall("mouse_event", "UInt", 1, "Int", T3, "Int", 0)
        return
    }
    if (twistv1macro.Value && twistv1dashstyle.Text = "2")
    {
        Send("{q}")
        PreciseSleep(Integer(twistv1sleep3.Value))
        Loop 15
        {
            DllCall("mouse_event", "UInt", 1, "Int", S4, "Int", 0)
            PreciseSleep(2)
        }
        PreciseSleep(10)
        Loop 10
        {
            DllCall("mouse_event", "UInt", 1, "Int", S5, "Int", 0)
            PreciseSleep(8)
        }
        PreciseSleep(10)
        Loop 10
        {
            DllCall("mouse_event", "UInt", 1, "Int", S6, "Int", 0)
            PreciseSleep(3)
        }
        return
    }
}

twistv2(*)
{
    if (!twistv2macro.Value || !macrosEnabled)
    {
        return
    }
    if (twistv2macro.Value)
    {
        DllCall("mouse_event", "UInt", 1, "Int", degree1, "Int", 0)
        Send("{q}")
        PreciseSleep(Integer(twistv2sleep.Value))
        DllCall("mouse_event", "UInt", 1, "Int", degree2, "Int", 0)
    }
}

sidefrontdash(*)
{
    if (!sidefrontdashmacro.Value || !macrosEnabled)
    {
        return
    }
    if (sidefrontdashmacro.Value && sidedash.Text = "Right")
    {
        Send("{q}")
        Send("{d Down}")
        PreciseSleep(10)
        Send("{q}")
        Send("{d Up}")
    }
    if (sidefrontdashmacro.Value && sidedash.Text = "Left")
    {
        Send("{q}")
        Send("{a Down}")
        PreciseSleep(10)
        Send("{q}")
        Send("{a Up}")
    }
}

backdash1(*)
{
    if (!backdash1macro.Value || !macrosEnabled)
    {
        return
    }
    if (backdash1macro.Value)
    {
        Send("{1}")
        Send("{s Down}")
        PreciseSleep(5)
        Send("{LButton}")
        PreciseSleep(10)
        Send("{q}")
        Send("{s Up}")
        Send("{1}")
    }
}

backdash2(*)
{
    if (!backdash2macro.Value || !macrosEnabled)
    {
        return
    }
    if (backdash2macro.Value)
    {
        Send("{2}")
        Send("{s Down}")
        PreciseSleep(5)
        Send("{LButton}")
        PreciseSleep(10)
        Send("{q}")
        Send("{s Up}")
        Send("{2}")
    }
}

backdash3(*)
{
    if (!backdash3macro.Value || !macrosEnabled)
    {
        return
    }
    if (backdash3macro.Value)
    {
        Send("{3}")
        Send("{s Down}")
        PreciseSleep(5)
        Send("{LButton}")
        PreciseSleep(10)
        Send("{q}")
        Send("{s Up}")
        Send("{3}")
    }
}

backdash4(*)
{
    if (!backdash4macro.Value || !macrosEnabled)
    {
        return
    }
    if (backdash4macro.Value)
    {
        Send("{4}")
        Send("{s Down}")
        PreciseSleep(5)
        Send("{LButton}")
        PreciseSleep(10)
        Send("{q}")
        Send("{s Up}")
        Send("{4}")
    }
}

solitude(*)
{
    if (!solitudemacro.Value || !macrosEnabled)
    {
        return
    }
    if(solitudemacro.Value && solitudedashstyle.Text = "1")
    {
        PreciseSleep(120)
        Send("{LButton}")
        PreciseSleep(110)
        Send("{Space Down}")
        PreciseSleep(Integer(solitudesleep1.Value))
        Send("{LButton}")
        PreciseSleep(Integer(solitudesleep2.Value))
        Send("{Space Up}")
        Send("{q}")
        PreciseSleep(Integer(solitudesleep3.Value))
        DllCall("mouse_event", "UInt", 1, "Int", L2, "Int", 0)
    }
    if(solitudemacro.Value && solitudedashstyle.Text = "2")
    {
        PreciseSleep(120)
        Send("{LButton}")
        PreciseSleep(100)
        Send("{Space Down}")
        PreciseSleep(Integer(solitudesleep1.Value))
        Send("{LButton}")
        PreciseSleep(Integer(solitudesleep2.Value))
        Send("{Space Up}")
        Send("{q}")
        PreciseSleep(Integer(solitudesleep4.Value))
        loop 4
        {
            DllCall("mouse_event", "UInt", 1, "Int", S1, "Int", 0)
            PreciseSleep(20)
        }
    }
    
    
}

truedownslam(*)
{
    if (!truedownslammacro.Value || !macrosEnabled)
    {
        return
    }
    if (truedownslammacro.Value && hitxjumpmode.Text = "Off")
    {
        PreciseSleep(200)
        Send("{LButton Down}")
        PreciseSleep(Integer(truedownslamsleep.Value))
        Send("{Space Down}")
        PreciseSleep(700)
        Send("{Space Up}")
        Send("{LButton Up}")
        return
    }
    if (truedownslammacro.Value && hitxjumpmode.Text = "On")
    {
        Click
        PreciseSleep(Integer(truedownslamsleep2.Value))
        Send("{Space Down}")
        PreciseSleep(50)
        Send("{Space Up}")
        return
    }
}

emotebc(*)
{
    if (!emotebcmacro.Value || !macrosEnabled)
    {
        return
    }
    if (emotebcmacro.Value)
    {
        Send("{Shift}")
        PreciseSleep(20)
        MouseMove(1124, 542)
        MouseMove(1122, 543)
        MouseMove(1124, 543)
        PreciseSleep(10)
        Send("{b Down}")
        Send("{b Up}")
        PreciseSleep(40)

        Click("Down Left")
        Click("Up Left")
        PreciseSleep(20)
        Send("{s Down}")
        PreciseSleep(10)
        Send("{q Down}")
        Send("{q Up}")
        Send("{s Up}")
        PreciseSleep(20)
        Click("Down Left")
        Click("Up Left")
        PreciseSleep(80)
        Send("{Shift}")
    }
    
}

superjumpp(*)
{
    if (!superjumpmacro.Value || !macrosEnabled)
    {
        return
    }
    if (superjumpmacro.Value && superjumpdash.Text = "Right" && tabmode.Text = "Off")
    {
        Send("{d Down}")
        PreciseSleep(3)
        Send("{q}")

        Send("{Space Down}")
        PreciseSleep(10)
        Send("{Space Up}")
        Send("{d Up}")
        return
    }
    if (superjumpmacro.Value && superjumpdash.Text = "Left" && tabmode.Text = "Off")
    {
        Send("{a Down}")
        PreciseSleep(3)
        Send("{q}")

        Send("{Space Down}")
        PreciseSleep(10)
        Send("{Space Up}")
        Send("{a Up}")
        return
    }
    if (superjumpmacro.Value && superjumpdash.Text = "Right" && tabmode.Text = "On")
    {
        MouseMove(500, 3)
        MouseMove(501, 3)
        MouseMove(502, 3)
        PreciseSleep(40)
        Send("{d Down}")
        PreciseSleep(3)
        Send("{q}")
        
        Send("{Space Down}")
        PreciseSleep(50)
        Click("Left Down")
        PreciseSleep(800)
        Click("Left Up")
        Send("{Space Up}")
        Send("{d Up}")
        return
    }
    if (superjumpmacro.Value && superjumpdash.Text = "Left" && tabmode.Text = "On")
    {
        MouseMove(500, 3)
        MouseMove(501, 3)
        MouseMove(502, 3)
        PreciseSleep(40)
        Send("{a Down}")
        PreciseSleep(3)
        Send("{q}")
        
        Send("{Space Down}")
        PreciseSleep(50)
        Click("Left Down")
        PreciseSleep(800)
        Click("Left Up")
        Send("{Space Up}")
        Send("{a Up}")
        return
    }
}
settings.Show("w700 h500")
savesettings()
focused()
