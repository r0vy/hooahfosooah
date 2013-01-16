//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_IED","_EOD","_id","_ok"];
_IED = _this select 0;
_EOD = _this select 1;
_id = _this select 2;

if (!local _EOD) exitWith {};

if (!alive _IED OR !alive _EOD) exitWith{};

if !(_EOD in reezo_IEDdetect_EODs) exitWith {
  _title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>UNABLE</t><br/><br/>";
  _text   = "You do not have the required expertise";
  hint parseText (_title + _text)
};

_IED removeAction _id;

_ok = createDialog "IEDdetect_injector";
reezo_IEDdetect_injection = 1;
publicVariable "reezo_IEDdetect_injection";

while { reezo_IEDdetect_injection == 1 && alive _IED && alive _EOD} do {
  reezo_IEDdetect_reading = floor (random 200);
  publicVariable "reezo_IEDdetect_reading";
  
  (finddisplay 650) displayctrl 660 ctrlSetText format ["%1", reezo_IEDdetect_reading];	
  
  sleep 0.2;
  sleep random 3;
};

deleteMarkerLocal "REEZOIED";
Reezo_IED_detector_objects = Reezo_IED_detector_objects - [_IED];
publicVariable "Reezo_IED_detector_objects";

if (_IED in reezo_IEDdetect_attachedIEDs) then {
  reezo_IEDdetect_attachedIEDs = reezo_IEDdetect_attachedIEDs - [_IED];
  publicVariable "reezo_IEDdetect_attachedIEDs";
};

if (_IED in reezo_IEDdetect_beepers) then {
  reezo_IEDdetect_beepers = reezo_IEDdetect_beepers - [_IED];
  publicVariable "reezo_IEDdetect_beepers"; 
};

if (reezo_IEDdetect_debug) then { player globalChat "REEZO_IEDDETECT DEBUG: MANUAL.SQF COMPLETE" };

if (true) exitWith {};