BEGIN ~%tutu_scripto%GRELEAD~
IF ~True()~ THEN BEGIN 0
SAY @21502
IF ~~ THEN DO
	~SetGlobal("prep","LOCALS",1)
	ApplySpellRES("%WIZARD_SPIRIT_ARMOR%",Myself)
	ApplySpellRES("%WIZARD_MIRROR_IMAGE%",Myself)
	ApplySpellRES("%WIZARD_PROTECTION_FROM_EVIL%",Myself)
	ApplySpellRES("%WIZARD_MINOR_GLOBE_OF_INVULNERABILITY%",Myself)
	ApplySpellRES("%WIZARD_PROTECTION_FROM_NORMAL_MISSILES%",Myself)~
JOURNAL @21503
EXIT END

