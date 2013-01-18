
//Misc
#define night						(daytime >= 18 || daytime <= 6)
#define time2                   	(time - startTime)
#define isEast						(typeOf player in eastInfCivClasses)
#define isWest						(typeOf player in westSoldierClasses)
#define isWestLeader					(typeOf player in westLeaderClasses)
#define isWestNormal					(typeOf player in westNormalClasses)
#define isWestMachineGunner				(typeOf player in westMachineGunClasses)
#define isWestMarksman					(typeOf player in westMarksmanClasses)
#define remoteControlling       	(typeOf cameraOn == HELITYPE && (driver cameraOn in units group player || !(player in crew cameraOn)))
#define sTypes						["#ZRPole", "#ZRTrava"]

//Gear
#define leaderItems              	[]
#include "gear\loadouts.sqf"

//Injured
#define healPlace0               	[0.75,0.15,0]
#define healPlace1               	[-0.75,0.1,0] 
#define healInjuredModelChestPos 	[0,0.08,0]
#define bloodloosCrit            	30
#define bloodlossFreq            	60
#define bloodlossInc             	5
#define reviveTime               	300
#define minHealTime              	20
#define healAnims		         	["ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic","ainvpknlmstpsnonwrfldnon_medic","ainvpknlmstpsnonwrfldr_medic0s","ainvpknlmstpsnonwrfldnon_medic0s","ainvpknlmstpsnonwrfldr_medic0","ainvpknlmstpsnonwrfldnon_medic0","ainvpknlmstpsnonwrfldr_medic1","ainvpknlmstpsnonwrfldnon_medic1","ainvpknlmstpsnonwrfldr_medic2","ainvpknlmstpsnonwrfldnon_medic2","ainvpknlmstpsnonwrfldr_medic3","ainvpknlmstpsnonwrfldnon_medic3","ainvpknlmstpsnonwrfldr_medic4","ainvpknlmstpsnonwrfldnon_medic4","ainvpknlmstpsnonwrfldr_medic5","ainvpknlmstpsnonwrfldnon_medic5"]
#define draggedAnim              	"ainjppnemstpsnonwrfldb_still"
#define draggerAnims             	["acinpknlmstpsraswrfldnon","acinpknlmwlksraswrfldb"]
#define carrierAnim              	"acinpercmstpsraswrfldnon"
#define carriedAnims             	["ainjpfalmstpsnonwrfldnon_carried_up","ainjpfalmstpsnonwrfldnon_carried_down","ainjpfalmstpsnonwrfldnon_carried_still","ainjpfalmstpsnonwrfldf_carried_fallwc"]

//Respawn
#define respawnRange            	75
#define A10respawn         		1800
#define artyRespawn			1800
