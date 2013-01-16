//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_object","_rnd","_beep","_detonate","_wait","_currentDamage"];
if (!isServer) exitWith{};

if (count _this < 1 OR count _this > 2) exitWith {hint "IED_DETECT_ADD.SQF WRONG PARAMETERS, QUITTING.." };
_object = _this select 0;
if (count _this == 2) then {_beep = _this select 1 } else { _beep = 2 };

waitUntil {!(isNull _object)};
waitUntil {_object == _object};
waitUntil {reezo_IEDdetect_initComplete};

Reezo_IED_detector_objects = Reezo_IED_detector_objects + [_object];
publicVariable "Reezo_IED_detector_objects";

if (_beep == 2) then {
  _rnd = random 1;
  if (_rnd > 0.5) then { _beep = 1 } else { _beep = 0 };
};

if (_beep == 1) then {
  reezo_IEDdetect_beepers = reezo_IEDdetect_beepers + [_object];
  publicVariable "reezo_IEDdetect_beepers";
};

if (reezo_IEDdetect_debug) then { sleep 1; player globalChat "REEZO_IEDDETECT DEBUG: ADD DONE AND WAITING"; sleep 1;};

// blow up the IED if it gets shot or destroyed
_wait = true;
_detonate = false;
while { _wait } do {
  _rnd = random 1;
  if (_rnd < damage _object) then { _detonate = true; _wait = false; };
  if (!alive _object) then { _wait = false };
  if (_wait) then { sleep 3 };
};

if (_detonate && _object in reezo_IED_detector_objects) then {
    _rnd = random 1;
    if (_rnd < 0.4) then { "B_30mm_HE" createVehicle (getPos _object) };
    if (_rnd > 0.6) then { "Sh_125_HE" createVehicle (getPos _object) }
    else { "Bo_GBU12_LGB" createVehicle (getPos _object) };
};

if (_object in Reezo_IED_detector_objects) then {
  Reezo_IED_detector_objects = Reezo_IED_detector_objects - [_object];
  publicVariable "reezo_IED_detector_objects"; 
};

if (_object in reezo_IEDdetect_beepers) then {
  reezo_IEDdetect_beepers = reezo_IEDdetect_beepers - [_object];
  publicVariable "reezo_IEDdetect_beepers"; 
};

if (reezo_IEDdetect_canFear == 1) then {
  reezo_IEDdetect_cursorTarget = 0;
  publicVariable "reezo_IEDdetect_cursorTarget";
  reezo_IEDdetect_Targeters = [];
  publicVariable "reezo_IEDdetect_Targeters";
  reezo_IEDdetect_canFear = 0;
  publicVariable "reezo_IEDdetect_canFear";
};

if (alive _object) then { deleteVehicle _object };

if (reezo_IEDdetect_debug) then { sleep 1; player globalChat "REEZO_IEDDETECT DEBUG: ADD COMPLETE"; sleep 1;};

if (true) exitWith {};