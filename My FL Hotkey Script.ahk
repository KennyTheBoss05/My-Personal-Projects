;#Persistent
;Thread, interrupt, 0
RIGHT_EDGE      := A_ScreenWidth - 2
TOP_EDGE        := 20
LEFT_EDGE      := 20
BOTTOM_EDGE      := A_ScreenHeight - 2
global stat := [0 , 0 , 0 , 0]
global XPOS , YPOS

#Persistent
SetTimer, Mixer, 50
SetTimer, PianoRoll, 50
SetTimer, Playlist, 50
SetTimer, ResetStat, 50
SetTimer, Check, 50
return

;Special PLAY -> Shift + Space
;+Space::
;global Te
;MouseGetPos CurX, CurY
;SetTimer, Mixer, Off
;SetTimer, PianoRoll, Off
;SetTimer, Playlist, Off
;IniRead , playx , FLsettings.ini , Main , playx
;IniRead , playy, FLsettings.ini , Main , playy
;IniRead , pausex , FLsettings.ini , Main , pausex
;IniRead , pausey , FLsettings.ini , Main , pausey
;MouseClick , left , 200, -10
;counter++
;Te := Mod(counter , 2)
;if(Te==1)
;{
;MouseClick , left , %playx%, %playy%
;Goto gg
;}
;if(Te==0)
;{
;MouseClick , left , %pausex%, %pausey%
;Goto gg
;}
;gg:
;MouseMove %CurX%, %CurY%, 0
;SetTimer, Mixer, On
;SetTimer, PianoRoll, On
;SetTimer, Playlist, On
;return

;Get Point : `
`::
WinGetPos, X, Y, W, H
MouseGetPos, xpos, ypos 
ez := W/xpos
pz := H/ypos
MsgBox,
( 
The cursor is at X (%xpos%) , Y (%ypos%).
Width , Height : %A_ScreenWidth% , %A_ScreenHeight%
)
return

;Exit the AHK -> Shift + Escape
+Esc::goto ExitThisProgramQuestion

ExitThisProgramQuestion:
    MsgBox, 4, , Are we exiting? 
    IfMsgBox, No
        return
    ExitApp
return

;Suspend the AHK -> Ctrl + Escape
^Esc::
;Suspend Permit
Pause Toggle
return

;Paste Serum Code -> PgUp
pgup::
MouseClick, left
SendInput {Raw}SBFG-HKYQ-GDNA-DDSM-NODO
Send {enter}
Send {enter}
return

#IfWinActive ahk_class TFruityLoopsMainForm

;Start setup -> Shift + Enter
+Enter::
MsgBox,1 , ,Welcome to the FL Studio AHK Setup `n `nClick on OK to continue the Setup`nClick on Cancel to Abort the Setup
IfMsgBox OK
{ 
end=0
While (end < 5)
{
if(end==0)
{
MsgBox,,Step 1 ,Right Click on Tools
}
if(end==1)
{
MsgBox,,Step 2 ,Right Click on Play Button
}
if(end==2)
{
MsgBox,,Step 3 ,Right Click on Stop Button
}
if(end==3)
{
InputBox , gen ,Step 4 ,Enter upto 10 most used Generator Plugins as shown in the plugin picker seperated by a comma 
}
if(end==4)
{
InputBox , eff ,Step 5 ,Enter upto 10 most used Effect Plugins as shown in the plugin picker seperated by a comma
}
if(end<3)
{
KeyWait,RButton , D
}
if(end==0)
{
MouseGetPos, toolx, tooly
}
if(end==1)
{
MouseGetPos, playx, playy
}
if(end==2)
{
MouseGetPos, pausex, pausey
}
if(end==3)
{
}
if(end==4)
{
}
end++
}
Iniwrite , %toolx% , FLsettings.ini , Main , toolx
Iniwrite , %tooly% , FLsettings.ini , Main , tooly
Iniwrite , %playx% , FLsettings.ini , Main , playx
Iniwrite , %playy%, FLsettings.ini , Main , playy
Iniwrite , %pausex% , FLsettings.ini , Main , pausex
Iniwrite , %pausey% , FLsettings.ini , Main , pausey
;genarr := StrSplit(gen , ",")
;effarr := StrSplit(eff , ",")
Iniwrite , %gen% , FLsettings.ini , Main , gen
Iniwrite , %eff% , FLsettings.ini , Main , eff
MsgBox,,Finish ,Thankyou for completing the FL Studio AHK Setup `n`nCreated by Kevin Timothy Muller <3
}
else
{
MsgBox , Setup Aborted
}
return

Mixer:
MouseGetPos, xpos, ypos
if(ypos>BOTTOM_EDGE && stat[1]==0)
{
Send {f9}
stat[1]:=1
Sleep 250
}
return

PianoRoll:
MouseGetPos, xpos, ypos
if(xpos>RIGHT_EDGE && stat[2]==0)
{
Send {f7}
stat[2]:=1
Sleep 250
}
return

Playlist:
MouseGetPos, xpos, ypos
if(ypos<TOP_EDGE && stat[3]==0)
{
Send {f5}
stat[3]:=1
Sleep 250
}
return

ResetStat:
MouseGetPos, XPOS, YPOS
If(XPOS<RIGHT_EDGE && YPOS<BOTTOM_EDGE && YPOS>TOP_EDGE)
{
stat[1]:=0
stat[2]:=0
stat[3]:=0
}
return

Check:
If WinActive("ahk_class TFruityLoopsMainForm")
{
SetTimer, Mixer, On
SetTimer, PianoRoll, On
SetTimer, Playlist, On
}
Else
{
SetTimer, Mixer, Off
SetTimer, PianoRoll, Off
SetTimer, Playlist, Off
}
Return

Tools()
{
global CurX , CurY
WinGetPos, X, Y, W, H
;MsgBox, %X%`,%Y% ,%W%, %H%
MouseGetPos CurX, CurY
IniRead, toolx, FLsettings.ini , Main , toolx
IniRead, tooly, FLsettings.ini , Main , tooly
MouseClick, left, %toolx%, %tooly%
Send {up}
Send {up}
Send {right}
return
}

;Create automate from last touched -> A
a::
Tools()
Send a
MouseMove %CurX%, %CurY%, 0
return

;Copy VST Value -> Shift + C
+c::
Tools()
Send c
MouseMove %CurX%, %CurY%, 0
return

;Paste VST Value -> Shift + V
+v::
Tools()
Send v
MouseMove %CurX%, %CurY%, 0
return

;Type in VST Value -> Shift + X
+x::
Tools()
Send t
MouseMove %CurX%, %CurY%, 0
return

;Link VST Knob to Controller -> Shift + A
+a::
Tools()
Send l
MouseMove %CurX%, %CurY%, 0
return


;Init song from current position -> Shift + D
+d::
Tools()
Send i
MouseMove %CurX%, %CurY%, 0
return

;New Pattern -> Q
q::
Send {f4}
Send {enter}
return

;Maximize Selected -> CapsLock
CapsLock::
Send {enter}
return

;Delete Selected -> D
d::
Send {Del}
return

;Brush Tool -> X
x::
Send b
return

;Mute Tool -> Z
z::
Send t
return

;Listen Tool -> B
b::
Send y
return

;Cut tool is still C

;Duplicate -> Ctrl + D 
^d::
Send ^b
return

;Toggle between pattern and playlist -> Tab
Tab::
Send l
return 

;Keep Undoing -> Ctrl + Z
^z::
Send ^{z}
return

;Redo -> Ctrl + Alt + Z
^!z::
Send ^!{z}
return

;Strech and Back -> Shift + S
+s::
Send +m
return

;LFO -> Ctrl + B
^b::
Send ^b
Send ^b
Send ^b
Send ^b
Send ^b
Send ^b
Send ^b
return

Effect()
{
global S
MouseGetPos CurX, CurY
WinGetPos, X, Y, W, H
MouseClick, left
Send {enter}
Sleep 1000
SendInput {Raw}%S%
;Sleep 1000
Send {enter}
Send {down}
Send {enter}
MouseMove %A_ScreenWidth%/2, %A_ScreenHeight%/2, 0
return
}

;Load Effect 1 -> 1 + Left Mouse Click
1 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==1)
S = %element%
Effect()
return

;Load Effect 2 -> 2 + Left Mouse Click
2 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==2)
S = %element%
Effect()
return

;Load Effect 3 -> 3 + Left Mouse Click
3 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==3)
S = %element%
Effect()
return

;Load Effect 4 -> 4 + Left Mouse Click
4 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==4)
S = %element%
Effect()
return

;Load Effect 5 -> 5 + Left Mouse Click
5 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==5)
S = %element%
Effect()
return

;Load Effect 6 -> 6 + Left Mouse Click
6 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==6)
S = %element%
Effect()
return

;Load Effect 7 -> 7 + Left Mouse Click
7 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==7)
S = %element%
Effect()
return

;Load Effect 8 -> 8 + Left Mouse Click
8 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==8)
S = %element%
Effect()
return

;Load Effect 9 -> 9 + Left Mouse Click
9 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==9)
S = %element%
Effect()
return

;Load Effect 10 -> 0 + Left Mouse Click
0 & LButton::
IniRead, eff, FLsettings.ini , Main , eff
effarr = []
effarr := StrSplit(eff , ",")
for index , element in effarr
if(index==10)
S = %element%
Effect()
return

;Route like a boss -> Shift + Z
+z::
Send ^l
return 

;Move Notes Up -> X + Scroll Up
x & WheelUp::
Send +{Up}
return

;Move Notes Down -> X + Scroll Down
x & WheelDown::
Send +{Down}
return

;Move Right -> Shift + Scroll Up
+WheelUp::
Send +{Right}
return

;Move Left -> Shift + Scroll Down
+WheelDown::
Send +{Left}
return

;Move Track Up -> Ctrl + Shift + Scroll Up
^+WheelUp::
Send +{WheelUp}
return

;Move Track Down -> Ctrl + Shift + Scroll Down
^+WheelDown::
Send +{WheelDown}
return

;Move Notes Up Oct -> Z + Scroll Up
z & WheelUp::
Send ^{Up}
return 

;Move Notes Down Oct -> Z + Scroll Down
z & WheelDown::
Send ^{Down}
return 

;Get Piano Roll on Plugin -> W
w::
MouseClick, right
Send p
;MouseMove 1303, 468, 0
return

;Recording Mode -> CapsLock + A
;Capslock & a::
;MouseGetPos CurX, CurY
;MouseClick, left, 266, 28
;Send a
;Sleep 500
;MouseClick, left, 148, 259
;Sleep 500
;MouseClick, left, 51, 79
;Sleep 1000
;MouseClick, left, 361, 11
;MouseClick, left, 825, 11
;MouseMove CurX, CurY, 0
;return

;Non - Recording Mode -> CapsLock + S
;Capslock & s::
;MouseGetPos CurX, CurY
;MouseClick, left, 266, 28
;Send a
;Sleep 500
;MouseClick, left, 148, 259
;Sleep 500
;MouseClick, left, 321, 79
;Sleep 1000
;MouseClick, left, 361, 11
;MouseClick, left, 825, 11
;MouseMove CurX, CurY, 0
;return

Generator()
{
global S
WinGetPos, X, Y, W, H
MouseGetPos CurX, CurY
MouseClick, right
Send t
Send i
Send {enter}
Sleep 1000
SendInput %S%
;Sleep 1000
;MouseClick, left, 500, 86
;MouseClick, left
Send {enter}
Send {down}
Send {enter}
MouseMove %A_ScreenWidth%/2, %A_ScreenHeight%/2, 0
return
}

;Load Generator 1 on Track -> 1 + Right Mouse Click
1 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==1)
{
S = %element%
}
Generator()
return

;Load Generator 2 on Track -> 2 + Right Mouse Click
2 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==2)
{
S = %element%
}
Generator()
return

;Load Generator 3 on Track -> 3 + Right Mouse Click
3 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==3)
S = %element%
Generator()
return

;Load Generator 4 on Track -> 4 + Right Mouse Click
4 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==4)
S = %element%
Generator()
return

;Load Generator 5 on Track -> 5 + Right Mouse Click
5 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==5)
S = %element%
Generator()
return

;Load Generator 6 on Track -> 6 + Right Mouse Click
6 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==6)
S = %element%
Generator()
return

;Load Generator 7 on Track -> 7 + Right Mouse Click
7 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==7)
S = %element%
Generator()
return


;Load Generator 8 on Track -> 8 + Right Mouse Click
8 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==8)
S = %element%
Generator()
return

;Load Generator 9 on Track -> 9 + Right Mouse Click
9 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==9)
S = %element%
Generator()
return

;Load Generator 10 on Track -> 0 + Right Mouse Click
0 & RButton::
IniRead, gen, FLsettings.ini , Main , gen
genarr = []
genarr := StrSplit(gen , ",")
for index , element in genarr
if(index==10)
S = %element%
Generator()
return

;Make Instrument Track -> CapsLock + Q
CapsLock & q::
Sleep 1000
MouseGetPos CurX, CurY
MouseClick, right
Send t
Send i
Send {enter}
return

;Make Audio Track -> CapsLock + W
CapsLock & w::
Sleep 1000
MouseGetPos CurX, CurY
MouseClick, right
Send t
Send {right}
Send {down}
Send {down}
Send {right}
;Send {down}
;Send {down}
;Send {down}
;Send {enter}
return

;Record on Edison -> Shift + R
;+r::
;Send {F9}
;MouseClick , left , 345, 609
;Sleep 1000
;MouseClick , left , 118, 602
;Sleep 1000
;Send r
;return

;Empty a spot on Playlist -> CapsLock + E
Capslock & e::
Send ^!{insert}
return

;Add Gen in Patcher -> Shift + Q
+q::
MouseClick, right
Send p
Send {down}
Send {down} 
Send {down} 
Send {enter}
return 

;Add Effect in Patcher -> Shift + W
+w::
MouseClick, right
Send p
Send {down}
Send {down} 
Send {down}
Send {right}
Send {right}
Send {right}  
Send {enter}
return 

;Activate last touched -> Tab + A
Tab & a::
MouseClick, right
Send {down}
Send {down} 
Send {down}
Send {down}
Send {down} 
Send {right}
Send {up}
Send {right}
Send {down}
Send {enter}
return

;Make Major Chord -> Tab + Q
;Tab & q::
;Send, {Ctrl Down}{Click}{Ctrl up}
;Sleep 500
;Send, {Shift Down}{Click}{Shift up}
;;Sleep 500
;Send, {Shift Down}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send, {Shift Up}
;Send, {Ctrl Down}{Click}{Ctrl up}
;;Sleep 500
;Send, {Shift Down}{Click}{Shift up}
;;Sleep 500
;Send, {Shift Down}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send, {Shift Up}
;return

;Make Minor Chord -> Tab + W
;Tab & w::
;Send, {Ctrl Down}{Click}{Ctrl up}
;Sleep 500
;Send, {Shift Down}{Click}{Shift up}
;;Sleep 500
;Send, {Shift Down}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send, {Shift Up}
;Send, {Ctrl Down}{Click}{Ctrl up}
;;Sleep 500
;Send, {Shift Down}{Click}{Shift up}
;;Sleep 500
;Send, {Shift Down}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send {up}
;Send, {Shift Up}
;return

;Consolidate Track -> Capslock + A
Capslock & a::
MouseClick, right
Send o
Send {right}
Send {down}
Send {enter}
Send {enter}
return

;Clone Track -> Capslock + S
Capslock & s::
MouseClick, right
Send o
Send o
Send {enter}
Send {space}
return



