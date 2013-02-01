

APPEND ~%tutu_var%ichary~

IF WEIGHT #-999 ~HPPercentLT(Myself,60)~
THEN BEGIN icharyd
	SAY @21701=@21702=@21703
IF ~~ THEN DO ~SetGlobal("DMWWIcharydStorm","GLOBAL",1)~ EXIT END
END
