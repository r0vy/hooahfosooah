#include "functions.sqf"
current_playergroupname = playergroupname;

LeaderKilled = {

	sleep 4;
 	
	["Task10","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;

	sleep 4;

	[current_playergroupname] execVM ("common\server\sm\8b.sqf");
}; 

["Task10","Side Mission: Leader of the Gang","<br/><br/>Leader of the Gang<br/><br/>Insurgency officer is hiding out far North West of Feruz Abad. We don't have precise details. We believe that the officer may have additional intelligence on Insurgency units.<br/><br/>Search out the leader and remove him.",current_playergroupname] call SHK_Taskmaster_add;

_msc = createVehicle ["Misc_TyreHeapEP1", [4765.0215,6780.3735], [], 0, "NONE"];

_msc = createVehicle ["CampEast_EP1", [4672.000, 6798.000], [], 0, "CAN_COLLIDE"];

waitUntil { nearestPlayers(getPosATL (_msc), 1000, true, "count") > 0 };


_group  = ["static","Grp","","east"] call getGroup;

_leader  = _group createUnit ["TK_Soldier_Officer_EP1", [4672.000, 6798.000], [], 0, "NONE"];
_leader setPos [4672.000, 6798.000];
_leader setbehaviour "AWARE";
_leader setRank "COLONEL";
_leader addEventHandler["Killed", { (_this select 0) spawn LeaderKilled; }];

_ai1  = _group createUnit ["TK_INS_Soldier_4_EP1", [4766.0215,6780.3735], [], 0, "NONE"];
doStop _ai1;

_ai  = _group createUnit ["TK_INS_Soldier_AT_EP1", [4766.0215,6785.3735], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_Sniper_EP1", [4766.0215,6784.3735], [], 0, "NONE"];


_ai2  = _group createUnit ["TK_INS_Soldier_MG_EP1", [4871.00,6782.00], [], 0, "NONE"];
doStop _ai2;

_ai3  = _group createUnit ["TK_INS_Soldier_MG_EP1", [4775.00,6687.00], [], 0, "NONE"];
doStop _ai3;

_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [4780.00, 6687.000], [], 0, "NONE"];
_ai doMove (position _leader);

_ai4  = _group createUnit ["TK_INS_Soldier_AA_EP1", [4780.00, 6687.000], [], 0, "NONE"];
doStop _ai4;

_ai5  = _group createUnit ["TK_INS_Soldier_MG_EP1", [4660.00,6813.00], [], 0, "NONE"];
doStop _ai5;

_ai6  = _group createUnit ["TK_INS_Soldier_2_EP1", [4610.00, 6881.000], [], 0, "NONE"];
doStop _ai6;

