
ALTER_TRANS bazmonk 
BEGIN 8 END
BEGIN 0 END
BEGIN 
"ACTION" ~SetGlobal("DMWWMonkRope","GLOBAL",1)~
END

ALTER_TRANS bazmonk 
BEGIN 8 END
BEGIN 1 END
BEGIN 
"ACTION" ~SetGlobal("DMWWMonkRope","GLOBAL",1)~
"REPLY" ~%monkreply%~
END

ALTER_TRANS bazmonk
BEGIN 12 END
BEGIN 0 END
BEGIN
"UNSOLVED_JOURNAL" ~%monkjournal%~
END

EXTEND_BOTTOM ambar01 2 20
IF ~Global("DMWWMonkRope","GLOBAL",1)~ THEN REPLY @3002 GOTO barmanrope 
END

APPEND ambar01 

IF ~~ THEN BEGIN barmanrope
SAY @3003 = @3004 = @3005
IF ~~ THEN DO ~GiveItemCreate("bazplo05",Player1,0,0,0) SetGlobal("DMWWMonkRope","GLOBAL",2)~ EXIT END
END

BEGIN dw#abrop

IF ~True()~ THEN BEGIN merchantrope
SAY @3006
IF ~~ THEN REPLY @3007 GOTO givesrope 
IF ~~ THEN REPLY @3008 GOTO givesrope
END

IF ~~ THEN BEGIN givesrope
SAY @3009=@3010
IF ~~ THEN DO ~GiveItemCreate("bazplo05",Player1,0,0,0) EscapeArea()~ EXIT END
