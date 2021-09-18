// remove initial EscapeArea() commands; change format for summoning Kahrk; add journal entries and quest XP

ALTER_TRANS "%tutu_var%carsa"
BEGIN 0 END
BEGIN 0 1 END
BEGIN 
	"UNSOLVED_JOURNAL" ~@10020~
END

ALTER_TRANS "%tutu_var%carsa"
BEGIN 1 7 END
BEGIN 0 END
BEGIN 
	"ACTION" ~~
END

ALTER_TRANS "%tutu_var%carsa"
BEGIN 2 END
BEGIN 0 1 END
BEGIN
	"UNSOLVED_JOURNAL" ~@10021~
END

ALTER_TRANS "%tutu_var%carsa"
BEGIN 8 END
BEGIN 0 END
BEGIN
	"SOLVED_JOURNAL" ~@10022~
	"ACTION" ~SetGlobal("dw_release_kahrk","MYAREA",1)EraseJournalEntry(@10021)EraseJournalEntry(@10020)AddExperienceParty(500)Kill("carsa")~
END

// gate main dialog tree for first-time-only use

REPLACE_STATE_TRIGGER "%tutu_var%carsa" 0 "NumTimesTalkedTo(0)"

// set a variable to check if the party got as far as the explanation of the jar

ADD_TRANS_ACTION "%tutu_var%carsa" BEGIN 3 END BEGIN END ~SetGlobal("dw_told_of_jar","LOCALS",1)~

// new section

APPEND "%tutu_var%carsa"

IF	~!Dead("kahrk")~ BEGIN intro_on_return
SAY @0 /* AAAHhhh...! Stop his screaming, stop it, please! I can't bear it any more! */
IF ~Global("dw_told_of_jar","LOCALS",1)~ THEN REPLY @1 /* I can make it stop. You just have to give me the jar. */ GOTO 5
IF ~!Global("dw_told_of_jar","LOCALS",1)~ THEN REPLY ~%carsa_response_0%~ GOTO 2
IF ~~ THEN REPLY ~%carsa_response_1%~ GOTO 1
END

IF ~Dead("kahrk")~ BEGIN after_dead
SAY @4 /* The whispering.. the screams... gone... I thought no-one could stop it... */
=
@5 /* But still, so much blood, so many dead... what will poor Carsa do now, how can she sleep? */
IF ~~ THEN REPLY @6 /* The village of Gullykin is only a few hours north of here, and I can give you supplies. The halflings will be able to look after you while you recover from this ordeal. */ DO ~SetGlobal("dw_carsa_gullykin","GLOBAL",1)~ GOTO to_gullykin
IF ~~ THEN REPLY @7 /* Why should I care? Get out of here, I've got more important things to worry about. */ GOTO get_lost
IF ~~ THEN REPLY @8 /* Once I cut you down for nearly getting me killed, that won't be a problem. */ GOTO time_to_die
END

IF ~~ BEGIN to_gullykin
SAY @9 /* Yes... yes, I can do that. Thank you! Thank you for freeing me! */
IF ~~ THEN SOLVED_JOURNAL @10023 DO ~EraseJournalEntry(@10020)EraseJournalEntry(@10021)AddExperienceParty(1000)EscapeArea()~
EXIT
END

IF ~~ BEGIN get_lost
SAY @10 /* Aaaahhh! */
IF ~~ THEN SOLVED_JOURNAL @10024 DO ~EraseJournalEntry(@10020)EraseJournalEntry(@10021)AddExperienceParty(1000)EscapeArea()~
EXIT
END

IF ~~ BEGIN time_to_die
SAY @11 /* Aaaahhh! */
IF ~~ THEN SOLVED_JOURNAL @10025 DO ~EraseJournalEntry(@10020)EraseJournalEntry(@10021)AddExperienceParty(1000)Enemy()~
EXIT
END

END // end of APPEND