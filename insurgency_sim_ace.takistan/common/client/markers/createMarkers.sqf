private ["_mkr","_var","_pos","_houses"];

_houses = [CENTERPOS,AORADIUS, 3, true] call findHouses;
{
	_pos = _x call getGridPos;
	_mkr = str _pos;
	if (getMarkerPos _mkr select 0 == 0) then {
		_mkr = createMarkerLocal[_mkr, _pos]; 
		_mkr setMarkerShapeLocal "RECTANGLE"; 
		_mkr setMarkerTypeLocal "SOLID";		
		_mkr setMarkerSizeLocal [50,50]; 
		_mkr setMarkerAlphaLocal 0.2; 
	};
	_var = missionNamespace getVariable format["%1cleared", _mkr];
	if isNil "_var" then {
		_mkr setMarkerColorLocal "ColorRed"; 
	} else {
		_mkr setMarkerColorLocal "ColorGreen";
	};
} forEach _houses;

if (isWest && markersEnabled == 1) then {
	{ 
		_mkr = createMarkerLocal[_x, spawnPos]; 
		_mkr setMarkerTypeLocal "mil_triangle"; 
		_mkr setMarkerSizeLocal [0.5,0.7]; 	
	} forEach westPlayerStrings; 
	{ 
		_mkr = createMarkerLocal[_x, spawnPos]; 
		_mkr setMarkerTypeLocal "mil_triangle"; 
		_mkr setMarkerSizeLocal [0.8,1.0]; 
		_i = westVehicleStrings find _x;
		if (_i > 3 && _i < 8) then { _mkr setMarkerSizeLocal [0.65,0.85]; };
	} forEach westVehicleStrings;
};
