//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: Reezo of SR5 Tactical - www.sr5tactical.net
// IED Detection and Disposal Scripts
//////////////////////////////////////////////////////////////////

// INIT
private ["_detector","_range","_interval","_skill","_fakeRatio","_vehicle","_near","_nearCount","_IEDmarker","_rnd","_posX","_posY","_sign","_y","_h","_iedMarkename","_createvarname","_numberMarker","_action_reezo_IEDdetect_remoteDet","_action_reezo_IEDdetect_manualDefuse","_lapse","_nearHosts","_thisHost","_action_reezo_IEDdetect_detach","_fakeIED"];

_detector = _this select 0;
_range = _this select 1;
_interval = _this select 2;
_skill = _this select 3;
_fakeRatio = _this select 4;
_vehicle = _this select 5;

if !(local _detector) exitWith {};
if (damage _vehicle > 0.75) exitWith{};
waitUntil {reezo_IEDdetect_initComplete};

reezo_IEDdetect_EODs = reezo_IEDdetect_EODs + [_detector];
publicVariable "reezo_IEDdetect_EODs";

waitUntil {!dialog}; cutRsc ["IEDdetect_13", "PLAIN", 0];
playsound "IEDdetect_beep2";

// MAIN SCAN LOOP
while {alive _detector && alive _vehicle && driver _vehicle == _detector} do {
  if (reezo_IEDdetect_debug) then { player globalChat "NOW RUNNING: MAIN SCAN LOOP" };
  
  _detector = driver _vehicle;
  _fakeIED = 0;
  
  if !(_detector in reezo_IEDdetect_EODs && driver _vehicle == _detector) then {
    reezo_IEDdetect_EODs = reezo_IEDdetect_EODs + [_detector];
    publicVariable "reezo_IEDdetect_EODs";
  };
  
  while {count reezo_IED_detector_objects == 0} do { sleep (_interval * 2) };
    
  if (reezo_IEDdetect_busy == 0) then {
  
    _near = (getPos _vehicle) nearObjects (_range - ((speed _vehicle) * 1.25));
    _nearCount = count _near;
    if (_nearCount > 50) then {_nearCount = 50};
    
    // CASE 1. FAKE IED DETECTED (radio interferences or whatever gizmo might trigger it)
    _rnd = random 100;  
  
    if (_rnd < _fakeRatio && reezo_IEDdetect_busy == 0 && _nearCount > 5 && _detector == driver _vehicle) then {
      if (reezo_IEDdetect_debug) then { player globalChat "NOW RUNNING: FAKE IED CODE" };
   
      // Script goes busy
      reezo_IEDdetect_busy = 1;
      publicVariable "reezo_IEDdetect_busy";
      _fakeIED = 1;

      // ACQUIRE IED AND BROADCAST, adding it to the "Found IEDs" array
      reezo_IEDdetect_activeIED = _near select (floor (random _nearCount));
      publicVariable "reezo_IEDdetect_activeIED";
      reezo_IEDdetect_activeEOD = _detector;
      publicVariable "reezo_IEDdetect_activeEOD";

      // Scanner notification (Scanning..)
      waitUntil {!dialog}; cutRsc ["IEDdetect_01", "PLAIN", 0];
      playsound "IEDdetect_beep"; sleep 1;
      playsound "IEDdetect_beep"; sleep 1;
      playsound "IEDdetect_beep"; sleep 1;
      sleep 2;
      
      //MARKER PLACEMENT (approximate)
      deleteMarkerLocal "REEZOIED";
      deleteMarkerLocal _iedMarkename;
      sleep 0.1;    
      _rnd = random _range;
      _sign = random 1;
      if (_sign < 0.5) then { _rnd = -1 * _rnd };
      _posX = (getPos (_detector) select 0) + _rnd;
      _rnd = random _range;
      _sign = random 1;
      if (_sign < 0.5) then { _rnd = -1 * _rnd };
      _posY = (getPos (_detector) select 1) + _rnd;
      
      // GENERATE NAME NOT IN USE GLOBALLY
      _iedMarkename = "REEZOIED";
      _numberMarker = 0;
      if (isnil ("REEZOIED")) then {_iedMarkename="REEZOIED"} else {
        _createvarname = true;
        while {_createvarname} do {
          _iedMarkename = format["REEZOIED_%1",_numberMarker];
          if (isnil ("_iedMarkename")) then {
            _createvarname = false;
          } else {
            _numberMarker = _numberMarker+ 1;
          };
        };
      };
      _IEDmarker = createMarkerLocal[_iedMarkename,[_posX,_posY]];
      _IEDmarker setMarkerShape "ICON";
      _IEDmarker setMarkerType "WARNING";
      _IEDmarker setMarkerColor "colorRed";
      _IEDmarker setMarkerText "IED Approx. Position";
      _IEDmarker setMarkerSize [.50, .50];

      // Report the fake IED
      waitUntil {!dialog}; cutRsc ["IEDdetect_02", "PLAIN", 0];
      playsound "IEDdetect_beep2";
      sleep 15 + floor (random 90);

      // After some time..declare the IED fake
      waitUntil {!dialog}; cutRsc ["IEDdetect_07", "PLAIN", 0];
      playsound "IEDdetect_beep2";

      // Cleaning
      deleteMarkerLocal "REEZOIED";
      deleteMarkerLocal _iedMarkename;
    };

    if (_fakeIED == 0 && _detector == driver _vehicle && alive _detector) then {
      for [{_y = 0},{_y < _nearCount},{_y = _y + 1}] do {
             
        // CASE 2. REAL IED DETECTED
          if ((_near select _y) in reezo_IED_detector_objects && _detector == driver _vehicle) then {
            if (reezo_IEDdetect_debug) then { player globalChat "NOW RUNNING: REAL IED CODE" }; sleep 1;
             
            // Script goes busy
            reezo_IEDdetect_busy = 1;
            publicVariable "reezo_IEDdetect_busy";
            
            // ACQUIRE IED AND BROADCAST, adding it to the "Found IEDs" array
            reezo_IEDdetect_activeIED = _near select _y;
            publicVariable "reezo_IEDdetect_activeIED";
            reezo_IEDdetect_activeEOD = _detector;
            publicVariable "reezo_IEDdetect_activeEOD";
            
                if (reezo_IEDdetect_debug) then {
                  hint Format["Array:\n\n%1\n\nActiveIED:\n\n%2\n\nActiveEOD:\n\n%3",reezo_IED_detector_objects,reezo_IEDdetect_activeIED, reezo_IEDdetect_activeEOD];
                  sleep 1;
                };

            // Scanner notification (Scanning..)
            waitUntil {!dialog}; cutRsc ["IEDdetect_01", "PLAIN", 0];
            playsound "IEDdetect_beep"; sleep 1;
            playsound "IEDdetect_beep"; sleep 1;
            playsound "IEDdetect_beep"; sleep 1;
            sleep 2;
            
            //MARKER PLACEMENT (approximate)
            deleteMarkerLocal "REEZOIED";
            deleteMarkerLocal _iedMarkename;
            sleep 0.1;    
            _rnd = random 5;
            _sign = random 1;
            if (_sign < 0.5) then { _rnd = -1 * _rnd };
            _posX = (getPos (reezo_IEDdetect_activeIED) select 0) + _rnd;
            _rnd = random 5;
            _sign = random 1;
            if (_sign < 0.5) then { _rnd = -1 * _rnd };
            _posY = (getPos (reezo_IEDdetect_activeIED) select 1) + _rnd;
            
            // GENERATE NAME NOT IN USE GLOBALLY
            _iedMarkename = "REEZOIED";
            _numberMarker = 0;
            if (isnil ("REEZOIED")) then {_iedMarkename="REEZOIED"} else {
              _createvarname = true;
              while {_createvarname} do {
                _iedMarkename = format["REEZOIED_%1",_numberMarker];
                if (isnil ("_iedMarkename")) then {
                  _createvarname = false;
                } else {
                  _numberMarker = _numberMarker+ 1;
                };
              };
            };
            _IEDmarker = createMarkerLocal[_iedMarkename,[_posX,_posY]];
            _IEDmarker setMarkerShape "ICON";
            _IEDmarker setMarkerType "WARNING";
            _IEDmarker setMarkerColor "colorRed";
            _IEDmarker setMarkerText "IED Approx. Position";
            _IEDmarker setMarkerSize [.50, .50];

            // Notify the IED found, add disarm actions     
            waitUntil {!dialog}; cutRsc ["IEDdetect_02", "PLAIN", 0];
            playsound "IEDdetect_beep2";
            reezo_IEDdetect_activeIED removeAction _action_reezo_IEDdetect_manualDefuse;
            _action_reezo_IEDdetect_manualDefuse = reezo_IEDdetect_activeIED addAction ['<t color="#FF9800">'+"Defuse Bomb"+'</t>', "common\server\IEDdetect\IEDdetect_manualDefuse.sqf", [], 0, false, true, "",""];
            
            //check if IED is attached to something and if it is, place a Detach action on it
            if (reezo_IEDdetect_activeIED in reezo_IEDdetect_attachedIEDs) then {
              _nearHosts = ((getPos reezo_IEDdetect_activeIED) nearObjects 3) - [reezo_IEDdetect_activeIED];
              for [{_h= 0},{_h < (count _nearhosts)},{_h = _h + 1}] do {
                _thisHost = _nearHosts select _h;
                if (_thisHost in reezo_IEDdetect_hostIEDs) then {
                  _action_reezo_IEDdetect_detach = _thisHost addAction ['<t color="#FF3300">'+"Detach IED"+'</t>', "common\server\IEDdetect\IEDdetect_detach.sqf", [reezo_IEDdetect_activeIED], 0, false, true, "",""];
                };
              };
            };

            // Remote Det possibility
            _rnd = random 100;
            if (_rnd < _skill) then {
              sleep 4;
              waitUntil {!dialog}; cutRsc ["IEDdetect_03", "PLAIN", 0];
              playsound "IEDdetect_beep2";
              _vehicle removeAction _action_reezo_IEDdetect_remoteDet;
              _action_reezo_IEDdetect_remoteDet = _vehicle addAction ['<t color="#FF9800">'+"Remotely Detonate Bomb"+'</t>', "common\server\IEDdetect\IEDdetect_remoteDet.sqf", [reezo_IEDdetect_activeIED], 0, false, true, "",""];
            };
         
          }; // END IF
        
        // MAIN WAIT LOOP
        _lapse = 1;
        while { _detector == driver _vehicle && reezo_IEDdetect_busy == 1 && _lapse < 36 && alive reezo_IEDdetect_activeIED && alive reezo_IEDdetect_activeEOD && _vehicle distance reezo_IEDdetect_activeEOD < 300} do {
          // update IED marker if it moved in the meantime
          if (speed reezo_IEDdetect_activeIED != 0) then {
            _rnd = random 5;
            _sign = random 1;
            if (_sign < 0.5) then { _rnd = -1 * _rnd };
            _posX = (getPos (reezo_IEDdetect_activeIED) select 0) + _rnd;
            _rnd = random 5;
            _sign = random 1;
            if (_sign < 0.5) then { _rnd = -1 * _rnd };
            _posY = (getPos (reezo_IEDdetect_activeIED) select 1) + _rnd;
            _iedMarkename setMarkerPos [_posX, _posY];
          };
              
          sleep 5;
          _lapse = _lapse + 1;
        };

        if (!alive _vehicle OR !alive reezo_IEDdetect_activeIED OR _detector != driver _vehicle) then {
          reezo_IEDdetect_activeIED removeAction _action_reezo_IEDdetect_manualDefuse;
          _vehicle removeAction _action_reezo_IEDdetect_remoteDet;
        };
        
        deleteMarkerLocal "REEZOIED";
        deleteMarkerLocal _iedMarkename;
        
        //reezo_IEDdetect_activeIED = _detector;
        //publicVariable "reezo_IEDdetect_activeIED";
        //reezo_IEDdetect_activeEOD = _detector;
        //publicVariable "reezo_IEDdetect_activeEOD";
      }; // END FOR
    }; //END IF FAKEIED == 0
    
    reezo_IEDdetect_busy = 0;
    publicVariable "reezo_IEDdetect_busy";
    reezo_IEDdetect_EODs = reezo_IEDdetect_EODs - [_detector];
    publicVariable "reezo_IEDdetect_EODs";
  }; // END IF IEDDETECT_BUSY == 0
  
  sleep _interval;
  
}; // END WHILE

reezo_IEDdetect_busy = 0;
publicVariable "reezo_IEDdetect_busy";
reezo_IEDdetect_EODs = reezo_IEDdetect_EODs - [_detector];
publicVariable "reezo_IEDdetect_EODs";


if (reezo_IEDdetect_debug) then { player globalChat "reezo_IEDDETECT DEBUG: IEDDETECT_VEHICLE.SQF COMPLETE" };

if (true) exitWith {};