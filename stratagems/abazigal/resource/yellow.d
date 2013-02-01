BEGIN ~dw#abdgy~

IF ~Global("DMWWYellowFight","GLOBAL",0)~ THEN BEGIN hello
SAY @3055
IF ~~ THEN REPLY @3056 GOTO hoorayhesdead
IF ~~ THEN REPLY @3057 GOTO poormeguarddog
IF ~~ THEN REPLY @3058 GOTO battletodeath
END

IF ~~ THEN BEGIN battletodeath 
SAY @3059
IF ~~ THEN DO ~SetGlobal("DMWWYellowFight","GLOBAL",2) Enemy()~ EXIT 
END

IF ~~ THEN BEGIN hoorayhesdead
SAY @3060
IF ~~ THEN REPLY @3061 GOTO poormefull
IF ~~ THEN REPLY @3062 GOTO poormeguarddog
IF ~~ THEN REPLY @3063 GOTO battletodeath
IF ~~ THEN REPLY @3064 GOTO forfuckssake
END

IF ~~ THEN BEGIN forfuckssake
SAY @3065
IF ~~ THEN REPLY @3061 GOTO poormefull
IF ~~ THEN REPLY @3062 GOTO poormeguarddog
IF ~~ THEN REPLY @3063 GOTO battletodeath
END

IF ~~ THEN BEGIN poormeguarddog
SAY @3066
IF ~~ THEN REPLY @3067 GOTO poormepartial
IF ~~ THEN REPLY @3068 GOTO injuredpride
IF ~~ THEN REPLY @3069 GOTO battletodeath
END

IF ~~ THEN BEGIN poormefull
SAY @3070
IF ~~ THEN REPLY @3071 GOTO ~battletoyield~
IF ~~ THEN REPLY @3068 GOTO injuredpride
IF ~~ THEN REPLY @3069 GOTO ~battletodeath~
END

IF ~~ THEN BEGIN poormepartial
SAY @3072
IF ~~ THEN REPLY @3071 GOTO battletoyield
IF ~~ THEN REPLY @3073 GOTO injuredpride
IF ~~ THEN REPLY @3063 GOTO ~battletodeath~
END



IF ~~ THEN BEGIN injuredpride
SAY @3074
IF ~~ THEN DO ~SetGlobal("DMWWYellowFight","GLOBAL",2) Enemy()~ EXIT 
END

IF ~~ THEN BEGIN battletoyield
SAY @3075= 
@3076
IF ~~ THEN DO ~SetGlobal("DMWWYellowFight","GLOBAL",1) Enemy()~ EXIT 
END

IF ~HPPercentLT(Myself,25) Global("DMWWYellowFight","GLOBAL",1)~ THEN BEGIN dragonyields
SAY @3077
IF ~~ THEN REPLY @3078 GOTO flattered
IF ~~ THEN REPLY @3079 GOTO sulky
IF ~~ THEN REPLY @3080 GOTO todeath
END

IF ~~ THEN BEGIN sulky
SAY @3081
IF ~~ THEN DO ~SetGlobal("DMWWYellowFight","GLOBAL",3)DestroyItem("minhp1")~ EXIT
END

IF ~~ THEN BEGIN flattered
SAY @3082
IF ~~ THEN DO ~SetGlobal("DMWWYellowFight","GLOBAL",3) GiveItemCreate("dw#abamu",Player1,0,0,0)DestroyItem("minhp1")~ EXIT
END

IF ~~ THEN BEGIN todeath
SAY @3083
IF ~~ THEN DO ~SetGlobal("DMWWYellowFight","GLOBAL",2)DestroyItem("minhp1") Enemy()~ EXIT
END

IF ~Dead("Abazigal") Global("DMWWYellowGloat","GLOBAL",0)~ THEN BEGIN gloating
SAY @3084
IF ~~ THEN DO ~SetGlobal("DMWWYellowGloat","GLOBAL",1)~ EXIT END

IF ~Global("DMWWYellowFight","GLOBAL",3)~ THEN BEGIN goaway
SAY @3085
IF ~~ THEN REPLY @3086 GOTO gothen
IF ~~ THEN REPLY @3087 GOTO sulky2
IF ~~ THEN REPLY @3088 GOTO todeath
END

IF ~~ THEN BEGIN sulky2
SAY @3089
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN gothen
SAY @3090
IF ~~ THEN DO ~~ EXIT END



ADD_TRANS_TRIGGER botsmith 101 ~!PartyHasItem("dw#abyds")~

EXTEND_BOTTOM botsmith 100 96 92 89 86 82 76 72 67 63 59 55 51 47 43 39 35 31 27 23 19 15 9 4
IF ~PartyHasItem("dw#abyds")~ THEN GOTO 101
END

EXTEND_BOTTOM botsmith 101 
IF ~PartyHasItem("dw#abyds")!PartyHasItem("compon18")!PartyHasItem("compon19")~ THEN GOTO scalesyellow
IF ~PartyHasItem("dw#abyds")!PartyHasItem("compon18")PartyHasItem("compon19")~ THEN GOTO scalesyellowblue
IF ~PartyHasItem("dw#abyds")PartyHasItem("compon18")!PartyHasItem("compon19")~ THEN GOTO scalesyellowwhite
IF ~PartyHasItem("dw#abyds")PartyHasItem("compon18")PartyHasItem("compon19")~ THEN GOTO scalesyellowwhiteblue
END

APPEND botsmith
IF ~~ THEN BEGIN scalesyellowwhiteblue 
  SAY @3092
IF ~PartyGoldLT(5000)~ THEN REPLY #66914  GOTO 10
  IF ~PartyGoldGT(4999)~ THEN REPLY #66915 DO ~SetGlobal("ItemMaker","GLOBAL",26)
TakePartyGold(5000)
TakePartyItemNum("compon18",1)
DestroyItem("compon18")
DestroyGold(5000)~ GOTO 11
  IF ~PartyGoldGT(4999)~ THEN REPLY #66916  DO ~SetGlobal("ItemMaker","GLOBAL",27)
TakePartyGold(5000)
TakePartyItemNum("compon19",1)
DestroyItem("compon19")
DestroyGold(5000)~ GOTO 11
  IF ~PartyGoldGT(4999)~ THEN REPLY @3093  DO ~SetGlobal("DMWWYellowArmor","GLOBAL",1)
TakePartyGold(5000)
TakePartyItemNum("dw#abyds",1)
DestroyItem("dw#abyds")
DestroyGold(5000)~ GOTO 11
  IF ~~ THEN REPLY @3094 GOTO 105
END

IF ~~ THEN BEGIN scalesyellowwhite
  SAY @3095
IF ~PartyGoldLT(5000)~ THEN REPLY #66914  GOTO 10
  IF ~PartyGoldGT(4999)~ THEN REPLY #66915 DO ~SetGlobal("ItemMaker","GLOBAL",26)
TakePartyGold(5000)
TakePartyItemNum("compon18",1)
DestroyItem("compon18")
DestroyGold(5000)~ GOTO 11
  IF ~PartyGoldGT(4999)~ THEN REPLY @3093  DO ~SetGlobal("DMWWYellowArmor","GLOBAL",1)
TakePartyGold(5000)
TakePartyItemNum("dw#abyds",1)
DestroyItem("dw#abyds")
DestroyGold(5000)~ GOTO 11
  IF ~~ THEN REPLY #66917 /* ~Neither of them.  What else?~ */ GOTO 105
END

IF ~~ THEN BEGIN scalesyellowblue
  SAY @3096
IF ~PartyGoldLT(5000)~ THEN REPLY #66914  GOTO 10
  IF ~PartyGoldGT(4999)~ THEN REPLY #66916 DO ~SetGlobal("ItemMaker","GLOBAL",27)
TakePartyGold(5000)
TakePartyItemNum("compon19",1)
DestroyItem("compon19")
DestroyGold(5000)~ GOTO 11
  IF ~PartyGoldGT(4999)~ THEN REPLY @3093  DO ~SetGlobal("DMWWYellowArmor","GLOBAL",1)
TakePartyGold(5000)
TakePartyItemNum("dw#abyds",1)
DestroyItem("dw#abyds")
DestroyGold(5000)~ GOTO 11
  IF ~~ THEN REPLY #66917 /* ~Neither of them.  What else?~ */ GOTO 105
END

IF ~~ THEN BEGIN scalesyellow
  SAY @3097
IF ~PartyGoldLT(5000)~ THEN REPLY #66914  GOTO 10
IF ~PartyGoldGT(4999)~ THEN REPLY #66912  DO ~SetGlobal("DMWWYellowArmor","GLOBAL",1)
TakePartyGold(5000)
TakePartyItemNum("dw#abyds",1)
DestroyItem("dw#abyds")
DestroyGold(5000)~ GOTO 11
  IF ~~ THEN REPLY #66913  GOTO 105
END

END


INTERJECT_COPY_TRANS dw#abdgy poormefull DMWWYellowHaer
== HAERD25J IF ~IsValidForPartyDialogue("HaerDalis")~ THEN @3091
END


INTERJECT_COPY_TRANS dw#abdgy poormeguarddog DMWWYellowHaer
== HAERD25J IF ~IsValidForPartyDialogue("HaerDalis")~ THEN @3091
END

INTERJECT_COPY_TRANS dw#abdgy poormefull DMWWYellowImoen
== IMOEN25J IF ~IsValidForPartyDialogue("Imoen2")~ THEN @3012
END

INTERJECT_COPY_TRANS dw#abdgy poormepartial DMWWYellowImoen
== IMOEN25J IF ~IsValidForPartyDialogue("Imoen2")~ THEN @3012
END


INTERJECT_COPY_TRANS dw#abdgy poormeguarddog DMWWYellowSarevok
== SAREV25J IF ~IsValidForPartyDialogue("Sarevok")~ THEN @3013
END

