; This is an AutoHotKey 2.0 script for the Alcoholics Anonymous 24 hour International Zoom Meeting that lets you automatically mute any participant upon sharing automatically for whatever reason you might not want to hear their audio. 
; requirements in Zoom:
; Stop incoming video
; enable gallery view
; hide non-video participants

; Runs with AutoHotKey 2 as it also requires UIA-v2  
; got occasional Error: Invalid index/condition at path index 1 tried adding #WARN Off to UAI.ahk so far so good

#include uia2\Lib\UIA.ahk

lable:
ZoomEl := UIA.ElementFromHandle("Zoom Meeting ahk_exe Zoom.exe")
CAS := ZoomEl.ElementFromPath("X0/").Name

if CAS = "Meeting Information, with Security Warnings" {
   Sleep 1000
   SoundSetMute false
} else if (CAS = "Close") {
   SoundSetMute true
} else if (CAS = "PARTICIPANT'S_NAME_HERE is talking…") || (CAS = "PARTICIPANT_2's_NAME_HERE is talking…") {  ; seems to work just by more ORS "||"
   SoundSetMute true
   Sleep 2000
} else {
   SoundSetMute false
}
goto lable

; You can find the participant with UAI.ahk by undocking and maximizing "Participants in Zoom Meeting". Capture, ect etc. 

; Just wanted to see if it was possible and do find the script useful especially when falling asleep to a meeting.
; It's called piggly.ahk because DON'T HOG THE MIC!
