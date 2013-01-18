//Vars
westDeaths = 0; 
publicVariable "westDeaths";

playergroupname = objNull;
publicVariable "playergroupname";

current_eod = objNull;
publicVariable "current_eod";

#define vclCrewClass		"TK_INS_Soldier_AT_EP1"
#define staticClass		"TK_INS_Soldier_3_EP1"
#define eastVehiclesFreq	["Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","Pickup_PK_TK_GUE_EP1","UAZ_MG_TK_EP1","UAZ_MG_TK_EP1","BTR40_MG_TK_INS_EP1","BTR40_TK_INS_EP1","BRDM2_TK_EP1","M113_TK_EP1","Mi24_D_TK_EP1","UH1H_TK_EP1","Mi17_TK_EP1","BTR60_TK_EP1","LandRover_MG_TK_INS_EP1","LandRover_MG_TK_INS_EP1","LandRover_MG_TK_INS_EP1","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","T34_TK_EP1","T55_TK_EP1"]
#define eastLightVehicles	["LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_INS_EP1","Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","Pickup_PK_TK_GUE_EP1","UAZ_MG_TK_EP1","UAZ_MG_TK_EP1"]


#define stationaryGunsHigh 	["KORD_high_UN_EP1","DSHKM_TK_INS_EP1","SearchLight_TK_INS_EP1"]
#define stationaryGunsMed	["ZU23_TK_INS_EP1","DSHKM_TK_INS_EP1","SearchLight_TK_INS_EP1"]
#define stationaryGunsLow	["AGS_TK_INS_EP1","ZU23_TK_INS_EP1","SearchLight_TK_INS_EP1"]

#define eastVclRspnTime		600
#define eastInfCount		(count(CENTERPOS nearObjects [eastInfClasses, AORADIUS]))
#define maxStaticGuns		8

//Markers
#define intelMarkerType		"hd_unknown"

//Misc
#define isEast(X)			(typeOf X in eastInfClasses)
#define isWest(X)			(typeOf X in westSoldierClasses)
