#include "functions.sqf"
current_playergroupname = _this select 0;

IEDKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 2;
	"ARTY_R_227mm_HE" createVehicle _pos;
	sleep random 3;
	"ARTY_R_227mm_HE" createVehicle _pos;

	["Task7b","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;

	sleep 4;

	[current_playergroupname] execVM ("common\server\sm\5c.sqf");


}; 


["Task7b","Side Mission: Hidden Treasures","<br/><br/>Hidden Treasures<br/><br/>From the IED explosives and trigger devices recovered, we now have enough evidence to help locate where the explosives might have come from. A local informant has come foward with further explosives which are a match. He has divulged the location of the explosives stash, stating that you take the road out of Nur and head south, the road snakes to the right and head towards the hills.<br/><br/>Locate the IED stash of explosives and destroy them before the Insurgency forces can collect them.",current_playergroupname] call SHK_Taskmaster_add;

	_ied = createVehicle ["TKVehicleBox_EP1", [810.000, 10478.000], [], 0, "CAN_COLLIDE"];
	_ied addEventHandler["Killed", { (_this select 0) spawn IEDKilled; }];
	_ied setPos [(getpos _ied select 0) + random 300 - random 300,(getpos _ied select 1) + random 300 - random 300,0];

	
_msc = createVehicle ["CampEast_EP1", [810.000, 10478.000], [], 0, "CAN_COLLIDE"];
_msc = createVehicle ["Misc_TyreHeapEP1", [810.000, 10478.000], [], 0, "CAN_COLLIDE"];

waitUntil { nearestPlayers(getPosATL (_ied), 1000, true, "count") > 0 };

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [810.000, 10478.000], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [812.000, 10478.000], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [814.000, 10478.000], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [816.000, 10478.000], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_AT_EP1", [818.000, 10478.000], [], 0, "NONE"];
_ai doMove (position _msc);

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [820.000, 10478.000], [], 0, "NONE"];
_ai doMove (position _msc);
