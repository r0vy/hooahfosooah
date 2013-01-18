#include "functions.sqf"
current_playergroupname = playergroupname;

RadioKilled = { 	

	sleep 4;

	["Task3","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};


["Task3","Side Mission: Radio Gaga","<br/><br/><br/>Radio Gaga<br/><br/>Intel suggests insurgency have an active radio tower on the mount of Gur Dur.<br/><br/>Locate the tower and destroy it.",playergroupname] call SHK_Taskmaster_add;

_vcl  = createVehicle ["Land_radar_EP1",[8036.37,6174.79],[],0,"NONE"];
_vcl addEventHandler["Killed", { (_this select 0) spawn RadioKilled; }];

_vcl  = createVehicle ["PowGen_Big_EP1",[8037.37,6175.79],[],0,"NONE"];

waitUntil { nearestPlayers(getPosATL (_vcl), 800, true, "count") > 0 };

_group  = ["static","Grp","","east"] call getGroup;

_ai1  = _group createUnit ["TK_INS_Soldier_MG_EP1", [8038.37,6180.79], [], 0, "NONE"];

_ai2  = _group createUnit ["TK_INS_Soldier_AT_EP1", [8038.37,6177.79], [], 0, "NONE"];

_ai3  = _group createUnit ["TK_INS_Soldier_Sniper_EP1", [8039.37,6180.79], [], 0, "NONE"];

_ai4  = _group createUnit ["TK_INS_Soldier_AA_EP1", [8045.00,6182.79], [], 0, "NONE"];
