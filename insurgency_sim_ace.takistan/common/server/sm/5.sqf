#include "functions.sqf"
current_playergroupname = playergroupname;

IEDKilled = { 	
	"ARTY_R_227mm_HE" createVehicle [2281.491, 11568.728, -6.1035156e-005];
	["Task7","succeeded"] call SHK_Taskmaster_upd;
	deletevehicle ied2;
	
	{_x addscore +5;} foreach units current_playergroupname;
	sleep 4;

	[current_playergroupname] execVM ("common\server\sm\5b.sqf");
}; 


["Task7","Side Mission: Big Bang Theory","<br/><br/>Big Bang Theory<br/><br/>A mobile phone from a recent Insurgent fighter has been recovered, the phone only has a single contact called 022 115. We suspect he was a triggerman.<br/><br/>Locate the IED source and destroy it.",current_playergroupname] call SHK_Taskmaster_add;

	_ied = createVehicle ["Lada1_TK_CIV_EP1", [2281.491, 11568.728], [], 0, "CAN_COLLIDE"];
	_ied setpos [2282.491, 11568.728];
	_ied setVehicleArmor 0.5;
	_ied setFuel 0;
	_ied lockDriver true;
	_ied lockCargo true;
	_ied addEventHandler["Killed", { (_this select 0) spawn IEDKilled; }];
	
ied2 = createVehicle ["Land_IED_v1_PMC", [2281.491, 11568.728], [], 0, "CAN_COLLIDE"];
ied2 setpos [2281.491, 11568.728];

_msc = createVehicle ["UralWreck", [2282.00, 11589.000], [], 0, "CAN_COLLIDE"];
_msc = createVehicle ["Land_Misc_IronPipes_EP1", [2292.00, 11555.000], [], 0, "CAN_COLLIDE"];
_set setpos [2292.00, 11555.000];
_msc = createVehicle ["Land_Misc_ConcPipeline_EP1", [2257.00, 11594.000], [], 0, "CAN_COLLIDE"];
_msc = createVehicle ["Land_Misc_ConcPipeline_EP1", [2257.00, 11584.000], [], 0, "CAN_COLLIDE"];
_msc setdir 18;
_msc = createVehicle ["Land_Misc_Rubble_EP1", [2298.00, 11532.000], [], 0, "CAN_COLLIDE"];
_msc = createVehicle ["Land_Misc_Garb_Heap_EP1", [2271.00, 11558.000], [], 0, "CAN_COLLIDE"];

waitUntil { nearestPlayers(getPosATL (_ied), 1000, true, "count") > 0 };

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [2151.491, 11523.728], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [2226.000, 11352.00], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [2111.491, 11468.728], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [2105.491, 11468.728], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [2101.491, 11468.728], [], 0, "NONE"];
_ai doMove (position _ied);

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [2581.491, 11568.728], [], 0, "NONE"];
_ai doMove (position _ied);

	_ai  = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [2226.000, 11352.00], [], 0, "NONE"];
	_ai setskill 0.8;