//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
if (!isServer) exitWith{};

reezo_IEDdetect_debug = false; //make TRUE to turn on debug messages
publicVariable "reezo_IEDdetect_debug";

reezo_IEDdetect_busy = 0;
publicVariable "reezo_IEDdetect_busy";

reezo_IED_detector_objects = [];
publicVariable "reezo_IED_detector_objects";

reezo_IEDdetect_attachedIEDs = [];
publicVariable "reezo_IEDdetect_attachedIEDs";

reezo_IEDdetect_hostIEDs = [];
publicVariable "reezo_IEDdetect_hostIEDs";

reezo_IEDdetect_EODs = [];
publicVariable "reezo_IEDdetect_EODs";

reezo_IEDdetect_beepers = [];
publicVariable "reezo_IEDdetect_beepers";

reezo_IEDdetect_EODvehicles = [];
publicVariable "reezo_IEDdetect_EODvehicles";

reezo_IEDdetect_cursorTarget = 0;
publicVariable "reezo_IEDdetect_cursorTarget";

reezo_IEDdetect_Targeters = [];
publicVariable "reezo_IEDdetect_Targeters";

reezo_IEDdetect_canFear = 0;
publicVariable "reezo_IEDdetect_canFear";

reezo_IEDdetect_initComplete = true;
publicVariable "reezo_IEDdetect_initComplete";

nul0 = [] execVM "common\server\IEDdetect\IEDdetect_beeper.sqf";

if (reezo_IEDdetect_debug) then { player globalChat "REEZO_IEDDETECT DEBUG: INIT COMPLETE" };

if (true) exitWith {};