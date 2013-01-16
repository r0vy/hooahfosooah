//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_soldier","_ambientGROUP","_objects","_vehicles","_proximityIED","_minNumber","_chance","_interval","_bomb","_IEDtype","_beep","_scanArea","_fearArea","_detArea","_typeRate","_enemySide","_rnd","_fate","_actualPos","_y","_k","_ambientRadius","_IEDskins","_posX","_posY","_posZ","_randomPos"];

if !(isServer) exitWith{};

waitUntil {reezo_IEDdetect_initComplete};
if (count _this != 6) exitWith{ hint "IEDDETECT_AMBIENTPROXYIEDS error: wrong parameters!" };

_center = _this select 0;
_radius = _this select 1;
_quantity = _this select 2;
_chance = _this select 3;
_beep = _this select 4;
_typeRate = _this select 5;

_IEDskins = ["Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v3_PMC","Land_IED_v4_PMC"];

//CHECK HOW MANY ROADS ARE IN THE AREA
_nearRoads = []; 
_goodSpots = []; 
_nearRoads = (getMarkerPos _center) nearRoads _radius;

if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT SCATTER: SPOTS ACQUIRED" };

//FIND SUITABLE SPOTS IN THE GIVEN AREA
if (count _nearRoads > 0) then {
  for [{_y = 0},{_y < (count _nearRoads)},{_y = _y + 1}] do {
    _goodSpots = _goodSpots + [getPos (_nearRoads select _y)];
    if (reezo_IEDdetect_debug) then {
      _soldier globalChat "DEBUG IEDDETECT SCATTER: GOOD SPOT FOUND (ON ROAD)";
      hintSilent Format["GOOD SPOT:\n%1\n\nPOSITION:\n%2",(_nearRoads select _y),(getPos (_nearRoads select _y))];
      sleep 0.05;
    };
  };
} else {
  for [{_y = 0},{_y < _quantity},{_y = _y + 1}] do {
    _segno = random 1; if (_segno < 0.5) then { _posX = random _radius } else { _posX = -1 * (random _radius) };
    _segno = random 1; if (_segno < 0.5) then { _posY = random _radius } else { _posY = -1 * (random _radius) };
    _posX = _posX + ((getMarkerPos _center) select 0);
    _posY = _posY + ((getMarkerPos _center) select 1);
    _posZ = (getMarkerPos _center) select 2;
    _randomPos = [_posX,_posY,_posZ];
    _goodSpots = _goodSpots + [_randomPos];
    if (reezo_IEDdetect_debug) then {
      _soldier globalChat "DEBUG IEDDETECT SCATTER: GOOD SPOT FOUND (NOT ON ROAD)";
      hintSilent Format["GOOD SPOT:\n\nPOSITION:\n%1",_randomPos];
      sleep 0.05;
    };
  };
};

_n = 0;

// MAIN LOOP 
while { _n <= _quantity && count _goodSpots > 0} do {

  if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT SCATTER: START MAIN LOOP" };
  
  //RANDOMIZE BASED ON CHANCE
  _fate = random 100;
  if (_fate < _chance) then {

    //RANDOMIZE A GOOD POSITION, AN IED TYPE AND REMOVE THAT LOCATION FROM THE AVAILABLE SPOTS
    _IEDtype = _IEDskins select (floor (random (count _IEDskins)));
    _IEDpos = _goodSpots select (floor (random (count _goodSpots)));
    _goodSpots = _goodSpots - [_IEDpos];
    _n = _n + 1;
    
    //RANDOMIZE POSITION AROUND THE GOOD SPOT FOUND
    _rndX = 5.5 + random 1.5;
    _rndY = 5.5 + random 1.5;
    _segno = random 1; if (_segno < 0.5) then { _rndX = -1 * _rndX };
    _segno = random 1; if (_segno < 0.5) then { _rndY = -1 * _rndY };
    _IEDpos = [(_IEDpos select 0) + _rndX, (_IEDpos select 1) + _rndY, (_IEDpos select 2)];

    _proximityIED = createVehicle [_IEDtype, _IEDpos, [], 0, "NONE"];
    _proximityIED setDir (random 360);

    _rnd = random 100;
    if (_rnd < _typeRate) then {
      nul0 = [_proximityIED,_beep,0] execVM "common\server\IEDdetect\IEDdetect_proximity.sqf";
    } else {
      nul0 = [_proximityIED,_beep,1] execVM "common\server\IEDdetect\IEDdetect_proximity.sqf";
    };
    
    if (reezo_IEDdetect_debug) then {
      hintSilent Format["IEDTYPE:\n%1\n\nIEDPOS:\n%2",_IEDtype,_IEDpos];
      _soldier globalChat "DEBUG IEDDETECT SCATTER: PROXIMITY IED SPAWNED";
      _debugProxyName = Format["DEBUG_PROXY_MARKER_%1",_n];
      _debugMRK1 = createMarkerLocal[_debugProxyName,position _proximityIED];
      _debugMRK1 setMarkerShapeLocal "ICON";
      _debugMRK1 setMarkerTypeLocal "DOT";
      _debugMRK1 setMarkerTextLocal "DEBUG: Proximity IED Scatter";
      sleep 0.05;
    };
  }; //END IF
}; //END MAIN LOOP


// EXIT
if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT SCATTER: SCRIPT COMPLETE"; sleep 1; };
if (true) exitWith{};