current_playergroupname = _this select 0;

PlaneSafe = { 	
	sleep 2;

	["Task16c","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;

	sleep 30;
	_vcl = _this;

			_grp = createGroup civilian;
			[_vcl] join _grp;
			
	_vcl setFuel 0;

	_vcl animate ["ramp_top", 1];
	_vcl animate ["ramp_bottom", 1];
	sleep 2;

	_vcl0 = createVehicle ["BAF_Jackal2_GMG_D", [(getpos _vcl select 0) - 5 * sin (getdir _vcl), (getpos _vcl select 1) - 5 * cos (getdir _vcl)], [], 0, "NONE"];	
	_vcl0 = createVehicle ["BAF_Jackal2_L2A1_D", [(getpos _vcl select 0) - 10 * sin (getdir _vcl), (getpos _vcl select 1) - 10 * cos (getdir _vcl)], [], 0, "NONE"];
	_vcl0 = createVehicle ["BAF_BasicAmmunitionBox", [(getpos _vcl select 0) - 15 * sin (getdir _vcl), (getpos _vcl select 1) - 15 * cos (getdir _vcl)], [], 0, "NONE"];
	_vcl0 = createVehicle ["BAF_OrdnanceBox", [(getpos _vcl select 0) - 18 * sin (getdir _vcl), (getpos _vcl select 1) - 18 * cos (getdir _vcl)], [], 0, "NONE"];

	
	sleep 15;
	_vcl animate ["ramp_top", 0];
	_vcl animate ["ramp_bottom", 0];

	sleep 2;
	_vcl setFuel 1;
	_vcl allowDamage false;

	_pos  = [7821, 1665, 0];
	_dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
	_pos2 = [(_pos select 0) + (sin _dir)*5000,(_pos select 1) + (cos _dir)*5000,500];
	
	_unit doMove _pos2;
	sleep 300;
	deleteVehicle _vcl;
	
	
}; 

PlaneKilled = { 	
	sleep 2;


	["Task16c","failed"] call SHK_Taskmaster_upd;
}; 


["Task16c","Side Mission: Eagle is Landing","<br/><br/>Eagle is Landing<br/><br/>British Forces have been called to an uprising on the border and so are no longer able to assist with the capture of Loy Manara airbase. As the power is still out, new supplies are still scheduled to be inbound in the next 10 minutes.<br/><br/>Head to Loy Manara airbase and keep it clear of any Insurgency forces. Ensure the cargo plane can land without any trouble.",current_playergroupname] call SHK_Taskmaster_add;

	sleep 60;


	_arr = [[8849.000, 2073.0000,0.00], 180, "LandRover_MG_TK_INS_EP1", EAST] call bis_fnc_spawnvehicle;
	_vcl2 = _arr select 0;
	_vcl2 doMove [7828.00,1695.00,0.00];

	_arr = [[8859.000, 2073.0000,0.00], 180, "LandRover_SPG9_TK_INS_EP1", EAST] call bis_fnc_spawnvehicle;
	_vcl3 = _arr select 0;
	_vcl3 doMove [8177.00,1646.00,0.00];

	sleep 120;




	_vcl8 = createVehicle ["V3S_Open_TK_EP1", [8250.00, 1950.00], [], 0, "NONE"];
	_vcl8 setdir 265;



	_group  = ["static","Grp","","east"] call getGroup;

	_vcl9 = createVehicle ["Ural_ZU23_TK_GUE_EP1", [8849.000, 2073.0000,0.00], [], 0, "NONE"];


	_ai2  = _group createUnit ["TK_INS_Soldier_MG_EP1", [8177.00,1800.00], [], 0, "NONE"];
	_ai2 domove [(getpos _ai2 select 0) + random 300 - random 300,(getpos _ai2 select 1) + random 300 - random 300,0];

	_ai4  = _group createUnit ["TK_INS_Soldier_MG_EP1", [8187.00,1750.00], [], 0, "NONE"];
	_ai4 allowFleeing 0;
	_ai4 domove [8250.00, 1950.00, 0.00];

	
	_ai0  = _group createUnit ["TK_INS_Soldier_2_EP1", [8852.000, 2075.0000,0.00], [], 0, "NONE"];
	_ai0 assignAsGunner _vcl9;
	_ai0 moveInGunner _vcl9;

	_ai5  = _group createUnit ["TK_INS_Soldier_2_EP1", [8852.000, 2073.0000,0.00], [], 0, "NONE"];
	_ai5 assignAsDriver _vcl9;
	_ai5 moveInDriver _vcl9;
	_ai3 domove [8190.00, 2000.00, 0.00];

	_ai3  = _group createUnit ["TK_INS_Soldier_AA_EP1", [8383.00,1932.00], [], 0, "NONE"];
	_ai3 domove [(getpos _ai3 select 0) + random 300 - random 300,(getpos _ai3 select 1) + random 300 - random 300,0];

	_ai6  = _group createUnit ["TK_INS_Soldier_2_EP1", [8200.00,2036.00], [], 0, "NONE"];
	_ai6 allowFleeing 0;
	_ai6 dowatch _vcl2;


	_ai0  = _group createUnit ["TK_INS_Soldier_2_EP1", [8230.00,1986.00], [], 0, "NONE"];


	sleep 300;


	
	_pos  = [7821, 1665, 0];
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

		_vcl landAt 1;

	
		_vcl addEventHandler["Killed", { deleteVehicle _ai; (_this select 0) spawn PlaneKilled; }];
		_vcl addEventHandler["LandedStopped", { (_this select 0) spawn PlaneSafe; }];




