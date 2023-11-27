APPEND_EARLY kaish 
	IF ~~ THEN BEGIN kaish_resupply  
	SAY @24007
	IF ~~ THEN DO ~SetGlobal("dw_supplies_count","GLOBAL",0)
			AddGlobals("dw_supplies_count","dw_supplies_max")
			SetTokenGlobal("dw_supplies_count","GLOBAL","DW_SIGNAL_PROVISIONS_COUNT")~
	EXIT
	END
END

EXTEND_BOTTOM kaish 19
	IF ~GlobalsLT("dw_supplies_count","dw_supplies_max")~ THEN REPLY @24006 GOTO kaish_resupply
END

