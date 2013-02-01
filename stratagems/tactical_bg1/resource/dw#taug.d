REPLACE_STATE_TRIGGER ~%tutu_var%taugos~ 0
	~!Global("joinedbandits","GLOBAL",0) !Dead("venkt")~

REPLACE_STATE_TRIGGER ~%tutu_var%taugos~ 5
	~!Global("joinedbandits","GLOBAL",0) !Dead("venkt")~


APPEND ~%tutu_var%taugos~

IF
	~!Global("joinedbandits","GLOBAL",0)
	 Dead("venkt")~
THEN BEGIN taug1
	SAY @21401 = @21402
IF ~~ THEN REPLY @21403 GOTO taug2 
IF ~~ THEN REPLY @21409 GOTO taug3
END

IF ~~ THEN BEGIN taug2
	SAY @21404
IF ~~ THEN REPLY @21405 GOTO taug3
IF ~~ THEN REPLY @21407 GOTO taug4
END

IF ~~ THEN BEGIN taug3
	SAY @21406
IF ~~ THEN DO ~SetGlobal("joinedbandits","GLOBAL",0) SetGlobal("dmwwtentdisplay","GLOBAL",1) Enemy()~ EXIT 
END

IF ~~ THEN BEGIN taug4
	SAY @21408
IF ~~ THEN DO ~SetGlobal("joinedbandits","GLOBAL",0) SetGlobal("dmwwtentdisplay","GLOBAL",1) Enemy()~ EXIT 
END
END
