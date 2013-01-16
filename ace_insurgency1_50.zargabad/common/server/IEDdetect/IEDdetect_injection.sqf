//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

private ["_event","_IED","_b","_rnd"];

_display = _this select 0;
_event = _this select 1;
_control = _this select 2;
_modulator = _this select 3;
_IED = reezo_IEDdetect_activeIED;
_EOD = reezo_IEDdetect_activeEOD;

  switch (_event) do {
    case "MouseButtonDown": { 
      if (reezo_IEDdetect_reading mod 3 == 0) then {
        playsound "IEDdetect_click"; sleep 0.33;
        closedialog 0;
        waitUntil {!dialog}; cutRsc ["IEDdetect_10", "PLAIN", 0];
        playsound "IEDdetect_beep2";
      } else {
        playsound "IEDdetect_click"; sleep 0.33;
        closedialog 0;
        waitUntil {!dialog}; cutRsc ["IEDdetect_11", "PLAIN", 0];
        sleep random 2;
        for [{_b = 24},{_b > 0},{_b = _b - 2}] do {
          _IED say3D "IEDdetect_Beep3";
          sleep (_b / (15 + floor (random 3)));
        };
        _rnd = random 1;
        if (_rnd < 0.4) then { "B_30mm_HE" createVehicle (getPos _IED) };
        if (_rnd > 0.6) then { "Sh_125_HE" createVehicle (getPos _IED) } 
        else { "Bo_GBU12_LGB" createVehicle (getPos _IED) };
      };
    };	
    default {};
  };

Reezo_IED_detector_objects = Reezo_IED_detector_objects - [_IED];
deleteVehicle _IED;
reezo_IEDdetect_injection = 0;
publicVariable "reezo_IEDdetect_injection";
reezo_IEDdetect_cursorTarget = 0;
publicVariable "reezo_IEDdetect_cursorTarget";
reezo_IEDdetect_Targeters = [];
publicVariable "reezo_IEDdetect_Targeters";
reezo_IEDdetect_canFear = 0;
publicVariable "reezo_IEDdetect_canFear";


if (reezo_IEDdetect_debug) then { player globalChat "REEZO_IEDDETECT DEBUG: INJECTION.SQF COMPLETED" };

if (true) exitWith {};