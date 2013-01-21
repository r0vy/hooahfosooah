#define DEBUG		false


//Constants
#define VIEWDISTANCE		1500
#define SPAWNRANGE 		700
#define WEP_DESPAWN_RANGE	100

//Misc Functions
// getDirTo - vector of X towards Y in degrees while Y can be either a position or an object; 
// if X is in the East of Y, vector is from 0.01° to 179.99° and if on the West it's from -0.01° to -179.99° (N is 0°, S is 180°)
#define getDirTo(X,Y)       (((if(typeName Y == "OBJECT")then{getPosATL Y}else{Y} select 0) - (getPosATL X select 0)) atan2 ((if(typeName Y == "OBJECT")then{getPosATL Y}else{Y} select 1) - (getPosATL X select 1)))  

//Params
if (isNil "paramsArray") then {
    if (isClass (missionConfigFile/"Params")) then {
        for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
            _paramName = configName ((missionConfigFile >> "Params") select _i);
            missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
        };
    };
} else {
    for "_i" from 0 to (count paramsArray - 1) do {
        missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
    };
}; 

#define startLocation       (if(isDead(MHQ))then{HQ}else{MHQ})
#define startPos            (getPosATL fieldHospital)
#define livesLeft           (startLives - westDeaths)

//AI
#define infDeleteTime		30

//String Functions
#define squadNumber(X)      call compile toString[toArray(str X) select 7]
#define squadString(X)      ("Hitman1" + str squadNumber(X))
#define squadUnitStrings(X)	[X+"1",X+"2",X+"3",X+"4",X+"5"]
#define unitNumber(X)		call compile toString[toArray(str X) select (count toArray(str X) - 1)]
#define vehicleSquad(X)     (call compile ("Hitman1" + str unitNumber(X)))
#define getName(X)          (playerNames select (westPlayerStrings find str X))
#define squadLeader(X)      (squadString(X)+"1")

// these macros do NOT return the actual name of the unit - these are only for text references
#define squadVictor(X)      ("Victor-1-" + str squadNumber(X))
#define vehicleID(X)		("Hitman-1-" + str unitNumber(X))
#define squadID(X)          ("Hitman-1-" + str squadNumber(X))
#define unitID(X)           ("Hitman-1-" + str squadNumber(X) + "-" + str unitNumber(X))

#define victorID(X)         (\
if(typeOf X == ATVTYPE)then{"ATV-1-" + str unitNumber(X)}else{\
if(typeOf X == HELITYPE)then{"Heli"}else{\
if(typeOf X == MHQTYPE)then{"MHQ"}else{\
"Victor-1-" + str unitNumber(X)}}})

#define IEDList             ["BAF_ied_v1","BAF_ied_v2"]
#define InjurySounds		["medic1","bleeding1","hit1","hit2","hit3","hit4","medic2","bleeding2","medic3","bleeding3","medic4","scream1","scream2","scream3","help1","help2","help3","help4","help5"]
#define cacheType 			"GuerillaCacheBox_EP1"
#define intelType 			"Notebook"
#define ammoBoxType			"UNBasicWeapons_EP1"
#define westVehicles 		[humv11,humv12,humv13,humv14,humv15,humv16,atv11,atv12,atv13,atv14,heli,MHQ]
#define westVehicleStrings	["humv11","humv12","humv13","humv14","humv15","humv16","atv11","atv12","atv13","atv14","heli","MHQ"]
#define westPlayerStrings	["Hitman111","Hitman112","Hitman113","Hitman114","Hitman115",\
							"Hitman121","Hitman122","Hitman123","Hitman124","Hitman125",\
							"Hitman131","Hitman132","Hitman133","Hitman134","Hitman135",\
							"Hitman141","Hitman142","Hitman143","Hitman144","Hitman145",\
							"Hitman151","Hitman152","Hitman153","Hitman154","Hitman155",\
							"Hitman161","Hitman162","Hitman163","Hitman164","Hitman165"]
#define eastPlayerStrings   ["east0","east1","east2","east3","east4","east5"]
#define westAllClasses		(westSoldierClasses + westVehicleClasses)
#define eastStationaryGuns	["KORD_high_UN_EP1","DSHKM_TK_INS_EP1","ZU23_TK_INS_EP1","AGS_TK_INS_EP1","SearchLight_TK_INS_EP1"]
#define eastVclClasses		["BRDM2_TK_EP1","M113_TK_EP1","BTR60_TK_EP1","LandRover_MG_TK_INS_EP1",\
							"LandRover_SPG9_TK_INS_EP1","T34_TK_EP1","T55_TK_EP1","KORD_high_UN_EP1",\
							"DSHKM_TK_INS_EP1","ZU23_TK_INS_EP1","AGS_TK_INS_EP1","Mi24_D_TK_EP1","Ka52","UH1H_TK_EP1"]
#define eastRanks			["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE"] 

#define eastInfCivClasses		[\
"TK_CIV_Takistani02_EP1",\
"TK_CIV_Takistani06_EP1"\
]

#define eastInfClasses		[\
"TK_INS_Warlord_EP1",\
"TK_INS_Soldier_TL_EP1",\
"TK_INS_Bonesetter_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_MG_EP1",\
"TK_INS_Soldier_AA_EP1",\
"TK_INS_Soldier_AA_EP1",\
"TK_INS_Soldier_AA_EP1",\
"TK_INS_Soldier_AA_EP1",\
"TK_INS_Soldier_AR_EP1",\
"TK_INS_Soldier_AAT_EP1",\
"TK_INS_Soldier_EP1",\
"TK_INS_Soldier_2_EP1",\
"TK_INS_Soldier_3_EP1",\
"TK_INS_Soldier_Sniper_EP1",\
"TK_INS_Soldier_4_EP1",\
"TK_Special_Forces_TL_EP1",\
"TK_Special_Forces_MG_EP1",\
"TK_Special_Forces_EP1"\
]

#define eastAllClasses      (eastInfClasses + eastStationaryGuns + eastVclClasses)

#define legalMagazines [\
"20Rnd_762x51_DMR",\
"10x_303",\
"5Rnd_127x99_as50",\
"5rnd_127x99_as50",\
"200Rnd_556x45_L110A1",\
"5Rnd_86x70_L115A1",\
"100Rnd_762x54_PK",\
"75Rnd_545x39_RPK",\
"10Rnd_762x54_SVD",\
"8Rnd_9x18_Makarov",\
"6Rnd_45ACP",\
"20Rnd_B_765x17_Ball",\
"30Rnd_9x19_UZI",\
"PG7V",\
"PG7VL",\
"PG7VR",\
"OG7",\
"RPG18",\
"Strela",\
"Stinger",\
"SMAW_HEDP",\
"SMAW_HEAA",\
"20Rnd_762x51_FNFAL",\
"30Rnd_545x39_AK",\
"30Rnd_762x39_AK47",\
"30Rnd_556x45_Stanag",\
"5Rnd_762x51_M24",\
"100Rnd_762x51_M240",\
"200Rnd_556x45_M249",\
"20Rnd_762x51_B_SCAR",\
"20rnd_762x51_B_SCAR",\
"Laserbatteries",\
"Javelin",\
"Mine",\
"PipeBomb",\
"15Rnd_9x19_M9",\
"7Rnd_45ACP_1911",\
"17Rnd_9x19_glock17",\
"HandGrenade_West",\
"HandGrenade_East",\
"SmokeShell",\
"1Rnd_HE_M203",\
"1Rnd_Smoke_M203",\
"IR_Strobe_Target",\
"IR_Strobe_Marker",\
"SmokeShellRed",\
"SmokeShellGreen",\
"SmokeShellBlue",\
"SmokeShellYellow",\
"SmokeShellOrange",\
"SmokeShellPurple",\
"FlareWhite_M203",\
"FlareYellow_M203",\
"FlareGreen_M203",\
"FlareRed_M203",\
"1Rnd_SmokeRed_M203",\
"1Rnd_SmokeGreen_M203",\
"1Rnd_SmokeYellow_M203",\
"1Rnd_HE_GP25",\
"FlareWhite_GP25",\
"FlareGreen_GP25",\
"FlareRed_GP25",\
"FlareYellow_GP25",\
"1Rnd_Smoke_GP25",\
"1Rnd_SmokeRed_GP25",\
"1Rnd_SmokeGreen_GP25",\
"1Rnd_SmokeYellow_GP25",\
"30Rnd_9x19_MP5",\
"30Rnd_9x19_MP5SD",\
"30Rnd_9x19_UZI",\
"30Rnd_9x19_UZI_SD",\
"10Rnd_B_765x17_Ball",\
"20Rnd_B_765x17_Ball",\
"20Rnd_556x45_Stanag",\
"30Rnd_556x45_G36",\
"30Rnd_556x45_G36SD",\
"30Rnd_556x45_StanagSD",\
"20Rnd_B_AA12_74Slug",\
"20Rnd_B_AA12_Pellets",\
"100Rnd_556x45_BetaCMag",\
"10Rnd_127x99_m107",\
"20Rnd_762x51_B_SCAR",\
"20rnd_762x51_B_SCAR",\
"20Rnd_762x51_SB_SCAR",\
"20rnd_762x51_SB_SCAR",\
"8Rnd_B_Beneli_74Slug",\
"8Rnd_B_Beneli_Pellets",\
"15Rnd_9x19_M9SD",\
"20Rnd_762x51_FNFAL",\
"6Rnd_HE_M203",\
"6Rnd_Smoke_M203",\
"6Rnd_SmokeRed_M203",\
"6Rnd_SmokeGreen_M203",\
"6Rnd_SmokeYellow_M203",\
"Dragon_EP1",\
"8Rnd_B_Saiga12_74Slug",\
"8Rnd_B_Saiga12_Pellets",\
"30Rnd_762x39_SA58",\
"ACE_10Rnd_127x99_Raufoss_m107",\
"ACE_10Rnd_127x99_T_m107",\
"ACE_100Rnd_556x45_T_M249",\
"ACE_200Rnd_556x45_T_M249",\
"ACE_30Rnd_556x45_SB_S_Stanag",\
"ACE_30Rnd_556x45_SB_Stanag",\
"ACE_30Rnd_556x45_T_Stanag",\
"ACE_5Rnd_127x99_B_TAC50",\
"ACE_5Rnd_127x99_S_TAC50",\
"ACE_5Rnd_127x99_T_TAC50",\
"ACE_20Rnd_762x51_S_M110",\
"ACE_20Rnd_762x51_SB_M110",\
"ACE_20Rnd_762x51_T_M110",\
"ACE_15Rnd_9x19_P226",\
"ACE_20Rnd_762x51_B_M14",\
"ACE_20Rnd_762x51_S_M14",\
"ACE_20Rnd_762x51_T_DMR",\
"ACE_20Rnd_762x51_S_DMR",\
"ACE_5Rnd_762x51_T_M24",\
"ACE_Javelin_Direct",\
"ACE_15Rnd_9x19_P226",\
"ACE_Battery_Rangefinder",\
"ACE_Flashbang",\
"ACE_SSGreen_M203",\
"ACE_SSRed_M203",\
"ACE_SSWhite_M203",\
"ACE_SSYellow_M203",\
"ACE_FlareIR_M203",\
"ACE_HuntIR_M203",\
"ACE_1Rnd_HE_M203",\
"ACE_M34",\
"BAF_L109A1_HE",\
"ACE_M84",\
"ACE_Claymore_M",\
"ACE_C4_M",\
"ACE_Rope_M_120",\
"ACE_VS17Panel_M",\
"ACE_MAAWS_HE",\
"ACE_SMAW_NE",\
"ACE_SMAW_Spotting",\
"ACE_Bandage",\
"ACE_Epinephrine",\
"ACE_Medkit",\
"ACE_Morphine",\
"ACE_Knicklicht_R",\
"ACE_Knicklicht_G",\
"ACE_Knicklicht_W",\
"ACE_Knicklicht_Y",\
"ACE_Knicklicht_B",\
"ACE_Knicklicht_IR",\
"ACE_MK19_CSWDM",\
"ACE_M2_CSWDM",\
"ACE_M224HE_CSWDM",\
"ACE_M224WP_CSWDM",\
"ACE_M224IL_CSWDM",\
"ACE_2B14HE_CSWDM",\
"ACE_100Rnd_556x45_S_BetaCMag",\
"ACE_20Rnd_762x51_B_FAL",\
"ACE_20Rnd_762x51_T_FAL",\
"ACE_20Rnd_762x51_B_G3",\
"ACE_20Rnd_762x51_T_G3",\
"ACE_20Rnd_762x51_B_HK417",\
"ACE_20Rnd_762x51_S_HK417",\
"ACE_20Rnd_762x51_SB_HK417",\
"ACE_20Rnd_762x51_SB_S_HK417",\
"ACE_20Rnd_762x51_T_HK417",\
"ACE_20Rnd_762x51_SB_M110",\
"ACE_20Rnd_762x51_S_M110",\
"ACE_20Rnd_762x51_T_M110",\
"ACE_20Rnd_762x51_S_SCAR",\
"ACE_20Rnd_762x51_SB_S_SCAR",\
"ACE_20Rnd_762x51_SB_SCAR",\
"ACE_20Rnd_762x51_T_SCAR",\
"ACE_20Rnd_9x39_S_OC14",\
"ACE_20Rnd_9x39_B_OC14",\
"ACE_20Rnd_9x39_S_SP6_OC14",\
"ACE_20Rnd_9x39_B_SP6_OC14",\
"ACE_20Rnd_556x45_S_Stanag",\
"ACE_20Rnd_9x39_SP6_VSS",\
"ACE_25Rnd_1143x23_B_UMP45",\
"ACE_25Rnd_1143x23_S_UMP45",\
"ACE_30Rnd_556x45_S_G36",\
"ACE_30Rnd_556x45_AP_S_G36",\
"ACE_30Rnd_556x45_AP_G36",\
"ACE_30Rnd_556x45_T_G36",\
"ACE_30Rnd_6x35_B_PDW",\
"ACE_30Rnd_1143x23_B_M3",\
"ACE_30Rnd_9x19_S_MP5",\
"ACE_30Rnd_762x51_B_FAL",\
"ACE_30Rnd_762x39_T_SA58",\
"ACE_30Rnd_556x45_S_Stanag",\
"ACE_40Rnd_B_46x30_MP7",\
"ACE_40Rnd_S_46x30_MP7",\
"ACE_5Rnd_86x70_T_L115A1",\
"ACE_5Rnd_127x108_T_KSVK",\
"ACE_5Rnd_25x59_HEDP_Barrett",\
"ACE_6Rnd_12Ga_Buck00",\
"ACE_6Rnd_12Ga_Slug",\
"ACE_8Rnd_12Ga_Buck00",\
"ACE_8Rnd_12Ga_Slug",\
"ACE_9Rnd_12Ga_Buck00",\
"ACE_9Rnd_12Ga_Slug",\
"ACE_20Rnd_9x18_APS",\
"ACE_64Rnd_9x19_S_Bizon",\
"ACE_12Rnd_45ACP_USPSD",\
"ACE_12Rnd_45ACP_USP",\
"ACE_GlassesGasMask_US",\
"ACE_WireCutter"\
]
