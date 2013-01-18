#include "functions.sqf"
current_playergroupname = playergroupname;

HindKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep 5;
	["Task12","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
}; 


AmmoKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 2;
	"ARTY_R_227mm_HE" createVehicle _pos;
	sleep random 3;
	"ARTY_R_227mm_HE" createVehicle _pos;
}; 

["Task12","Side Mission: The Flying Tank","<br/><br/>The Flying Tank<br/><br/>The Insurgency forces have access to the Mi-23 Hind helicopter, it has already been used to attack a UN Patrol today. Intel suggests that it has returned to is base in the center of Rasman to be refueled and rearmed.<br/><br/>Destroy the Hind and while you are at it take out the supply trucks.",playergroupname] call SHK_Taskmaster_add;


_hind = createVehicle ["Mi24_D_TK_EP1", [6048.9458, 10468.565], [], 0, "NONE"];
_hind setVehicleArmor 0.5;
_hind setFuel 0;
_hind lockDriver true;
_hind lockturret [[0],true];
_hind lockCargo true;
_hind addMPEventHandler["MPKilled", { (_this select 0) spawn HindKilled; }];


_ammo = createVehicle ["UralReammo_TK_EP1", [6060.4736, 10466.785], [], 0, "NONE"];
_ammo setDir 100.00;
_ammo setVehicleArmor 0.5;
_ammo lockDriver true;
_ammo addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

_ammo = createVehicle ["UralRefuel_TK_EP1", [6057.0063, 10461.318], [], 0, "NONE"];
_ammo setDir 120.00;
_ammo setVehicleArmor 0.5;
_ammo lockDriver true;
_ammo addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

waitUntil { nearestPlayers(getPosATL (_hind), 1000, true, "count") > 0 };

	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [6053.0063, 10462.318], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [6055.0063, 10464.318], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [6060.0063, 10465.318], [], 0, "NONE"];

