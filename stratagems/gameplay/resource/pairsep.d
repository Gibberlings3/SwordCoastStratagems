EXTEND_BOTTOM ~%JAHEIRA_POSTJOIN%~ ~%jaheira_loc%~

IF ~!IsValidForPartyDialog("khalid") InMyArea("khalid")~ THEN REPLY @20700   EXTERN ~%KHALID_POSTJOIN%~ dmww_khalidnotwanted
END

CHAIN 
IF ~~ THEN %KHALID_POSTJOIN% dmww_khalidnotwanted
@20701 == %JAHEIRA_POSTJOIN%
@20702
DO ~ SetGlobal("%kicked_out_variable%","LOCALS",0)JoinParty()~ EXIT

EXTEND_BOTTOM ~%KHALID_POSTJOIN%~ %khalid_loc%

IF ~!IsValidForPartyDialog("jaheira") InMyArea("jaheira")~ THEN REPLY @20703 GOTO dmww_jaheiranotwanted
END

CHAIN
IF ~~ THEN %KHALID_POSTJOIN% dmww_jaheiranotwanted
@20704 == %JAHEIRA_POSTJOIN%
@20705
DO ~ActionOverride("khalid",SetGlobal("%kicked_out_variable%","LOCALS",0))
ActionOverride("khalid",JoinParty())~ EXIT

EXTEND_BOTTOM ~%MINSC_POSTJOIN%~ %minsc_loc%

IF ~!IsValidForPartyDialog("dynaheir")InMyArea("dynaheir")~ THEN REPLY @20706 GOTO dmww_dynaheirnotwanted
END

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN
IF ~~ THEN %MINSC_POSTJOIN% dmww_dynaheirnotwanted
@20707 == %DYNAHEIR_POSTJOIN%
@20708
DO ~ActionOverride("minsc",SetGlobal("%kicked_out_variable%","LOCALS",0))
ActionOverride("minsc",JoinParty())~ EXIT

EXTEND_BOTTOM ~%DYNAHEIR_POSTJOIN%~ %dynaheir_loc%

IF ~!IsValidForPartyDialog("minsc")~ THEN REPLY @20709 EXTERN ~%MINSC_POSTJOIN%~ dmww_minscnotwanted
END

CHAIN 
IF ~~ THEN %MINSC_POSTJOIN% dmww_minscnotwanted
@20710 == %DYNAHEIR_POSTJOIN%
@20711
DO ~SetGlobal("%kicked_out_variable%","LOCALS",0) JoinParty() ~ EXIT

EXTEND_BOTTOM ~%MONTARON_POSTJOIN%~ %montaron_loc%

IF ~!IsValidForPartyDialog("xzar")InMyArea("xzar")~ THEN REPLY @20712 EXTERN ~%XZAR_POSTJOIN%~ dmww_xzarnotwanted
END

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN
IF ~~ THEN %XZAR_POSTJOIN% dmww_xzarnotwanted
@20713 == %MONTARON_POSTJOIN%
@20714 
DO ~SetGlobal("%kicked_out_variable%","LOCALS",0) JoinParty() ~ EXIT

EXTEND_BOTTOM ~%XZAR_POSTJOIN%~ %xzar_loc%

IF ~!IsValidForPartyDialog("montaron") InMyArea("montaron")~ THEN REPLY @20715 GOTO dmww_montaronnotwanted
END

CHAIN
IF ~~ THEN %XZAR_POSTJOIN% dmww_montaronnotwanted
@20716 == %MONTARON_POSTJOIN%
@20717
DO ~ActionOverride("xzar",SetGlobal("%kicked_out_variable%","LOCALS",0))
ActionOverride("xzar",JoinParty())~ EXIT

EXTEND_BOTTOM ~%ELDOTH_POSTJOIN%~ %eldoth_loc%

IF ~!IsValidForPartyDialog("skie") InMyArea("skie")~ THEN REPLY @20726 GOTO dmww_skienotwanted
END

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN
IF ~~ THEN %ELDOTH_POSTJOIN% dmww_skienotwanted
@20718 = @20719 == %SKIE_POSTJOIN%
@20720 = @20721
DO ~ActionOverride("eldoth",SetGlobal("%kicked_out_variable%","LOCALS",0))
ActionOverride("eldoth",JoinParty())~
EXIT

EXTEND_BOTTOM ~%SKIE_POSTJOIN%~ %skie_loc%

IF ~!IsValidForPartyDialog("eldoth") InMyArea("eldoth")~ THEN REPLY @20725 GOTO dmww_eldothnotwanted
END

CHAIN
IF ~~ THEN %SKIE_POSTJOIN% dmww_eldothnotwanted
@20722 == %ELDOTH_POSTJOIN%
@20723=@20724
DO ~ActionOverride("skie",SetGlobal("%kicked_out_variable%","LOCALS",0))
ActionOverride("skie",JoinParty())~
EXIT


