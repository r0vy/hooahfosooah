//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

if (!isServer) exitWith{};
private ["_center","_area","_civilians","_chance","_IEDtype","_beep","_scanArea","_fearArea","_detArea","_suicideRate","_enemySide","_vehicles","_triggerman","_rnd","_nearCars","_bomb"];

if (count _this != 9) exitWith{ hint "IEDdetect_triggerman_spawn error: wrong parameters!" };

waitUntil {reezo_IEDdetect_initComplete};

_name = _this select 0;
_center = getPos _name;
_area = (((triggerArea _name) select 0) + ((triggerArea _name) select 1) / 2);
_chance = _this select 1;
_IEDtype = _this select 2;
_beep = _this select 3;
_scanArea = _this select 4;
_fearArea = _this select 5;
_detArea = _this select 6;
_suicideRate = _this select 7;
_enemySide = _this select 8;

if (reezo_IEDdetect_debug) then { player globalChat "DEBUG IEDDETECT_TRIGGERMAN_SPAWN: BEGIN SCRIPT" };

_rnd = random 100;
if (_rnd > _chance) exitWith{};

_civilians = [];   
_nearPeople = _center nearObjects ["Man",_area];
for [{_y = 0},{_y < (count _nearPeople)},{_y = _y + 1}] do {
  if (side (_nearPeople select _y) == CIVILIAN) then {
    _civilians = _civilians + [_nearPeople select _y];
  };
};

_triggerman = (_civilians select (floor (random (count _civilians))));
if (reezo_IEDdetect_debug) then { player globalChat "DEBUG IEDDETECT_TRIGGERMAN_SPAWN: TRIGGERMAN FOUND" };

_rnd = random 100;
_nearCars = (getPos _triggerman) nearObjects [_IEDtype,_scanArea];
_vehicles = [];

if (_rnd < _suicideRate && count _nearCars > 0) then {
    for [{_y = 0},{_y < (count _nearCars)},{_y = _y + 1}] do {
        if !(side (_nearCars select _y) == _enemySide) then {
          if (isNull driver (_nearCars select _y) && !(isEngineOn (_nearCars select _y))) then {
            _vehicles = _vehicles + [_nearCars select _y];
          };
        };
    };
  _bomb = (_vehicles select (floor (random (count _vehicles))));
  if (reezo_IEDdetect_debug) then { player globalChat "DEBUG IEDDETECT_TRIGGERMAN_SPAWN: BOMB IS OBJECT" };
} else {
  _bomb = _triggerman;
  if (reezo_IEDdetect_debug) then { player globalChat "DEBUG IEDDETECT_TRIGGERMAN_SPAWN: BOMB IS TRIGGERMAN" };
};
 
nul0 = [_triggerman,_bomb,_beep,_fearArea,_detArea,_enemySide] execVM "common\server\IEDdetect\IEDdetect_triggerman.sqf";

if (reezo_IEDdetect_debug) then { player globalChat "IEDDETECT_TRIGGERMAN_SPAWN COMPLETE" };

if (true) exitWith{};