#include "functions.sqf"

current_playergroupname = _this select 0;

IFKilled = { 	
	
	sleep 60;

	["Task7c","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
}; 



["Task7c","Side Mission: Wasps Nest","<br/><br/>Wasps Nest<br/><br/>After the explosion, far south west of Nur, the Insurgency radio chatter is going crazy, Insurgency forces are heading to the source.<br/><br/>Wait for the Insurgency forces and deal with them.",current_playergroupname] call SHK_Taskmaster_add;

 sleep 120;

	_arr = [[1617.000, 11664.0000], 180, "LandRover_MG_TK_INS_EP1", EAST] call bis_fnc_spawnvehicle;
	_vcl2 = _arr select 0;
	_vcl2 doMove [810.000, 10478.000];

waitUntil { nearestPlayers(getPosATL (_vcl2), 1000, true, "count") > 0 };

_vcl3  = createVehicle ["BRDM2_TK_EP1",[1617.000, 11664.0000],[],0,"NONE"];
_vcl3 setDir 210;
_vcl3 addMPEventHandler["MPKilled", { (_this select 0) spawn IFKilled; }];

_vcl4  = createVehicle ["V3S_Open_TK_EP1",[1627.000, 11664.0000],[],0,"NONE"];
_vcl4 setDir 210;


_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [1628.000, 11664.0000], [], 0, "NONE"];
_ai moveInCargo _vcl4;

_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [1629.000, 11664.0000], [], 0, "NONE"];
_ai moveInCargo _vcl4;

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [1630.000, 11664.0000], [], 0, "NONE"];
_ai moveInCargo _vcl4;

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [1631.000, 11664.0000], [], 0, "NONE"];
_ai moveInCargo _vcl4;

_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [1630.000, 11664.0000], [], 0, "NONE"];
_ai assignAsDriver _vcl4;
_ai moveInDriver _vcl4;
_ai doMove [810.000, 10478.000];

sleep 60;


_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [1637.000, 11664.0000], [], 0, "NONE"];
_ai assignAsGunner _vcl3;
_ai moveInGunner _vcl3;

_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [1635.000, 11664.0000], [], 0, "NONE"];
_ai assignAsDriver _vcl3;
_ai moveInDriver _vcl3;
_ai doMove [810.000, 10478.000];

