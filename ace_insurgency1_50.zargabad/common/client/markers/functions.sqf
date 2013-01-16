gridPath = {
    private ["_gMkr"];
    
    if (vehicle player != player) exitWith {};
	_gMkr  = str(player call getGridPos);
	if isNil "_gMkr" exitWith {};
	if (markerColor _gMkr == "ColorGreen") exitWith {};
	if (nearestEastMen(call compile _gMkr,70,true,"count") > 0 
	|| nearestPlayers(call compile _gMkr,140,true,"count") < playersNeeded) exitWith {};
	_gMkr setMarkerColor "ColorGreen";
	missionNamespace setVariable [format["%1cleared", _gMkr], true];
	publicVariable format["%1cleared", _gMkr];
	};

AImarkers = {
	private ["_mkr","_txt","_color","_isPlayer"];
    {
		if (alive _x && _x != graveDigger) then {
			_mkr = str _x;
			if (getMarkerPos _mkr select 0 == 0) then {
				_mkr = createMarkerLocal[_mkr, getPosATL _x];
				_mkr setMarkerShapeLocal "ICON";
				_mkr setMarkerTypeLocal "mil_triangle";
				_mkr setMarkerSizeLocal [0.5,0.7];
				_mkr spawn { sleep 10; deleteMarkerLocal _this; };
			};
			_mkr setMarkerPosLocal getPosATL _x;
			_mkr setMarkerDirLocal getDir _x;
			_txt = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
			_isPlayer = str leader _x in eastPlayerStrings;
			if _isPlayer then { _txt = name _x; };
			_mkr setMarkerTextLocal _txt;
			_color = "ColorRed";
			if (_isPlayer || nearestPlayers(getPosATL _x,100,true,"count") > 0 || startPos distance _x < hqProtectionRing) then { _color = "ColorOrange"; };
			_mkr setMarkerColorLocal _color;
		};
	} forEach nearestObjects[CENTERPOS, eastInfClasses, AORADIUS];
};

playerMarkers = { 	
	private ["_colour","_plr","_vcl"];
	
    { 		
		if !isNil _x then {
			_plr = call compile _x;
			if(isNull _plr) exitWith { _x setMarkerPosLocal spawnPos; _x setMarkerTextLocal ""; };
			_vcl = vehicle _plr;
			if (_vcl != _plr) exitWith { _x setMarkerPosLocal spawnPos; };
			_colour = "ColorBlue";
			if (str _plr in squadUnitStrings(squadString(player))) then { _colour = "ColorGreen"; };
			if (!alive _plr) then { _colour = "ColorBlack"; };
			if (lifeState _plr == "UNCONSCIOUS") then { _colour = "ColorRed"; };
			_x setMarkerColorLocal _colour;
			_x setMarkerPosLocal getPosATL _plr;
			_x setMarkerDirLocal getDir _plr; 
		} else { _x setMarkerPosLocal spawnPos; _x setMarkerTextLocal ""; };
	} forEach westPlayerStrings;
};

vehicleMarkers = { 		
    private ["_bool","_mkr","_vcl","_crew","_type"];
    
    {
		if !isNil _x then {
			_mkr = _x;
			_vcl = call compile _x;	
			_mkr setMarkerPosLocal getPosATL _vcl;
			_mkr setMarkerDirLocal getDir _vcl;
			_crew = crew _vcl;
			_type = typeOf _vcl;
			if (!alive _vcl) then { _mkr setMarkerColorLocal "ColorBlack"} else {
				if (count _crew == 0 || (count _crew == 1 && _type == HELITYPE) ) then { _mkr setMarkerColorLocal "ColorYellow"; } else {
					_bool = false;
					for "_i" from 0 to (count _crew - 1) do { if (str (_crew select _i) in squadUnitStrings(squadString(player))) then { _bool = true; }; };
					if (_bool) then { _mkr setMarkerColorLocal "ColorGreen"; } else { _mkr setMarkerColorLocal "ColorBlue"; };
				}; 
			};
		};
	} forEach westVehicleStrings;
};

markerTexts = { 	  
    if (isNil "mapClickBool") then { mapClickBool = false; };
	if !visibleMap exitWith {
		if mapClickBool then { mapClickBool = false; };
		if mapInUse then { mapInUse = false; };
	};
	if !(mapClickBool || mapInUse) then {
		mapClickBool = true;
		onMapSingleClick '
		_pos   = [_pos select 0, _pos select 1];
		if isEast exitWith {
			// Mission is set to COOP only
			if (eastRatio == -1) exitWith { 
				_text = format["The mission is set to COOP only! Please join BLUFOR!",_num];
				titleText[_text, "PLAIN", 3];
			};
			// If teams are not balanced, do not let OPFOR players spawn
			_num = floor(playersNumber west / eastRatio);
			_pstr = call compile (player getVariable ["INS_playerString","9"]);
			if !(unitNumber(_pstr) <= _num) exitWith { 
				_text = format["Only OPFOR units up to slot %1 can spawn, due to imbalance (OPFOR:BLUFOR ratio is 1:%2)!",_num, eastRatio];
				titleText[_text, "PLAIN", 3];
			};
			_units = nearestEastMen(_pos,40,true,"array");
			if (count _units == 0) exitWith {};
			_unit = _units select 0;
			if (str leader _unit in eastPlayerStrings) exitWith { player groupChat "Cannot switch into a player''s unit"; };
			if (nearestPlayers(getPosATL _unit,100,true,"count") > 0 || startPos distance _unit < hqProtectionRing) exitWith { 
				player groupChat "This unit is too close to the enemy"; 
			};
			_unit spawn {
				_unit = _this;
				_PlayerGroup = group _unit;
				[_unit] joinSilent startGroup;
				_oldUnit = player;
				waitUntil { local _unit };
				selectPlayer _unit;
				player setVariable ["INS_playerString",str _oldUnit, true];
				hint "Switched unit!";
			//self bomber
				_unit call addActionWearBelt;

				if !(str _oldUnit in eastPlayerStrings) then { [_oldUnit] joinSilent oldGroup;};
				oldGroup = _PlayerGroup;
			};						
			openMap false;
		};
		_units = nearestObjects[_pos,westAllClasses,40];
		if (count _units == 0) exitWith {};
		_unit  = _units select 0;
		_mkr	= str _unit; 	
		if (_unit isKindOf "man" && _mkr in westPlayerStrings) then { 			
			_id	 	= unitID(_unit); 		
			_name = getName(_unit); 		
			if (markerText _mkr == "") exitWith { _mkr setMarkerTextLocal _id; };
			if (markerText _mkr == _id) exitWith { _mkr setMarkerTextLocal _name; };
			_mkr setMarkerTextLocal "";
		}; 		
		if (_unit in westVehicles) then { 		
			_id		= victorID(_unit); 			
			if (markerText _mkr == "") exitWith { _mkr setMarkerTextLocal _id; };
			_mkr setMarkerTextLocal "";
		}; 		 
		';
	}; 	
}; 