#include "functions.sqf"
current_playergroupname = playergroupname;

_vehicle_at_base = false;

["Task18","Side Mission: Shhh... It's a secret","<br/><br/>Shhh. It's a secret<br/><br/>Insurgency forces have acquired a new helicopter and are performing final checks on it at Loy Manara airbase. It is believed that the helicopter maybe armed with a new chemical weapons payload.<br/><br/>Locate the helicopter and steal it before it takes off. Return it to your base service point so we can check its payload.",playergroupname] call SHK_Taskmaster_add;

sleep 120;


_vehicle  = createVehicle ["Ka52",[8163.8955, 2015.5464],[],0,"NONE"];
_vehicle setPos [(getpos _vehicle select 0) + random 200 - random 200,(getpos _vehicle select 1) + random 200 - random 200,0];
_vehicle setFuel 0.10;
_vehicle setVehicleAmmo 0.2;

_vcl2  = createVehicle ["Pickup_PK_TK_GUE_EP1",[8179.8955, 2013.5464],[],0,"NONE"];

_vcl3  = createVehicle ["Pickup_PK_TK_GUE_EP1",[8145.8955, 2009.5464],[],0,"NONE"];
_vcl3 setDir -180.97284;


waitUntil { nearestPlayers(getPosATL (_vcl3), 1000, true, "count") > 0 };

	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [8163.8955, 2015.5464], [], 0, "NONE"];
	_ai allowFleeing 0;
	_ai doWatch _ka52;
	_ai setPos [8160.8955, 2017.5464];

	_ai = _group createUnit ["TK_INS_Soldier_4_EP1", [8163.8955, 2015.5464], [], 0, "NONE"];
	_ai assignAsGunner _vcl2;
	_ai moveInGunner _vcl2;

	_ai  = _group createUnit ["TK_INS_Soldier_AR_EP1", [8162.8955, 2011.5464], [], 0, "NONE"];
	_ai assignAsDriver _vcl2;
	_ai moveInDriver _vcl2;
	_ai doMove (position _vehicle);

	_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [8163.8955, 2015.5464], [], 0, "NONE"];
	_ai allowFleeing 0;
	_ai assignAsGunner _vcl3;
	_ai moveInGunner _vcl3;

	_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [8163.8955, 2015.5464], [], 0, "NONE"];
	_ai allowFleeing 0;
	_ai doWatch _ka52;
	_ai doMove (position _vehicle);


while {!_vehicle_at_base} do {

	if (_vehicle distance vehicleServicePoint < 20) then {
	["Task18","succeeded"] call SHK_Taskmaster_upd;
	_vehicle_at_base = true;

	if (player in crew _vehicle) then { titleText["Vehicle is available to use for 10 minutes.", "PLAIN DOWN"]; };
	sleep 600;
	if (player in crew _vehicle) then { titleText["Vehicle is now disabled. Everyone out!", "PLAIN DOWN"]; };
	_vehicle setVehicleArmor 0.25;
	_vehicle setFuel 0;
	_vehicle setVehicleAmmo 0;
	sleep 30;
	__vehicle setVehicleArmor 0.0;
	{_x addscore +5;} foreach units current_playergroupname;
	};
};

