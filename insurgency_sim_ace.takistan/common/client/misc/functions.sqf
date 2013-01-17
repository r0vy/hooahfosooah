clearHouses = {
    private ["_house","_cleared","_houses","_gMkr"];
	
    _gMkr  = str(player call getGridPos);				
	if (markerColor _gMkr == "ColorRed") then {	
		_houses = [getPosATL player, 8, 3, false] call findHouses;
		if (count _houses > 0) then {
			_house = _houses select 0;
			_cleared = _house getVariable "cleared";
			if (isNil "_cleared") then {
				if (nearestEastMen(getPosATL _house, 10, true, "count") == 0) then {
					_house setVariable ["cleared", true];
				};
			};
		};
	};
};

showCache = {
_caches = nearestObjects [getPosATL player, ["GuerillaCacheBox_EP1"], 25];
if (count _caches == 0) exitWith {};
_cache = _caches select 0;
if isNull _cache exitWith {}; 
_cache hideObject false;
};


firedEH = {
	if ((_this select 1) == ATTYPE) then { [] spawn { sleep 0.5; player removeWeapon ATTYPE; }; }; 
	if (captive player) then { [nil,player, rSETCAPTIVE, false] call RE; }; 
};

oneShotM136 = { 
	if (currentWeapon player == ATTYPE && !(ATMAGTYPE in magazines player)) then { 
		player removeWeapon ATTYPE; 
		player addMagazine ATMAGTYPE; 
		player addWeapon ATTYPE; 
		player selectWeapon ATTYPE; 
	}; 
	if (currentWeapon player != ATTYPE && ATMAGTYPE in magazines player) then { player removeMagazine ATMAGTYPE; }; 
}; 

nameStrings = { 
	private ["_id","_name","_plr"];
	{ 
		_id 	= westPlayerStrings find _x; 
		if !isNil _x then { 
			_plr = call compile _x; 
			if (!isNull _plr && isPlayer _plr) then { 
				if alive _plr then {
					if (playerNames select _id == "Error: No unit") exitWith {};
					_name = name _plr; 
					if (playerNames select _id != _name) then { playerNames set[_id, _name]; };
				}; 
			} else { 
				if (playerNames select _id != "") then { playerNames set[_id, ""]; }; 
			}; 
		} else { 
			if (playerNames select _id != "") then { playerNames set[_id, ""]; }; 
		}; 				
	} forEach westPlayerStrings; 	
}; 

vclisFull = { 
	if (_this isKindOf "man" || _this isKindOf "building") exitWith { false };
	if (_this emptyPositions "Driver" > 0) exitWith { false }; 
	if (_this emptyPositions "Gunner" > 0)exitWith  { false }; 
	if (_this emptyPositions "Commander" > 0) exitWith { false }; 
	if (_this emptyPositions "Cargo" > 0) exitWith { false }; 
	true
};

moveInVehicle = {
    private ["_id"];
    
    if (_this emptyPositions "Driver" 		> 0) exitWith { player action["getInDriver", _this]; }; 
    if (_this emptyPositions "Gunner" 		> 0) exitWith { player action["getInTurret", _this, [0]]; }; 
    if (_this emptyPositions "Commander" > 0) exitWith { player action["getInCommander", _this]; }; 
    if (_this emptyPositions "Cargo" 		> 0) exitWith { 
		_id = count (crew _this - [driver _this] - [gunner _this] - [commander _this]);
		player action["getInCargo", _this, _id];	
	};
};  

crewToStr = { 
    private ["_pos","_str","_man","_num","_vcl"];
    
    _num = count _this - 1; 
	_vcl = vehicle (_this select 0); 
	_str = ""; 
	for "_j" from 0 to (_num) do { 
		_man = _this select _j; 
		if (alive _man && str _man in westPlayerStrings) then {
			_str = _str + getName(_man); 
			_pos = " (Cargo)"; 
			if (driver _vcl == _man) then { _pos = " (Driver)"; }; 
			if (_vcl turretUnit [0] == _man) then { _pos = " (Turret)"; }; 
			if (_vcl turretUnit [1] == _man) then { _pos = " (Front Gunner)"; }; 
			_str = _str + _pos; 
			if (_j < _num) then { _str = _str + "<br/>"; }; 
		}; 
	};
	_str
}; 

equals = { 
    private ["_bool","_arr1","_arr2"];
    
    _arr1 = _this select 0; 
	_arr2 = _this select 1; 
	_bool = true; 	
	if (count _arr1 != count _arr2) exitWith { false}; 	
	for "_i" from 0 to (count _arr1 - 1) do { 
		if (!((_arr1 select _i) in _arr2)) exitWith { _bool = false; }; 
		if (!((_arr2 select _i) in _arr1)) exitWith { _bool = false; }; 
	}; 	
	_bool
}; 
