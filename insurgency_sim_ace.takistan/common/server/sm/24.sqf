#include "functions.sqf"
current_playergroupname = playergroupname;

PlaneKilled = { 	
	sleep 2;


	["Task26","failed"] call SHK_Taskmaster_upd;
}; 


PlaneSafe = { 	
	sleep 25;

	_vcl = _this;

			_grp = createGroup civilian;
			[_vcl] join _grp;
			
	_vcl setFuel 0;

	_vcl animate ["ramp_top", 1];
	_vcl animate ["ramp_bottom", 1];
	sleep 2;

	_crate = createVehicle ["Misc_cargo_cont_net1", [(getpos _vcl select 0) - 1 * sin (getdir _vcl), (getpos _vcl select 1) - 1 * cos (getdir _vcl)], [], 0, "NONE"];	
_crate setVehicleInit "if !isNil 'actionDragBox' then { player removeAction actionDragBox; actionDragBox = nil; };

 actionDragBox = this addAction ['Drag Boxes','common\client\actions\noScript.sqf','
		_object_dragged = _this select 0;
		player playMove ""acinpknlmstpsraswrfldnon"";
		_object_dragged attachto [player,[0,1.3,0.7]];
		sleep 0.1;
		WaitUntil {!Alive player || ((animationstate player == ""acinpknlmstpsraswrfldnon"") || (animationstate player == ""acinpknlmwlksraswrfldb""))};
		While {Alive player && (animationstate player == ""acinpknlmstpsraswrfldnon"") || (animationstate player == ""acinpknlmwlksraswrfldb"")} do
		{
		sleep 0.1;
		};
		detach _object_dragged;
		_object_dragged setpos (getpos _object_dragged);
',1,false,true,'','_this distance _target < 4'];

if !isNil 'actionUnpackBox' then { player removeAction actionUnpackBox; actionUnpackBox = nil; }; actionUnpackBox = this addAction ['Unpack Boxes and Install Well','common\client\actions\noScript.sqf','
		_object_unpacked = _this select 0;
		sleep 1;
		player playMove ""amovpknlmstpsraswrfldnon_gear"";
		sleep 3;
		_well = createVehicle [""Land_Misc_Well_C_EP1"", (getpos _object_unpacked), [], 0, ""NONE""];
		deletevehicle _object_unpacked;
',1,false,true,'','_this distance _target < 4'];";
processInitCommands;


		


	["Task26","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;

	sleep 4;

	[current_playergroupname] execVM ("common\server\sm\24b.sqf");

	
	sleep 15;
	_vcl animate ["ramp_top", 0];
	_vcl animate ["ramp_bottom", 0];

	sleep 2;
	_vcl setFuel 1;
	_vcl allowDamage false;

	
	_pos  = [181.00, 7428.00, 0];
	_dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
	_pos2 = [(_pos select 0) + (sin _dir)*5000,(_pos select 1) + (cos _dir)*5000,500];
	
	_unit doMove _pos2;
	sleep 300;
	deleteVehicle _vcl;
	
	
}; 


["Task26","Side Mission: Not a drop to drink","<br/><br/>Not a drop to drink<br/><br/>Takistan locals in various villages are complaining that Insurgency forces have poisoned their drinking water by placing toxic chemicals in their wells. US Forces have scheduled the first of several humanitarian aid missions to help the Takistan setup new water wells.<br/><br/>The first shipment of well equipment is arriving by Hercules to the airbase North West of Rasman. Get to the airbase, clear the Insurgents and await inbound Hercules.<br/><br/>Make sure the airbase is cleared of Insurgency so the plane can land safely and drop water supplies. It is suggested you get some vehicles onto the runway so the pilot knows it is safe.",current_playergroupname] call SHK_Taskmaster_add;



		


_msc = createVehicle ["Misc_TyreHeapEP1", [5993.00,11536.00], [], 0, "NONE"];

waitUntil { nearestPlayers(getPosATL (_msc), 1200, true, "count") > 0 };



_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [5659.00,11085.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [6243.00,11735.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [6129.00,11582.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [5258.00,11162.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5849.00,11358.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [5990.00,11536.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [5989.00,11535.00], [], 0, "NONE"];


sleep 900;

_pos  = [181.00, 7428.00, 0];
	_dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
	_pos2 = [(_pos select 0) + (sin _dir)*5000,(_pos select 1) + (cos _dir)*5000,500];
	_arr = [_pos2, 90, "C130J_US_EP1", WEST] call bis_fnc_spawnvehicle;

		_vcl = _arr select 0;
		_ai = (_arr select 1) select 0;
		_vcl engineOn true;	
		_vcl setPosATL _pos2;
		_dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
		_vcl setDir _dir;
		_vcl setVelocity [(sin _dir)*100,(cos _dir)*100,20];

		_vcl landAt 0;

		_vcl addEventHandler["Killed", { deleteVehicle _ai; (_this select 0) spawn PlaneKilled; }];
		_vcl addEventHandler["LandedStopped", { (_this select 0) spawn PlaneSafe; }];
		_vcl allowDamage false;

		sleep 120;

		_vcl allowDamage true;	
		_vcl lockDriver true;
		_vcl lockCargo true;
