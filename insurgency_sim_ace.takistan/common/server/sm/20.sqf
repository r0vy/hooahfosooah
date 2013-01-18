#include "functions.sqf"
current_playergroupname = playergroupname;

FuelKilled = { 

	_pos	= getPosATL(_this);
	sleep random 3;	
	"Bo_GBU12_LGB" createVehicle _pos;

	sleep 4;
	["Task22","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};

["Task22","Side Mission: Truckin'","<br/><br/>Truckin'<br/><br/>Local Takistan intelligence report fuel shortages in Anar. Insurgency forces are promising resupply of fuel. The US satellite imagery unit have detected fuel trucks on the move at Nagara-1 oilfields.<br/><br/>Locate the fuel truck in convoy leaving Nagara oilfields moving towards Anar, destroy the vehicles before they reach Anar.",playergroupname] call SHK_Taskmaster_add;

sleep 120;


_vehicle  = createVehicle ["UralRefuel_TK_EP1",[3689.00,11089.00,0],[],0,"NONE"];
_vehicle setdir 90;
_vehicle addEventHandler["Killed", { (_this select 0) spawn FuelKilled; }];


_vcl2  = createVehicle ["Offroad_DSHKM_TK_GUE_EP1",[3691.00,11091.00,0],[],0,"NONE"];
_vcl2 setdir 90;

_vcl3  = createVehicle ["Pickup_PK_TK_GUE_EP1",[3693.00,11091.00,0],[],0,"NONE"];
_vcl3 setdir 90;

waitUntil { nearestPlayers(getPosATL (_vcl2), 1000, true, "count") > 0 };


	_group  = ["static","Grp","","east"] call getGroup;

	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [3683.00,11086.00], [], 0, "NONE"];
	_ai assignAsGunner _vcl3;
	_ai moveInGunner _vcl3;
		
	_driver3  = _group createUnit ["TK_INS_Soldier_AR_EP1", [3684.00,11087.00], [], 0, "NONE"];
	_driver3 assignAsDriver _vcl3;
	_driver3 moveInDriver _vcl3;
	_driver3 doMove [5837.00,5775.00,0];


		
	_driver  = _group createUnit ["TK_INS_Soldier_MG_EP1", [3687.00,11089.00], [], 0, "NONE"];
	_driver assignAsDriver _vehicle;
	_driver moveInDriver _vehicle;
	_driver doFollow _driver3;


	_ai  = _group createUnit ["TK_INS_Soldier_AR_EP1", [3683.00,11085.00], [], 0, "NONE"];
	_ai assignAsGunner _vcl2;
	_ai moveInGunner _vcl2;


	_driver2  = _group createUnit ["TK_INS_Soldier_AR_EP1", [3685.00,11089.00], [], 0, "NONE"];
	_driver2 assignAsDriver _vcl2;
	_driver2 moveInDriver _vcl2;
	_driver2 doFollow _driver3;

	
