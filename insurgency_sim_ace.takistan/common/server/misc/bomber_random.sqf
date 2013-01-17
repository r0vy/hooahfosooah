//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: kylania
// 
// Based on code from SNKMAN
// http://forums.bistudio.com/showpost.php?p=1623731&postcount=4
//////////////////////////////////////////////////////////////////
//  Examples: 
//
//  Called from a trigger, Civilians - Present - Once to set 1 bomber out of preset Civs, attacking WEST, 70% chance of attack and 50m range.
//  nul = [thislist select floor(random count thislist), WEST, 7, 50] execVM "hkRandom.sqf";
//
//  Called from a unit's init, 100% chance to attack EAST units within 100m with a warning and shout.
//  nul = [this, EAST, 10, 100, true, true];
//
//  Default, attacking WEST targets 30% of the time within 20m warning the group but not yelling out a shout.
//  nul = [this] execVM "hkRandom.sqf";
//
//////////////////////////////////////////////////////////////////

_unit = _this select 0;  // Bomber unit, set randomly by trigger.
_side = if (count _this > 1) then {_this select 1} else {WEST};  // Side to attack, default West.
_prob = if (count _this > 2) then {_this select 2} else {3};  // Probilitiy of attack once a target is found, Number 1 - 10, higher = more chance.  Default 3 (30% chance or so);
_range = if (count _this > 3) then {_this select 3} else {20};  // Range to look for targets in, default 20m.
_warn = if (count _this > 4) then {_this select 4} else {true};  // Option to warn the attacked group, all group members will target the bomber, AI won't shoot civs though.  Default true.
_shout = if (count _this > 5) then {_this select 5} else {false};  // Option to make the bomber say a sound (declared below) before attacking.  Default false.
_sound = "allahu";  // Sound file declared 

// Defaults.
_looking = true;
_target = objNull;

// Set to true to see status messages from the bomber.
_demo = false;

if (isServer) then {

  // Init the target array.
  if (isNil "TargetArray") then {TargetArray = [];};

  // Start hunting.
  while {_looking} do {
	_targets = _unit nearTargets _range;  // Check targets within range.

	if (count TargetArray > 0) then {_targets = _targets - TargetArray;};

	// We have targets in range...
	if (count _targets > 0) then
	{
		_count = 0;
		while { (_count < count _targets) } do
		{
			_selectTarget = (_targets select _count);
			// Make sure we know about the target and that they match the side we want to attack.
			if ( (_unit knowsAbout (_selectTarget select 4) > 0) && (_selectTarget select 2 == _side) ) then
			{
				TargetArray = TargetArray + [_selectTarget select 4];  // Grab the target unit objects
			};
		_count = _count + 1;
		};
	};

	// If we have valid target objects...
	if (count TargetArray > 0) then {
	
		// Lets see if we're ready to die...
		_chance = round(random 9) + 1;
		
		// Demo text.
		if (_demo) then {_txt = format["Probability: %1, Roll: %2",_prob, _chance]; titleText[_txt, "PLAIN"];};
		
		// If the bomber is ready to die, stop looking and pick one of the random targets found...
		if (_chance <= _prob) then {
			if (_demo) then {hint format["Found these targets: %1", TargetArray];};
			_looking = false;
			_target = TargetArray select floor(random count TargetArray);
		} else {
			// The bomber is NOT ready to die, so do nothing.
			if (_demo) then {hintSilent "Sill hunting, not ready to die...";};
		};
	
	} else {
		// No targets found so do nothing.
		if (_demo) then { hintSilent "Still hunting...";};
	};

	// Wait a while and clear any targets previously found.
	sleep 5;
	TargetArray = [];
  };

  // At this point we've found a target (broke out of loop via _looking = false)

  // Charge at the target!
  _unit SetUnitPos "Up";
  _unit SetSpeedMode "Full";
  _unit SetCombatMode "Red";
  _unit SetBehaviour "Careless";
  if (_demo) then {hint format["INCOMING for you %1!", _target];};


  // Make the bomber keep chasing the target till dead or within 15m.
  while {alive _unit && (_unit distance _target > 15)} do {
	_unit doMove getPos _target;
	sleep 3;
  };

  // We're in range, make sure we're still alive then pull the pin!
	  // Shout or warn per options
	  //if (_shout) then {_unit say [_sound,5]};
	  //if (_warn) then {units (group _target) commandTarget _unit};

  if (alive _unit) then {"R_57mm_HE" createVehicle getPos _unit};
  
};