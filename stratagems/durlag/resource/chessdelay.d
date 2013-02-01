
APPEND ~%EDWIN_JOINED%~

IF WEIGHT #-99 ~Global("DMWWChessDelay","GLOBAL",1)~ THEN BEGIN ~edwinchesswarning~
SAY @22401
IF ~~ THEN DO ~SetGlobal("DMWWChessDelay","GLOBAL",2) SetGlobalTimer("DMWWChess","GLOBAL",24)~ EXIT END
END


APPEND ~%DYNAHEIR_JOINED%~

IF WEIGHT #-99 ~Global("DMWWChessDelay","GLOBAL",1)~ THEN BEGIN ~dynaheirchesswarning~
SAY @22402
IF ~~ THEN DO ~SetGlobal("DMWWChessDelay","GLOBAL",2) SetGlobalTimer("DMWWChess","GLOBAL",24)~ EXIT END
END

APPEND ~%XAN_JOINED%~

IF WEIGHT #-99 ~Global("DMWWChessDelay","GLOBAL",1)~ THEN BEGIN ~xanchesswarning~
SAY @22403
IF ~~ THEN DO ~SetGlobal("DMWWChessDelay","GLOBAL",2) SetGlobalTimer("DMWWChess","GLOBAL",24)~ EXIT END
END

APPEND ~%IMOEN_JOINED%~

IF WEIGHT #-99 ~Global("DMWWChessDelay","GLOBAL",1)~ THEN BEGIN ~imoenchesswarning~
SAY @22404
IF ~~ THEN DO ~SetGlobal("DMWWChessDelay","GLOBAL",2) SetGlobalTimer("DMWWChess","GLOBAL",24)~ EXIT END
END

APPEND ~%XZAR_JOINED%~

IF WEIGHT #-99 ~Global("DMWWChessDelay","GLOBAL",1)~ THEN BEGIN ~xzarchesswarning~
SAY @22405=@22406=@22407=@22408
IF ~~ THEN DO ~SetGlobal("DMWWChessDelay","GLOBAL",2) SetGlobalTimer("DMWWChess","GLOBAL",24)~ EXIT END
END

APPEND ~%QUAYLE_JOINED%~

IF WEIGHT #-99 ~Global("DMWWChessDelay","GLOBAL",1)~ THEN BEGIN ~quaylechesswarning~
SAY @22409=@22410
IF ~~ THEN DO ~SetGlobal("DMWWChessDelay","GLOBAL",2) SetGlobalTimer("DMWWChess","GLOBAL",24)~ EXIT END
END



