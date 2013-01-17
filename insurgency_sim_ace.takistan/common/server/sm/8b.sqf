#include "functions.sqf"
current_playergroupname = _this select 0;

BMPKilled = { 	
	sleep 4;

	["Task10b","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
}; 

["Task10b","Side Mission: Rusting","<br/><br/>Rusting<br/><br/>The Insurgency officer North West of Feruz Abad had intelligence on him to suggest that the Insurgency forces are hiding an armoured vehicle at the crossroads somewhere in the map square 053, 103 amongst all the old vehicle scrap to avoid being detected by Us satellite systems.<br/><br/>Search out the tracked vehicle and destroy it.",current_playergroupname] call SHK_Taskmaster_add;


_bmp = createVehicle ["BMP2_HQ_TK_EP1", [5394.00, 10361.00], [], 0, "CAN_COLLIDE"];
_bmp setFuel 0;
_bmp lockDriver true;
_bmp lockturret [[0],true];
_bmp setdir 330;
_bmp setPos [5394.00, 10361.00];
_bmp addEventHandler["Killed", { (_this select 0) spawn BMPKilled; }];


waitUntil { nearestPlayers(getPosATL (_bmp), 1000, true, "count") > 0 };



_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_EP1", [5281.000, 10333.00000], [], 0, "NONE"];

_ai  = _group createUnit ["TK_INS_Soldier_AT_EP1", [5200.000, 10492.00000], [], 0, "NONE"];
_ai domove (position _bmp);

_ai  = _group createUnit ["TK_INS_Soldier_Sniper_EP1", [5220.000, 10492.00000], [], 0, "NONE"];
_ai domove (position _bmp);

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5240.000, 10492.00000], [], 0, "NONE"];
_ai domove (position _bmp);

sleep 60;


_sniper  = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [5192.000, 10492.00000], [], 0, "NONE"];
_sniper setskill 0.8;
_sniper domove [(getpos _sniper select 0) + random 200 - random 200,(getpos _sniper select 1) + random 200 - random 200,0];


_sniper2 = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [5586.000, 10268.00000], [], 0, "NONE"];
_sniper2 setskill 0.8;
_sniper2 domove [(getpos _sniper2 select 0) + random 200 - random 200,(getpos _sniper2 select 1) + random 200 - random 200,0];