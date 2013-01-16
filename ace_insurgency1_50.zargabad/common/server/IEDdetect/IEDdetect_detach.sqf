//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_object","_title","_text","_EOD","_id","_attachedIED"];
_object = _this select 0;
_EOD = _this select 1;
_id = _this select 2;
_attachedIED = (_this select 3) select 0;

if !(local _EOD) exitWith {};

if (!alive _attachedIED) exitWith {_object removeAction _id};

if !(_EOD in reezo_IEDdetect_EODs) exitWith {
  _title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>UNABLE</t><br/><br/>";
  _text   = "You do not have the required expertise";
  hint parseText (_title + _text)
};

_EOD playMove "AinvPknlMstpSnonWrflDnon_medic3";
sleep 1;
_EOD playMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
sleep 3;

if (alive _attachedIED) then {
  detach _attachedIED;
  _attachedIED setPos (getPos _EOD);
  _object removeAction _id;
  reezo_IEDdetect_hostIEDs = reezo_IEDdetect_hostIEDs - [_object];
};

if (reezo_IEDdetect_debug) then { player globalChat "REEZO_IEDDETECT DEBUG: DETACH COMPLETE" };

if (true) exitWith {};