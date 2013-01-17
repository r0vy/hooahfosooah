#include "functions.sqf"
current_playergroupname = playergroupname;

AmmoKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep 4;                                           

}; 


["Task24","Side Mission: Gangsters Paradise","<br/><br/>Gangsters Paradise<br/><br/>Takistan Gangsters have raided the old base at Garmsar and stolen ammunition supplies. Reports from Takistan residents in Zavarak state that they have been seen in two black SUVs and are hiding in the far South of Zavarak.<br/><br/>Locate and neutralise the guerilla Gangsters, destroy any weapons supplies and their vehicles.",playergroupname] call SHK_Taskmaster_add;



_ammo = createVehicle ["TKOrdnanceBox_EP1", [10411.00,10340.00], [], 0, "NONE"];
_ammo addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];


_vcl1 = createVehicle ["SUV_PMC", [10411.00, 10345.00], [], 0, "NONE"];
_vcl1 setDir -102.16188;;
_vcl1 setVehicleArmor 0.8;
_vcl1 setFuel 0.0;
_vcl1 lockDriver true;
_vcl1 lockCargo true;
_vcl1 setPos [10411.00, 10345.00];

waitUntil { nearestPlayers(getPosATL (_vcl), 1000, true, "count") > 0 };

_vcl2 = createVehicle ["SUV_PMC", [10400.00, 10355.00], [], 0, "NONE"];
_vcl2 setDir 45.000;;
_vcl2 setVehicleArmor 0.8;
_vcl2 setFuel 0.0;
_vcl2 lockDriver true;
_vcl2 lockCargo true;
_vcl2 setPos [10400.00,  10355.00];





	_group  = ["static","Grp","","east"] call getGroup;

	_ai  = _group createUnit ["TK_GUE_Soldier_2_EP1", [10408.00, 10345.00], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_GUE_Soldier_3_EP1", [10408.00, 10345.00], [], 0, "NONE"];
	

	_ai  = _group createUnit ["TK_GUE_Soldier_4_EP1", [10402.00, 10345.00], [], 0, "NONE"];		

	_ai  = _group createUnit ["TK_GUE_Soldier_5_EP1", [10405.00, 10360.00], [], 0, "NONE"];

	_ai  = _group createUnit ["TK_GUE_Soldier_AAT_EP1", [10505.00, 10250.00], [], 0, "NONE"];

	_ai  = _group createUnit ["TK_GUE_Soldier_4_EP1", [10385.00, 10230.00], [], 0, "NONE"];

	_sniper  = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [10408.00, 10345.00], [], 0, "NONE"];
	_sniper setskill 0.8;
	_sniper domove [(getpos _sniper select 0) + random 300 - random 300,(getpos _sniper select 1) + random 300 - random 300,0];

while {alive _vcl1; alive _vcl2; alive _ammo} do {
sleep 10;
};

["Task24","succeeded"] call SHK_Taskmaster_upd;
{_x addscore +5;} foreach units current_playergroupname;