#include "functions.sqf"
current_playergroupname = playergroupname;

ChemKilled = { 	
	_pos	= getPosATL(_this);

	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 2;
	"ARTY_R_227mm_HE" createVehicle _pos;
	sleep random 3;
	"ARTY_R_227mm_HE" createVehicle _pos;

	sleep 5;
	["Task13","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
}; 


Chem2Killed = { 	
	_pos	= getPosATL(_this);

	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 2;
}; 

["Task13","Side Mission: Teddy Bear's Picnic","<br/><br/>Teddy Bear's Picnic<br/><br/>Intel recovered from an Insurgency fighter suggests there is a plan to move a large quantity of chemical weapons material from rural outpost East of Naran Darre Pass. US Forces satellite imagery of the area has picked up some vehicle movement however at this time cannot confirm any chemical weapons.<br/><br/>Investigate the area, remove any Insurgency forces, their vehicles and if any chemical weapons stores are located, ensure they are destroyed.",playergroupname] call SHK_Taskmaster_add;


_chem = createVehicle ["Land_transport_crates_EP1", [9868.3916, 4239.6548], [], 0, "NONE"];
_chem setPos [9868.3916, 4239.6548];
_chem addEventHandler["Killed", { (_this select 0) spawn ChemKilled; }];

_chem2 = createVehicle ["Land_transport_crates_EP1", [9865.1191, 4230.8594], [], 0, "NONE"];
_chem2 setPos [9865.1191, 4230.8594];
_chem2 setDir 70;
_chem2 addEventHandler["Killed", { (_this select 0) spawn Chem2Killed; }];


_vcl = createVehicle ["Offroad_DSHKM_INS", [9871.8184, 4254.6499], [], 0, "NONE"];
_vcl setPos [9871.8184, 4254.6499];

_vcl2 = createVehicle ["Ural_CDF", [9866.335, 4251.8721], [], 0, "NONE"];
_vcl2 setPos [9866.335, 4251.8721];

waitUntil { nearestPlayers(getPosATL (_vcl), 1000, true, "count") > 0 };

	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [9874.7354, 4259.5762], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [9871.2363, 4206.9644], [], 0, "NONE"];
	_ai assignAsGunner _vcl;
	_ai moveInGunner _vcl;

	_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [9872.9463, 4247.6626], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [9898.9092, 4307.4766], [], 0, "NONE"];

