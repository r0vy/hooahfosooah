//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_object","_beep","_attachedIED","_rnd","_detonate","_wait","_currentDamage"];
if (!isServer) exitWith{};

if (count _this < 1 OR count _this > 2) exitWith {hint "IED_DETECT_ADD.SQF WRONG PARAMETERS, QUITTING.." };
_object = _this select 0;
if (count _this == 2) then {_beep = _this select 1 } else { _beep = 0 };

// Better wait until the host object is ready
waitUntil {!(isNull _object)};
waitUntil {_object == _object};
waitUntil {reezo_IEDdetect_initComplete};

// Spawn the explosive object
_attachedIED = "Explosive" createVehicle (getPos _object);
sleep 0.1;

//Add that object to the array
Reezo_IED_detector_objects = Reezo_IED_detector_objects + [_attachedIED];
publicVariable "Reezo_IED_detector_objects";

//..and add it to the IEDs that are ATTACHED to something
Reezo_IEDdetect_attachedIEDs = Reezo_IEDdetect_attachedIEDs + [_attachedIED];
publicVariable "Reezo_IEDdetect_attachedIEDs";

//..and add the object it is attached to in the list of IED hosts
reezo_IEDdetect_hostIEDs = reezo_IEDdetect_hostIEDs + [_object];
publicVariable "reezo_IEDdetect_hostIEDs";

// To beep or not to beep, this is the question
if (_beep == 2) then { _rnd = random 1; if (_rnd > 0.5) then { _beep = 1 } else { _beep = 0 }; };

if (_beep == 1) then {
  reezo_IEDdetect_beepers = reezo_IEDdetect_beepers + [_attachedIED];
  publicVariable "reezo_IEDdetect_beepers";
};

// Attach the IED to the object
if (_object isKindof "Car" OR _object isKindOf "Tank") then {
  _attachedIED attachTo [_object,[0,0,-1],"hatch1"];
} else {
  _attachedIED attachTo [_object,[0,0,0],"hatch1"];
};
sleep 0.1;

if (reezo_IEDdetect_debug) then { player globalChat "REEZO_IEDDETECT DEBUG: ATTACH DONE AND WAITING" };

// blow up the IED if it gets shot or destroyed
_wait = true;
_detonate = false;
while { _wait } do {
  if (!alive _attachedIED) then { _wait = false };
  _rnd = random 1;
  if (_object in reezo_IEDdetect_hostIEDs && !(_object isKindOf "Man") && _rnd < damage _object) then { _detonate = true; _wait = false; };
  if (!(_object in reezo_IEDdetect_hostIEDs) && _attachedIED in reezo_IEDdetect_attachedIEDs && damage _attachedIED != 0) then { _detonate = true; _wait = false; };
  //if (!(_attachedIED in reezo_IED_detector_objects)) then { _wait = false; }; 
  if (_wait) then { sleep 3 };
};

if (_detonate && _attachedIED in reezo_IEDdetect_attachedIEDs) then {
    _rnd = random 1;
    if (_rnd < 0.4) then { "B_30mm_HE" createVehicle (getPos _attachedIED) };
    if (_rnd > 0.6) then { "Sh_125_HE" createVehicle (getPos _attachedIED) }
    else { "Bo_GBU12_LGB" createVehicle (getPos _attachedIED) };
};

if (_attachedIED in Reezo_IED_detector_objects) then {
  Reezo_IED_detector_objects = Reezo_IED_detector_objects - [_attachedIED];
  publicVariable "reezo_IED_detector_objects";
};
if (_attachedIED in reezo_IEDdetect_attachedIEDs) then {
  reezo_IEDdetect_attachedIEDs = reezo_IEDdetect_attachedIEDs - [_attachedIED];
  publicVariable "reezo_IEDdetect_attachedIEDs"; 
};

if (_attachedIED in reezo_IEDdetect_beepers) then {
  reezo_IEDdetect_beepers = reezo_IEDdetect_beepers - [_attachedIED];
  publicVariable "reezo_IEDdetect_beepers"; 
};

if (_object in reezo_IEDdetect_hostIEDs) then {
  reezo_IEDdetect_hostIEDs = reezo_IEDdetect_hostIEDs - [_object];
  publicVariable "reezo_IEDdetect_hostIEDs";
};
if (reezo_IEDdetect_canFear == 1) then {
  reezo_IEDdetect_cursorTarget = 0;
  publicVariable "reezo_IEDdetect_cursorTarget";
  reezo_IEDdetect_Targeters = [];
  publicVariable "reezo_IEDdetect_Targeters";
  reezo_IEDdetect_canFear = 0;
  publicVariable "reezo_IEDdetect_canFear";
};
if (alive _attachedIED) then { deleteVehicle _attachedIED };

if (reezo_IEDdetect_debug) then { player globalChat "REEZO_IEDDETECT DEBUG: ATTACH COMPLETE" };

if (true) exitWith {};