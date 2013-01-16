//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_soldier","_ambientGROUP","_civilians","_vehicles","_triggerman","_minNumber","_chance","_interval","_bomb","_IEDtype","_beep","_scanArea","_fearArea","_detArea","_suicideRate","_enemySide","_rnd","_fate","_actualPos","_y","_k","_ambientRadius"];

_soldier = player;
_ambientGROUP = group _soldier;

if !(local _soldier) exitWith{};
if (_soldier != leader group _soldier) exitWith{};
waitUntil {reezo_IEDdetect_initComplete};
if (count _this != 11) exitWith{ hint "IEDdetect_ambientBombers error: wrong parameters!" };

_ambientRadius = _this select 0;
_minNumber = _this select 1;
_chance = _this select 2;
_interval = _this select 3;
_IEDtype = _this select 4;
_beep = _this select 5;
_scanArea = _this select 6;
_fearArea = _this select 7;
_detArea = _this select 8;
_suicideRate = _this select 9;
_enemySide = _this select 10;

if (side _soldier != _enemySide) exitWith{};

waitUntil { time > 3 };

// MAIN LOOP
while {alive _soldier} do {

  //RANDOMIZE BASED ON CHANCE AND RUN CODE ONLY IF TRUE (SAVES CYCLES IN ACCORDANCE WITH KYOTO PACTS)
  _fate = random 100;
  if (_fate < _chance) then {
    //CHECK HOW MANY CIVILIANS ARE IN THE AREA
    _civilians = [];   
    _nearPeople = (getPos _soldier) nearObjects ["Man",_ambientRadius];
    for [{_y = 0},{_y < (count _nearPeople)},{_y = _y + 1}] do {
      if (side (_nearPeople select _y) == CIVILIAN) then {
        _civilians = _civilians + [_nearPeople select _y];
      };
    };
    //PROCEED ONLY IF ENOUGH CIVVIES ARE FOUND AND CHECK FOR ALTITUDE DIFFERENCE TO AVOID TRIGGERING WHEN FLYING OVER
    _soldierAltitude = (getPos _soldier) select 2;
    _civAltitude = (getPos (_civilians select 0)) select 2;
    if (count _civilians >= _minNumber && (abs (_soldierAltitude - _civAltitude)) < 5 ) then {
      _triggerman = (_civilians select (floor (random (count _civilians))));
      _civilians = [];   
      _nearPeople = (getPos _triggerman) nearObjects ["Man",_ambientRadius];
      for [{_y = 0},{_y < (count _nearPeople)},{_y = _y + 1}] do {
        if (side (_nearPeople select _y) == CIVILIAN) then {
          _civilians = _civilians + [_nearPeople select _y];
        };
      };
      _triggerman = (_civilians select (floor (random (count _civilians))));
      _bomb = _triggerman;
      if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTBOMBERS: TRIGGERMAN FOUND"; sleep 1; };
      _rnd = random 100;
      _vehicles = [];
      _nearCars = (getPos _triggerman) nearObjects [_IEDtype,_scanArea];
      //DECIDE: SUICIDE BOMBER OR TRIGGERMAN?
      if (_rnd < _suicideRate && count _nearCars > 0) then {
        for [{_k = 0},{_k < (count _nearCars)},{_k = _k + 1}] do {
          if !(side (_nearCars select _k) == _enemySide) then {
            if (isNull driver (_nearCars select _k) && !(isEngineOn (_nearCars select _k))) then {
              //hint Format ["%1",(side (_nearCars select _k))];
              _vehicles = _vehicles + [_nearCars select _k];
            };
          };
        };
        _bomb = (_vehicles select (floor (random (count _vehicles))));
        if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTBOMBERS: BOMB IS OBJECT"; sleep 1; };
      } else {
        _bomb = _triggerman;
        if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTBOMBERS: BOMB IS TRIGGERMAN"; sleep 1; };
      };
      //FINALLY ACTIVATE THE SON OF A BITCH
      sleep 1;
      if (reezo_IEDdetect_debug) then {
        hintSilent Format["TRIGGERMAN:\n%1\n\nBOMB:\n%2\n\nBEEP:\n%3\n\nFEARAREA:\n%4\n\nDETAREA:\n%5\n\nENEMYSIDE:\n%6",_triggerman,_bomb,_beep,_fearArea,_detArea,_enemySide];
      };
      nul0 = [_triggerman,_bomb,_beep,_fearArea,_detArea,_enemySide] execVM "common\server\IEDdetect\IEDdetect_triggerman.sqf";
      
      while {_soldier distance _triggerman < (_ambientRadius/2) && alive _triggerman} do {
        if (reezo_IEDdetect_debug) then {
          _soldier globalChat "DEBUG IEDDETECT_AMBIENTBOMBERS: WAIT TYPE 2";
          _debugMRK1 = createMarkerLocal ["debugMRK1", position _triggerman];
          _debugMRK1 setMarkerShapeLocal "ICON";
          _debugMRK1 setMarkerTypeLocal "DOT";
          if (_triggerman == _bomb) then {
            _debugMRK1 setMarkerTextLocal "Suicide Bomber";
          } else {
            _debugMRK2 = createMarkerLocal ["debugMRK2", position _bomb];
            _debugMRK2 setMarkerShapeLocal "ICON";
            _debugMRK2 setMarkerTypeLocal "DOT";
            _debugMRK1 setMarkerTextLocal "Triggerman";
            _debugMRK2 setMarkerTextLocal "IED";
          };
        };
        sleep _interval;
      };
    } else {
      //YOU NEVER GET ENOUGH SLEEP WHEN YOU ARE A LAZY PERSON
      if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTBOMBERS: NOT ENOUGH CIVVIES"; sleep 1; };
      sleep _interval;
    };
    
    //SLEEP IF _soldier DOES NOT MOVE FROM THE AREA
    _actualPos = getPos _soldier;
    while {_actualPos distance (getPos _soldier) < (_ambientRadius/2)} do {
      if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTBOMBERS: WAIT TYPE 1"; sleep 1; };
      sleep _interval;
    };
    
    if (!alive _soldier) then { _soldier = leader _ambientGROUP };
  
  };
}; //END MAIN LOOP

// END
if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_AMBIENTBOMBERS: SCRIPT COMPLETE"; sleep 1; };
if (true) exitWith{};