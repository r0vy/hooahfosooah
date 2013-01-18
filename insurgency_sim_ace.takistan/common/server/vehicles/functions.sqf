Mass_cur = [];

westVehicleChecker = {
    private ["_vcl","_pos","_range","_driver","_plrs","_str"];
      
    if (!alive MHQ && startLocation == MHQ) exitWith {
	sleep 120;
		_vcl = createVehicle [MHQTYPE, spawnPos, [], 0, "None"]; 
		_vcl setVehicleInit format["this setVehicleVarName ""%1""; %1 = this;", "MHQ"];
		processInitCommands;
		HQ setDir (getDir vehicleServicePoint + 90);
		_pos = vehicleServicePoint modelToWorld [10,0,0];
		_pos set [2,0];
		HQ setPosATL _pos;
	};	
	
	if (startLocation != HQ) exitWith {};
	
	_pos = startLocation modelToWorld [3,20,0];
	_pos set [2,0];
	if (helipad distance _pos > 1) then {
		helipad setPosATL _pos;
		helipad setDir (getDir startLocation - 90);
	};
	
	_pos = startLocation modelToWorld [0,-10,0];
	_pos set [2,0];
	if (vehicleServicePoint distance _pos > 1) then { 
		vehicleServicePoint setPosATL _pos;
		vehicleServicePoint setDir (getDir startLocation - 90);
	};
	
	_pos = startLocation modelToWorld [0,-19,0];
	_pos set [2,0];
	if (repairarea distance _pos > 1) then { 
		repairarea setPosATL _pos;
		repairarea setDir (getDir startLocation - 90);
	};
	
	_pos = startLocation modelToWorld [-3,-8,0];
	_pos set [2,0];
	if (baseflag distance _pos > 1) then { 
		baseflag setPosATL _pos;
		baseflag setDir (getDir startLocation);
	};
	
	_pos = startLocation modelToWorld [8,0,0];
	_pos set [2,0];
	if (fieldHospital distance _pos > 1) then { 
		fieldHospital setPosATL _pos;
		fieldHospital setDir (getDir startLocation);
	};
		
	for "_i" from 0 to (count westVehicleStrings - 1) do {
		_str = westVehicleStrings select _i;
		
		// isNil _str check if the vehicle is undefined
		// note that, _str does NOT get wrapped in quotes because _str contains the vehicle name
		// and we are checking for the presence of the vehicle, I assume _str whill always be a valid string
		if (isNil _str) then {
			_i call resetWestVehicle;
		} else {
			_vcl = call compile _str;
			// _vcl should not be NIL here .... due to ( isNil _str) protecting us
			// but it could be anything, so ... check its an object
			if (typeName _vcl=="OBJECT") then {
				if ( isNull _vcl) then {
					_i call resetWestVehicle;
				} else {
					if (!alive _vcl) then { 
						_i call resetWestVehicle;
					} else {
						scopeName "main";
						_range = 400;
						if (typeOf _vcl == ATVTYPE) then { 
							_range = 100; 
						};
						if (typeOf _vcl == HELITYPE && heliRC == 1) exitWith { breakTo "main"; };
						_plrs = nearestPlayers(getPosATL _vcl,SPAWNRANGE,false,"array");
						if (alive _vcl && !arrCanSee(_plrs,_vcl,45,_range) && _vcl distance startLocation > 100) then {
							_driver = driver _vcl;
							_gunner = gunner _vcl;
							if (!isNull _driver || !isNull _gunner) then { 
								if (alive _driver || alive _gunner) exitWith { 
									breakTo "main"; 
								}; 
							};
							{ moveOut _x; } forEach (crew _vcl);
							_i call resetWestVehicle;
						};	
					};
				};
			};
		};
		sleep 0.01;
	};
}; 	

// returns one specific vehicle or re-creates it at the start position
resetWestVehicle = {
	private ["_vcl","_str","_objs","_type","_bool","_pos","_dir","_id","_i"];
	_i = _this;
	_str = westVehicleStrings select _i;

	if (_i > 10 || _i == -1) exitWith { }; //only return listed vehicles, but not MHQ
		_id  = _i % 6;
		_pos = startLocation modelToWorld [-15,-10+_id*8,0.05];
		_dir = getDir startLocation - 90;
		//_type 	  = if (_id % 2 == 1) then { CAR1TYPE } else { CAR2TYPE };
	if (_i == 0) then {
		_type = CAR1TYPE;
	};
	if (_i == 1) then {
		_type = CAR2TYPE;
	};
	if (_i == 2) then {
		_type = CAR3TYPE;
	};
	if (_i == 3) then {
		_type = CAR4TYPE;
	};
	if (_i == 4) then {
		_type = CAR5TYPE;
	};
	if (_i == 5) then {
		_type = CAR6TYPE;
	};
	if (_i >= 6) then {
		_id = _id + 1;
		_type = ATVTYPE;
		_pos  = startLocation modelToWorld [-15,-14+_id*8,0.05];
	};
	if (_i >= 8) then {
		_id = _id + 1;
		_type = CAR7TYPE;
		_pos  = startLocation modelToWorld [-15,-14+_id*8,0.05];
	};
	if (_i == 10) then {
		_type = HELITYPE;
		_pos  = getPosATL helipad;
		_dir  = getDir helipad; 
		if (_pos distance startLocation > 100) exitWith {}; //avoid racing condition, where helipad is still at spawnPos
	};
	_pos set [2,0];
		
	_bool = isNil _str;
	_vcl = call compile _str;
	if !_bool then { _bool = isNull _vcl || !alive _vcl; };
	if _bool then {
		_objs = nearestObjects[_pos,["LandVehicle","Air","CraterLong"],20];
		if (count _objs > 0) then { { if (!(_x isKindOf "AllVehicles") || !alive _x) then { deleteVehicle _x; }; } forEach _objs; };
		_vcl = createVehicle [_type, spawnPos, [], 0, "None"]; 
		_vcl setVehicleInit format["this setVehicleVarName ""%1""; %1 = this;", _str];
		_vcl setDir _dir;
		_vcl setPosATL _pos;
		

		if (_i < 10 ) then { _vcl call setVclAmmoCargo; };  // changed for vehicle loadouts

		processInitCommands;
		[player,_vcl,"loc",rSPAWN,_vcl,{ _this call addActionLock; }] call RE;
	} else {
		_vcl call vehicleService;
		_vcl engineOn false;
		_vcl setDir _dir;
		_vcl setPosATL _pos;
	};
};

setWeaponCargo = {
	private ["_vcl","_wep","_num","_cargo","_arr1","_arr2","_count","_id"];
	_vcl   = _this select 0;
	_wep   = _this select 1;
	
	_num   = 0;
	_cargo = getWeaponCargo _vcl;
	_arr1  = _cargo select 0;
	_id    = _arr1 find _wep;
	if (_id == -1) exitWith {};
	_arr1 set[_id, str _wep];
	_arr2  = (_cargo select 1);
	_arr2 set[_id, 0];
	_cargo = [_arr1,_arr2];
	_count = count _arr2;
	call compile format['
		_vcl setVehicleInit "
		clearWeaponCargo this;
		for ""_i"" from 0 to (%2 - 1) do {
			_wep = (%1 select 0) select _i;
			_num = (%1 select 1) select _i;
			this addWeaponCargo [_wep,_num];
		};
		";
		processInitCommands;
	', _cargo, _count];
};

vehicleService = {
	_this call setVclAmmoCargo;
	processInitCommands;
};

setVclAmmoCargo = {
	_this setVehicleInit '
	this setVehicleAmmo 1;
	this setFuel 1;
	this setDamage 0;
	clearWeaponCargo this;
	clearMagazineCargo this;
	this addWeaponCargo ["ACE_M136_CSRS",1];
	this addWeaponCargo ["ACE_Stretcher",1];
	this addWeaponCargo ["ACE_M1014_Eotech",1];
	this addWeaponCargo ["ACE_KeyCuffs",2];
	this addWeaponCargo ["ACE_Rangefinder_OD",1];
	{ this addMagazineCargo [_x select 0, _x select 1]; } forEach humvMagazines;
	if (player in crew this) then { titleText["Vehicle serviced", "PLAIN DOWN"]; };
	';
};

addActionLock = {
	private "_actionIndex";
	_actionIndex = _this addAction ["Lock","common\client\actions\noScript.sqf",'
		_this select 0 lock true; 
		_this select 0 removeAction (_this select 2);
		_this select 0 call addActionUnlock; 
	',1,false,true,"","isAdmin"];
};

addActionUnlock = {
	private "_actionIndex";
	_actionIndex = _this addAction ["Unlock","common\client\actions\noScript.sqf",'
		_this select 0 lock false; 
		_this select 0 removeAction (_this select 2);
		_this select 0  call addActionLock; 
	',1,false,true,"","isAdmin"];
};