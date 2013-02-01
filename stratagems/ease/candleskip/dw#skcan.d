BEGIN ~dw#skcan~

IF ~NumTimesTalkedTo(0)~
THEN BEGIN ~firsttalk~
SAY @22201 = @22202
IF ~~ THEN REPLY @22203 GOTO ~guardleaves~
IF ~~ THEN REPLY @22204 GOTO ~getthecash~
END

IF ~~ THEN BEGIN ~guardleaves~
SAY @22205
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN ~getthecash~
SAY @22206=@22207
IF ~~ THEN DO ~AddExperienceParty(400)
	GiveItemCreate("%tutu_var%dagg01",Player1,0,0,0)
	GiveItemCreate("%tutu_var%dagg01",Player1,0,0,0)
	GiveItemCreate("%tutu_var%potn08",Player1,0,0,0)
	GiveItemCreate("%tutu_var%potn08",Player1,0,0,0)
	GiveItemCreate("%tutu_var%misc16",Player1,0,0,0)
	GiveGoldForce(32)
	SetGlobalTimer("talktopc","LOCALS",15)~
EXIT END


IF ~NumTimesTalkedToGT(0)~ THEN BEGIN ~secondchat~
SAY @22208
IF ~~ THEN REPLY @22209 GOTO ~taketogorion~
IF ~~ THEN REPLY @22210 GOTO ~stillshopping~
IF ~~ THEN REPLY @22211 GOTO ~cheat~
END

IF ~~ THEN BEGIN ~taketogorion~
SAY @22212
IF ~~ THEN DO ~ActionOverride(Player1,JumpToPoint([2910.1970]))
SetGlobal("DMWWReadyToLeaveKeep","GLOBAL",1)
MoveViewPoint([2910.1970],INSTANT)~
EXIT END

IF ~~ THEN BEGIN ~stillshopping~
SAY @22213=@22214
IF ~~ THEN DO ~SetGlobalTimer("talktopc","LOCALS",15)~ EXIT END

IF ~~ THEN BEGIN ~cheat~
SAY @22215
IF ~~ THEN DO ~EscapeArea()~ EXIT END
