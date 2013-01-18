#include "functions.sqf"
current_playergroupname = playergroupname;

FortKilled = { 

	sleep 4;

	["Task23","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};

["Task23","Side Mission: End of the Road","<br/><br/>End of the Road<br/><br/>The local Takistan population are complaining that  Insurgency forces have setup a checkpoint North of Ravanay and are stopping people getting to their homes.<br/><br/>Locate the checkpoint, remove any Insurgency forces and destroy/remove any obstruction to the road.",playergroupname] call SHK_Taskmaster_add;

sleep 120;


_fort  = createVehicle ["Land_Misc_IronPipes_EP1",[11590.00,8612.00,0],[],0,"NONE"];
_fort setPos [11590.00,8600.00,0];
_fort addEventHandler["Killed", { (_this select 0) spawn FortKilled; }];

_msc  = createVehicle ["Fort_Barricade_EP1",[11602.00,8610.00,0],[],0,"NONE"];



_vcl2  = createVehicle ["Offroad_DSHKM_TK_GUE_EP1",[11585.00,8630.00,0],[],0,"NONE"];
_vcl2 setdir 90;

_vcl3  = createVehicle ["Pickup_PK_TK_GUE_EP1",[11590.00,8610.00,0],[],0,"NONE"];
_vcl3 setdir 45;

waitUntil { nearestPlayers(getPosATL (_vcl2), 1000, true, "count") > 0 };


	_group  = ["static","Grp","","east"] call getGroup;

	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [11595.00,8604.00], [], 0, "NONE"];
	_ai assignAsGunner _vcl3;
	_ai moveInGunner _vcl3;
		



		



	_ai  = _group createUnit ["TK_INS_Soldier_AR_EP1", [11598.00,8604.00], [], 0, "NONE"];
	_ai assignAsGunner _vcl2;
	_ai moveInGunner _vcl2;



	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [11595.00,8540.00], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_AT_EP1", [11600.00,8520.00], [], 0, "NONE"];

	_ai  = _group createUnit ["TK_INS_Soldier_AT_EP1", [11580.00,8620.00], [], 0, "NONE"];

	_sniper  = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [11721.00, 8586.00000], [], 0, "NONE"];
	_sniper setskill 0.8;
	_sniper domove [(getpos _sniper select 0) + random 100 - random 100,(getpos _sniper select 1) + random 100 - random 100,0];
	
	_sniper2  = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [11265.00, 8496.00000], [], 0, "NONE"];
	_sniper2 setskill 0.8;
	_sniper2 domove [(getpos _sniper2 select 0) + random 100 - random 100,(getpos _sniper2 select 1) + random 100 - random 100,0];


