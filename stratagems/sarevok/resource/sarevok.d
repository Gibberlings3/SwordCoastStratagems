APPEND ~%tutu_var%sarevo~

IF ~Global("DMWWSarevokFight","GLOBAL",1)~
THEN BEGIN sarevokinvulnerable
SAY @22002=@22003=@22004=@22005
IF ~~ THEN DO ~SetGlobal("DMWWSarevokFight","GLOBAL",2)~ EXIT END

IF ~
OR(4)
	Dead("galdor")
	Dead("diarmi")
	Dead("semaj")
	Dead("tazok")
Global("DMWWSarevokFight","GLOBAL",2)~
THEN BEGIN sarevokbravado
SAY @22006=@22007
IF ~~ THEN DO ~SetGlobal("DMWWSarevokFight","GLOBAL",3)~ EXIT END

IF ~
	Dead("galdor")
	Dead("diarmi")
	Dead("semaj")
	Dead("tazok")
Global("DMWWSarevokFight","GLOBAL",3)~
THEN BEGIN sarevoklastwords
SAY @22008=@22009
IF ~~ THEN DO ~SetGlobal("DMWWSarevokFight","GLOBAL",4)~ EXIT END

END



