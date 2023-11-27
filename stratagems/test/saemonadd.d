// new holding-pattern block

APPEND_EARLY ppsaem2

	IF ~~ THEN BEGIN saem_pause
	SAY ~Of course! Take your time, I will be here when you are ready to consider my generous proposal.~
	IF ~~ THEN EXIT
	END

END


// adjust choice block so you can enter it if DW_Saemon_Spellhold=1

ADD_STATE_TRIGGER ppsaem2 20 ~Global("DW_Saemon_Spellhold","GLOBAL",1)~

// adjust 'run away!!!!' block so you can enter it if DW_Saemon_Spellhold=2

ADD_STATE_TRIGGER ppsaem2 26 ~Global("DW_Saemon_Spellhold","GLOBAL",2)~

// add exit to choice block

EXTEND_BOTTOM ppsaem2 20 

	IF ~~ THEN REPLY "" DO ~SetGlobal("DW_Saemon_Spellhold","GLOBAL",1)~ GOTO ppsaem2

END