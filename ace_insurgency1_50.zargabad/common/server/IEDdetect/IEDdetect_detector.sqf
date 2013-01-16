//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_detector","_range","_interval","_skill","_fakeRatio"];
if (count _this != 5) exitWith {hint "REEZO_IEDDETECT: WRONG PARAMETERS, QUITTING.."};

_detector = _this select 0;
if (!local _detector) exitWith {};
if !(_detector isKindOf "Man") exitWith { hint "REEZO_IEDDETECT: DETECTOR IS NOT A UNIT, QUITTING.."};

waitUntil {reezo_IEDdetect_initComplete};
waitUntil {!(isNull _detector)};
waitUntil {_detector == _detector};

_range = _this select 1;
_interval = _this select 2;
_skill = _this select 3;
_fakeRatio = _this select 4;

if (_range < 5) then { _range = 5 };
if (_interval < 5) then { _interval = 5 };

//nul0 = [_detector,_range,_interval,_skill,_fakeRatio] execVM "common\server\IEDdetect\IEDdetect_respawn_detector.sqf";
nul0 = [_detector,_range,_interval,_skill,_fakeRatio] execVM "common\server\IEDdetect\IEDdetect.sqf";

if (reezo_IEDdetect_debug) then { player globalChat "REEZO_IEDDETECT DEBUG: DETECTOR.SQF COMPLETE" };

if (true) exitWith {};