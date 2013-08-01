EXTEND_BOTTOM %script% %state%
IF ~Global("EnteredArmInn","GLOBAL",1)
    !Global("IslandTravel","GLOBAL",1) //not on Werewolf Isle
    !Global("teth","GLOBAL",1) //not trapped under Candlekeep
    !Global("teth","GLOBAL",2)
    !AreaCheck("%DurlagsTower_Chessboard%") // lower levels of Durlag's Tower
    !AreaCheck("%DurlagsTower_IceChamber%")
    !AreaCheck("%DurlagsTower_FireChamber%")
    !AreaCheck("%DurlagsTower_AirChamber%")
    !AreaCheck("%DurlagsTower_EarthChamber%")
    !AreaCheck("%DurlagsTower_D2%")
    !AreaCheck("%DurlagsTower_D3%")
    !AreaCheck("%DurlagsTower_D4%")
    !AreaCheck("%DurlagsTower_CompassRoom%")
    !AreaCheck("%DurlagsTower_DemonknightsChamber%")
    !AreaCheck("%IceIsland%") // frozen wizard-trap isle
    !AreaCheck("%IceIslandMaze_L1%")
    !AreaCheck("%IceIslandMaze_L1%")
~
THEN REPLY @20801 GOTO dmww_fai


IF ~GlobalGT("Chapter","GLOBAL",%tutu_chapter_1%)
!Global("IslandTravel","GLOBAL",1)
    !Global("IslandTravel","GLOBAL",1) //not on Werewolf Isle
    !Global("teth","GLOBAL",1) //not trapped under Candlekeep
    !Global("teth","GLOBAL",2)
    !AreaCheck("%DurlagsTower_Chessboard%") // lower levels of Durlag's Tower
    !AreaCheck("%DurlagsTower_IceChamber%")
    !AreaCheck("%DurlagsTower_FireChamber%")
    !AreaCheck("%DurlagsTower_AirChamber%")
    !AreaCheck("%DurlagsTower_EarthChamber%")
    !AreaCheck("%DurlagsTower_D2%")
    !AreaCheck("%DurlagsTower_D3%")
    !AreaCheck("%DurlagsTower_D4%")
    !AreaCheck("%DurlagsTower_CompassRoom%")
    !AreaCheck("%DurlagsTower_DemonknightsChamber%")
    !AreaCheck("%IceIsland%") // frozen wizard-trap isle
    !AreaCheck("%IceIslandMaze_L1%")
    !AreaCheck("%IceIslandMaze_L1%")
~
THEN REPLY @20802  GOTO dmww_nash

IF ~Global("EnteredBeregost","GLOBAL",1)
!Global("IslandTravel","GLOBAL",1)
    !Global("IslandTravel","GLOBAL",1) //not on Werewolf Isle
    !Global("teth","GLOBAL",1) //not trapped under Candlekeep
    !Global("teth","GLOBAL",2)
    !AreaCheck("%DurlagsTower_Chessboard%") // lower levels of Durlag's Tower
    !AreaCheck("%DurlagsTower_IceChamber%")
    !AreaCheck("%DurlagsTower_FireChamber%")
    !AreaCheck("%DurlagsTower_AirChamber%")
    !AreaCheck("%DurlagsTower_EarthChamber%")
    !AreaCheck("%DurlagsTower_D2%")
    !AreaCheck("%DurlagsTower_D3%")
    !AreaCheck("%DurlagsTower_D4%")
    !AreaCheck("%DurlagsTower_CompassRoom%")
    !AreaCheck("%DurlagsTower_DemonknightsChamber%")
    !AreaCheck("%IceIsland%") // frozen wizard-trap isle
    !AreaCheck("%IceIslandMaze_L1%")
    !AreaCheck("%IceIslandMaze_L1%")
~
THEN REPLY @20804  GOTO dmww_beregost

IF ~!Global("Chapter","GLOBAL",%tutu_chapter_7%)   // you're not wanted in the Gate for murder
    Global("EnteredBaldursGate","GLOBAL",1)
    !Global("IslandTravel","GLOBAL",1) //not on Werewolf Isle
    !Global("teth","GLOBAL",1) //not trapped under Candlekeep
    !Global("teth","GLOBAL",2)
    !AreaCheck("%DurlagsTower_Chessboard%") // lower levels of Durlag's Tower
    !AreaCheck("%DurlagsTower_IceChamber%")
    !AreaCheck("%DurlagsTower_FireChamber%")
    !AreaCheck("%DurlagsTower_AirChamber%")
    !AreaCheck("%DurlagsTower_EarthChamber%")
    !AreaCheck("%DurlagsTower_D2%")
    !AreaCheck("%DurlagsTower_D3%")
    !AreaCheck("%DurlagsTower_D4%")
    !AreaCheck("%DurlagsTower_CompassRoom%")
    !AreaCheck("%DurlagsTower_DemonknightsChamber%")
    !AreaCheck("%IceIsland%") // frozen wizard-trap isle
    !AreaCheck("%IceIslandMaze_L1%")
    !AreaCheck("%IceIslandMaze_L1%")
~
THEN REPLY @20803  GOTO dmww_elfsong
END

APPEND %script%
IF ~~ THEN BEGIN dmww_fai 
  SAY @%response%
  IF ~~ THEN DO ~EscapeAreaMove("%FriendlyArmInn_L1%",%friendly_xloc%,%friendly_yloc%,0)
~ EXIT
END

IF
  ~~ THEN BEGIN dmww_nash
  SAY @%response%
  IF ~~ THEN DO ~EscapeAreaMove("%Nashkel_Inn%",%nashkel_xloc%,%nashkel_yloc%,0)
~ EXIT
END

IF
  ~~ THEN BEGIN dmww_elfsong
  SAY @%response%
  IF ~~ THEN DO ~EscapeAreaMove("%EBaldursGate_ElfsongTavern_L1%",%elfsong_xloc%,%elfsong_yloc%,0)
~ EXIT
END

IF
  ~~ THEN BEGIN dmww_beregost
  SAY @%response%
  IF ~~ THEN DO ~EscapeAreaMove("%Beregost_JovialJuggler_L1%",%beregost_xloc%,%beregost_yloc%,0)
~ EXIT
END
END
