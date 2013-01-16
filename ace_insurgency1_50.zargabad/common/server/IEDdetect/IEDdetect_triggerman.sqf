//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

//INIT
if (!isServer) exitWith{};
private ["_triggerman","_scanDistance","_triggerDistance","_IEDhost","_enemySide","_armed","_nearUnits","_nearStuff","_nearTargets","_nearMen","_nearCars","_nearTanks","_nearTargetsMen","_nearTargetsCars","_nearTargetsTanks","_IED","_soldier","_y","_rnd","_trigGROUP","_posX","_posY","_escape"];

if (count _this != 6) exitWith{ hint "IEDdetect_triggerman error: wrong parameters!" };

waitUntil {reezo_IEDdetect_initComplete};

_triggerman = _this select 0;
_IEDhost = _this select 1;
_beep = _this select 2;
_scanDistance = _this select 3;
_triggerDistance = _this select 4;
_enemySide = _this select 5;
_armed = 0;
_fearing = 0;
_nearUnits = [];
_nearTargets = [];
_victimsCount = 0;

//ATTACH BOMB TO OBJECT
nul0 = [_IEDhost,_beep] execVM "common\server\IEDdetect\IEDdetect_attach.sqf";
waitUntil {_IEDhost in reezo_IEDdetect_hostIEDs};

//GET THE ACTUAL IED AND STORE IT INTO A VARIABLE
_nearStuff = (getPos _IEDhost) nearObjects ["Explosive",10];
for [{_y = 0},{_y < (count _nearStuff)},{_y = _y + 1}] do {
	if ((_nearStuff select _y) in reezo_IEDdetect_attachedIEDs) then {
		_IED = _nearStuff select _y;
	};
};

//MAIN LOOP
while {_armed != 2} do {

  //SEARCH FOR POTENTIAL VICTIMS AND DECIDE WHETHER TO TRIGGER THE BOMB OR NOT
  _nearTargetsMen = (getPos _IED) nearObjects ["Man",_triggerDistance];
  _nearTargetsCars = (getPos _IED) nearObjects ["Car",_triggerDistance];
  _nearTargetsTanks = (getPos _IED) nearObjects ["Tank",_triggerDistance];
  _nearTargets = _nearTargetsMen + _nearTargetsCars + _nearTargetsTanks;

  _victimsCount = 0;
  for [{_y = 0},{_y < (count _nearTargets)},{_y = _y + 1}] do {
    _victim = _nearTargets select _y;
    if (side _victim == _enemySide && _triggerman knowsAbout _victim > 0.22) then {
      _victimsCount = _victimsCount + 1;
    };
  };
  _rnd = random 10;
  if (_rnd < _victimsCount) then {
  	_armed = 1;
  	_triggerman addRating -1000;
  	reezo_IEDdetect_canFear = 1;
  	publicVariable "reezo_IEDdetect_canFear";
  	if (reezo_IEDdetect_debug) then {_soldier globalChat "IEDDETECT_CARBOMB DEBUG: Armed"; sleep 1;};
  };

  //SEARCH FOR UNITS THAT CAN INSTILL FEAR IN THE TRIGGERMAN
  if (_armed == 1) then {
  	_nearMen = (getPos _triggerman) nearObjects ["Man",_scanDistance];
  	_nearCars = (getPos _triggerman) nearObjects ["Car",_scanDistance];
  	_nearTanks = (getPos _triggerman) nearObjects ["Tank",_scanDistance];
  	_nearUnits = _nearMen + _nearCars + _nearTanks;
  	
  	for [{_y = 0},{_y < (count _nearUnits)},{_y = _y + 1}] do {
    	_soldier = _nearUnits select _y;
    	if (side _soldier == _enemySide) then {
    		_fearing = 1;
        	nul0 = [_soldier,_triggerman] execVM "common\server\IEDdetect\IEDdetect_cursorTarget.sqf";
    	} else {
    		_fearing = 0;
    	};
  	};
  	sleep 3;
  };
  
  //CHECK FOR THE EFFECTS OF FEAR AND CAUSE IT IN THE TRIGGERMAN BY PAUSING THIS SCRIPT
  while {_fearing == 1 && alive _triggerman && reezo_IEDdetect_cursorTarget > -1 && reezo_IEDdetect_canFear == 1} do { sleep 1 };  

  //DURING THE FEAR PHASE, THE TRIGGERMAN OR THE BOMB MIGHT HAVE BEEN NEUTRALIZED
  if (!alive _IED OR !(_IED in reezo_IED_detector_objects) OR !alive _triggerman) then {
    _armed = 2;
    if (reezo_IEDdetect_debug) then { _soldier globalChat "IEDDETECT_CARBOMB DEBUG: armed=2"; sleep 1; };
  };
  
  //WITH NO FEAR, ALIVE AND READY, THE TRIGGERMAN DETONATES HIS IED
  if (_armed == 1 && _IED in reezo_IED_detector_objects && alive _triggerman && reezo_IEDdetect_cursorTarget < 1) then {
    
    _triggerman playmove "AmovPercMstpSsurWnonDnon";
    _triggerman disableAI "ANIM";
    _triggerman disableAI "MOVE";
    sleep 0.1;
    _triggerman say "akbar";
    sleep 1.4;

    //ONE LAST CHECK FOR THE REQUISITES TO MEET BEFORE EXPLOSION
    if (alive _triggerman && alive _IED && damage _triggerman < 0.8) then {
      _rnd = random 1;
      if (_rnd < 0.4) then { "B_30mm_HE" createVehicle (getPos _IEDhost) };
      if (_rnd > 0.6) then { "Sh_125_HE" createVehicle (getPos _IEDhost) }
      else { "Bo_GBU12_LGB" createVehicle (getPos _IEDhost)};
      reezo_IEDdetect_canFear = 0;
      publicVariable "reezo_IEDdetect_canFear";
      _armed = 2;
    };
  };
  
  if (_armed != 2) then { sleep 3 };
};

//CLEAN UP IF IED IS NO LONGER PRESENT
Reezo_IED_detector_objects = Reezo_IED_detector_objects - [_IED];
publicVariable "Reezo_IED_detector_objects";
reezo_IEDdetect_attachedIEDs = reezo_IEDdetect_attachedIEDs - [_IED];
publicVariable "reezo_IEDdetect_attachedIEDs";
reezo_IEDdetect_hostIEDs = reezo_IEDdetect_hostIEDs - [_IEDhost];
publicVariable "reezo_IEDdetect_hostIEDs";
deleteVehicle _IED;
  
reezo_IEDdetect_cursorTarget = 0;
publicVariable "reezo_IEDdetect_cursorTarget";
reezo_IEDdetect_Targeters = reezo_IEDdetect_Targeters - [_soldier];
publicVariable "reezo_IEDdetect_Targeters";
reezo_IEDdetect_canFear = 0;
publicVariable "reezo_IEDdetect_canFear";
if (reezo_IEDdetect_debug) then { _soldier globalChat "IEDDETECT_CARBOMB DEBUG: IED Cleared from array"; sleep 1; };

//RANDOMIZE TRIGGERMAN REACTION IF HE IS STILL ALIVE
_rnd = random 100;

if (damage _triggerman < 0.9 && _rnd >= 25) then {

  _triggerman enableAI "ANIM";
  _triggerman enableAI "MOVE";

  _trigGROUP = createGroup EAST;
  [_triggerman] join _trigGROUP;
  _triggerman addRating -1000;

  if (_rnd >= 75) then {
    if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_TRIGGERMAN FIGHTING" };
    _triggerman addWeapon "AK_47_M";
    _triggerman addMagazine "30Rnd_762x39_AK47";
    _triggerman addMagazine "30Rnd_762x39_AK47";
    _triggerman setCombatMode "RED";
    _triggerman setBehaviour "COMBAT";
    doGetout _triggerman;
    _triggerman setSkill (random 0.8);
    //_triggerman doTarget _soldier;
    //_triggerman doFire _soldier;
  };

  if (_rnd > 0.25 && _rnd <= 0.75) then {
      if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_TRIGGERMAN ESCAPING" };
      _posX = 250 + random 250;
      _poxY = 250 + random 250;
      _segno = random 1;
      if (_segno < 0.5) then { _posX = -1 * _posX };
      _segno = random 1;
      if (_segno < 0.5) then { _posX = -1 * _posY };
      _escape = [_posX,_posY];
      _trigGROUP addWaypoint [_escape, 0];
      [_trigGROUP, 0] setWaypointType "MOVE";
      [_trigGROUP, 0] setWaypointSpeed "FULL";
      [_trigGROUP, 0] setWaypointBehaviour "AWARE";
  };
};

//FINALLY GET THE FUCK OUT OF THIS SCRIPT
if (reezo_IEDdetect_debug) then { _soldier globalChat "DEBUG IEDDETECT_TRIGGERMAN COMPLETE" };

if (true) exitWith{};