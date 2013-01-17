#include "functions.sqf"
current_playergroupname = playergroupname;

_warrior_at_base = false;


["Task6","Side Mission: Long Haul","<br/><br/><br/>Long Haul<br/><br/>British Forces have a FV-510 Warrior armoured vehicle at the military airbase North West of Rasman, it is out of ammunition and needs servicing. A C-130 Hercules cargo plane was sent to the airfield but the pilot has been wounded over Nagara. The pilot has landed the plane but has now been taken to the local field hospital.<br/><br/>Locate the Hercules and then load the Warrior. The deliver the Warrior to the main base by any means so it can be refueled and serviced.",playergroupname] call SHK_Taskmaster_add;

_plane  = createVehicle ["C130J_US_EP1", [5675.6699, 11235.053, 83.050003],[],0,"NONE"];
_plane setdir -130;
_plane setPos [5675.6699, 11235.053];

_warrior = createVehicle ["BAF_FV510_D",[5708.5996, 11178.643],[],0,"NONE"];
_warrior setPos [(getpos _warrior select 0) + random 200 - random 200,(getpos _warrior select 1) + random 200 - random 200,0];
_warrior setVehicleArmor 0.5;
_warrior setFuel 0.1;
_warrior setVehicleAmmo 0.1;


_vcl  = createVehicle ["Pickup_PK_TK_GUE_EP1",[5700.5996, 11170.643],[],0,"NONE"];
_vcl setdir -100;

waitUntil { nearestPlayers(getPosATL (_vcl), 1000, true, "count") > 0 };

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [5696.5996, 11165.643], [], 0, "NONE"];
_ai allowFleeing 0;
_ai assignAsGunner _vcl;
_ai moveInGunner _vcl;

_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [5656.5996, 11173.643], [], 0, "NONE"];
_ai allowFleeing 0;
_ai doWatch _warrior;


_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5702.5996, 11173.643], [], 0, "NONE"];
_ai allowFleeing 0;
_ai doWatch _warrior;

_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [5686.5996, 11173.643], [], 0, "NONE"];
_ai domove (position _warrior);

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5722.5996, 11173.643], [], 0, "NONE"];
_ai domove (position _warrior);

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5712.5996, 11173.643], [], 0, "NONE"];
_ai domove (position _plane);

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [5696.5996, 11165.643], [], 0, "NONE"];
_ai domove (position _warrior);

while {!_warrior_at_base} do {

	if (_warrior distance vehicleServicePoint < 20) then {
	sleep 4;
	["Task6","succeeded"] call SHK_Taskmaster_upd;
	_warrior_at_base = true;
	_warrior setVehicleArmor 0.0;
	deletevehicle _warrior;
	{_x addscore +5;} foreach units current_playergroupname;
	};
};

