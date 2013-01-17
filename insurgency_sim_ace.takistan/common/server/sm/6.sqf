#include "functions.sqf"
current_playergroupname = playergroupname;

ChemKilled = { 	
	sleep random 12;
	"Bo_GBU12_LGB" createVehicle [9405.08, 10024,0];
	sleep random 12;
	"Bo_GBU12_LGB" createVehicle [9395.76, 10013.9];
	sleep random 12;
	"Bo_GBU12_LGB" createVehicle [9406.75, 10035,0];

	sleep 10;
	"Bo_GBU12_LGB" createVehicle [9362.00, 9992.00,0];
	sleep random 12;
	"Bo_GBU12_LGB" createVehicle [9387.00, 9978.00,0];
	sleep random 12;
	"Bo_GBU12_LGB" createVehicle [9409.00, 9965.00,0];
	sleep random 12;
	"Bo_GBU12_LGB" createVehicle [9300.00, 9324.00,0];
	sleep random 12;
	"Bo_GBU12_LGB" createVehicle [9324.00, 10015.00,0];

	sleep 10;

	["Task8","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
}; 

Chem2Killed = { 
	_pos	= getPosATL(_this);
	sleep random 3;	
	"Bo_GBU12_LGB" createVehicle _pos;
}; 



["Task8","Side Mission: Chemical Romance","<br/><br/>Chemical Romance<br/><br/>Insurgency forces are storing chemical weapons at Sagram.<br/><br/>Locate the chemical storage containers and destroy them before the Insurgency forces can get theirs hands on them.",playergroupname] call SHK_Taskmaster_add;

	_chem = createVehicle ["Misc_Cargo1B_military", [9405.08, 10024.00], [], 0, "NONE"];
	_chem addEventHandler["Killed", { (_this select 0) spawn ChemKilled; }];

	_chem2 = createVehicle ["Misc_Cargo1B_military", [9395.76, 10013.90], [], 0, "NONE"];
	_chem2 addEventHandler["Killed", { (_this select 0) spawn Chem2Killed; }];
	_chem3 = createVehicle ["Misc_Cargo1B_military", [9406.75, 10035.00], [], 0, "NONE"];
	_chem3 addEventHandler["Killed", { (_this select 0) spawn Chem2Killed; }];

	_vcl = createVehicle ["V3S_TK_GUE_EP1", [9373.00, 10016.00], [], 0, "NONE"];
	_vcl setdir 300;

	_vcl = createVehicle ["V3S_TK_GUE_EP1", [9362.00, 10025.00], [], 0, "NONE"];
	_vcl setdir 305;

	_msc = createVehicle ["Sign_Checkpoint_TK_EP1", [9308.00, 10052.00], [], 0, "NONE"];
	_msc setdir 300;

	_vcl2 = createVehicle ["Offroad_DSHKM_INS", [9304.00, 10068.0000], [], 0, "NONE"];
	_vcl2 setPos [9304.00, 10068.0000];

	_vcl3 = createVehicle ["Offroad_DSHKM_INS", [9308.00, 10057.00], [], 0, "NONE"];
	_vcl3 setPos [9308.00, 10057.0];
	_vcl3 setdir 230;


waitUntil { nearestPlayers(getPosATL (_chem), 1000, true, "count") > 0 };

	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [9415.76, 10040.9], [], 0, "NONE"];
	_ai domove (position _msc);

	_ai1  = _group createUnit ["TK_INS_Soldier_4_EP1", [9375.00, 10015.0], [], 0, "NONE"];
	dostop _ai1;

	_ai1  = _group createUnit ["TK_INS_Soldier_MG_EP1", [9405.76, 10032.9], [], 0, "NONE"];
	doStop _ai1;

	_sniper  = _group createUnit ["TK_GUE_Soldier_Sniper_EP1", [9415.08, 10054,0], [], 0, "NONE"];
	_sniper setskill 0.8;
	_sniper domove [(getpos _sniper select 0) + random 200 - random 200,(getpos _sniper select 1) + random 200 - random 200,0];

	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [9408.00, 9963.00], [], 0, "NONE"];
	_ai domove (position _vcl);

	_ai2  = _group createUnit ["TK_INS_Soldier_4_EP1", [9309.00, 10061.00], [], 0, "NONE"];
	doStop _ai2;  

	_ai2  = _group createUnit ["TK_INS_Soldier_MG_EP1", [9304.00, 10047.0], [], 0, "NONE"];
	_ai3 assignAsGunner _vcl3;
	_ai3 moveInGunner _vcl3;

	_ai4  = _group createUnit ["TK_INS_Soldier_MG_EP1", [9359.00, 9965.00], [], 0, "NONE"];
	doStop _ai4;	

	_ai5  = _group createUnit ["TK_INS_Soldier_4_EP1", [9418.00, 10084.00], [], 0, "NONE"];
	doStop _ai5;
	
	_ai6  = _group createUnit ["TK_INS_Soldier_4_EP1", [9307.00, 10121.00], [], 0, "NONE"];
	_ai6 assignAsGunner _vcl2;
	_ai6 moveInGunner _vcl2;

	_ai7  = _group createUnit ["TK_INS_Soldier_4_EP1", [9317.00, 10121.00], [], 0, "NONE"];
	_ai7 assignAsDriver _vcl2;
	_ai7 moveInDriver _vcl2;
	_ai7 domove (position _msc);

	_ai8  = _group createUnit ["TK_INS_Soldier_AA_EP1", [9427.00, 10020.000], [], 0, "NONE"];
	doStop _ai8;