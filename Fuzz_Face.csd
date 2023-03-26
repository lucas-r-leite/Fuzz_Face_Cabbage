<Cabbage>
form caption("Fuzz Face") size(400, 300), guiMode("queue") pluginId("fuz1") colour("purple")
rslider bounds(196, 162, 100, 100), channel("fuzz"), range(20, 100, 60, 1, .01), text("Fuzz"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(296, 162, 100, 100), channel("volume"), range(0, 1, 0.5, 1, .01), text("Out"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 256
nchnls = 1
0dbfs = 1


instr 1
kFuzz cabbageGetValue "fuzz"
kVolume cabbageGetValue "volume"

a1 inch 1
;a2 inch 2
//Fuzz Distortion 
a1 = tanh(a1 * kFuzz)

outs a1*kVolume, a1*kVolume
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
