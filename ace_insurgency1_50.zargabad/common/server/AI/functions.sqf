createHeliPilot = {
	call compile format['
		%1 = _PGroup createUnit [PILOTTYPE, spawnPos, [], 0, "NONE"];
		%1 setVehicleVarName "%1";
		%1 setCaptive true;
		%1
	', _this];
};

pilotAI = {	
    private ["_pilot","_stopped","_landing","_movePos","_units","_vcl"];
    
    _pilot = "heliPilot";
	if isNil _pilot then { _pilot call createHeliPilot; };
	_pilot = call compile _pilot;
	if isNull _pilot then { 
		// null objects can't be re-used in SQF
		_pilot = "heliPilot"; 
		_pilot call createHeliPilot; 
	};
	if !alive _pilot then { deleteVehicle _pilot; _pilot = _pilot call createHeliPilot; };	
	_units = units group _pilot;	
	if (!(pilotController in _units) && count _units == 1) then {	[_pilot] join _PGroup; };
	_vcl = vehicle _pilot;
	if (_vcl == _pilot) then {
		if (alive heli && heli distance startPos < 300) then { 
			heli setDamage 0;
			heli setFuel 1;
			heli lockDriver false;
			_pilot assignAsDriver heli;				
			_pilot moveInDriver heli; 
			heli lockDriver true;				 
		};
	} else {
		_stopped = _vcl getVariable "stopped";
		_landing = _vcl getVariable "landing";
		if !(pilotController in _units) exitWith {
			if !isNil "_stopped" then { _vcl setVariable ["stopped", nil]; };
			if !isNil "_landing" then { _vcl setVariable ["landing", nil]; };
		};		
		if (getPosATL _vcl select 2 < 5 && count crew _vcl > 1 && isEngineOn _vcl) exitWith {
			if !isNil "_stopped" exitWith {};
			doStop _pilot;
			_vcl flyInHeight (getPosATL _vcl select 2);
			_vcl setVariable ["stopped", true];
		};
		if !isNil "_stopped" then { _vcl setVariable ["stopped", nil]; };
		_movePos = expectedDestination _pilot select 0;
		if (_movePos select 0 == 0 && _vcl distance helipad > 200) exitWith { 
			_vcl flyInHeight 30; 
			_vcl doMove getPosATL helipad; 
		};		
		if (_vcl distance helipad <= 200 && isEngineOn _vcl) exitWith { 
			if (getPosATL _vcl select 2 < 2) exitWith { _pilot action ["EngineOff", _vcl];  };
			if !isNil "_landing" exitWith {};
			_vcl land "land"; 
			_vcl setVariable ["landing", true];
		};
		if !isNil "_landing" then { _vcl setVariable ["landing", nil]; };
	};
};

spawnAIVehicle = {
	private ["_num","_track","_speed","_grp","_type","_obj","_mkr","_pos","_vcl","_ai","_unum"];
	_unum = _this;
	
	_num	= _unum % 3; 
	if (_num == 0) then { _num = 3; }; 
	_grp	= ["","vclGrp",_unum+1,"east"] call getGroup; 
	_type = eastVehiclesFreq select round(random (count eastVehiclesFreq - 1)); 		
	_obj 	= call compile ("vclSpawn" + str(_num)); 
	_mkr 	= str _unum; 
	_pos 	= getPosATL _obj; 
	_vcl 	= createVehicle [_type, _pos, [], 0, "None"];
	if (DEBUG) then { server globalChat format["AI VEHICLE %1 of TYPE %2 CREATED! POSITION: %3", _unum, str _vcl, str _pos]; };
	_vcl setDir getDir _obj; 
	_ai	  = _grp createUnit [vclCrewClass, _pos, [], 0, "None"]; 
	_ai setRank (eastRanks select 2); 
	_ai moveInDriver _vcl; 
	_ai	  = _grp createUnit [vclCrewClass, _pos, [], 0, "None"]; 
	_ai setRank (eastRanks select 3); 
	_ai moveInGunner _vcl;
	if !(typeOf _vcl in eastLightVehicles) then {
		_vcl lockDriver true;
		_vcl lockTurret [[0], true];
	};
	_speed = "slow"; 
	_track = ""; 
	if (DEBUG) then { _track = "track"; }; 
	if (typeOf _vcl in eastLightVehicles) then { _speed = "noslow"; }; 
	[leader _grp, _mkr, _speed, "nowait", _track, "delete:", 200] execVM "common\server\AI\UPS.sqf";
};

spawnAIVehicles = { 
	private "_num";
    
    for "_i" from 1 to eastVehicleNum do { 
		_i call spawnAIVehicle;
		if (DEBUG) then { server globalChat format ["SPAWNING AI VEHICLE %1", _i]; };
     };
}; 	
if (INS_Roofguns == 1) then {
spawnAIGuns = { 
	private ["_id","_gCount","_house","_houses"]; 
    
	_houses = [CENTERPOS,AORADIUS, 4, true] call findHouses; 	
	_gCount	= 0; 
	while{ _gCount < maxStaticGuns && count _houses > 0} do{ 
		_house = _houses select random(count _houses - 1); 
		_id	   = GUNROOFPOSITIONS find (typeOf _house); 
        if (_id != -1 && _house distance startLocation > 500) then { 
			if (count nearestObjects[getPosATL _house, eastStationaryGuns, 800] == 0) then { 
				[_id, _house, _gCount] call createRoofGun; 	
				_gCount = _gCount + 1; 
			}; 
		}; 
		_houses = _houses - [_house]; 		
		}; 
	
	_gCount
}; 

createRoofGun = { 	
	private ["_class","_housePositions","_id","_housePosition","_classId","_gun","_house","_dir","_grp","_gCount","_ai"]; 
	_id		= _this select 0;
	_house	= _this select 1;
	_gCount = _this select 2;
    
	_housePositions = GUNROOFPOSITIONS select (_id+1); 
	_housePosition  = (_housePositions select random (count _housePositions - 1)) select 0; 
	_classId        = (_housePositions select random (count _housePositions - 1)) select 1; 
	if (_classId <= 0.2) then { _class = stationaryGunsLow select random(count stationaryGunsLow - 1); }; 
	if (_classId > 0.2 && _classId < 0.5) then { _class = stationaryGunsMed select random(count stationaryGunsMed - 1); }; 
	if (_classId >= 0.5) then { _class = stationaryGunsHigh select random(count stationaryGunsHigh - 1); }; 
	_gun = createVehicle [_class, spawnPos, [], 0, "None"]; 
	for "_j" from 0 to 10 do { _gun addMagazine (magazines _gun select 0); };
	_gun setPosATL (_house buildingPos _housePosition); 
	_dir = ((boundingCenter _house select 0) - (getPosATL _gun select 0)) atan2 ((boundingCenter _house select 1) - (getPosATL _gun select 1)); 
	_dir = (360 - _dir); 
	//_dir = ((getPosATL startLocation select 0) - (getPosATL _gun select 0)) atan2 ((getPosATL startLocation select 1) - (getPosATL _gun select 1)); 
	_gun setDir _dir;
	_grp = ["static","Grp",str _gCount,"east"] call getGroup; 
	_ai  = _grp createUnit [staticClass, spawnPos, [], 0, "NONE"];	
	_ai assignAsGunner _gun; 
	_ai moveInGunner _gun;	
	_grp setFormDir _dir;
	if DEBUG then { [_house, _ai] call createDebugMarker; };  		
}; 
};