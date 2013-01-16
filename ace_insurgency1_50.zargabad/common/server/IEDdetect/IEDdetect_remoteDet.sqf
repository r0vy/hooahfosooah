//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_object","_id","_IED","_EOD","_rnd","_y","_nearstuff","_EMP"];

_object = _this select 0;
_EOD = _this select 1;
_id = _this select 2;
_IED = (_this select 3) select 0;
_EMP = true;

if (!local _EOD) exitWith {};

playsound "IEDdetect_click"; sleep 0.2;

_nearstuff = getPos reezo_IEDdetect_activeIED nearObjects 50;

// TOO CLOSE
for [{_y = 0},{_y < (count _nearstuff)},{_y = _y + 1}] do {
    if (side (_nearstuff select _y) == side reezo_IEDdetect_activeEOD) then {
      waitUntil {!dialog}; cutRsc ["IEDdetect_05", "PLAIN", 0];
      playsound "IEDdetect_beep2";
      _EMP = false;
    };
};

// TOO FAR
  if ((reezo_IEDdetect_activeEOD distance reezo_IEDdetect_activeIED) > 150) then {
    waitUntil {!dialog}; cutRsc ["IEDdetect_06", "PLAIN", 0];
    playsound "IEDdetect_beep2";
    _EMP = false;
  };

if (_EMP) then { _object removeAction _id };

if (alive reezo_IEDdetect_activeIED && _EMP) then {
  waitUntil {!dialog}; cutRsc ["IEDdetect_04", "PLAIN", 0];
  playsound "IEDdetect_wave"; sleep 2.5;
  sleep random 1.5;

  _rnd = random 1;
  if (_rnd < 0.4) then { "B_30mm_HE" createVehicle (getPos _IED) };
  if (_rnd > 0.6) then { "Sh_125_HE" createVehicle (getPos _IED) }
  else { "Bo_GBU12_LGB" createVehicle (getPos _IED)};
  
  Reezo_IED_detector_objects = Reezo_IED_detector_objects - [reezo_IEDdetect_activeIED];
  publicVariable "Reezo_IED_detector_objects";
  deleteVehicle reezo_IEDdetect_activeIED;
  reezo_IEDdetect_cursorTarget = 0;
  publicVariable "reezo_IEDdetect_cursorTarget";
  reezo_IEDdetect_Targeters = [];
  publicVariable "reezo_IEDdetect_Targeters";
  reezo_IEDdetect_canFear = 0;
  publicVariable "reezo_IEDdetect_canFear";
};

if (reezo_IEDdetect_debug) then { player globalChat "IEDDETECT_DEBUG: REMOTEDET COMPLETE" };

if (true) exitWith {};