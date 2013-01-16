
//Misc
#define night						(daytime >= 18 || daytime <= 6)
#define time2                   	(time - startTime)
#define isEast						(typeOf player in eastInfClasses)
#define isWest						(typeOf player in westSoldierClasses)
#define remoteControlling       	(typeOf cameraOn == HELITYPE && (driver cameraOn in units group player || !(player in crew cameraOn)))
#define sTypes						["#ZRPole", "#ZRTrava"]

//Gear
#define leaderItems              	[]

//Respawn
#define respawnRange            	75
#define A10respawn         			1500
#define artyRespawn					1800
