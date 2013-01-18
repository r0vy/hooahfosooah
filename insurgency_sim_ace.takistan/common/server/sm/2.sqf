#include "functions.sqf"
current_playergroupname = playergroupname;

AH64Killed = { 	

	sleep 4;

	["Task4","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};


["Task4","Side Mission: An Ugly Brute","<br/><br/><br/>An Ugly Brut<br/><br/>US Forces Apache AH-64 was shot down near Lalezar. Both pilot and gunner managed to make it Gospandi without being captured and were rescued this morning by British Forces. Pilot reports that the Apache was too badly damaged so recovery was not an option.<br/><br/>Locate the Apache and destroy it to stop it getting into the Insurgency's hands.<br/>(hint: using artillery will save you losing any points)",playergroupname] call SHK_Taskmaster_add;

_ah64  = createVehicle ["AH64D",[4619.6982,9547.2334],[],0,"NONE"];
_ah64 setPos [(getpos _ah64 select 0) + random 400 - random 400,(getpos _ah64 select 1) + random 400 - random 400,0];
_ah64 setVehicleArmor 0;
_ah64 setFuel 0;
_ah64 setVehicleAmmo 0; 
_ah64 lockDriver true;
_ah64 lockturret [[0],true];
_ah64 addEventHandler["Killed", { (_this select 0) spawn AH64killed; }];

waitUntil { nearestPlayers(getPosATL (_ah64), 1000, true, "count") > 0 };

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [4630.6982, 9549.2334], [], 0, "NONE"];
_ai doMove (position _ah64);

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [4645.6982, 9549.2334], [], 0, "NONE"];
_ai doMove (position _ah64);

_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [4615.6982, 9540.2334], [], 0, "NONE"];
_ai doMove (position _ah64);

_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [4605.6982, 9540.2334], [], 0, "NONE"];
_ai doMove (position _ah64);

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [4635.6982, 9552.2334], [], 0, "NONE"];
_ai doMove (position _ah64);

_sniper2  = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [4673.000, 10068.00000], [], 0, "NONE"];
_sniper2 setskill 0.6;
_sniper2 domove [(getpos _sniper2 select 0) + random 200 - random 200,(getpos _sniper2 select 1) + random 200 - random 200,0];