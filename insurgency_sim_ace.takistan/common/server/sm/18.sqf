#include "functions.sqf"
current_playergroupname = playergroupname;

CruiseKilled = { 
	_pos	= getPosATL(_this);

	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep 4;
	["Task20","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};

["Task20","Side Mission: Cruising","<br/><br/>Cruising<br/><br/>A Tomahawk Cruise Missile has launched however it's failed mid-flight due to an electronics failure. Tracking the missile it was west of Mulladost.<br/><br/>Locate and destroy the missile before the Insurgency forces can get it's hands on it.",playergroupname] call SHK_Taskmaster_add;

_vehicle  = createVehicle ["Chukar_EP1",[1138.44,7387.92,0],[],0,"NONE"];
_vehicle setPos [(getpos _vehicle select 0) + random 100 - random 100,(getpos _vehicle select 1) + random 100 - random 100,0];
_vehicle lockDriver true;
_vehicle addEventHandler["Killed", { (_this select 0) spawn CruiseKilled; }];

_vcl  = createVehicle ["Offroad_DSHKM_TK_GUE_EP1",[1175.00,7424.00],[],0,"NONE"];
_vcl setPos [1175.00,7424.0];

_vcl2  = createVehicle ["Pickup_PK_TK_GUE_EP1",[1077.00,7833.00],[],0,"NONE"];
_vcl2 setdir 135;
_vcl2 setPos [1077.00,7833.00];


waitUntil { nearestPlayers(getPosATL (_vcl), 1000, true, "count") > 0 };

	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [1180.00,7423.0], [], 0, "NONE"];

	_ai  = _group createUnit ["TK_INS_Soldier_AR_EP1", [1182.00,7424.0], [], 0, "NONE"];

	_ai  = _group createUnit ["TK_INS_Soldier_AR_EP1", [1184.00,7425.0], [], 0, "NONE"];
	_ai assignAsGunner _vcl;
	_ai moveInGunner _vcl;

	_ai  = _group createUnit ["TK_INS_Soldier_EP1", [1075.00,7835.0], [], 0, "NONE"];
	_ai assignAsGunner _vcl2;
	_ai moveInGunner _vcl2;

	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [1074.00,7836.0], [], 0, "NONE"];

	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [1424.00,8176.0], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [1425.00,8174.0], [], 0, "NONE"];

		

	
