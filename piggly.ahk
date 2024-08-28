; This is an AutoHotKey 2.0 script for the Alcoholics Anonymous 24 Hour International Zoom Meeting that lets you automatically mute any participant upon sharing
; automatically for whatever reason you might not want to hear their audio.   May work with other zoom meetings, but never tested. 
; requirements in Zoom:
; Stop incoming video
; enable gallery view
; hide non-video participants, "SOME_PARTICIPANT is talking…" must be showing at the top of the Zoom Meeting window or audio will unmute if muted.

; Runs with AutoHotKey 2 as it also requires UIA-v2  

#include uia2\Lib\UIA.ahk

istalk := " is talking…"
parts := FileRead("pb.txt", "UTF-8")
ZoomEl := UIA.ElementFromHandle("Zoom Meeting ahk_exe Zoom.exe")

Loop
{
begn:
if (ZoomEl.ElementFromPathExist("cA") && CAS := ZoomEl.ElementFromPathExist("X0/")) {
    Goto somelable
} Else {
    Goto begn
}

somelable:	
NewStr := StrReplace(CAS.Name, istalk, "", 1)
If CAS = "Meeting Information, with Security Warnings" {
    Sleep 1000
    SoundSetMute false
} Else If InStr(parts, NewStr) {
    SoundSetMute true
    Sleep 2500
} Else {
	SoundSetMute false
}
}

; You can find the exact participant, special fonts emojis, and copy paste with UAI.ahk by undocking and maximizing Participants in Zoom Meeting then Capture, ect etc. 
; ADD/DELETE/PARTICIPANTS Instructions:::: create a file called pb.txt in the same dir as piggly.ahk and add or delete participant's names 1 per line then just reload piggly.ahk 
; 
; Just wanted to see if it was possible and do find the script useful especially when falling asleep to a meeting.
; It's called piggly.ahk because DON'T HOG THE MIC!
