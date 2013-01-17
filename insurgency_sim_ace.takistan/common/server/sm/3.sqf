#include "functions.sqf"
current_playergroupname = playergroupname;

TankKilled = { 	

	sleep 4;	

	["Task5","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};

AmmoKilled = { 	
	_pos	= getPosATL(_this);

	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 2;
}; 


["Task5","Side Mission: War Horse","<br/><br/><br/>War Horse<br/><br/>It appears that the Insurgency forces may have acquired a new tank from the Russians and are trialing the weapon systems. Locals have reported that recent shelling on the hills west of Bastam have been killing their goats.<br/><br/>Recce the area West of Bastam, locate any enemy forces and destroy all equipment and ordanance including the new tank before it can be rearmed.",playergroupname] call SHK_Taskmaster_add;

_tank  = createVehicle ["T90",[5335.3037, 9348.7285],[],0,"NONE"];
_tank setVehicleAmmo 0.1;
_tank setFuel 0;

_tank addEventHandler["Killed", { (_this select 0) spawn TankKilled; }];


_vcl  = createVehicle ["T72_INS",[5353.7422, 9354.7314],[],0,"NONE"];
_vcl setVehicleAmmo 0;
_vcl setFuel 0;
_vcl lockDriver true;
_vcl lockturret [[0],true];
_vcl  = createVehicle ["Ural_INS",[5369.8848, 9371.6504],[],0,"NONE"];

_vcl  = createVehicle ["TKVehicleBox_EP1",[5372.8848, 9373.6504],[],0,"NONE"];
_vcl addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];


waitUntil { nearestPlayers(getPosATL (_tank), 1000, true, "count") > 0 };

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [5370.8848, 9373.6504], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [5362.6108, 9364.626], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [5356.7422, 9358.7314], [], 0, "NONE"];

_ai  = _group createUnit ["TK_INS_Soldier_EP1", [5369.8848, 9375.6504], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_EP1", [5370.8848, 9375.6504], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [5353.1191, 9354.7314], [], 0, "NONE"];

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5323.1191, 9354.7314], [], 0, "NONE"];

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5333.1191, 9354.7314], [], 0, "NONE"];


_gunner  = _group createUnit ["TK_INS_Soldier_EP1", [5338.8848, 9375.6504], [], 0, "NONE"];
_gunner assignAsGunner _tank;
_gunner moveInGunner _tank;

_tank lockDriver true;
_tank lockturret [[0],true];