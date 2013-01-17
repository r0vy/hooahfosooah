aiMonitor = {
    private ["_ai","_gun","_ais","_guns"];
    
    _ais  = nearestEastMen(getPosATL player,125,true,"array");
	_guns = nearestObjects[getPosATL player, eastStationaryGuns, 1000];
	_ai   = objNull;
	_gun  = objNull;
	if (count _ais > 0) then { if (vehicle (_ais select 0) == (_ais select 0)) then { _ai = _ais select 0; }; };
	if (count _guns > 0) then { _gun = gunner (_guns select 0); };
	if (isNull _gun && isNull _ai) exitWith {};


	[nil,server,"loc",rSPAWN,[_ai,player,_gun],{

		_ai  = _this select 0;
		_plr = _this select 1;
		_gun = _this select 2;

		//move gun around whilst waiting.
		
		group _gun setFormDir (random -(359)+(359/2));
  
		
		if !isNull _ai then {
			_ai reveal _plr;
			_ai setUnitPos "UP";
			_ai doWatch _plr;
			_ai doMove getPosATL _plr;
		};
	 

	
		if !isNull _gun then {
			 if (player distance _gun < 400) then {	
			_gun reveal _plr;
			_dir = ((getPosATL _plr select 0) - (getPosATL _gun select 0)) atan2 ((getPosATL _plr select 1) - (getPosATL _gun select 1)); 
			group _gun setFormDir _dir;
			_gun doTarget _plr;
			sleep 1;
			curTime = time;
			while { time - curTime < 5 } do {
				vehicle _gun fireAtTarget [_plr,currentWeapon vehicle _gun];
				sleep (0.1 + random 1);
			};
			};			
		};

	}] call RE;
 
};

// findHousesFront; find enterable houses close to the player
findHousesFront = { 
	private ["_buildings","_minPositions","_enterables"];
    
	// find houses within a certain radius based on a position
	_buildings = nearestObjects [_this select 0, ["House"], _this select 1]; 
	// house should have _minPositions spawn points, 0 based
	_minPositions = (_this select 2) - 1; 
	_enterables = []; 	
	{ 
		//checking if enough spawn positions are found in the house ([0,0,0] returned means illegal position),
		//if it's a house from OA (optional through mapping defines), is not listed in 'ILLEGALHOUSES', is not damaged and player can see it
		if (
		format["%1", _x buildingPos _minPositions] != "[0,0,0]" && 
		EP1HOUSES &&
		!(typeOf _x in ILLEGALHOUSES) && 
		damage _x == 0 &&
		canSee(player,_x,60)
		) then { 
			_enterables set [count _enterables, _x]; 
		}; 
	} forEach _buildings; 
	_enterables
}; 

// makes up the AI name based on player squad name plus a incrementing number and returns it
// each player has its "own" AI spawned, defined by the count defined in the mission params
// from 25% == 1 AI up to 100% == 4 AIs per player
findSquadAIName = {
	private ["_i","_squad","_str","_unit","_plrs","_pos","_arr"];
    _squad = _this select 0;
    _i     = _this select 1;

	//Simple adjusting AI rate when Dynamic is selected.
	if (maxAIPerPlayer == 0) then {
		if (playersNumber west < 11) then { maxAIPerPlayer = 2 } else { maxAIPerPlayer = 1 };
	};
    
	if (_i > maxAIPerPlayer) exitWith { "" }; 
    _str = format["%1ai%2", _squad, _i];
	if isNil _str exitWith { _str };
    _unit = call compile _str;
	if !alive _unit exitWith { _str };
	_pos = getPosATL _unit;
	_plrs = nearestPlayers(_pos,SPAWNRANGE,true,"array");
	if ( 
	alive _unit && !(str leader _unit in eastPlayerStrings) &&
	( (count _plrs == 0 || !arrCanSee(_plrs,_unit,90,100)) || (!(player in _plrs) && !arrCanSee(_plrs,_unit,35,50)) )
	) exitWith { _str };
	[_squad, _i+1] call findSquadAIName; 
}; 

#define findSquadAIName(X) ([X,1] call findSquadAIName)

#define exitCondition (findSquadAIName(player) == "" || !alive player)

fillHouseEast = { 
	private ["_x","_process","_arr","_inc","_pID","_pos","_bool","_unit","_name","_class","_ai","_nPos","_house","_cCount","_hID","_wCount","_i","_group","_skill"];
	scopeName "fillHouseEastMain";
	
	_house	 = _this select 0;
	_wCount  = _this select 1;
	_inc	 = _this select 2;
	
	// when this is true, setVehicleInit is processed (i.e. AI is created)
	_process	= false;
	// number of spawn positions in a house
	_nPos		= nPos(_house);
	// 0 based count of OPFOR infantry class members
	_cCount		= count eastInfClasses - 1;
	// random spawn position
	_x			= round random (_nPos-1); 	
	// checks if the house is a valid house for AI spawns (if not it's -1)
	_hID		= CACHEHOUSEPOSITIONS find (typeOf _house);
	_arr		= [];
	if (_hID != -1 && _wCount > 0) then {
		_arr = CACHEHOUSEPOSITIONS select (_hID + 1);		
	};
	
	for [{ _i=_x},{ _i<((_nPos-1)+_x)},{ _i=_i+_inc}] do {  
		if (count _arr == 0 && _wCount > 0 && _hID != -1) exitWith {};	
		_pos   = _house buildingPos (_i % _nPos); 
		if (count _arr > 0) then {
			_pID = (_arr select 0);
			_pos = _house buildingPos _pID;
			_arr = _arr - [(_arr select 1)] - [_pID];
		};
		// create an AI at _pos if no other "Man" in radus of 3 meters of _pos
		if (count nearestObjects[_pos, ["Man"], 3] == 0) then {
			_name  = findSquadAIName(player);
			if (_name == "") exitWith { breakTo "fillHouseEastMain"; };
			_bool  = !isNil _name;
			if _bool then { _bool = alive (call compile _name); };
			// when the AI unit (found by name) is alive, make sure it's healthy and, make it 
			// "look-alive" by issuing a move command
			if _bool exitWith {
				_unit = call compile _name;
				_unit setPosATL _pos; 
				_unit setDamage 0;
				[server,server,"loc",rSPAWN,_unit,{
					_this doMove getPosATL _this;
					sleep 1;
				}] call RE;
				if DEBUG then { server globalChat format["moving %1", _name]; };
			};
			if DEBUG then { server globalChat "sleeping"; }; sleep (20 + random 20);
			// if there are no appropriate AI units around,  prepare for spawning them
			if DEBUG then { server globalChat format["spawning %1", _name]; };
			_class = eastInfClasses select (random _cCount);
			_group  = [player, "EastAIGrp", "", "east"] call getGroup; // create an AI group
			_group setBehaviour "AWARE";
			_ai    = _group createUnit [_class, spawnPos, [], 0, "NONE"];

				
			_ai setPosATL _pos;
			_skill = aiSkill / 10;

			if (random 100 > 75) then {
				_ai setUnitRank "SERGEANT";				
			};


			_ai setSkill ["aimingAccuracy",(0.1 + random 0.25)];
			_ai setSkill ["aimingShake", (0.1 + random 0.5)];
			_ai setSkill ["aimingSpeed",(0.5 + random 0.5)];
			_ai setSkill ["endurance",(0.7 + random 0.3)];
			_ai setSkill ["spotDistance",(0.7 + random 0.3)];
			_ai setSkill ["spotTime",1.0];
			_ai setSkill ["courage",(0.7 + random 0.3)];
			_ai setSkill ["reloadSpeed",(0.5 + random 0.5)];
			_ai setSkill ["commanding",1.0];
			_ai setSkill ["general",1.0];

			
			call compile format['
				%1 = _ai;
				_ai setVehicleInit ''
					this setVehicleVarName ''''%1'''';
					%1 = this;

					if (random 100 > 75) then {
					this addweapon ''''binocular'''';
					};
							
					if !(this hasWeapon ''''MakarovSD'''') then { this addWeapon ''''glock17_EP1''''; this addMagazine ''''17Rnd_9x19_glock17''''; this addMagazine ''''17Rnd_9x19_glock17'''';};

					if (random 100 > 90) then {
						removeAllWeapons this;
						removeAllItems this;
						this addWeapon ''''ItemMap'''';
						this addWeapon ''''ItemCompass'''';								
						this addWeapon ''''ItemRadio'''';
						_wep_rnd = round random 3;
							if (_wep_rnd == 0) then { this addMagazine ''''6Rnd_45ACP''''; this addMagazine ''''6Rnd_45ACP''''; this addMagazine ''''6Rnd_45ACP''''; this addMagazine ''''6Rnd_45ACP''''; this addWeapon ''''revolver_EP1'''';};
							if (_wep_rnd == 1) then { this addMagazine ''''30Rnd_9x19_UZI''''; this addMagazine ''''30Rnd_9x19_UZI''''; this addMagazine ''''30Rnd_9x19_UZI''''; this addMagazine ''''30Rnd_9x19_UZI''''; this addWeapon ''''UZI_EP1'''';};
							if (_wep_rnd == 2) then { this addMagazine ''''20Rnd_B_765x17_Ball'''';	this addMagazine ''''20Rnd_B_765x17_Ball''''; this addMagazine ''''20Rnd_B_765x17_Ball''''; this addMagazine ''''20Rnd_B_765x17_Ball''''; this addWeapon ''''Sa61_EP1'''';};
							if (_wep_rnd == 3) then { this addMagazine ''''8Rnd_9x18_Makarov''''; this addMagazine ''''8Rnd_9x18_Makarov''''; this addMagazine ''''8Rnd_9x18_Makarov''''; this addMagazine ''''8Rnd_9x18_Makarov''''; this addWeapon ''''Makarov'''';};
					};
					
					if (random 100 > 40) then {
					this addMagazine (%2 select (random (count %2 - 1)));
					this addMagazine ''''BAF_ied_v3'''';
					};

									
					this addEventHandler [''''killed'''', { 
					missionNamespace setVariable [''''%1var'''', time];
						
					}];
				'';
			', _name, IEDList, _skill, spawnPos];
			_process = true;
		};
		sleep 0.1;
	};
	// spawns the AI prepared with 'setVehicleInit'
	if _process then { processInitCommands; };
}; 

aiSpawn = {   	
    private ["_inc","_hPos","_eCount","_wUnits","_wCount","_house","_clear","_gMkr","_houses","_hCount"];
    
    if exitCondition exitWith {}; // player dead or has no name for ai squad name generation, then exit
	_houses = [getPosATL player, SPAWNRANGE, 3] call findHousesFront; // find available houses for spawn posits
	_hCount = count _houses;
	if (_hCount == 0) exitWith {};	
	_inc		= 6; 
	if (_hCount < 10) then { _inc = 3; };			
	for "_j" from 0 to (count _houses - 1) do {				
		_house 	= _houses select _j; 
		_clear  = _house getVariable "cleared";
		_gMkr   = str(_house call getGridPos);
		if (markerColor _gMkr == "ColorRed" && isNil "_clear") then {  // make sure it's a red square
			_hPos   = getPosATL _house;	
			_eCount = count nearestObjects[_hPos, ["Man"], 15];									
			_wUnits = nearestPlayers(_hPos,SPAWNRANGE-200,true,"array"); 
			_wCount = count _wUnits;
			// players need not to be within SPAWNRANGE-200 from a house or they need not to see the spawn position for its AI to spawn
			if (_eCount == 0 && (_wCount == 0 || !arrCanSee(_wUnits,_hPos,30,50))) then { [_house, _wCount, _inc] call fillHouseEast; };					
		};
		if exitCondition exitWith {};
	};
};

// aiDespawn, removes dead AI 
aiDespawn = {
	private ["_unit","_str","_var","_plrs"];
    
	for "_i" from 1 to 4 do {
		_str  = format["%1ai%2", player, _i];	
		if !isNil _str then {
			_unit = call compile _str;
			if isNull _unit exitWith {};
			if !alive _unit then {
				_str  = _str + "var";
				missionNamespace setVariable [_str, nil];
				if DEBUG then { server globalChat "removing old ai";};

				if (_unit distance graveDigger < 10) exitWith {
					if DEBUG then { server globalChat format["deleting %1 at gravedigger...", format["%1ai%2", player, _i]]; };
					deleteVehicle _unit; 
					missionNamespace setVariable [_str, nil]; 
				};
				//_plrs = nearestPlayers(getPosATL _unit,200,true,"array");
				//if (count _plrs == 0 || !arrCanSee(_plrs,_unit,35,30)) then { 
				//	_var = missionNamespace getVariable _str;
				//	if isNil "_var" exitWith { missionNamespace setVariable [_str, time]; };
				//	if (time - _var < infDeleteTime) exitWith { if DEBUG then { server globalChat format["waiting to delete %1: %2s left", format["%1ai%2", player, _i], infDeleteTime - (time - _var)]; }; };
				//	if (_unit distance graveDigger >= 10 && isPlayer _unit && !isNull group _unit) exitWith { _unit call setGrpNull; };		
				//	if DEBUG then { server globalChat format["deleting %1...", format["%1ai%2", player, _i]]; };
				//	//deleteVehicle _unit;
				//	missionNamespace setVariable [_str, nil];
				//};
				sleep 0.01;	
			};
		};				
	};
};

// returns East AI to the gravedigger position
setGrpNull = {	
	private "_unit";
	_unit 	= _this;

    if DEBUG then { server globalChat format["sending %1 to gravedigger", format["%1ai%2", player, _unit]]; };
	if alive _unit then { _unit setDamage 1; };
	[_unit] join group graveDigger;
	_unit setPosATL getPosATL graveDigger;
};
