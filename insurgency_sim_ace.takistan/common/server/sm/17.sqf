#include "functions.sqf"
current_playergroupname = playergroupname;

SniperKilled = { 	
	sleep 4;

	["Task19","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};

["Task19","Side Mission: Here Snipe!","<br/><br/>Here Snipe!<br/><br/>A US patrol has come under fire whilst travelling to Sakhe. Last radio transmission from the Squad Leader reported sniper fire from the West hill side just before the patrol reached the outskirts of Sakhe. Radio contact has now been lost with the patrol. The sniper is more than likely to be falling back over the west hills by now.<br/><br/>Locate the patrol vehicle, check for survirors and then hunt down the sniper.",playergroupname] call SHK_Taskmaster_add;

sleep 120;


_vehicle  = createVehicle ["HMMWV_M1035_DES_EP1",[3643.000, 4846.0000],[],0,"NONE"];
_vehicle setPos [3643.000, 4846.0000];
_vehicle setFuel 0.40;
_vehicle setVehicleArmor 0.6;
_vehicle setdir 165;


waitUntil { nearestPlayers(getPosATL (_vehicle), 900, true, "count") > 0 };


	_group  = ["sniper","Grp","","east"] call getGroup;
	
	_sniper  = _group createUnit ["TK_Soldier_SniperH_EP1", [3331.000, 4890.00000], [], 0, "NONE"];
	_sniper setskill 1;
	_sniper domove [(getpos _sniper select 0) - random 600,(getpos _sniper select 1) + random 400 - random 400,0];
	_sniper	setUnitPos "DOWN";
	_sniper addEventHandler["Killed", { (_this select 0) spawn SniperKilled; }];

	_man  = _group createUnit ["TK_INS_Soldier_MG_EP1", [3641.000, 4846.00000], [], 0, "NONE"];
	_man domove [(getpos _man select 0)  + random 100 - random 100,(getpos _man select 1) + random 100 - random 100,0];

	_man2  = _group createUnit ["TK_INS_Soldier_EP1", [3643.000, 4849.00000], [], 0, "NONE"];
	_man2 domove [(getpos _man select 0) + random 100 - random 100,(getpos _man select 1) + random 100 - random 100,0];

	_man3  = _group createUnit ["TK_INS_Soldier_EP1", [3779.00, 4984.00000], [], 0, "NONE"];
	_man3 domove [(getpos _man3 select 0) + random 100 - random 100,(getpos _man3 select 1) + random 100 - random 100,0];
		
	_man4  = _group createUnit ["TK_INS_Soldier_AA_EP1", [3777.00, 4988.00000], [], 0, "NONE"];
	_man4 doFollow _man3;

	_man5  = _group createUnit ["TK_INS_Soldier_MG_EP1", [3462.000, 4509.00000], [], 0, "NONE"];
	_man5 domove [(getpos _man5 select 0)  + random 100 - random 100,(getpos _man5 select 1) + random 100 - random 100,0];

	_man6  = _group createUnit ["TK_INS_Bonesetter_EP1", [3462.000, 4509.00000], [], 0, "NONE"];
	_man6 doFollow _man5;

	_man7  = _group createUnit ["TK_INS_Bonesetter_EP1", [3560.000, 5253.00000], [], 0, "NONE"];
	_man7 domove [(getpos _man7 select 0)  + random 100 - random 100,(getpos _man7 select 1) + random 100 - random 100,0];

	_man8  = _group createUnit ["TK_INS_Soldier_2_EP1", [3594.000, 5198.00000], [], 0, "NONE"];
	_man8 doFollow _man7;

	_man9  = _group createUnit ["TK_INS_Soldier_4_EP1", [3592.000, 5196.00000], [], 0, "NONE"];
	_man9 doFollow _man8;

	_sniper2  = _group createUnit ["TK_Soldier_Spotter_EP1", [3331.000, 4890.00000], [], 0, "NONE"];
	_sniper2 setskill 1;
	_sniper2 doFollow _sniper;
	_sniper2 setUnitPos "DOWN";


_group2  = ["USstatic","USGrp","","west"] call getGroup;
_man  = _group2 createUnit ["USMC_Soldier_MG", [3640.000, 4844.0000], [], 0, "NONE"];
	_man setPos [3640.000, 4844.0000];
	_man setDir -180.97284;
	_man setVehicleArmor 0;

_man  = _group2 createUnit ["USMC_Soldier_Medic", [3646.000, 4840.0000], [], 0, "NONE"];
	_man setPos [3646.000, 4840.0000];
	_man setVehicleArmor 0;

_man  = _group2 createUnit ["USMC_Soldier", [3648.000, 4846.0000], [], 0, "NONE"];
	_man setPos [3648.000, 4846.000];
	_man setVehicleArmor 0;

	

waitUntil { nearestPlayers(getPosATL (_sniper), 600, true, "count") > 0 };
_sniper domove [(getpos _sniper select 0) - random 500,(getpos _sniper select 1) + random 200 - random 200,0];
