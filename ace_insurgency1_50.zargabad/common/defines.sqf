#define DEBUG		false

//Constants
#define VIEWDISTANCE		1500
#define SPAWNRANGE 			500
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

#define IEDList             ["BAF_ied_v1","BAF_ied_v2","BAF_ied_v3","BAF_ied_v4"]
#define cacheType 			"GuerillaCacheBox_EP1"
#define ammoBoxType			"UNBasicWeapons_EP1"
#define westVehicles 		[humv11,humv12,humv13,humv14,humv15,humv16,atv11,atv12,atv13,atv14,atv15,heli,MHQ]
#define westVehicleStrings	["humv11","humv12","humv13","humv14","humv15","humv16","atv11","atv12","atv13","atv14","atv15","heli","MHQ"]
#define westPlayerStrings	["Hitman111","Hitman112","Hitman113","Hitman114","Hitman115",\
							"Hitman121","Hitman122","Hitman123","Hitman124","Hitman125",\
							"Hitman131","Hitman132","Hitman133","Hitman134","Hitman135",\
							"Hitman141","Hitman142","Hitman143","Hitman144","Hitman145",\
							"Hitman151","Hitman152","Hitman153","Hitman154","Hitman155",\
							"Hitman161","Hitman162","Hitman163","Hitman164","Hitman165"]
#define eastPlayerStrings   ["east1","east2","east3","east4"]
#define westAllClasses		(westSoldierClasses + westVehicleClasses)
#define eastStationaryGuns	["Igla_AA_pod_TK_EP1","KORD_high_UN_EP1","DSHKM_TK_INS_EP1","ZU23_TK_INS_EP1","AGS_TK_INS_EP1"]
#define eastVclClasses		["BRDM2_TK_EP1","M113_TK_EP1","BTR60_TK_EP1","LandRover_MG_TK_INS_EP1",\
							"LandRover_SPG9_TK_INS_EP1","T34_TK_EP1","T55_TK_EP1","KORD_high_UN_EP1",\
							"DSHKM_TK_INS_EP1","ZU23_TK_INS_EP1","AGS_TK_INS_EP1","Mi24_D_TK_EP1","UH1H_TK_EP1"]
#define eastRanks			["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE"] 
#define eastInfClasses		[\
"TK_INS_Warlord_EP1",\
"TK_INS_Soldier_TL_EP1",\
"TK_INS_Bonesetter_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AT_EP1",\
"TK_INS_Soldier_AA_EP1",\
"TK_INS_Soldier_MG_EP1",\
"TK_INS_Soldier_AR_EP1",\
"TK_INS_Soldier_AR_EP1",\
"TK_INS_Soldier_AAT_EP1",\
"TK_INS_Soldier_EP1",\
"TK_INS_Soldier_2_EP1",\
"TK_INS_Soldier_3_EP1",\
"TK_INS_Soldier_4_EP1"\
]

#define eastAllClasses      (eastInfClasses + eastStationaryGuns + eastVclClasses)

//////class definitions						//Change vehicles, Helis to ACE
#define westVehicleClasses  	["hilux1_civil_3_open_EP1","MMT_Civ","M1030_US_DES_EP1","ACE_HMMWV_M2_USARMY","ACE_HMMWV_MK19_USARMY","HMMWV_Ambulance_DES_EP1","Lada2_TK_CIV_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","M1126_ICV_mk19_EP1","M1126_ICV_M2_EP1","CH_47F_EP1","UH1Y","ACE_MH6","BAF_Merlin_HC3_D","AW159_Lynx_BAF","MV22","ACE_UH60M","HMMWV_M1151_M2_DES_EP1","BAF_Jackal2_GMG_D","BAF_Jackal2_L2A1_D","LandRover_CZ_EP1","LandRover_Special_CZ_EP1","BAF_Offroad_D","ArmoredSUV_PMC","SUV_PMC","SUV_PMC_BAF","HMMWV_M998A2_SOV_DES_EP1","BAF_Jackal2_GMG_D","BAF_Jackal2_L2A1_D","LandRover_Special_CZ_EP1","BAF_Offroad_D","ArmoredSUV_PMC","SUV_PMC","ACE_ATV_Honda_Desert"]
#define westSoldierClasses 		["US_Soldier_TL_EP1","US_Soldier_Medic_EP1","US_Soldier_LAT_EP1","US_Soldier_EP1","US_Soldier_GL_EP1","BAF_Soldier_TL_DDPM","BAF_Soldier_Medic_DDPM","BAF_Soldier_AT_DDPM","BAF_Soldier_GL_DDPM","BAF_Soldier_MG_DDPM","US_Delta_Force_TL_EP1","US_Delta_Force_Medic_EP1","US_Delta_Force_MG_EP1","US_Delta_Force_EP1","US_Delta_Force_Night_EP1","USMC_Soldier_TL","USMC_Soldier_Medic","USMC_Soldier_LAT","USMC_Soldier_AR","USMC_Soldier_GL","GER_Soldier_TL_EP1","GER_Soldier_Medic_EP1","GER_Soldier_Scout_EP1","GER_Soldier_EP1","GER_Soldier_MG_EP1","FR_TL","FR_Corpsman","FR_AR","FR_Assault_R","FR_Assault_GL"]

//////unit definitions
#define ATVTYPE         (\
if(INS_ATVType1 == 1)then{"ACE_ATV_Honda_Desert"}else{\
if(INS_ATVType1 == 2)then{"HMMWV_Ambulance_DES_EP1"}else{\
if(INS_ATVType1 == 3)then{"LandRover_CZ_EP1"}else{\
if(INS_ATVType1 == 4)then{"Lada2_TK_CIV_EP1"}else{\
if(INS_ATVType1 == 5)then{"M1030_US_DES_EP1"}else{\
if(INS_ATVType1 == 6)then{"BAF_Offroad_D"}else{\
if(INS_ATVType1 == 7)then{"MMT_Civ"}else{\
if(INS_ATVType1 == 8)then{"SUV_PMC"}else{\
if(INS_ATVType1 == 10)then{"hilux1_civil_3_open_EP1"}else{\
"SUV_PMC_BAF"}}}}}}}}})

#define HELITYPE         (\
if(INS_AdvanceType == 1)then{"ACE_MH6"}else{\
if(INS_AdvanceType == 2)then{"UH1Y"}else{\
if(INS_AdvanceType == 3)then{"CH_47F_EP1"}else{\
if(INS_AdvanceType == 4)then{"BAF_Merlin_HC3_D"}else{\
if(INS_AdvanceType == 5)then{"AW159_Lynx_BAF"}else{\
if(INS_AdvanceType == 6)then{"MV22"}else{\
"ACE_UH60M"}}}}}})

	#define PILOTTYPE          "US_Soldier_Pilot_EP1"
	
	#define CAR1TYPE         (\
if(INS_CarType1 == 1)then{"HMMWV_M1151_M2_DES_EP1"}else{\
if(INS_CarType1 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType1 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType1 == 4)then{"ACE_HMMWV_M2_USARMY"}else{\
if(INS_CarType1 == 5)then{"LandRover_Special_CZ_EP1"}else{\
if(INS_CarType1 == 6)then{"BAF_Offroad_D"}else{\
if(INS_CarType1 == 7)then{"ArmoredSUV_PMC"}else{\
if(INS_CarType1 == 8)then{"SUV_PMC"}else{\
"SUV_PMC_BAF"}}}}}}}})

	#define CAR2TYPE         (\
if(INS_CarType2 == 1)then{"HMMWV_M998A2_SOV_DES_EP1"}else{\
if(INS_CarType2 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType2 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType2 == 4)then{"ACE_HMMWV_MK19_USARMY"}else{\
if(INS_CarType2 == 5)then{"LandRover_Special_CZ_EP1"}else{\
if(INS_CarType2 == 6)then{"BAF_Offroad_D"}else{\
if(INS_CarType2 == 7)then{"ArmoredSUV_PMC"}else{\
if(INS_CarType2 == 8)then{"SUV_PMC"}else{\
"SUV_PMC_BAF"}}}}}}}})

	#define MHQTYPE            "M1130_CV_EP1"

#define humvMagazines [\
["ACE_30Rnd_556x45_SB_Stanag",12],\
["ACE_5Rnd_762x51_T_M24",4],\
["100Rnd_762x51_M240",3],\
["200Rnd_556x45_M249",3],\
["20Rnd_762x51_B_SCAR",8],\
["PipeBomb",2],\
["ACE_Rope_TOW_M_5",1],\
["15Rnd_9x19_M9",4],\
["HandGrenade_West",4],\
["SmokeShell",4],\
["SmokeShellBlue",4],\
["SmokeShellGreen",4],\
["SmokeShellOrange",4],\
["SmokeShellPurple",4],\
["SmokeShellRed",4],\
["SmokeShellYellow",4],\
["ACE_M7A3",4],\
["ACE_ANM14",4],\
["ACE_M84",4],\
["1Rnd_HE_M203",6],\
["IR_Strobe_Target",6],\
["ACE_Bandage",12],\
["ACE_Morphine",12],\
["ACE_Epinephrine",12],\
["ACE_Medkit",6]\
]

#define humvItems [\
["ACE_Stretcher",1],\
["ACE_JerryCan_Dummy_15",1]\
]

#define heliMagazines [\
["ACE_30Rnd_556x45_SB_Stanag",4],\
["ACE_5Rnd_762x51_T_M24",4],\
["100Rnd_762x51_M240",1],\
["200Rnd_556x45_M249",1],\
["20Rnd_762x51_B_SCAR",8],\
["ACE_30Rnd_9x19_S_MP5",6],\
["PipeBomb",2],\
["15Rnd_9x19_M9",4],\
["HandGrenade_West",4],\
["SmokeShell",2],\
["SmokeShellBlue",2],\
["SmokeShellGreen",2],\
["SmokeShellOrange",2],\
["SmokeShellPurple",2],\
["SmokeShellRed",2],\
["SmokeShellYellow",2],\
["ACE_M7A3",2],\
["ACE_ANM14",2],\
["ACE_M84",2],\
["IR_Strobe_Target",2],\
["ACE_Bandage",7],\
["ACE_Morphine",7],\
["ACE_Epinephrine",7],\
["ACE_Medkit",4]\
]

#define heliItems [\
["ACE_Stretcher",2],\
["ACE_ParachutePack",10],\
["ACE_ParachuteRoundPack",10],\
["ACE_MP5A5",2],\
["ACE_JerryCan_Dummy_15",1]\
]
