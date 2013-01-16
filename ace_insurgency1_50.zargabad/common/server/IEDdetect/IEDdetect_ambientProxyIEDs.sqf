//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_soldier","_ambientGROUP","_objects","_vehicles","_proximityIED","_minNumber","_chance","_interval","_bomb","_IEDtype","_beep","_scanArea","_fearArea","_detArea","_typeRate","_enemySide","_rnd","_fate","_actualPos","_y","_k","_ambientRadius","_IEDskins"];

_soldier = player;
_ambientGROUP = group _soldier;

if !(local _soldier) exitWith{};
if (_soldier != leader group _soldier) exitWith{};
waitUntil {reezo_IEDdetect_initComplete};
if (count _this != 6) exitWith{ hint "IEDDETECT_AMBIENTPROXYIEDS error: wrong parameters!" };

_ambientRadius = _this select 0;
_chance = _this select 1;
_interval = _this select 2;
_beep = _this select 3;
_typeRate = _this select 4;
_enemySide = _this select 5;

if (reezo_IEDdetect_debug) then {
  hintSilent Format["RADIUS:\n%1\n\nCHANCE:\n%2\n\nINTERVAL:\n%3\n\nBEEP:\n%4\n\nTYPERATE:\n%5\n\nENEMYSIDE:\n%6",_ambientRadius,_chance,_interval,_beep,_typeRate,_enemySide];
  sleep 1;
};

_IEDskins = ["Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v3_PMC","Land_IED_v4_PMC"];

if (side _soldier != _enemySide) exitWith{};

waitUntil { time > 3 };

// MAIN LOOP
while {alive _soldier} do {
  if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTPROXYIEDS: START MAIN LOOP"; sleep 1; };

  //RANDOMIZE BASED ON CHANCE AND RUN CODE ONLY IF TRUE (SAVES CYCLES IN ACCORDANCE WITH KYOTO PACTS)
  _fate = random 100;
  if (_fate < _chance) then {
    //CHECK HOW MANY ROADS ARE IN THE AREA
    _nearRoads = []; 
    _goodSpots = []; 
    _nearRoads = (getPos _soldier) nearRoads _ambientRadius;
    
    //FIND SUITABLE SPOTS AT LEAST 2/3 OF THE SOLDIER POSITION
    for [{_y = 0},{_y < (count _nearRoads)},{_y = _y + 1}] do {
      if ((getPos (_nearRoads select _y)) distance getPos _soldier > (_ambientRadius * 0.67))  then {
        _goodSpots = _goodSpots + [getPos (_nearRoads select _y)];
        if (reezo_IEDdetect_debug) then {
          _soldier globalChat "DEBUG IEDDETECT_AMBIENTPROXYIEDS: GOOD SPOT FOUND";
          hintSilent Format["GOOD SPOT:\n%1\n\nPOSITION:\n%2",(_nearRoads select _y),(getPos (_nearRoads select _y))];
          sleep 1;
        };
      };
    };
    
    //SPAWN THE IED AND MAKE IT A PROXIMITY IED
    if (count _goodSpots > 0 && ((getPos _soldier) select 2 < 5)) then {
      //RANDOMIZE A GOOD POSITION AND AN IED TYPE
      _IEDtype = _IEDskins select (floor (random (count _IEDskins)));
      _IEDpos = _goodSpots select (floor (random (count _goodSpots)));
      //RANDOMIZE POSITION AROUND THE GOOD SPOT FOUND
      _rndX = 5.5 + random 1.5;
      _rndY = 5.5 + random 1.5;
      _segno = random 1; if (_segno < 0.5) then { _rndX = -1 * _rndX };
      _segno = random 1; if (_segno < 0.5) then { _rndY = -1 * _rndY };
      _IEDpos = [(_IEDpos select 0) + _rndX, (_IEDpos select 1) + _rndY, (_IEDpos select 2)];
      
      if (reezo_IEDdetect_debug) then {
        hintSilent Format["IEDTYPE:\n%1\n\nIEDPOS:\n%2\n\nSOLDIERPOS:\n%3",_IEDtype,_IEDpos,(getPos _soldier)];
        sleep 1;
      };      
      _proximityIED = createVehicle [_IEDtype, _IEDpos, [], 0, "NONE"];
      _proximityIED setDir (random 360);
      
      //_proximityIED = _IEDtype createVehicle ((getPos _goodSpots) select (floor (random (count _goodSpots))));
      _rnd = random 100;
      if (_rnd < _typeRate) then {
        nul0 = [_proximityIED,_beep,0] execVM "common\server\IEDdetect\IEDdetect_proximity.sqf";
      } else {
        nul0 = [_proximityIED,_beep,1] execVM "common\server\IEDdetect\IEDdetect_proximity.sqf";
      };
      if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTPROXYIEDS: PROXIMITY IED SPAWNED"; sleep 1; };
    };

    while {_soldier distance _proximityIED <= (_ambientRadius) && alive _proximityIED} do {
      if (reezo_IEDdetect_debug) then {
        _soldier globalChat "DEBUG IEDDETECT_AMBIENTPROXYIEDS: WAIT TYPE 2";
        deleteMarker "debugMRK1";
        _debugMRK1 = createMarkerLocal ["debugMRK1", position _proximityIED];
        _debugMRK1 setMarkerShapeLocal "ICON";
        _debugMRK1 setMarkerTypeLocal "DOT";
        _debugMRK1 setMarkerTextLocal "DEBUG: Proximity IED";
      };
      sleep _interval;
    };
  } else {
    //YOU NEVER GET ENOUGH SLEEP WHEN YOU ARE A LAZY PERSON
    if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTPROXYIEDS: WAIT TYPE 3"; sleep 1; };
    sleep _interval;
  };
    
  //SLEEP IF _soldier DOES NOT MOVE FROM THE AREA
  while {_proximityIED distance _soldier < (_ambientRadius * 1.33)} do {
    if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTPROXYIEDS: WAIT TYPE 1"; sleep 1; };
    sleep _interval;
  };
  
  reezo_IED_detector_objects = reezo_IED_detector_objects - [_proximityIED];
  publicVariable "reezo_IED_detector_objects";
  deleteVehicle _proximityIED;
  
  if (!alive _soldier) then { _soldier = leader _ambientGROUP };
  
}; //END MAIN LOOP

// END
if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTPROXYIEDS: SCRIPT COMPLETE"; sleep 1; };
if (true) exitWith{};