 // this block of trigger fixes and the following block of action fixes eliminates all reported
// compile errors in the game, including legacy errors from BG

// borrowed from Fixpack

REPLACE_TRIGGER_TEXT_REGEXP ~\(^aataqah$\)\|\(^trgyp03$\)~  ~Name(LastTalkedToBy,"\([a-z|A-Z|0-9]+\)")~ ~Name("\1",LastTalkedToBy)~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^aeriej$\)\|\(^banomen$\)\|\(^minscj$\)\|\(^yoshj$\)~  ~AreaType(OUTSIDE)~ ~AreaType(OUTDOOR)~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^amnise$\)\|\(^delorn$\)~ ~STATE_[CD]HA[MR][MR]ED~ ~STATE_CHARMED~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^dmark1$\)\|\(^kieres$\)~ ~True\(([0-9]+)\)?~ ~True()~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^kpcapt02$\)\|\(^kpmaid01$\)~ ~InPartySlot(LastTalkedToBy,"Nalia")~ ~Name("Nalia",LastTalkedToBy)~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^idryad[1-3]$\)\|\(^delthy$\)~ ~"GL[ABO][ABO][ABO]L"~ ~"GLOBAL"~
REPLACE_TRIGGER_TEXT ~bandic~   ~NumDeadGT("Bandcap"4)~ ~NumDeadGT("Bandcap",4)~
REPLACE_TRIGGER_TEXT ~banomen~  ~\bReactionGT(Player1,NEUTRAL_UPPER))~ ~ReactionGT(Player1,NEUTRAL_UPPER)~
REPLACE_TRIGGER_TEXT ~breg01~   ~CheckStat\(L\|G\)T(\("?[a-z|A-Z|0-9]+"?\),\([A-Z][A-Z][A-Z]\),\([0-9]+\))~ ~CheckStat\1T(\2,\4,\3)~
REPLACE_TRIGGER_TEXT ~dmtown1~  ~RandomNum(4,1)1~ ~RandomNum(4,1)~
REPLACE_TRIGGER_TEXT ~edwinj~   ~IsValidForPartyDialog("Viconia)~ ~IsValidForPartyDialog("Viconia")~
REPLACE_TRIGGER_TEXT ~elgea~    ~("Korgan")!~ ~("Korgan")~
REPLACE_TRIGGER_TEXT ~fergus~   ~Global("FERGUS1","GLOBAL",2);~ ~Global("FERGUS1","GLOBAL",2)~
REPLACE_TRIGGER_TEXT ~ffactor1~ ~!Dead("HaerDalis)~ ~!Dead("HaerDalis")~
REPLACE_TRIGGER_TEXT ~firtrl01~ ~Dead(firorc01)~ ~Dead("firorc01")~
REPLACE_TRIGGER_TEXT ~flam7~    ~StateCheck(Myself,STATE_CHARMED);~ ~StateCheck(Myself,STATE_CHARMED)~
REPLACE_TRIGGER_TEXT ~friend~   ~CheckState(~ ~StateCheck(~
REPLACE_TRIGGER_TEXT ~fumin~    ~!Gabber("Nalia")~ ~!IsGabber("Nalia")~
REPLACE_TRIGGER_TEXT ~gorpel~   ~NumTimesTalkedTo()~ ~NumTimesTalkedTo(0)~
REPLACE_TRIGGER_TEXT ~ithtyl~   ~True();~ ~True()~
REPLACE_TRIGGER_TEXT ~jared~    ~ReactionGLT(LastTalkedToBy,NEUTRAL_UPPER)~ ~ReactionGT(LastTalkedToBy,NEUTRAL_UPPER)~
REPLACE_TRIGGER_TEXT ~kaish~    ~Dead(Karoug)~ ~Dead("Karoug")~
REPLACE_TRIGGER_TEXT ~lahl~     ~Random(~ ~RandomNum(~
REPLACE_TRIGGER_TEXT ~marcus~   ~HALFELF~ ~HALF_ELF~
REPLACE_TRIGGER_TEXT ~minern~   ~Global("SpokenToEmerson",0)~ ~Global("SpokenToEmerson","GLOBAL",0)~
REPLACE_TRIGGER_TEXT ~mgappr02~ ~PartyGoldGT(1999(~ ~PartyGoldGT(1999)~
REPLACE_TRIGGER_TEXT ~nobl10~   ~Reaction\([GL]\)T(\([A-Z|_]+\))~ ~Reaction\1T(LastTalkedToBy,\2)~
REPLACE_TRIGGER_TEXT ~noblem3~  ~NUETRAL_LOWER~ ~NEUTRAL_LOWER~
REPLACE_TRIGGER_TEXT ~obssol01~ ~!Class(Player,MAGE_ALL)~ ~!Class(Player1,MAGE_ALL)~
REPLACE_TRIGGER_TEXT ~ppdesh~   ~IsValidForPartyDialog\(ue\)?("YOSHIMO)~ ~IsValidForPartyDialog("YOSHIMO")~
REPLACE_TRIGGER_TEXT ~read4~    ~NumberOfTimesTalkedToGT(0)~ ~NumTimesTalkedToGT(0)~
REPLACE_TRIGGER_TEXT ~tamoko~   ~FRIENLY_LOWER~ ~FRIENDLY_LOWER~
REPLACE_TRIGGER_TEXT ~trthf02~  ~Class(LastTalkedToBy,"THIEF")~ ~Class(LastTalkedToBy,THIEF)~
REPLACE_TRIGGER_TEXT ~uddrow16~ ~Dead(\([a-z|A-Z|0-9]+\))~ ~StateCheck(\1,STATE_REALLY_DEAD)~
REPLACE_TRIGGER_TEXT ~uhinn01~  ~!Dead("uhinn02')~ ~!Dead("uhinn02")~

REPLACE_ACTION_TEXT_REGEXP ~\(^abela$\)\|\(^brevli$\)\|\(^deltan2?$\)\|\(^galken$\)\|\(^narlen$\)\|\(^quinn$\)\|\(^taerom$\)\|\(^tersus$\)\|\(^ulcast$\)~ ~GiveItemCreate(\("?[a-z|A-Z|0-9]+"?\),\("?[a-z|A-Z|0-9]+"?\))~ ~GiveItemCreate(\1,\2,1,1,1)~
REPLACE_ACTION_TEXT_REGEXP ~\(^aerie$\)\|\(^kalah2$\)~  ~StartDialogueNoSet()~ ~StartDialogueNoSet([PC])~
REPLACE_ACTION_TEXT_REGEXP ~^drstatu[1-3]$~ ~ActionOverride("\([a-z|A-Z|0-9]+\)",StartDialogueNoSet(Player1)+~ ~ActionOverride("\1",StartDialogueNoSet(Player1))~
REPLACE_ACTION_TEXT_REGEXP ~\(^hamek$\)\|\(^mekrath$\)~ ~Set(~ ~SetGlobal(~
REPLACE_ACTION_TEXT_REGEXP ~\(^keldorj$\)\|\(^udvith$\)~ ~SetGlobalTimer("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)"?,"?\([A-Z|_|0-9]+\)"?)~ ~SetGlobalTimer("\1","\2",\3)~
REPLACE_ACTION_TEXT_REGEXP ~\(^kielpc$\)\|\(^ppireni1$\)~ ~Open\(Door\)?("?\([A-Z|a-z|0-9]+\)"?)~ ~OpenDoor("\2")~
REPLACE_ACTION_TEXT_REGEXP ~\(^kieres$\)\|\(^ulf$\)~  ~ActionOverride(\([a-z|A-Z|0-9|"]+\),AttackReevaluate(\([a-z|A-Z|0-9|"|(|)]+\),\([0-9]+\))+~ ~ActionOverride(\1,AttackReevaluate(\2,\3)) ~
REPLACE_ACTION_TEXT_REGEXP ~\(^kpcapt02$\)\|\(^kpmaid01$\)\|\(^kprang02$\)~ ~ActionOverride("\([a-z|A-Z|0-9]+\)",MoveToPoint(\[\([0-9]+\)\.\([0-9]+\)\])*~ ~ActionOverride("\1",MoveToPoint([\2.\3]))~
REPLACE_ACTION_TEXT_REGEXP ~^obshal0[13]$~ ~ChangeEnemyAlly("obshal0\([13]\)",\[ENEMY\])~ ~ChangeEnemyAlly("obshal0\1",ENEMY)~
REPLACE_ACTION_TEXT_REGEXP ~^pheirk\(as\)?$~ ~True()~ ~~
REPLACE_ACTION_TEXT_REGEXP ~\(^messed$\)\|\(^rashad$\)~ ~Die()~ ~Kill(Myself)~
REPLACE_ACTION_TEXT_REGEXP ~\(^udphae01$\)\|\(^delthy$\)~ ~"GL[ABO][ABO][ABO]L"~ ~"GLOBAL"~
REPLACE_ACTION_TEXT ~arnman11~ ~ActionOverride("arnman10",MoveToObject("arnman11")+~ ~ActionOverride("arnman10",MoveToObject("arnman11"))~
REPLACE_ACTION_TEXT ~baerie~   ~MoveGlobal("AR0607","Aerie",\[1034\.1034\],0)~ ~MoveGlobal("AR0607","Aerie",[1034.1034])~
REPLACE_ACTION_TEXT ~bdact05~  ~ActionOverride("bdact06",MoveToPoint(\[?1384\.420\])+~ ~ActionOverride("bdact06",MoveToPoint([1384.420]))~
REPLACE_ACTION_TEXT ~bdact06~  ~StartCutScene("Cut31L)~ ~StartCutScene("Cut31L")~
REPLACE_ACTION_TEXT ~cattac~   ~Attack(NearestEnemyOf(Myself)+~ ~Attack(NearestEnemyOf(Myself))~
REPLACE_ACTION_TEXT ~dadrow17~ ~SetGlobal("GhaunTimer","GLOBAL",ONE_DAY)~ ~SetGlobalTimer("GhaunTimer","GLOBAL",ONE_DAY)~
REPLACE_ACTION_TEXT ~deltan~   ~AddJournalEntry(15840)~ ~~
REPLACE_ACTION_TEXT ~dream4~   ~\bStartDialogueNoSet(Player1))~ ~StartDialogueNoSet(Player1)~
REPLACE_ACTION_TEXT ~drunk~    ~Sleep()~ ~ReallyForceSpell(Myself,SURE_SLEEP)~
REPLACE_ACTION_TEXT ~eldotp~   ~ActionOverride(Skie",ChangeAIScript("",DEFAULT))~ ~ActionOverride("Skie",ChangeAIScript("",DEFAULT))~
REPLACE_ACTION_TEXT ~ffbiff01~ ~ActionOverride("Raelis",StartDialogueNoSet(\[Player1\]))~ ~ActionOverride("Raelis",StartDialogueNoSet([PC]))~
REPLACE_ACTION_TEXT ~hajanos~  ~ActionOverride("habrega",EscapeAreaMove("ar0500",4475,1037,5)~ ~ActionOverride("habrega",EscapeAreaMove("ar0500",4475,1037,5))~
REPLACE_ACTION_TEXT ~imoemj~   ~GiveItemCreate("Misc4e",Myself,1)~ ~GiveItemCreate("Misc4e",Myself,1,1,1)~
REPLACE_ACTION_TEXT ~iron12~   ~EscapeArea\(()\)?~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~kielpc~   ~ChangeAIScript(\?\?\?\?\?,Override)~ ~ChangeAIScript("",OVERRIDE)~
REPLACE_ACTION_TEXT ~kielpc~   ~MoveToPoint(2357\.930\])~ ~MoveToPoint([2357.930])~
REPLACE_ACTION_TEXT ~lavok~    ~DestroyItem(MINHP1)~ ~DestroyItem("MINHP1")~
REPLACE_ACTION_TEXT ~marl~     ~MoveToPoint(\[\.\])~ ~MoveToPoint([-1.-1])~
REPLACE_ACTION_TEXT ~mazzy4~   ~Enemt(~ ~Enemy(~
REPLACE_ACTION_TEXT ~mazzyj~   ~\bEscapeAreaMove("AR2002",341,400,12)*~ ~EscapeAreaMove("AR2002",341,400,12)~
REPLACE_ACTION_TEXT ~mazzyj~   ~ActionOverride("uhrang01",StartDialogueNoSet(\[PC\])+~ ~ActionOverride("uhrang01",StartDialogueNoSet([PC]))~
REPLACE_ACTION_TEXT ~melica~   ~GiveItemCreate("MISC49,LastTalkedToBy,0,0,0)~ ~GiveItemCreate("MISC49",LastTalkedToBy,0,0,0)~
REPLACE_ACTION_TEXT ~mgappr03~ ~CreateItem(\("?[a-z|A-Z|0-9]+"?\))~ ~CreateItem(\1,1,1,1)~
REPLACE_ACTION_TEXT ~pelanna~  ~ActionOverride("arntra03",MoveToPointNoInterrupt(\[2192\.1535\])+~ ~ActionOverride("arntra03",MoveToPointNoInterrupt([2192.1535]))~
REPLACE_ACTION_TEXT ~ppsaem3~  ~GiveItem(\[PC\],"misc8u")~ ~~
REPLACE_ACTION_TEXT ~quayle~   ~\bSetGlobalTimer("CircusEnded","GLOBAL",ONE_DAY)*~ ~SetGlobalTimer("CircusEnded","GLOBAL",ONE_DAY)~
REPLACE_ACTION_TEXT ~sahimp02~ ~CreateVisualEffectObject("SPSTRENH,"CHEST6")~ ~CreateVisualEffectObject("SPSTRENH","CHEST6")~
REPLACE_ACTION_TEXT ~shape~    ~Polymorph(RAKHASA)~ ~Polymorph(RAKSHASA)~
REPLACE_ACTION_TEXT ~sharte~   ~ChangeAIScript("SHARTEEL,OVERRIDE)~ ~ChangeAIScript("SHARTEEL",OVERRIDE)~
REPLACE_ACTION_TEXT ~shoal~    ~ActionOverride("Droth",MoveToPoint(\[2900\.525\])+~ ~ActionOverride("Droth",MoveToPoint([2900.525]))~
REPLACE_ACTION_TEXT ~test2~    ~Attack(\[0\],0,\[0\])~ ~Attack(NearestEnemyOf(Myself))~
REPLACE_ACTION_TEXT ~udphae01~ ~EscapeArea(\("[a-z|A-Z|0-9]+"\)?)~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~udsvir06~ ~EscapeAreaObject("AR2300")~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~udsvir08~ ~EscapeArea();~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~valygarj~ ~ActionOverride("Viconia",LeaveParty()+~ ~ActionOverride("Viconia",LeaveParty())~

// Bioware manages to screw up Global and SetGlobal every possible way. These two patches fix almost all of 'em.
REPLACE_TRIGGER_TEXT_REGEXP ~\(^bounha$\)\|\(^brevli$\)\|\(^burch2$\)\|\(^cor$\)\|\(^dadrow16$\)\|\(^firban02$\)\|\(^gorf1$\)\|\(^hellsare$\)\|\(^jared$\)\|\(^lothan$\)\|\(^mtob6$\)\|\(^raiken$\)\|\(^rumora$\)\|\(^teven$\)\|\(^trfued11$\)~
  ~\b\(Set\)?Globa\(l\([LG]T\)?\)("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)['"]?,"?\([0-9]+\)"?)~
  ~Globa\2("\4","\5",\6)~
REPLACE_ACTION_TEXT_REGEXP ~\(^bhgaal01$\)\|\(^bounha$\)\|\(^cerndp$\)\|\(^delthy$\)\|\(^docsol03$\)\|\(^doomsay$\)\|\(^drshsp01$\)\|\(^emerso$\)\|\(^hellsare$\)\|\(^lothan$\)\|\(^mazzyp$\)\|\(^naliaj$\)\|\(^nobw8$\)\|\(^rufpal2$\)\|\(^shape$\)\|\(^sonner$\)~
  ~\b\(Set?\)?Global("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)"?,"?\([0-9]+\)"?)~
  ~SetGlobal("\2","\3",\4)~

// replaces all the old BG CreateCreature actions that NI flags as bad. Lines are too long; had to be broken in two.
REPLACE_ACTION_TEXT_REGEXP ~\(^albert$\)\|\(^alora$\)\|\(^arghai$\)\|\(^baruk$\)\|\(^beldin$\)\|\(^benjy$\)\|\(^brathl$\)\|\(^brevli$\)\|\(^brilla$\)\|\(^carsa$\)\|\(^charle$\)\|\(^cult[13]$\)\|\(^cythan$\)\|\(^degrod$\)\|\(^dopdur3$\)\|\(^dratan$\)\|\(^elkart$\)\|\(^feloni$\)\|\(^flamgg$\)\|\(^ftobe5$\)\|\(^galtok$\)\|\(^gantol$\)\|\(^garan$\)\|\(^gazib$\)\|\(^gervis$\)\|\(^gorpel$\)\|\(^husam2$\)\|\(^iron10$\)\|\(^ironm4$\)\|\(^islsir$\)\|\(^ithmee$\)\|\(^jacil$\)\|\(^jondal$\)~
  ~CreateCreature(\("?[a-z|A-Z|0-9]+"?\),\(\[[0-9]+\.[0-9]+\]\))~
  ~CreateCreature(\1,\2,0)~
REPLACE_ACTION_TEXT_REGEXP ~\(^karoug$\)\|\(^kielpc$\)\|\(^kryla$\)\|\(^laerta$\)\|\(^lakada$\)\|\(^laurel$\)\|\(^mtbe9$\)\|\(^mulahe$\)\|\(^narcil$\)\|\(^nestor$\)\|\(^nevill$\)\|\(^nexlit$\)\|\(^nobw8$\)\|\(^obe\(ran\)?$\)\|\(^osmadi$\)\|\(^palin$\)\|\(^prism$\)\|\(^pumberl$\)\|\(^ratchi$\)\|\(^samant$\)\|\(^sarevo$\)\|\(^shoal$\)\|\(^silenc$\)\|\(^silke$\)\|\(^skie$\)\|\(^sunin$\)\|\(^tracea$\)\|\(^tremai$\)\|\(^wiven$\)~
  ~CreateCreature(\("?[a-z|A-Z|0-9]+"?\),\(\[[0-9]+\.[0-9]+\]\))~
  ~CreateCreature(\1,\2,0)~

// these three were getting corrupted with above patch, so do them separately
REPLACE_ACTION_TEXT_REGEXP ~glanma~ ~CreateCreature(\("[a-zA-Z0-9]+"\),\(\[[0-9]+\.[0-9]+\]\))~ ~CreateCreature(\1,\2,0)~
REPLACE_ACTION_TEXT_REGEXP ~ramazi~ ~CreateCreature(\("[a-zA-Z0-9]+"\),\(\[[0-9]+\.[0-9]+\]\))~ ~CreateCreature(\1,\2,0)~
REPLACE_ACTION_TEXT_REGEXP ~thalan~ ~CreateCreature(\("[a-zA-Z0-9]+"\),\(\[[0-9]+\.[0-9]+\]\))~ ~CreateCreature(\1,\2,0)~

// dialogue error fixes for ToB
REPLACE_ACTION_TEXT_REGEXP ~^famil[1-3]25$~ ~CLERIC_CURE_MODERATE_WOUNDS~ ~CLERIC_CURE_MEDIUM_WOUNDS~
REPLACE_ACTION_TEXT_REGEXP ~\(^fsspir2$\)\|\(^imoen25j$\)\|\(^jahei25j$\)\|\(^vicon25j$\)~  ~TriggerActivation("IT302\([4-6]\)"~ ~TriggerActivation("Exit302\1"~
REPLACE_ACTION_TEXT ~amfaheed~  ~[^,]EscapeArea())~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~amman02~  ~ApplySpell("runrun",Myself)~ ~ApplySpellRES("runrun",Myself)~
REPLACE_ACTION_TEXT ~fsspir3~   ~\bApplyDamage(Myself,25,ACID)+~ ~ApplyDamage(Myself,25,ACID)~
REPLACE_ACTION_TEXT ~gorchr~  ~TakeItemReplace("GORCHRAM","GORCHR",Myself)~ ~DestroyItem("GORCHR")~
REPLACE_ACTION_TEXT ~sarmel01~ ~DialogInterrupt("FALSE")~ ~DialogInterrupt(FALSE)~
REPLACE_ACTION_TEXT ~sarpro01~  ~FadeFromColor(\[20\.0),0\])?~ ~FadeFromColor([20.0],0)~