
ADD_STATE_TRIGGER ~%tutu_var%shopkn~ 0 ~!Global("DMWWNashkelPelt","GLOBAL",1)~
ADD_STATE_TRIGGER ~%tutu_var%shopkn~ 1 ~!Global("DMWWNashkelPelt","GLOBAL",1)~

REPLACE_ACTION_TEXT ~%tutu_var%shopkn~ ~GiveGoldForce(500)~ ~GiveGoldForce(500) IncrementGlobal("DMWWNashkelPelt","GLOBAL",1)EraseJournalEntry(%journal_string%)~

APPEND ~%tutu_var%shopkn~ 

IF ~Global("DMWWNashkelPelt","GLOBAL",1) !PartyHasItem("%tutu_var%misc01")~
THEN BEGIN ~nonewpelt~
SAY @22500
IF ~~ THEN REPLY @22501 DO ~StartStore("%tutu_var%STO4803",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY @22502 EXIT END

IF ~Global("DMWWNashkelPelt","GLOBAL",1) PartyHasItem("%tutu_var%misc01")~
THEN BEGIN ~newpelt~
SAY @22503
IF ~~ THEN REPLY @22504 DO ~StartStore("%tutu_var%STO4803",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY @22505 EXIT END

END
