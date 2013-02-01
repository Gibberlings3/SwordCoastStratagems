REPLACE ~%tutu_var%kaish2~ 
IF ~~ THEN BEGIN 1
SAY @21604
IF ~~ THEN REPLY @21605 GOTO onlyifforced 
IF ~!HPPercentLT(Player1,75)
!HPPercentLT(Player2,75)
!HPPercentLT(Player3,75)
!HPPercentLT(Player4,75)
!HPPercentLT(Player5,75)
!HPPercentLT(Player6,75)
~ THEN REPLY @21606 GOTO waytoohard
IF ~OR(6)
HPPercentLT(Player1,75)
HPPercentLT(Player2,75)
HPPercentLT(Player3,75)
HPPercentLT(Player4,75)
HPPercentLT(Player5,75)
HPPercentLT(Player6,75)
~ THEN REPLY @21606 GOTO nothardenough
IF ~~ THEN REPLY @21607 GOTO bravado 
IF ~~ THEN REPLY @21608 GOTO perhapswearemonsters
END

IF ~~ THEN BEGIN 3
SAY @21609
IF ~!HPPercentLT(Player1,75)
!HPPercentLT(Player2,75)
!HPPercentLT(Player3,75)
!HPPercentLT(Player4,75)
!HPPercentLT(Player5,75)
!HPPercentLT(Player6,75)
~ THEN REPLY @21610 GOTO waytoohard
IF ~OR(6)
HPPercentLT(Player1,75)
HPPercentLT(Player2,75)
HPPercentLT(Player3,75)
HPPercentLT(Player4,75)
HPPercentLT(Player5,75)
HPPercentLT(Player6,75)
~ THEN REPLY @21610 GOTO nothardenough
IF ~~ THEN REPLY @21608 GOTO perhapswearemonsters
END
END

APPEND ~%tutu_var%kaish2~

IF ~~ THEN BEGIN waytoohard
SAY @21611
IF ~~ THEN REPLY @21612 GOTO onlyifforced
IF ~~ THEN REPLY @21608 GOTO perhapswearemonsters
END

IF ~~ THEN BEGIN nothardenough
SAY @21613
IF ~~ THEN DO ~Enemy()~
SOLVED_JOURNAL @21614 EXIT END

IF ~~ THEN BEGIN perhapswearemonsters
SAY @21615
IF ~~ THEN DO ~Enemy()~
SOLVED_JOURNAL @21614 EXIT END

IF ~~ THEN BEGIN bravado
SAY @21616
IF ~~ THEN DO ~Enemy()~
SOLVED_JOURNAL @21614 EXIT END

IF ~~ THEN BEGIN onlyifforced
SAY @21617
IF ~~ THEN REPLY @21618 GOTO trulysorry
IF ~~ THEN REPLY @21619 GOTO wecankeepasecret
END

IF ~~ THEN BEGIN trulysorry
SAY @21620
IF ~~ THEN DO ~Enemy()~
SOLVED_JOURNAL @21614 EXIT END

IF ~~ THEN BEGIN wecankeepasecret
SAY @21621
IF ~~ THEN REPLY @21608 GOTO perhapswearemonsters 
IF ~Global("MaraDone","GLOBAL",1)~ THEN REPLY @21622 GOTO babygratitude
IF ~!Global("MaraDone","GLOBAL",1)~ THEN REPLY @21623 GOTO youcandonothing
END

IF ~~ THEN BEGIN youcandonothing
SAY @21624
IF ~~ THEN DO ~Enemy()~
SOLVED_JOURNAL @21614 EXIT END

IF ~~ THEN BEGIN babygratitude
SAY @21625 
IF ~~ THEN REPLY @21626 GOTO indeeditdoes
IF ~CheckStatGT(Player1,13,WIS) Alignment(Player1,MASK_GOOD) Global("WillHelpEscape","GLOBAL",1)~ THEN REPLY @21627 GOTO youshameme
IF ~OR(3)!CheckStatGT(Player1,13,WIS) !Alignment(Player1,MASK_GOOD) !Global("WillHelpEscape","GLOBAL",1)~ THEN REPLY @21627 GOTO trulysorry
IF ~CheckStatGT(Player1,13,INT) Global("WillHelpEscape","GLOBAL",1)~ THEN REPLY @21628 GOTO credit
IF ~CheckStatGT(Player1,13,INT) !Global("WillHelpEscape","GLOBAL",1)~ THEN REPLY @21628 GOTO creditbuttough 
END

IF ~~ THEN BEGIN indeeditdoes
SAY @21639
IF ~~ THEN DO ~Enemy()~
SOLVED_JOURNAL @21614 EXIT END

IF ~~ THEN BEGIN youshameme
SAY @21640
IF ~Gender(Player1,Female)~ THEN DO
~ClearAllActions()
SetGlobal("DMWWKaishasChat","GLOBAL",1)
CreateCreature("%tutu_var%durlyl2",[3541.2782],0)
StartCutSceneMode()
StartCutScene("dw#kcut1")~ EXIT
IF ~Gender(Player1,Male)~ THEN DO
~ClearAllActions()
SetGlobal("DMWWKaishasChat","GLOBAL",1)
CreateCreature("%tutu_var%delain2",[3541.2782],0)
StartCutSceneMode()
StartCutScene("dw#kcut2")~ EXIT
END

IF ~~ THEN BEGIN creditbuttough
SAY @21629 
IF ~~THEN DO ~Enemy()~
SOLVED_JOURNAL @21614 EXIT END

IF ~~ THEN BEGIN credit
SAY @21629
IF ~Gender(Player1,Female)~ THEN DO
~ClearAllActions()
SetGlobal("DMWWKaishasChat","GLOBAL",1)
CreateCreature("%tutu_var%durlyl2",[3541.2782],0)
StartCutSceneMode()
StartCutScene("dw#kcut1")~ EXIT
IF ~Gender(Player1,Male)~ THEN DO
~ClearAllActions()
SetGlobal("DMWWKaishasChat","GLOBAL",1)
CreateCreature("%tutu_var%delain2",[3541.2782],0)
StartCutSceneMode()
StartCutScene("dw#kcut2")~ EXIT
END
END



CHAIN
IF WEIGHT #-999 ~Global("DMWWKaishasChat","GLOBAL",1) ~ THEN ~%tutu_scriptd%elainy2~ plea1
@21630 == %tutu_var%kaish2 @21631
DO
~ClearAllActions()
CreateCreature("%tutu_var%marale2",[3540.2780],0)
StartCutSceneMode()
StartCutScene("dw#kcut3")~
EXIT

CHAIN
IF WEIGHT #-999 ~Global("DMWWKaishasChat","GLOBAL",1) ~ THEN ~%tutu_scriptd%urlyle2~ plea2
@21630 == %tutu_var%kaish2 @21631
DO
~ClearAllActions()
CreateCreature("%tutu_var%marale2",[3540.2780],0)
StartCutSceneMode()
StartCutScene("dw#kcut3")~
EXIT

CHAIN
IF WEIGHT #-999 ~Global("DMWWKaishasChat","GLOBAL",1)Gender(Player1,Male)~ THEN ~%tutu_var%marale2~ okaythen1
@21632 == %tutu_var%kaish2 @21633 = @21634 == %tutu_var%marale2 @21635 == %tutu_scriptd%elainy2 @21636
DO ~SetGlobal("DMWWNoKillKaishas","GLOBAL",1)~
EXIT

CHAIN
IF WEIGHT #-999 ~Global("DMWWKaishasChat","GLOBAL",1)Gender(Player1,Female)~ THEN ~%tutu_var%marale2~ okaythen2
@21632 == %tutu_var%kaish2 @21633 = @21634 == %tutu_var%marale2 @21635 == %tutu_scriptd%urlyle2 @21636
DO ~SetGlobal("DMWWNoKillKaishas","GLOBAL",1)~
EXIT

APPEND ~%tutu_var%menda4~ 

IF WEIGHT #-999 ~Global("DMWWNoKillKaishas","GLOBAL",1)~ THEN BEGIN welcome
SAY @21641
IF ~~ THEN REPLY @21642 GOTO whysend
IF ~~ THEN REPLY @21643 GOTO wontliftgift
END

IF ~~ THEN BEGIN whysend
SAY @21644
IF ~~ THEN REPLY @21645 GOTO dielikedogs
IF ~~ THEN REPLY @21649 GOTO nosailor
IF ~~ THEN REPLY @21646 GOTO wontliftgift
END

IF ~~ THEN BEGIN dielikedogs
SAY @21647 
IF ~~ THEN DO ~Enemy() ActionOverride("baresh",Enemy())~
JOURNAL @21648 EXIT END

IF ~~ THEN BEGIN nosailor
SAY @21650
IF ~~ THEN REPLY @21643 GOTO wontliftgift
IF ~~ THEN REPLY @21645 GOTO dielikedogs
END

IF ~~ THEN BEGIN wontliftgift
SAY @21651
IF ~~ THEN DO ~Enemy() ActionOverride("baresh",Enemy())~
JOURNAL @21648 EXIT END
END

REPLACE ~%tutu_var%baresh~

IF ~~ THEN BEGIN 2
SAY @21652
IF ~~ THEN REPLY @21653 GOTO 4
IF ~Dead("kaishwlf")~ THEN REPLY @21654 GOTO 5
IF ~PartyHasItem("%tutu_var%BOOK87")~ THEN REPLY @21655 GOTO 6
IF ~!Dead("kaishwlf")~ THEN REPLY @21656 GOTO bareshbluster
END

IF ~~ THEN BEGIN 3
SAY @21657
IF ~Dead("kaishwlf")~ THEN REPLY @21654 GOTO 5
IF ~!Dead("kaishwlf")~ THEN REPLY @21656 GOTO bareshbluster
IF ~~ THEN REPLY @21658 GOTO 7
IF ~~ THEN REPLY @21659 GOTO 1
END

IF ~~ THEN BEGIN 4
SAY @21660
IF ~Dead("kaishwlf")~ THEN REPLY @21654 GOTO 5
IF ~!Dead("kaishwlf")~ THEN REPLY @21656 GOTO bareshbluster
IF ~~ THEN REPLY @21658 GOTO 7
IF ~~ THEN REPLY @21659 GOTO 1
END

IF ~~ THEN BEGIN 6
SAY @21661 
IF ~Dead("kaishwlf")~ THEN REPLY @21654 GOTO 5
IF ~!Dead("kaishwlf")~ THEN REPLY @21656 GOTO bareshbluster
IF ~~ THEN REPLY @21658 GOTO 7
END

IF ~~ THEN BEGIN 7
SAY @21662
IF ~Dead("kaishwlf")~ THEN REPLY @21663 GOTO 5
IF ~!Dead("kaishwlf")~ THEN REPLY @21665 GOTO bareshbluster
IF ~~ THEN REPLY @21664 GOTO 4
END
END

APPEND ~%tutu_var%baresh~

IF ~~ THEN BEGIN bareshbluster
SAY @21666
 IF ~~ THEN DO ~SetGlobal("Baresh","GLOBAL",1)
MoveToObject("door1004")
OpenDoor("door1004")
DestroySelf()
~ EXIT
END
END


