
ADD_STATE_TRIGGER ~shopkn~ 0 ~!Global("DMWWNashkelPelt","GLOBAL",1)~
ADD_STATE_TRIGGER ~shopkn~ 1 ~!Global("DMWWNashkelPelt","GLOBAL",1)~
ADD_STATE_TRIGGER ~shopkn~ 2 ~!Global("DMWWNashkelPelt","GLOBAL",1)~

REPLACE_ACTION_TEXT ~shopkn~ ~GiveGoldForce(500)~ ~GiveGoldForce(500) IncrementGlobal("DMWWNashkelPelt","GLOBAL",1)~


ALTER_TRANS shopkn
BEGIN 0 END
BEGIN 0 1 END
BEGIN
"UNSOLVED_JOURNAL" "@22508"
END

ALTER_TRANS shopkn
BEGIN 1 END
BEGIN 0 END
BEGIN
"SOLVED_JOURNAL" "@22508"
END

APPEND ~shopkn~ 

IF ~Global("DMWWNashkelPelt","GLOBAL",1) !PartyHasItem("misc01")~
THEN BEGIN ~nonewpelt~
SAY @22500
IF ~~ THEN REPLY @22501 DO ~StartStore("STO4803",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY @22502 EXIT END

IF ~Global("DMWWNashkelPelt","GLOBAL",1) PartyHasItem("misc01")~
THEN BEGIN ~newpelt~
SAY @22503
IF ~~ THEN REPLY @22504 DO ~StartStore("STO4803",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY @22505 EXIT END

END
