current_playergroupname = playergroupname;

ScudKilled = { 	
_pos	= getPosATL(_this);
	_newpos1 = [(getPosATL(_this) select 0)+25, getPosATL(_this) select 1, getPosATL(_this) select 2];
	_newpos2 = [(getPosATL(_this) select 0)-30, getPosATL(_this) select 1, getPosATL(_this) select 2];
	_newpos3 = [getPosATL(_this) select 0, (getPosATL(_this) select 1)+15, getPosATL(_this) select 2];
	_newpos4 = [getPosATL(_this) select 0, (getPosATL(_this) select 1)-35, getPosATL(_this) select 2];

	"ARTY_R_227mm_HE" createVehicle _pos;
	"Bo_GBU12_LGB" createVehicle _pos;

	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _newpos1;
	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _newpos2;
	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _newpos3;
	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _newpos4;

	"ARTY_R_227mm_HE" createVehicle _pos;
	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _newpos1;
	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _newpos2;
	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _newpos3;
	sleep random 1;
	"Bo_GBU12_LGB" createVehicle _newpos4;

	sleep 5;

	if (_this distance msc > 300) then {

		["Task11","succeeded"] call SHK_Taskmaster_upd;
		{_x addscore +5;} foreach units current_playergroupname;

	} else {
		["Task11","failed"] call SHK_Taskmaster_upd;
	};

}; 

["Task11","Side Mission: Tick Tick Boom","<br/><br/>Tick Tick Boom<br/><br/>Insurgency forces have acquired an old Scud missile truck and have just arrived in Feruz Abad. The fear is that they will launch the scud at one of the neighbouring border cities. US and British Forces have ruled out an airstrike on the vehicle as its too close to civilian buildings at present and the collateral damage could be immense.<br/><br/>Locate the scud, capture and drive it well away from Feruz Abad. Once clear of any cilivian buildings destroy it. (if the actual scud missile is fired, the mission cannot be completed)",playergroupname] call SHK_Taskmaster_add;



_scud = createVehicle ["MAZ_543_SCUD_TK_EP1", [5261.605, 6123.731], [], 0, "NONE"];
_scud setDir -35.876842;
_scud setVehicleArmor 0.3;
_scud setFuel 0.1;
_scud addMPEventHandler["MPKilled", { (_this select 0) spawn ScudKilled; }];

msc = createVehicle ["Misc_TyreHeapEP1", [5079.00, 6068.00], [], 0, "CAN_COLLIDE"];

sleep 120;

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_EP1", [5265.605,6127.731], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_AT_EP1", [5255.605,6130.731], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_Sniper_EP1", [5270.605,6137.731], [], 0, "NONE"];

