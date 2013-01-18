#include "functions.sqf"
current_playergroupname = playergroupname;

PowerKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 1;
	"ARTY_R_227mm_HE" createVehicle _pos;
	sleep 2;
	{_x switchLight "OFF"} forEach ((getPos _this) nearObjects ["StreetLamp",1000]);
	{_x switchLight "OFF"} forEach ([7821.00,1665.00,000] nearObjects ["StreetLamp",1000]);

	sleep 5;
	["Task16","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;

	sleep 4;

	[current_playergroupname] execVM ("common\server\sm\14b.sqf");
}; 


["Task16","Side Mission: Buzzing","<br/><br/>Buzzing<br/><br/>British Forces plan to secure the airbase at Loy Manara. To help them, they have asked that the electricity supply to the surrounding area be disrupted. There is a small power substation building in the South, plans for the area show its at co-ordinates are approximately 073, 003. Plans show this building is made from reinforced concrete, so may take some considerable force to destroy it.<br/><br/>Locate the power substation and destroy it",current_playergroupname] call SHK_Taskmaster_add;

_power = createVehicle ["Land_Ind_PowerStation_EP1", [7261.0977, 302.74545], [], 0, "NONE"];
_power setDir -96.927689;
_power setPos [7261.0977, 302.74545];
_power addEventHandler["Killed", { (_this select 0) spawn PowerKilled; }];

_vcl = createVehicle ["Land_PowLines_Transformer1_EP1", [7270.0977, 302.74545], [], 0, "NONE"];

waitUntil { nearestPlayers(getPosATL (_power), 1000, true, "count") > 0 };

_vcl2  = createVehicle ["Offroad_DSHKM_TK_GUE_EP1",[7300.0977, 305.74545],[],0,"NONE"];
_vcl2 setdir 190;
_vcl2 setPos [7300.0977, 305.74545, 0.00];


	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [7272.0977, 200.74545], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [7102.0977, 235.74545], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [7198.0977, 273.74545], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_AT_EP1", [7198.0977, 255.74545], [], 0, "NONE"];

	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [7300.0977, 308.74545], [], 0, "NONE"];
	_ai assignAsGunner _vcl2;
	_ai moveInGunner _vcl2;

	_sniper  = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [7480.0977, 320.74545], [], 0, "NONE"];
	_sniper setskill 0.8;
	_sniper domove [(getpos _sniper select 0) + random 100 - random 100,(getpos _sniper select 1) + random 100 - random 100,0];
