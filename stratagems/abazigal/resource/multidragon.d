BEGIN dw#abbl1
IF ~~ THEN BEGIN NeverSay1
SAY ~~
IF ~~ THEN  EXIT END

BEGIN dw#abbl2
IF ~~ THEN BEGIN NeverSay2
SAY ~~
IF ~~ THEN  EXIT END

CHAIN 
IF ~True()~ THEN dw#abbl1 dragon1
@3031
DO ~SetGlobal("DMWWAbazBlacks","GLOBAL",3)~
== dw#abbl2
@3032
== %MINSC_25JOINED% IF ~IsValidForPartyDialogue("Minsc")~ THEN
@3033
EXIT

BEGIN dw#abgre
IF ~See([PC]) Global("DMWWAbazRedGreen","GLOBAL",1)~ THEN BEGIN greenarrives
SAY @3034
IF ~~ THEN DO ~SetGlobal("DMWWAbazRedGreen","GLOBAL",2)StartCutSceneMode()StartCutScene("dw#abct2")~ EXIT END

IF ~~ THEN BEGIN greenthreat
SAY @3035
IF ~~ THEN EXTERN dw#abred redrun END

IF ~~ THEN BEGIN greenwhine
SAY @3036
IF ~~ THEN EXTERN dw#abred redcajole END

IF ~~ THEN BEGIN greenagree
SAY @3037
IF ~~ THEN EXTERN dw#abred reddepart END

BEGIN dw#abred
IF ~See([PC]) Global("DMWWAbazRedGreen","GLOBAL",2)~ THEN BEGIN redarrives
SAY @3038
IF ~~ THEN DO ~SetGlobal("DMWWAbazRedGreen","GLOBAL",3)~ EXTERN dw#abgre greenthreat END

IF ~~ THEN BEGIN redrun
SAY @3039
IF ~~ THEN EXTERN dw#abgre greenwhine END

IF ~~ THEN BEGIN redcajole
SAY @3040
IF ~~ THEN EXTERN dw#abgre greenagree END

IF ~~ THEN BEGIN reddepart
SAY @3041
IF ~~ THEN DO ~DestroySelf()~ EXIT END

IF ~Global("DMWWAbazRedGreen","GLOBAL",4)~ THEN BEGIN redreturns
SAY @3042
IF ~~ THEN REPLY @3043 GOTO nodeal 
IF ~~ THEN REPLY @3044 GOTO mustfight
IF ~~ THEN REPLY @3045 GOTO endgame
END

IF ~~ THEN BEGIN nodeal
SAY @3046
IF ~~ THEN GOTO ~endgame~ END

IF ~~ THEN BEGIN mustfight
SAY @3047
IF ~~ THEN GOTO endgame END

IF ~~ THEN BEGIN endgame
SAY @3048
IF ~~ THEN DO ~SetGlobal("DMWWAbazRedGreen","GLOBAL",5)~ EXIT END


INTERJECT_COPY_TRANS dw#abred redarrives anomenred
== %ANOMEN_25JOINED% IF ~IsValidForPartyDialogue("Anomen")Alignment("Anomen",LAWFUL_GOOD)~ THEN
@3049
END 

INTERJECT_COPY_TRANS dw#abred endgame haerred
== %HAERDALIS_25JOINED% IF ~IsValidForPartyDialogue("HaerDalis")~ THEN
@3050
END
