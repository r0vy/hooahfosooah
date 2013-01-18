#include "functions.sqf"
current_playergroupname = playergroupname;

AmmoKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 2;
	"ARTY_R_227mm_HE" createVehicle _pos;
}; 

["Task14","Side Mission: The Big Guns","<br/><br/>The Big Gun<br/><br/>Whilst flying over Feruz Abad US Forces have spotted Insurgency forces setting up an artillery battery on mount Sanginakt.<br/><br/>Destroy the rocket artillery and any ordnance before they can fire the payload.",current_playergroupname] call SHK_Taskmaster_add;

_gun = createVehicle ["GRAD_TK_EP1", [4005.000,6914.000], [], 0, "NONE"];
_gun setPos [(getpos _gun select 0) + random 300 - random 300,(getpos _gun select 1) + random 300 - random 300,0];
_gun addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

_ammo1 = createVehicle ["TKOrdnanceBox_EP1", [4006.56,6911.64], [], 0, "NONE"];
_ammo1 setPos [(getpos _gun select 0) + random 30 - random 30,(getpos _gun select 1) + random 30 - random 30,0];
_ammo1 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

_ammo2 = createVehicle ["TKOrdnanceBox_EP1", [4005.56,6911.0000], [], 0, "NONE"];
_ammo2 setPos [(getpos _gun select 0) + random 30 - random 30,(getpos _gun select 1) + random 30 - random 30,0];
_ammo2 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

_vcl1 = createVehicle ["Pickup_PK_TK_GUE_EP1", [4033.56,6933.0000], [], 0, "NONE"];
_vcl1 setPos [(getpos _gun select 0) + random 50 - random 50,(getpos _gun select 1) + random 50 - random 50,0];

_vcl2 = createVehicle ["UralReammo_TK_EP1", [4035.56,6935.64], [], 0, "NONE"];
_vcl2 setPos [(getpos _gun select 0) + random 150 - random 50,(getpos _gun select 1) + random 150 - random 50,0];
_vcl2 lockDriver true;
_vcl2 lockCargo true;
_vcl2 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];


waitUntil { nearestPlayers(getPosATL (_gun), 1000, true, "count") > 0 };

	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai1  = _group createUnit ["TK_INS_Soldier_AA_EP1", [4002.56,6910.64,0], [], 0, "NONE"];
	_ai1 doMove (position _gun);

	_ai2  = _group createUnit ["TK_INS_Soldier_4_EP1", [4004.56,6909.64,0], [], 0, "NONE"];
	_ai2 assignAsGunner _gun;
	_ai2 moveInGunner _gun;

	_ai3  = _group createUnit ["TK_INS_Soldier_MG_EP1", [4000.56,6912.64,0], [], 0, "NONE"];
	_ai3 doMove (position _gun);

	_ai4  = _group createUnit ["TK_INS_Soldier_MG_EP1", [4548.56,7716.64,0], [], 0, "NONE"];
	_ai4  = _group createUnit ["TK_INS_Soldier_AA_EP1", [4549.56,7717.64,0], [], 0, "NONE"];
	
	_ai5  = _group createUnit ["TK_INS_Soldier_AA_EP1", [4594.56,6265.64,0], [], 0, "NONE"];
	_ai5  = _group createUnit ["TK_INS_Soldier_MG_EP1", [4595.56,6266.64,0], [], 0, "NONE"];

	_ai6  = _group createUnit ["TK_INS_Soldier_2_EP1", [4008.56,6910.64,0], [], 0, "NONE"];
	_ai6 setPos [(getpos _gun select 0) + random 300 - random 300,(getpos _gun select 1) + random 300 - random 300,0];

	_ai7  = _group createUnit ["TK_INS_Bonesetter_EP1", [4010.56,6910.64,0], [], 0, "NONE"];
	_ai7 setPos [(getpos _gun select 0) + random 300 - random 300,(getpos _gun select 1) + random 300 - random 300,0];

	_ai8  = _group createUnit ["TK_INS_Soldier_TL_EP1", [4012.56,6912.64,0], [], 0, "NONE"];
	_ai8 doMove (position _vcl2);

	_ai9  = _group createUnit ["TK_INS_Soldier_EP1", [40014.56,6909.64,0], [], 0, "NONE"];
	_ai9 assignAsGunner _vcl1;
	_ai9 moveInGunner _vcl1;

	_ai10  = _group createUnit ["TK_INS_Soldier_EP1", [3475.00,6814.64,0], [], 0, "NONE"];
	_ai10  = _group createUnit ["TK_INS_Soldier_AA_EP1", [3476.00,6815.64,0], [], 0, "NONE"];



while {alive __gun; alive _ammo1; alive _vcl2} do {
sleep 10;
};

sleep 5;

	["Task14","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
