#include "functions.sqf"
current_playergroupname = _this select 0;

_well_installed = false;

["Task26b","Side Mission: Wishing Well","<br/><br/>Wishing Well<br/><br/>Water supplies are now waiting at the airbase North West of Rasman.<br/><br/>Deliver the supplies to the village of Ahmaday and setup a new well at the T-junction.<br/><br/>The well supply boxes can be dragged by hand to position them and airlifted by Chinook (will load under Chinook). Once in position, the supply boxes can be used to install a new well.",current_playergroupname] call SHK_Taskmaster_add;


_msc = createVehicle ["Misc_TyreHeapEP1", [3591.00,1243.00], [], 0, "NONE"];

waitUntil { nearestPlayers(getPosATL (_msc), 1000, true, "count") > 0 };


_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [3593.00,1240.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [3596.00,1238.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [3596.00,1234.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [3543.00,1240.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [3540.00,1240.00], [], 0, "NONE"];


while {!_well_installed} do {

	_objectsinrange = nearestObjects [_msc,["Land_Misc_Well_C_EP1"], 50];
	_well_object = _objectsinrange select 0;
	sleep 10;

	if (_well_object distance _msc < 50 ) then {
		["Task26b","succeeded"] call SHK_Taskmaster_upd;
		{_x addscore +5;} foreach units current_playergroupname;
		_well_installed = true;
	};
};




