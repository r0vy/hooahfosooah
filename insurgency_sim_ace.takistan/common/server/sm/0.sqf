#include "functions.sqf"
current_playergroupname = playergroupname;

_jackal_at_base = false;

["Task2","Side Mission: Drive my car","<br/><br/><br/>Drive my car<br/><br/>A US Forces patrol was ambushed yesterday near Feruz Abad, the crew are feared dead and their Humvee has been stolen. <br/>Intelligence you have just received suggests Insurgency forces are storing the vehicle in the abandoned mine north of Feruz Abad.<br/><br/>Locate the mine, check for hostages and recover/return the Humvee back to base.",playergroupname] call SHK_Taskmaster_add;

_jackal  = createVehicle ["HMMWV_M1151_M2_DES_EP1",[5035.7554, 6935.752],[],0,"NONE"];
_jackal setdir 315;
_vcl  = createVehicle ["Pickup_PK_TK_GUE_EP1",[5057.0825, 6875.8398],[],0,"NONE"];

waitUntil { nearestPlayers(getPosATL (_jackal), 1000, true, "count") > 0 };

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [5063.8691, 6878.3525], [], 0, "NONE"];
_ai allowFleeing 0;
_ai assignAsGunner _vcl;
_ai moveInGunner _vcl;


_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5153.0806, 6843.645, 5.2976875], [], 0, "NONE"];
_ai setPos [5153.0806, 6843.645, 5.2976875];
doStop _ai;


_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5031.0986, 6923.8423, 6.0673594], [], 0, "NONE"];
_ai setPos [5031.0986, 6923.8423, 6.0673594];
doStop _ai;

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5070.00, 6837.00], [], 0, "NONE"];
doStop _ai;

_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [5054.00, 6837.00], [], 0, "NONE"];
doStop _ai;


_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5035.2793, 69403.2539], [], 0, "NONE"];
doStop _ai;


_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [5053.8984, 6883.4839], [], 0, "NONE"];
doStop _ai;


_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5079.1362, 6882.6797], [], 0, "NONE"];
_ai setPos [5079.1362, 6882.679];
doStop _ai;

_ai  = _group createUnit ["TK_INS_Soldier_EP1", [5082.6294, 6863.4761], [], 0, "NONE"];
_ai setPos [5082.6294, 6863.4761];
doStop _ai;


_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [5057.4375, 6880.9092], [], 0, "NONE"];
doStop _ai;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [5139.00, 6936.000], [], 0, "NONE"];
doStop _ai;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [5253.00, 6827.000], [], 0, "NONE"];
doStop _ai;

_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5252.00, 6828.000], [], 0, "NONE"];
doStop _ai;


_group2  = ["USstatic","USGrp","","west"] call getGroup;
_man  = _group2 createUnit ["USMC_Soldier_MG", [5032.7554, 6906.752], [], 0, "NONE"];
	_man setPos [5032.7554, 6906.752];
	_man setDir -180.97284;
	_man setVehicleArmor 0;

_man  = _group2 createUnit ["USMC_Soldier_Medic", [5037.0000, 6935.0000], [], 0, "NONE"];
	_man setPos [5050.0000, 6907.0000];
	_man setVehicleArmor 0;

_man  = _group2 createUnit ["USMC_Soldier", [5045.0000, 6899.0000], [], 0, "NONE"];
	_man setPos [5045.0000, 6899.0000];
	_man setVehicleArmor 0;


while {!_jackal_at_base} do {

	if (_jackal distance vehicleServicePoint < 20) then {
	["Task2","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
	_jackal_at_base = true;
	};
};