//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

private ["_soldier","_triggerman","_nearStuff"];

_soldier = _this select 0;
if !(local _soldier) exitWith{};
if (_soldier in reezo_IEDdetect_Targeters) exitWith{};

if (!isMultiplayer && _soldier != player) exitWith{};

if !(_soldier in reezo_IEDdetect_Targeters) then {
  reezo_IEDdetect_Targeters = reezo_IEDdetect_Targeters + [_soldier];
  publicVariable "reezo_IEDdetect_Targeters";
};

_triggerman = _this select 1;

while {alive _soldier && alive _triggerman && reezo_IEDdetect_canFear == 1} do {
  if (reezo_IEDdetect_debug) then { hint Format["CursorTarget\nFEAR:\n\n%1",reezo_IEDdetect_cursorTarget]; };
  if (cursorTarget == _triggerman ) then {
    if (reezo_IEDdetect_cursorTarget > 4) then { reezo_IEDdetect_cursorTarget = 4; }
    else { reezo_IEDdetect_cursorTarget = reezo_IEDdetect_cursorTarget + 1; };
    publicVariable "reezo_IEDdetect_cursorTarget";
  } else {
    if (reezo_IEDdetect_cursorTarget < -4) then { reezo_IEDdetect_cursorTarget = -4; }
    else { reezo_IEDdetect_cursorTarget = reezo_IEDdetect_cursorTarget - 1; };
    publicVariable "reezo_IEDdetect_cursorTarget";
  };
  sleep 1;
};

reezo_IEDdetect_Targeters = reezo_IEDdetect_Targeters - [_soldier];
publicVariable "reezo_IEDdetect_Targeters";

if (reezo_IEDdetect_debug) then { _soldier globalChat "IEDDETECT_CURSORTARGET.SQF COMPLETE" };
if (true) exitWith{};