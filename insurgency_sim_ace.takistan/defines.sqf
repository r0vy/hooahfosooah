//////map specific definitions/macros
//spawnPos must remain available in global missionNamespace, a definition does not
spawnPos =					[0,0,0];
#define CENTERPOS			[6000.00,5500.00,0]
#define AORADIUS 			8000
#define CACHEHOUSEPOSITIONS ["Land_House_K_1_EP1",[1,2,3,4],"Land_House_L_4_EP1",[6],"Land_House_C_5_V3_EP1",[0,2,6],"Land_House_C_12_EP1",[5,6],"Land_House_K_3_EP1",[9,1,2,3,5],"Land_House_C_5_V2_EP1",[4,0,1,5],"Land_House_L_8_EP1",[3,7,8,9],"Land_House_C_4_EP1",[7,12,13,15],"Land_House_C_2_EP1",[1,2,5,6,7,8,9],"Land_House_L_7_EP1",[0,1,2,3,4,5],"Land_House_C_10_EP1",[7,8,9,10,11,12,13,14],"Land_House_K_6_EP1",[6,7,8,9,10],"Land_House_C_11_EP1",[7,8,9,10],"Land_House_C_9_EP1",[2,3,4,5],"Land_House_C_3_EP1",[7,8,9,10,11,12,13,28,29,30,31,32],"Land_A_Office01_EP1",[5,6],"Land_A_Mosque_small_1_EP1",[3,4,5],"Land_A_Stationhouse_ep1",[6,9,13],"Land_House_C_5_EP1",[3,4,5],"Land_House_K_7_EP1",[4,5,6,11],"Land_Mil_ControlTower_EP1",[2,3,4,6],"Land_House_C_5_V1_EP1",[6,7],"Land_House_K_8_EP1",[4,0,1,2,3],"Land_A_BuildingWIP_EP1",[18,20,24,25,26,27,28,29,30,31],"Land_A_Villa_EP1",[4,6,7,8,9],"Land_House_C_1_EP1",[0,1,2,3,4],"Land_House_L_6_EP1",[4,0,3],"Land_House_L_3_EP1",[0,1,2],"Land_House_K_5_EP1",[1,2],"Land_House_C_1_v2_EP1",[0,1,2,3]]

#define GUNROOFPOSITIONS   	["Land_House_L_4_EP1",[[2,0],[3,0.2],[5,0]],"Land_House_L_3_EP1",[[3,0.8],[4,0.1]],"Land_House_C_12_EP1",[[7,0.9],[8,0.9],[9,0.6],[10,0.5]],"Land_House_C_5_V2_EP1",[[6,0.6],[7,0.7]],"Land_House_L_8_EP1",[[10,0.9],[11,0.9],[12,0.9],[13,1],[14,0.2],[15,0.8],[17,0.8]],"Land_House_C_4_EP1",[[5,0.1],[14,0.2]],"Land_House_L_6_EP1",[[1,0],[2,0]],"Land_House_C_10_EP1",[[18,0.9],[19,0.9],[20,0.6],[21,0.9]],"Land_House_K_6_EP1",[[11,0.1]],"Land_House_C_9_EP1",[[6,0.2]],"Land_House_C_3_EP1",[[14,0],[15,0],[16,0.4],[18,0],[19,0.4],[20,0],[21,0.1],[22,0],[23,0.3],[24,0.4],[25,0.4],[26,0.3],[27,0.4]],"Land_A_Office01_EP1",[[1,0.5]],"Land_A_Minaret_Porto_EP1",[[3,0],[5,0],[8,0],[9,0],[10,0.9],[11,0],[12,0],[13,0]],"Land_A_Stationhouse_ep1",[[14,0.8],[15,0.8],[16,0],[17,0],[18,0.1],[19,0],[20,0.1],[22,0.1],[23,0.3],[24,0.1],[25,0.2]],"Land_House_C_5_EP1",[[0,0.7],[1,0.9],[2,1],[6,0.8],[7,0.6]],"Land_House_K_7_EP1",[[12,0.1],[13,0],[14,0]],"Land_Mil_ControlTower_EP1",[[9,0.2],[10,0],[11,0],[12,0],[13,0],[14,0.3],[15,0],[16,0]],"Land_A_Mosque_big_hq_EP1",[[11,1],[12,0]],"Land_A_Mosque_big_minaret_2_EP1",[[2,0.9]],"Land_House_C_5_V1_EP1",[[0,0.7],[1,0.7],[5,0.6]],"Land_A_BuildingWIP_EP1",[[19,0.7],[22,0.9],[23,0.4],[33,0.1],[39,0.6],[40,0.5],[41,0.6],[47,0],[48,0.5],[53,0.6],[54,0.5],[55,0.1],[56,0.3],[57,0.2],[60,0.3]],"Land_House_K_8_EP1",[[5,0.2],[12,0.1]],"Land_Ind_Oil_Tower_EP1",[[2,0],[3,0],[4,0]],"Land_A_Villa_EP1",[[10,0.5],[11,0.5],[12,0.5],[13,0.5],[14,0.5]]]
#define ILLEGALHOUSES		["Land_Mil_hangar_EP1", "Land_Mil_ControlTower_EP1", "Land_Mil_Guardhouse_EP1", "Land_Mil_Repair_center_EP1","Land_A_Minaret_EP1","Land_Ind_Coltan_Main_EP1"]
// set EP1HOUSES to 'true' in order to have the param ignored and AI will spawn in every building, which got positions
#define EP1HOUSES			true
#define randPos				[(CENTERPOS select 0)+random 6000-random 6000,(CENTERPOS select 1)+random 6000-random 6000, 0]
#define cacheRadius		 	500
#define intelRadius			700

//////class definitions
#define westVehicleClasses  	["hilux1_civil_3_open_EP1","MMT_Civ","M1030_US_DES_EP1","HMMWV_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_Ambulance_DES_EP1","MtvrRepair_DES_EP1","Lada2_TK_CIV_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","M1126_ICV_mk19_EP1","M1126_ICV_M2_EP1","CH_47F_EP1","UH1Y","MH6J_EP1","BAF_Merlin_HC3_D","AW159_Lynx_BAF","MV22","UH60M_EP1","HMMWV_M1151_M2_DES_EP1","BAF_Jackal2_GMG_D","BAF_Jackal2_L2A1_D","LandRover_CZ_EP1","LandRover_Special_CZ_EP1","BAF_Offroad_D","ArmoredSUV_PMC","SUV_PMC","SUV_PMC_BAF","HMMWV_M998A2_SOV_DES_EP1","BAF_Jackal2_GMG_D","BAF_Jackal2_L2A1_D","LandRover_CZ_EP1","LandRover_Special_CZ_EP1","BAF_Offroad_D","ArmoredSUV_PMC","SUV_PMC","BAF_FV510_D",ATVTYPE,HELITYPE]
#define limitedSquadGear    	[]
#define limitedGearList     	[]
#define westSoldierClasses 	["US_Soldier_TL_EP1","US_Soldier_Medic_EP1","US_Soldier_MG_EP1","US_Soldier_Marksman_EP1","US_Soldier_EP1","US_Soldier_GL_EP1","BAF_Soldier_TL_MTP","BAF_Soldier_Medic_MTP","BAF_Soldier_MG_MTP","BAF_Soldier_Marksman_MTP","BAF_Soldier_GL_MTP","US_Delta_Force_TL_EP1","US_Delta_Force_Medic_EP1","US_Delta_Force_MG_EP1","US_Delta_Force_EP1","US_Delta_Force_Marksman_EP1","USMC_Soldier_TL","USMC_Soldier_Medic","USMC_Soldier_LAT","USMC_Soldier_AR","USMC_Soldier_GL","GER_Soldier_TL_EP1","GER_Soldier_Medic_EP1","GER_Soldier_Scout_EP1","GER_Soldier_EP1","GER_Soldier_MG_EP1","FR_TL","FR_Corpsman","FR_AR","FR_Assault_R","FR_Assault_GL","CZ_Special_Forces_TL_DES_EP1","CZ_Special_Forces_GL_DES_EP1","CZ_Soldier_DES_EP1","CZ_Soldier_MG_DES_EP1","CZ_Soldier_medik_DES_EP1","ACE_CZ_Medic_EP1"]
#define westLeaderClasses	["US_Soldier_TL_EP1","BAF_Soldier_TL_MTP","GER_Soldier_TL_EP1","CZ_Special_Forces_TL_DES_EP1","US_Delta_Force_TL_EP1"]
#define westNormalClasses	["US_Soldier_Medic_EP1","US_Soldier_EP1","US_Soldier_GL_EP1","BAF_Soldier_Medic_MTP","BAF_Soldier_GL_MTP","GER_Soldier_Medic_EP1","GER_Soldier_EP1","CZ_Soldier_medik_DES_EP1","CZ_Soldier_DES_EP1","US_Delta_Force_Medic_EP1","US_Delta_Force_EP1","ACE_CZ_Medic_EP1"]
#define westMachineGunClasses	["US_Soldier_MG_EP1", "BAF_Soldier_MG_MTP","GER_Soldier_MG_EP1","CZ_Soldier_MG_DES_EP1","US_Delta_Force_MG_EP1"]
#define westMarksmanClasses	["US_Soldier_Marksman_EP1","BAF_Soldier_Marksman_MTP","GER_Soldier_Scout_EP1","CZ_Special_Forces_GL_DES_EP1","US_Delta_Force_Marksman_EP1"]

//////unit definitions

#define ATVTYPE         (\
if(INS_ATVType == 1)then{"ATV_US_EP1"}else{\
if(INS_ATVType == 2)then{"HMMWV_Ambulance_DES_EP1"}else{\
if(INS_ATVType == 3)then{"LandRover_CZ_EP1"}else{\
if(INS_ATVType == 4)then{"Lada2_TK_CIV_EP1"}else{\
if(INS_ATVType == 5)then{"M1030_US_DES_EP1"}else{\
if(INS_ATVType == 6)then{"BAF_Offroad_D"}else{\
if(INS_ATVType == 7)then{"MMT_Civ"}else{\
if(INS_ATVType == 8)then{"SUV_PMC"}else{\
if(INS_ATVType == 9)then{"hilux1_civil_3_open_EP1"}else{\
"SUV_PMC_BAF"}}}}}}}}})


#define HELITYPE         (\
if(INS_AdvanceType == 1)then{"MH6J_EP1"}else{\
if(INS_AdvanceType == 2)then{"UH1Y"}else{\
if(INS_AdvanceType == 3)then{"CH_47F_EP1"}else{\
if(INS_AdvanceType == 4)then{"BAF_Merlin_HC3_D"}else{\
if(INS_AdvanceType == 5)then{"AW159_Lynx_BAF"}else{\
if(INS_AdvanceType == 6)then{"MV22"}else{\
"UH60M_EP1"}}}}}})

	#define PILOTTYPE          "US_Soldier_Pilot_EP1"
	
#define CAR1TYPE         (\
if(INS_CarType1 == 1)then{"HMMWV_M1151_M2_DES_EP1"}else{\
if(INS_CarType1 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType1 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType1 == 4)then{"HMMWV_M998_crows_M2_DES_EP1"}else{\
if(INS_CarType1 == 5)then{"LandRover_Special_CZ_EP1"}else{\
if(INS_CarType1 == 6)then{"BAF_Offroad_D"}else{\
if(INS_CarType1 == 7)then{"ArmoredSUV_PMC"}else{\
if(INS_CarType1 == 8)then{"SUV_PMC"}else{\
"SUV_PMC_BAF"}}}}}}}})

#define CAR2TYPE         (\
if(INS_CarType2 == 1)then{"HMMWV_M1151_M2_DES_EP1"}else{\
if(INS_CarType2 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType2 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType2 == 4)then{"HMMWV_M998_crows_M2_DES_EP1"}else{\
if(INS_CarType2 == 5)then{"LandRover_Special_CZ_EP1"}else{\
if(INS_CarType2 == 6)then{"BAF_Offroad_D"}else{\
if(INS_CarType2 == 7)then{"ArmoredSUV_PMC"}else{\
if(INS_CarType2 == 8)then{"SUV_PMC"}else{\
"SUV_PMC_BAF"}}}}}}}})

#define CAR3TYPE         (\
if(INS_CarType3 == 1)then{"HMMWV_M1151_M2_DES_EP1"}else{\
if(INS_CarType3 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType3 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType3 == 4)then{"HMMWV_M998_crows_M2_DES_EP1"}else{\
if(INS_CarType3 == 5)then{"HMMWV_Ambulance_DES_EP1"}else{\
if(INS_CarType3 == 6)then{"HMMWV_M1035_DES_EP1"}else{\
if(INS_CarType3 == 7)then{"MtvrRepair_DES_EP1"}else{\
if(INS_CarType3 == 8)then{"LandRover_Special_CZ_EP1"}else{\
"BAF_Offroad_D"}}}}}}}})

#define CAR4TYPE         (\
if(INS_CarType4 == 1)then{"HMMWV_M1151_M2_DES_EP1"}else{\
if(INS_CarType4 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType4 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType4 == 4)then{"HMMWV_M998_crows_M2_DES_EP1"}else{\
if(INS_CarType4 == 5)then{"HMMWV_Ambulance_DES_EP1"}else{\
if(INS_CarType4 == 6)then{"HMMWV_M1035_DES_EP1"}else{\
if(INS_CarType4 == 7)then{"MtvrRepair_DES_EP1"}else{\
if(INS_CarType4 == 8)then{"LandRover_Special_CZ_EP1"}else{\
"BAF_Offroad_D"}}}}}}}})

#define CAR5TYPE         (\
if(INS_CarType5 == 1)then{"HMMWV_M998A2_SOV_DES_EP1"}else{\
if(INS_CarType5 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType5 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType5 == 4)then{"HMMWV_M998_crows_M2_DES_EP1"}else{\
if(INS_CarType5 == 5)then{"HMMWV_Ambulance_DES_EP1"}else{\
if(INS_CarType5 == 6)then{"HMMWV_DES_EP1"}else{\
if(INS_CarType5 == 7)then{"MtvrRepair_DES_EP1"}else{\
if(INS_CarType5 == 8)then{"LandRover_Special_CZ_EP1"}else{\
"BAF_Offroad_D"}}}}}}}})

#define CAR6TYPE         (\
if(INS_CarType6 == 1)then{"HMMWV_M998A2_SOV_DES_EP1"}else{\
if(INS_CarType6 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType6 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType6 == 4)then{"HMMWV_M998_crows_M2_DES_EP1"}else{\
if(INS_CarType6 == 5)then{"HMMWV_Ambulance_DES_EP1"}else{\
if(INS_CarType6 == 6)then{"HMMWV_DES_EP1"}else{\
if(INS_CarType6 == 7)then{"MtvrRepair_DES_EP1"}else{\
if(INS_CarType6 == 8)then{"LandRover_Special_CZ_EP1"}else{\
"BAF_Offroad_D"}}}}}}}})

#define CAR7TYPE         (\
if(INS_CarType7 == 1)then{"HMMWV_M998A2_SOV_DES_EP1"}else{\
if(INS_CarType7 == 2)then{"BAF_Jackal2_GMG_D"}else{\
if(INS_CarType7 == 3)then{"BAF_Jackal2_L2A1_D"}else{\
if(INS_CarType7 == 4)then{"HMMWV_M998_crows_M2_DES_EP1"}else{\
if(INS_CarType7 == 5)then{"HMMWV_Ambulance_DES_EP1"}else{\
if(INS_CarType7 == 6)then{"HMMWV_DES_EP1"}else{\
if(INS_CarType7 == 7)then{"MtvrRepair_DES_EP1"}else{\
if(INS_CarType7 == 8)then{"LandRover_Special_CZ_EP1"}else{\
"BAF_Offroad_D"}}}}}}}})


	#define MHQTYPE            "M1130_CV_EP1"

/////weapon and magazine definitions
#define ATTYPE "M136"
#define ATMAGTYPE "M136"

#define humvMagazines [\
["PipeBomb",2],\
["HandGrenade_West",4],\
["SmokeShell",4],\
["1Rnd_HE_M203",8],\
["ACE_C4_M",2],\
["ACE_Claymore_M",2],\
["ACE_Bandage",12],\
["ACE_Morphine",12],\
["ACE_Epinephrine",12],\
["ACE_Medkit",8],\
["ACE_Rope_TOW_M_5",1],\
["ACE_Rope_M5",1],\
["ACE_SandBag_Magazine",4],\
["ACE_8Rnd_12Ga_Slug",2],\
["ACE_Battery_Rangefinder",2],\
["ACE_Knicklicht_R",4],\
["ACE_Knicklicht_G",4],\
["ACE_Bodybag",2]\
]