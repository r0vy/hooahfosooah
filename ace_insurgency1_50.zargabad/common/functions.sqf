// return true when distance to spawnPos is less than 1000m unless the unit is flying (i.e. altitude higher than 50m)
isDead = {
	(getPosATL _this select 2 < 50 && (_this distance spawnPos) < 500)
};
#define isDead(X) (X call isDead)

// find all valid houses which offer a certain minimum count of positions
findHouses = { 
	private ["_buildings","_minPositions","_enterables","_alive"];
	_buildings = nearestObjects [_this select 0, ["House"], _this select 1]; 
	_minPositions = (_this select 2) - 1;
	_alive = _this select 3;
	
	_enterables = []; 	
	{ 
		if (
			format["%1", _x buildingPos _minPositions] != "[0,0,0]" 
		&& EP1HOUSES 
		&& !(typeOf _x in ILLEGALHOUSES) && (alive _x || !_alive)
		) then { 
			_enterables set [count _enterables, _x]; 
		}; 
	} forEach _buildings; 
	_enterables
}; 

setSurrendered = {
	if !isDedicated then {
		if (player distance _this <= 20) then { 
			private "_txt";
			switch (round random 1) do {
				case 0: {	_txt = "I Surrender!"; };
				case 1: {	_txt = "I give up!"; };
			};
			_this globalChat format["%1: %2", getText (configFile >> "CfgVehicles" >> typeOf _this >> "displayName"), _txt];
		};
	};	
	if isServer then {
		removeAllWeapons _this;
		_this setUnitPos "UP";
		_this disableAI "move";	
		_this playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
		_this disableAI "anim";	
	};	
};

getDir2 = {
    private ["_dirW","_dirS"];

    _dirW			= screenToWorld [0.5,0.5];
	_dirS 		= ((_dirW select 0) - (getPosATL player select 0)) atan2 ((_dirW select 1) - (getPosATL player select 1));   
	((_dirS+360) % 360)
};

#define getDir2 (call getDir2)

nearestWeapons = {	
	private ["_wep","_pos","_rds","_alive","_type","_result"];
	_wep   = _this select 0;
	_pos   = _this select 1;
	_rds   = _this select 2;
	_alive = _this select 3;
	_type  = _this select 4;
    
	if (_type == "count") then { _result = 0; } else { _result = []; };	
	{
		if (_x isKindOf "man" && (!alive _x || _alive)) then {
			if (_wep in weapons _x) then { 
				if (_type == "count") then { _result = _result + 1; } else { _result = _result + [_x]; }; 
			};
		} else {
			if (_wep in (getWeaponCargo _x select 0)) then { 
				if (_type == "count") then { _result = _result + 1; } else { _result = _result + [_x]; }; 
			};
		};
	} forEach nearestObjects[_pos,["weaponHolder","man","ReammoBox","AllVehicles"],_rds];
	_result
};

#define nearestWeapons(V,W,X,Y,Z)	([V,W,X,Y,Z] call nearestWeapons)

groupMembers = {
	private ["_result","_plr","_alive","_type"];
	_alive = _this select 0;
	_type  = _this select 1;
    
	if (_type == "count") then { _result = 0; } else { _result = []; };	
	{
		if (!isNil _x) then {
			_plr = call compile _x;
			if (!isNull _plr) then {
				if ((alive _plr && !isDead(_plr)) || !_alive) then { 
					if (_type == "count") then { _result = _result + 1; } else { _result = _result + [_plr]; };
				};
			};
		};
	} forEach (squadUnitStrings(squadString(player))-[player]);
	_result
};

#define groupMembers(Y,Z)	([Y,Z] call groupMembers)

nearestPlayers = {
	private ["_result","_pos","_range","_type","_alive","_arr"];
	_pos   = _this select 0;
	_range = _this select 1;
	_alive = _this select 2;
	_type  = _this select 3;
	
	if (_type == "count") then { _result = 0; } else { _result = []; }; 
	{
		if (!isNil _x) then {
			_plr = call compile _x;
			if (!isNull _plr) then {
				if (_plr distance _pos <= _range && (alive _plr || !_alive)) then { 
					if (_type == "count") then { _result = _result + 1; } else { _result = _result + [_plr]; };
				};
			};
		};
	} forEach westPlayerStrings;
	_result
};
	
#define nearestPlayers(W,X,Y,Z)	([W,X,Y,Z] call nearestPlayers)

nearestInfantry = { 
	private ["_result","_arr","_alive","_type"];
	_arr   = nearestObjects[_this select 0, ["Man"], _this select 1];	
	_alive = _this select 2;
	_type  = _this select 3;
    
	if (_type == "count") then { _result = 0; } else { _result = []; }; 
	{
		if (!(_x in westPlayerStrings) && ( (alive _x && primaryWeapon _x != "") || !_alive ) ) then {
			if (_type == "count") then { _result = _result + 1; } else { _result set [count _result, _x]; };
		};
	} forEach _arr;
	_result
}; 

#define nearestInfantry(W,X,Y,Z)	([W,X,Y,Z] call nearestInfantry)

nearestEastMen = { 
	private ["_result","_arr1","_arr2","_alive","_type"];
	_arr1  = nearestObjects[_this select 0, ["LandVehicle"], _this select 1]; 
	_arr2  = nearestObjects[_this select 0, ["Man"], _this select 1];	
	_alive = _this select 2;
	_type  = _this select 3;
    
	if (_type == "count") then { _result = 0; } else { _result = []; }; 
	{
		if (typeOf _x in eastInfClasses && ( (alive _x && primaryWeapon _x != "") || !_alive ) ) then {
			if (_type == "count") then { _result = _result + 1; } else { _result set [count _result, _x]; };
		};
	} forEach _arr2;
	for "_i" from 0 to (count _arr1 - 1) do { 
		{ 
			if (typeOf _x in eastInfClasses && (alive _x || !_alive) ) then { 
				if (_type == "count") then { _result = _result + 1; } else { _result set [count _result, _x]; };
			};
		} forEach (crew (_arr1 select _i)); 
	}; 
	_result
}; 

#define nearestEastMen(W,X,Y,Z)	([W,X,Y,Z] call nearestEastMen)
#define numberOfAI           nearestEastMen(CENTERPOS,AORADIUS,false,"count")

nearestMen2 = { 
	private ["_result","_arr1","_arr2","_alive","_type"];
	_arr1  = nearestObjects[_this select 0, ["Car","Tank"], _this select 1]; 
	_arr2  = nearestObjects[_this select 0, ["Man"], _this select 1];	
	_alive = _this select 2;
	_type  = _this select 3;
    
	if (_type == "count") then { _result = 0; } else { _result = []; }; 
	{
		if (!isDead(_x) && _x isKindOf "Man" && !(str _x in westPlayerStrings) && ( (alive _x && primaryWeapon _x != "") || !_alive ) ) then {
			if (_type == "count") then { _result = _result + 1; } else { _result set [count _result, _x]; };
		};
	} forEach _arr2;
	for "_i" from 0 to (count _arr1 - 1) do { 
		{ 
			if (!(str _x in westPlayerStrings) && (alive _x || !_alive) ) then { 
				if (_type == "count") then { _result = _result + 1; } else { _result set [count _result, _x]; };
			};
		} forEach (crew (_arr1 select _i)); 
	}; 
	_result
}; 

#define nearestMen2(W,X,Y,Z)	([W,X,Y,Z] call nearestMen2)

knowsAboutAll = {
    private ["_knows","_unit","_ai","_arr"];
    _ai    = _this select 0;
	_arr   = _this select 1;
	
	_knows = true;
	for "_i" from 0 to (count _arr - 1) do {
		_unit = _arr select _i;
		if (_ai knowsAbout _unit < 1) exitWith { _knows = false; };
	};
	_knows
};

#define knowsAboutAll(X,Y) ([X,Y] call knowsAboutAll)

getBearing = {
	private ["_dirTo","_unit","_obj","_uDir"];
    
    _unit  = _this select 0;
    _obj   = _this select 1;
	
    _dirTo = abs(getDirTo(_unit,_obj));
    _uDir  = getDir(vehicle _unit);	
	if (abs(_dirTo - _uDir) > 180) then { _dirTo = -1*(360 - _dirTo); };
	(_dirTo - _uDir)
};

// canSee; returns true if a _unit looks at the _obj within a certain _arc (field of view) in degrees
canSee = {
	private ["_unit","_obj","_dirTo","_uDir","_vcl","_arc"];
	_unit  = _this select 0;
	_obj   = _this select 1;
	_arc   = _this select 2;
	
	_dirTo = getDirTo(_unit,_obj); // vector from _unit to _obj
	_uDir  = getDir (vehicle _unit); // heading of _unit
	if (vehicle _unit != _unit) then {
		// if it's a vehicle and _unit is in a turret we take the heading of that turret
		_vcl = vehicle _unit;
		if (_vcl turretUnit [0] == _unit) then {
			_uDir = _vcl weaponDirection (_vcl weaponsTurret [0] select 0);
			_uDir = (_uDir select 0) atan2 (_uDir select 1);
		};
	};
	if (abs(_dirTo - _uDir) > 180) then { _uDir = -1*(360 - _uDir); };
	abs(_dirTo - _uDir) <= _arc

};
			
#define canSee(X,Y,Z) ([X,Y,Z] call canSee)

arrCanSee = {
	private ["_arc","_pos","_arr","_rng","_unit","_canSee"];
	_arr = _this select 0;
	_pos = _this select 1;
	_arc = _this select 2;
	_rng = _this select 3;
    
	_canSee = false;
	for "_i" from 0 to (count _arr - 1) do {
		_unit = _arr select _i;
		if (alive _unit && (canSee(_unit,_pos,_arc) || _unit distance _pos <= _rng)) exitWith { _canSee = true; };
	};
	_canSee
};

#define arrCanSee(W,X,Y,Z) ([W,X,Y,Z] call arrCanSee)

canSeeArr = {	
    private ["_canSee","_unit","_pos","_arr","_arc"];
    _pos = _this select 0;
	_arr = _this select 1;
	_arc = _this select 2;
    
	_canSee = true;
	for "_i" from 0 to (count _arr - 1) do {
		_unit = _arr select _i;
		if !canSee(_pos,_unit,_arc) exitWith { _canSee = false; };
	};
	_canSee
};

#define canSeeArr(X,Y,Z) ([X,Y,Z] call canSeeArr)

// create an AI group based on the supplied params and returns the concatenated name
// if the AI group already exists it only returns the name
getGroup = { 
    private ["_side","_prefix","_name","_suffix"];
    _prefix = _this select 0; 
    _name   = _this select 1; 
    _suffix = _this select 2; 
	_side   = _this select 3;
	
	call compile format["
		if isNil ""%1%2%3"" exitWith { %1%2%3 = createGroup %4; %1%2%3 };
		if isNull %1%2%3 exitWith { %1%2%3 = createGroup %4; %1%2%3 }; 
		%1%2%3
	", _prefix, _name, _suffix, _side]; 
}; 

countPositions = { 
	private ["_i","_house","_hPos"]; 
    _house = _this select 0; 
    _i 	 = _this select 1; 
    
	_hPos	 = format["%1", _house buildingPos _i]; 
	if (_hPos == "[0,0,0]") exitWith { _i; }; 
	[_house, _i+1] call countPositions; 
}; 

#define nPos(X) ([X,0] call countPositions)

getGridPos = { 		
    private ["_pos","_x","_y"];
    
 	_pos = getPosATL _this; 
 	_x = _pos select 0;
 	_y = _pos select 1;
 	_x = _x - (_x % 100); 
 	_y = _y - (_y % 100); 
	[_x + 50, _y + 50, 0]
}; 

getCaches = { 
	private ["_i","_arr","_str","_cache"]; 
    _arr 	= _this select 0; 
    _i	  = _this select 1; 
    
	if (_i >= cacheCount) exitWith { _arr; }; 
    _str   = format["cache%1", _i+1]; 		
    _cache = call compile _str; 
	if (!isNull _cache) then {
		if (alive _cache) then { _arr = _arr + [_cache]; }; 
	};
	[_arr, _i+1] call getCaches; 
}; 

#define cacheList    	  ([[],0] call getCaches)
	
getCacheMarkers = { 
	private ["_i","_cache","_arr","_mkr"]; 
    _cache  = _this select 0; 
    _arr    = _this select 1; 
    _i 	  = _this select 2; 
    
	_mkr	 = format["%1intel%2", _cache, _i]; 
	if ((getMarkerPos _mkr select 0) == 0) exitWith { _arr; }; 
	_arr set [_i, _mkr]; 
	[_cache, _arr, _i+1] call getCacheMarkers; 
}; 

#define cacheMarkers(X) ([X,[],0] call getCacheMarkers)

createDebugMarker = { 
    private ["_txt","_dir","_unit","_mkr"];
    _unit = _this select 0;
	
	if (isNil "_unit") exitWith { };   
	_mkr = createMarkerLocal["DEBUG" + str _unit, getPosATL _unit]; 
	_mkr setMarkerShapeLocal "ICON";
	_mkr setMarkerTypeLocal "mil_triangle"; 
	_mkr setMarkerSizeLocal [0.5,0.7];  
	_txt = str _unit;
	//if (typeName _txt == "OBJECT") then {_txt = getText (configFile >> "CfgVehicles" >> typeOf vehicle(_this select 1) >> "displayName"); };
	if (str _unit in eastPlayerStrings) then { _txt = name _unit; };
	_mkr setMarkerTextLocal _txt; 
	_mkr setMarkerColorLocal "ColorRed"; 
	_dir = getDir _unit;
	if (vehicle _unit != _unit) then { _dir = formationDirection _unit; };
	_mkr setMarkerDirLocal _dir;
	if (!alive _unit) then { _mkr setMarkerColorLocal "ColorBlack"; };
	[_mkr, _unit] spawn {
        private ["_mkr","_unit"];
        _mkr    = _this select 0;
        _unit   = _this select 1;
        
		while{!isNull _unit && DEBUG}do{ 
			_mkr setMarkerPosLocal getPosATL _unit; 
			_mkr setMarkerDirLocal getDir _unit;
			if !alive _unit then { _mkr setMarkerColorLocal "ColorBlack";	};
			sleep 0.1; 
		}; 
		if !DEBUG then { sleep 5; }; 
		deleteMarkerLocal _mkr;
	};
}; 


