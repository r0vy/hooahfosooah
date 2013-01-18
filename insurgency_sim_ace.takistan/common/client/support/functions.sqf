exitRC = {	
	objNull remoteControl driver cameraOn;
	vehicle player switchCamera "INTERNAL";
	[player] joinSilent startGroup;
};

supportTimer = {
	private ["_leader"];
	
	_leader = squadLeader(player);
	if (_A10Timer == 99999 && !A10available) then { _A10Timer = time; };
	if (isNil _leader) exitWith { };
	if ((player == call compile _leader) && !A10available && time - _A10Timer > A10respawn) then {
		[west,"HQ"] sideChat "CAS (A10) and AH64 (Apache) support is now available for your squad";
		A10available = true;
		_A10Timer = 99999;
	};	
};

if isWest then {
	
controlChopper = {	
	private ["_pilot"];
    
    _PlayerGroup = ["pilot" + str _this, "Grp", "", "west"] call getGroup;
	_pilot = driver _this;
	if !(pilotController in units (group _pilot)) exitWith { player groupChat "This helicopter is currently being controlled by another player"; };		
	player joinAsSilent [_PlayerGroup, 1];	
	_pilot joinAsSilent [_PlayerGroup, 2];
	waitUntil { local _pilot };
	_pilot disableAI "TARGET";
	_pilot disableAI "AUTOTARGET";
	_pilot disableAI "MOVE";
	_pilot disableAI "ANIM";
	_this switchCamera "INTERNAL";
	player remoteControl _pilot;
};	

_req = unitID(player);

if (_req == "Hitman-1-1-1" || _req == "Hitman-1-1-5" || _req == "Hitman-1-2-1" || _req == "Hitman-1-2-5" || _req == "Hitman-1-3-1" || _req == "Hitman-1-3-5" || _req == "Hitman-1-4-1" || _req == "Hitman-1-4-5" || _req == "Hitman-1-5-1" || _req == "Hitman-1-5-5") then {

		
		BIS_MENU_GroupCommunication = [
		["Support",true],

		["More...", [2], "#USER:query_Menu_More", -5, [["expression", ""]], "1", "1"],

		["Request MH6J (Little Bird)", [3], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "MH6J (Little Bird) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting MH6J (Little Bird) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_MH6J"; 
                }] call RE;    
            ']], "1", "1"],

		["Request UH60M (BlackHawk)", [4], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "UH60M (BlackHawk) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting UH60M (BlackHawk) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_UH60M"; 
                }] call RE;    
            ']], "1", "1"],

	["Request CH47 (Chinook)", [5], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "CH47 (Chinook) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting CH47 (Chinook) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_CH47"; 
                }] call RE;    
            ']], "1", "1"],

	["Request Merlin", [6], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "Merlin support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting Merlin support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_Merlin"; 
		
                }] call RE;    
            ']], "1", "1"],

	
	["Request Lynx", [7], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "Lynx support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting Lynx support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_Lynx"; 
		
                }] call RE;    
            ']], "1", "1"],


	["Request Artillery", [9], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "Artillery support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting Artillery support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_Artillery"; 
		
                }] call RE;    
            ']], "1", "1"],

 	["Request CAS (A10) AI", [10], "", -5, [["expression", '
			if (lifeState player == "UNCONSCIOUS") exitWith {};
			if (a10Mode == 0) exitWith { [west,"HQ"] sideChat "CAS (A10) support is not available on this mission"; };
			_leader = call compile squadLeader(player);
			_str = "you need a squad leader to call for support";
			if (isNil "_leader") exitWith { player groupChat _str; };
			if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
			if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
			player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
			[nil,_leader,"loc",rSPAWN,player,{
				if (a10Mode == 0) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "CAS (A10) support is not available on this mission";}] call RE;
				};
				if (!A10available && !DEBUG) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "CAS (A10) support is currently not available for your squad";}] call RE;
				};
				requestingPlayer = _this; 
				player sideChat format["%1 (%2) is requesting CAS support. Accept?", unitID(_this), getName(_this)];
				showCommandingMenu "#USER:query_Menu_CAS"; 
			}] call RE;		
		']], "1", "1"],

	["Request AH64 (Apache) AI", [11], "", -5, [["expression", '
			if (lifeState player == "UNCONSCIOUS") exitWith {};
			if (a10Mode == 0) exitWith { [west,"HQ"] sideChat "AH64 (Apache) support is not available on this mission"; };
			_leader = call compile squadLeader(player);
			_str = "you need a squad leader to call for support";
			if (isNil "_leader") exitWith { player groupChat _str; };
			if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
			if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
			player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
			[nil,_leader,"loc",rSPAWN,player,{
				if (a10Mode == 0) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "AH64 (Apache) support is not available on this mission";}] call RE;
				};
				if (!A10available && !DEBUG) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "AH64 (Apache) support is currently not available for your squad";}] call RE;
				};
				requestingPlayer = _this; 
				player sideChat format["%1 (%2) is requesting AH64 Apache support. Accept?", unitID(_this), getName(_this)];
				showCommandingMenu "#USER:query_Menu_AH64"; 
			}] call RE;		
		']], "1", "1"]
	];
} else {
		BIS_MENU_GroupCommunication = [
		["Support",true],

	["Helicopter Support is only available to", [2], "", -5, [["expression", ""]], "1", "1"],
	["Squad Leader and Pilot Slots", [3], "", -5, [["expression", ""]], "1", "1"],
	["===============================", [4], "", -5, [["expression", ""]], "1", "1"],


	["Request Artillery", [9], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "Artillery support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting Artillery support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_Artillery"; 
		
                }] call RE;    
            ']], "1", "1"],

 	["Request CAS (A10) AI", [10], "", -5, [["expression", '
			if (lifeState player == "UNCONSCIOUS") exitWith {};
			if (a10Mode == 0) exitWith { [west,"HQ"] sideChat "CAS (A10) support is not available on this mission"; };
			_leader = call compile squadLeader(player);
			_str = "you need a squad leader to call for support";
			if (isNil "_leader") exitWith { player groupChat _str; };
			if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
			if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
			player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
			[nil,_leader,"loc",rSPAWN,player,{
				if (a10Mode == 0) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "CAS (A10) support is not available on this mission";}] call RE;
				};
				if (!A10available && !DEBUG) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "CAS (A10) support is currently not available for your squad";}] call RE;
				};
				requestingPlayer = _this; 
				player sideChat format["%1 (%2) is requesting CAS support. Accept?", unitID(_this), getName(_this)];
				showCommandingMenu "#USER:query_Menu_CAS"; 
			}] call RE;		
		']], "1", "1"],

	["Request AH64 (Apache) AI", [11], "", -5, [["expression", '
			if (lifeState player == "UNCONSCIOUS") exitWith {};
			if (a10Mode == 0) exitWith { [west,"HQ"] sideChat "AH64 (Apache) support is not available on this mission"; };
			_leader = call compile squadLeader(player);
			_str = "you need a squad leader to call for support";
			if (isNil "_leader") exitWith { player groupChat _str; };
			if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
			if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
			player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
			[nil,_leader,"loc",rSPAWN,player,{
				if (a10Mode == 0) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "AH64 (Apache) support is not available on this mission";}] call RE;
				};
				if (!A10available && !DEBUG) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "AH64 (Apache) support is currently not available for your squad";}] call RE;
				};
				requestingPlayer = _this; 
				player sideChat format["%1 (%2) is requesting AH64 Apache support. Accept?", unitID(_this), getName(_this)];
				showCommandingMenu "#USER:query_Menu_AH64"; 
			}] call RE;		
		']], "1", "1"]
	];

};
	

query_Menu_CAS = [
	["Accept call for support",false],
	["Yes",[2],"",-5,[["expression",'
		[nil,requestingPlayer,"loc",rSPAWN,player,{
			if (a10Mode == 2) then {
				player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for CAS", unitID(_this), getName(_this)];
				mapInUse = true;
				openMap true;
				onMapSingleClick "call spawnA10;";
			} else {
				player sideChat format["%1 (%2) accepted your request for support. CAS inbound.", unitID(_this), getName(_this)];
				call spawnA10;
			};
		}] call RE;
	']],"1","1"],
	["No",[3],"",-5,[["expression",'
	[nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
	']],"1","1"]
]; 

query_Menu_MHQ = [
	["Accept mobilise request",false],
	["Yes",[2],"",-5,[["expression",'
		_pos = HQ modelToWorld [0,0,0];
		_pos set [2,0];		
		HQ setPosATL spawnPos;
		MHQ setDamage 0;
		MHQ setFuel 1;
		MHQ setPosATL _pos;		
	']],"1","1"],
	["No",[3],"",-5,[["expression",'
	[nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request to mobilise the HQ", unitID(_this), getName(_this)]; }] call RE;
	']],"1","1"]
]; 

};

artillery = {
	private ["_c","_pos","_sID","_gPos"];
    
    _pos = _this;
	artyAvailable = false;
	_pos set [2,0];
	hint "Position selected!";
	openMap [false,false];
	mapInUse = false;
	_sID  = squadID(player);
	_gPos = mapGridPosition _pos;
	player sideChat format["Crossroad, this is %1, Adjust fire, over.", _sID];
	sleep 5;
	[west,"HQ"] sideChat format["%1 this is Crossroad, adjust fire, out.", _sID];
	sleep 4;
	player sideChat format["Grid %1, over", _gPos];
	sleep 3;
	[west,"HQ"] sideChat format["Grid %1, out", _gPos];
	sleep 5;
	[west,"HQ"] sideChat "R, F, DPICM in effect, 5 rounds, over.";
	sleep 3;
	player sideChat "DPICM in effect, 5 rounds, out.";
	sleep 7;
	[west,"HQ"] sideChat "shot, over.";
	sleep 3;
	player sideChat "shot, out.";
	sleep 25;
	[west,"HQ"] sideChat "splash, over.";
	sleep 2;
	player sideChat "splash, out.";
	sleep 5;
	_c = 0;
	while { _c < 5 } do { 
		"ARTY_R_227mm_HE" createVehicle [(_pos select 0) + random 50 - random 50,(_pos select 1) + random 50 - random 50,(_pos select 2)]; 
		sleep (0.5+random 2); 
		_c = _c + 1;
	};
};

spawnA10 = {		
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];
    
    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{ A10available = false; }] call RE;
	if (a10Mode == 2) then {
		hint "Position selected!";
		onMapSingleClick "";
		openMap [false,false];
		mapInUse = false;
		_startPos = getPosATL player;
		
		_dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
		_pos2 = [(_pos select 0) + (sin _dir)*5000,(_pos select 1) + (cos _dir)*8000,500];
		_vcl  = createVehicle ["A10_US_EP1",spawnPos,[],0,"NONE"];
		_vcl engineOn true;	
		_vcl setPosATL _pos2;
		_dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
		_vcl setDir _dir;
		_vcl setVelocity [(sin _dir)*100,(cos _dir)*100,20];

	
		moveOut player;
		player moveInDriver _vcl;
		[nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
			_vcl  = _this select 0;
			_plr  = _this select 1;
			_pos  = _this select 3;	
			
			if (player == _plr) then {
				flyTime = "-";
				_vcl addEventHandler ["fired",{ (_this select 0) removeEventHandler ["fired",0]; flyTime = a10FlyTime;}];
				while { alive player } do {
					if (typeName flyTime != "STRING") exitWith {}; 
					hintSilent format[
						"Distance to target: %1m\nBearing-target offset: %2dgs"
					, round(player distance _pos), round([player,_pos] call getBearing)];					
				};
				curTime = time;
				waitUntil { 
					hintSilent format[
					"Time remaining: %1s\nDistance to target: %2m\nBearing-target offset: %3dgs"
					, round(flyTime - (time - curTime)), round(player distance _pos), round([player,_pos] call getBearing)];
					time - curTime > flyTime || !alive player
				};
				if (alive player && vehicle player == _vcl) then { 
					player setPosATL (_this select 2);
					if (lifeState player == "UNCONSCIOUS") then { player setUnconscious false; };
				 };
			};
			if isServer then {
				waitUntil { !isNull (driver _vcl) };
				waitUntil { isNull (driver _vcl) || !alive _vcl };
				if !alive _vcl exitWith {};
				_dir = getDir _vcl;
				_grp = createGroup civilian;
				_man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
				_man assignAsDriver _vcl;
				_man moveInDriver _vcl;
				_vcl flyInHeight 300;
				_vcl engineOn true;
				_vcl setCaptive true;
				_pos2 = getPosATL _vcl;			
				_man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
				waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
				if alive _vcl then { deleteVehicle _vcl; };
				deleteVehicle _man;
				deleteGroup _grp;
			};
		}] call RE;
	} else {
		_grp = group player;
		_pos  = getPosATL player;
		_dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
		_pos2 = [(_pos select 0) + (sin _dir)*5000,(_pos select 1) + (cos _dir)*8000,500];
		_arr = [_pos2, 180, "A10_US_EP1", _grp] call bis_fnc_spawnvehicle;
		_vcl = _arr select 0;
		_ai = (_arr select 1) select 0;
		_vcl engineOn true;	
		_vcl setPosATL _pos2;
		_dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
		_vcl setDir _dir;
		_vcl setVelocity [(sin _dir)*100,(cos _dir)*100,20];
		_vcl lockDriver true;

		flyTime = a10FlyTime*2;
		curTime = time;
		waitUntil { 
			hintSilent format[
			"Eagle CAS standby, taking orders!\n\nTime remaining: %1s"
			, round((flyTime) - (time - curTime))];
			time - curTime > (flyTime) || !alive _ai || !alive _vcl
		};
		if (alive _vcl) then {
			player sideChat format["Eagle to %1: We are bingo fuel, RTB. See you soon! Eagle over and out.",unitID(player)];
			hint "Eagle CAS is RTB";
			_grp = createGroup civilian;
			[_vcl] join _grp;
			_vcl doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
			waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
			deleteVehicle _vcl;
		} else {
			hint "Eagle CAS was destroyed";
			_grp = createGroup west;
			if (alive _ai) then { [_ai] join _grp; };
		};
	};
};


query_Menu_MH6J = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for MH6J light transport support", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnMH6J;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

spawnMH6J = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["MH6J_EP1",spawnPos,[],0,"FLY"];
        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["Little Bird to %1: We are RTB. Good luck! Little Bird out.",unitID(player)];
                hint "Little Bird is RTB";



                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _man allowDamage false; /// Prevent hijack attempts
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "Little Bird is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
}; 




query_Menu_UH60M = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for UH60 (BlackHawK) transport support", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnUH60M;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

spawnUH60M = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["UH60M_EP1",spawnPos,[],0,"FLY"];
        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["BlackHawk to %1: We are RTB. Good luck! BlackHawk out.",unitID(player)];
                hint "BlackHawk is RTB";

                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "BlackHawk is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
}; 



query_Menu_CH47 = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for CH47 (Chinook) transport support", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnCH47;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

spawnCH47 = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["CH_47F_EP1",spawnPos,[],0,"FLY"];
        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		_alt = getPosATL _vcl select 2;

		if (_alt < 5) then {
	 	sleep 45;
                waitUntil { isNull (driver _vcl) || !alive _vcl };
		};

		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["Chinook to %1: We are RTB. Good luck! Chinook out.",unitID(player)];
                hint "Chinook is RTB";

                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "Chinook is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
}; 


query_Menu_Merlin = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for Merlin transport support", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnMerlin;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

spawnMerlin = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["BAF_Merlin_HC3_D",spawnPos,[],0,"FLY"];
        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["Merlin to %1: We are RTB. Good luck! Merlin out.",unitID(player)];
                hint "Merlin is RTB";

                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "Merlin is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
};

query_Menu_Lynx = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for Lynx support", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnLynx;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

spawnLynx = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["AW159_Lynx_BAF",spawnPos,[],0,"FLY"];
	_vcl setVehicleAmmo 0;
        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["Lynx to %1: We are RTB. Good luck! Lynx out.",unitID(player)];
                hint "Lynx is RTB";

                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "Lynx is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
};




_Player_UID = ["8256966","981190","6809926","2081473","4310278","409860","4755910","5170054","3722182","584832","5315014"];

if ((getPlayerUID player) in _Player_UID) then {

query_Menu_More = [
	["More...",false],
	["Request MH6J (Little Bird - Desert Camo)", [2], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "MH6J (Little Bird - Desert Camo) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting MH6J (Little Bird - Desert Camo) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_MH6JDesert"; 
                }] call RE;    
            ']], "1", "1"],

	["Request MH6J (Armed Little Bird : DD)", [3], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "MH6J (Armed Little Bird : DesertDevils Only) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting MH6J (Armed Little Bird : DesertDevils Only) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_ACE_MH6JDesert"; 
                }] call RE;    
            ']], "1", "1"],

	["Request AH64 (Apache : DD)", [4], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "AH64 (Apache : DesertDevils Only) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting AH64 (Apache : DesertDevils Only) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_AH64_Human"; 
                }] call RE;    
            ']], "1", "1"],
	
	["Request M1A2 (Abrams Tank : DD)", [5], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "M1A2 (Abrams Tank : DesertDevils Only) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting M1A2 (Abrams Tank : DesertDevils Only) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_M1A2"; 
                }] call RE;    
            ']], "1", "1"],

	["Request A10 (CBU87 : DD)", [6], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "A10 (CBU87 : DesertDevils Only) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting A10 (CBU87 : DesertDevils Only) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_A10_CBU"; 
                }] call RE;    
            ']], "1", "1"],

	["Request A10 (MK82 : DD)", [7], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "A10 (MK82 : DesertDevils Only) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting A10 (MK82 : DesertDevils Only) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_A10_MK82"; 
                }] call RE;    
            ']], "1", "1"], 

	["Request Landrover (Special : DD)", [8], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "Landrover (Special : DesertDevils Only) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting Landrover (Special : DesertDevils Only) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_Landrover_Special"; 
                }] call RE;    
            ']], "1", "1"],

	["Place Training Targets", [11], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "Placing targets is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting to place training targets. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_trainingtargets"; 
                }] call RE;    
            ']], "1", "1"]

]; 


} else {

query_Menu_More = [
	["More...",false],
	["Request MH6J (Little Bird - Desert Camo)", [2], "", -5, [["expression", '
                if (lifeState player == "UNCONSCIOUS") exitWith {};
                _leader = call compile squadLeader(player);
                _str = "you need a squad leader to call for support";
                if (isNil "_leader") exitWith { player groupChat _str; };
                if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
                if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
                player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
                [nil,_leader,"loc",rSPAWN,player,{
                    if (!SOARavailable && !DEBUG) exitWith {
                        [nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "MH6J (Little Bird - Desert Camo) support is currently not available for your squad";}] call RE;
                    };
                    requestingPlayer = _this; 
                    player sideChat format["%1 (%2) is requesting MH6J (Little Bird - Desert Camo) support. Accept?", unitID(_this), getName(_this)];
                    showCommandingMenu "#USER:query_Menu_MH6JDesert"; 
                }] call RE;    
            ']], "1", "1"]

];

};



query_Menu_MH6JDesert = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for MH6J light transport support", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnMH6JDesert;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

query_Menu_ACE_MH6JDesert = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for MH6J armed transport support", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnACEMH6JDesert;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

query_Menu_AH64_Human = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for AH64 piloted support", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnAH64Human;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

query_Menu_M1A2 = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for M1A2 tank", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnM1A2;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

query_Menu_A10_CBU = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for A10 (CBU)", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnA10_CBU;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

query_Menu_A10_MK82 = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for A10 (MK82)", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnA10_MK82;";
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];


query_Menu_Landrover_Special = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
		player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for Landrover (Special)", unitID(_this), getName(_this)];
                mapInUse = true;
                openMap true;
                onMapSingleClick "call spawnLandrover_Special;";
          
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

query_Menu_trainingtargets = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{

                 call spawnTrainingTargets;
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];


spawnMH6JDesert = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["MH6J_EP1",spawnPos,[],0,"FLY"];
	_vcl setVehicleInit  "this setobjecttexture [0,""images\mh6j_dd.jpg""]";
	processInitCommands;

        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["Little Bird to %1: We are RTB. Good luck! Little Bird out.",unitID(player)];
                hint "Little Bird is RTB";



                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "Little Bird is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
}; 

spawnACEMH6JDesert = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["ACE_AH6J_DAGR_FLIR",spawnPos,[],0,"FLY"];
	processInitCommands;

        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["Little Bird to %1: We are RTB. Good luck! Little Bird out.",unitID(player)];
                hint "Little Bird is RTB";



                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "Little Bird is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
}; 

spawnAH64Human = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["AH64D_EP1",spawnPos,[],0,"FLY"];
	processInitCommands;

        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

	player addWeapon "ACE_ParachutePack";
        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		
		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["Apache to %1: We are RTB. Good luck! Apache out.",unitID(player)];
                hint "Apache is RTB";



                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "Apache is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
};

spawnM1A2 = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*3000,(_pos select 1) + (cos _dir)*3000,1200];
        _vcl  = createVehicle ["C130J_US_EP1",spawnPos,[],0,"FLY"];
	processInitCommands;

        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;

	hint "Hercules inbound. Standby.";

        [nil,nil,rSPAWN,[_vcl,player,_startPos],{

	if (isServer) then { 

            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 2;   

		

		if (daytime > 6 && daytime < 19) then {
			_greensmoke = "SmokeShellGreen" createVehicle _pos;
		} else {
			_irstrobe = "IR_Strobe_Marker" createVehicle [(_pos select 0),(_pos select 1),0.05];
			["ace_sys_irstrobe_aradd", [_irstrobe]] call CBA_fnc_globalEvent;
		};		

            
                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos select 0),(_pos select 1),1000];
		_vcl allowDamage false;
		
		waitUntil { _vcl distance _plr < 275 };	

		_object  = createVehicle ["M1A2_US_TUSK_MG_EP1",[(getPos _vcl select 0),(getPos _vcl select 1),(getPos _vcl select 2)-10],[],0,"CAN_COLLIDE"];
		_object attachTo [_vcl,[0,-21,0]];
		detach _object;
		_object setPos [(getPos _object select 0),(getPos _object select 1),(getPos _object select 2)-3];

		//// Create parachute and smoke
		sleep 0.5;
		_parachute = "ParachuteBigWest" createVehicle position _object;
		_parachute setPos (getPos _object);

		if (daytime > 6 && daytime < 19) then {
			_vclmarker = "SmokeShellBlue" createVehicle position _object;
			_vclmarker setPos (getPos _object);
		} else {
			_vclmarker = "IR_Strobe_Marker" createVehicle position _object;
			["ace_sys_irstrobe_aradd", [_vclmarker]] call CBA_fnc_globalEvent;
			_vclmarker setPos (getPos _object);
		};	
		
		_object attachTo [_parachute,[0,0,-0.5]];
		
		//// Wait until ground reached
		waitUntil {(getPos _object select 2) < 2};
		deTach _object;
		sleep 3;
		_object setPos [(getPos _object select 0),(getPos _object select 1),0.001];
	
		//// Delete parachute and smoke
		sleep 15;
		deletevehicle _irstrobe;
		deleteVehicle _vclmarker;
		deleteVehicle _parachute;

                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,1000];

                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
           };
        }] call RE;
    
};

spawnA10_CBU = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["ACE_A10_CBU87",spawnPos,[],0,"FLY"];
	processInitCommands;

        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

	player addWeapon "ACE_ParachutePack";
        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		
		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["A10 to %1: We are RTB. Good luck! A10 out.",unitID(player)];
                hint "A10 is RTB";



                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "A10 is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
};

spawnA10_MK82 = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        hint "Position selected!";
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*1500,(_pos select 1) + (cos _dir)*2000,300];
        _vcl  = createVehicle ["ACE_A10_Mk82",spawnPos,[],0,"FLY"];
	processInitCommands;

        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;
        _vcl setVelocity [(sin _dir)*50,(cos _dir)*50,20];

	player addWeapon "ACE_ParachutePack";
        moveOut player;
        player moveInDriver _vcl;
        [nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 3;   

		if alive _vcl then {

                ///_driver = driver _vcl;
                ///_gunner = gunner _vcl;
                waitUntil { !isNull (driver _vcl) };
                waitUntil { isNull (driver _vcl) || !alive _vcl };

		
		//Allow people to unload ace rucksacks	
		sleep 60;

                player groupChat format["A10 to %1: We are RTB. Good luck! A10 out.",unitID(player)];
                hint "A10 is RTB";



                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
            } else {
                hint "A10 is no longer with us";
                deleteVehicle _vcl;
            };
        }] call RE;
    
};



spawnLandrover_Special = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        
        onMapSingleClick "";
        openMap [false,false];
        mapInUse = false;
        _startPos = getPosATL player;

        _dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
        _pos2 = [(_pos select 0) + (sin _dir)*3000,(_pos select 1) + (cos _dir)*3000,1200];
        _vcl  = createVehicle ["C130J_US_EP1",spawnPos,[],0,"FLY"];
	processInitCommands;

        _vcl engineOn true;    
        _vcl setPosATL _pos2;
        _dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
        _vcl setDir _dir;

	hint "Hercules inbound. Standby.";

        [nil,nil,rSPAWN,[_vcl,player,_startPos],{

	if (isServer) then { 

            _grp = group player;
            _vcl  = _this select 0;
            _plr  = _this select 1;
            _pos  = _this select 2;   

		

		if (daytime > 6 && daytime < 19) then {
			_greensmoke = "SmokeShellGreen" createVehicle _pos;
		} else {
			_irstrobe = "IR_Strobe_Marker" createVehicle [(_pos select 0),(_pos select 1),0.05];
			["ace_sys_irstrobe_aradd", [_irstrobe]] call CBA_fnc_globalEvent;
		};		

            
                _dir = getDir _vcl;
                _grp = createGroup civilian;
                _man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
                _man assignAsDriver _vcl;
                _man moveInDriver _vcl;
                _vcl setDamage 0;   /// Repair helo after eject action
                _vcl engineOn true;
                _pos2 = getPosATL _vcl;            
                _man doMove [(_pos select 0),(_pos select 1),1000];
		_vcl allowDamage false;
		
		waitUntil { _vcl distance _plr < 275 };	

		_object  = createVehicle ["LandRover_Special_CZ_EP1",[(getPos _vcl select 0),(getPos _vcl select 1),(getPos _vcl select 2)-10],[],0,"CAN_COLLIDE"];
		_object attachTo [_vcl,[0,-21,0]];
		detach _object;
		_object setPos [(getPos _object select 0),(getPos _object select 1),(getPos _object select 2)-3];

		//// Create parachute and smoke
		sleep 0.5;
		_parachute = "ParachuteBigWest" createVehicle position _object;
		_parachute setPos (getPos _object);

		if (daytime > 6 && daytime < 19) then {
			_vclmarker = "SmokeShellBlue" createVehicle position _object;
			_vclmarker setPos (getPos _object);
		} else {
			_vclmarker = "IR_Strobe_Marker" createVehicle position _object;
			["ace_sys_irstrobe_aradd", [_vclmarker]] call CBA_fnc_globalEvent;
			_vclmarker setPos (getPos _object);
		};	
		
		_object attachTo [_parachute,[0,0,0]];
		
		//// Wait until ground reached
		waitUntil {(getPos _object select 2) < 2};
		deTach _object;
		sleep 3;
		_object setPos [(getPos _object select 0),(getPos _object select 1),0.001];
	
		//// Delete parachute and smoke
		sleep 15;
		deletevehicle _irstrobe;
		deleteVehicle _vclmarker;
		deleteVehicle _parachute;

                _man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,1000];

                waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
                if alive _vcl then { deleteVehicle _vcl; };
                deleteVehicle _man;
                deleteGroup _grp;
           };
        }] call RE;
    
};

spawnTrainingTargets = {        
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];

    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{}] call RE;
    
        
        
        _startPos = getPosATL player;
        _vcl  = createVehicle ["TargetEpopup",_startPos,[],0,"None"];
        _vcl  = createVehicle ["ACE_Hostage_Target_1",_startPos,[],0,"None"];

    
};


query_Menu_Artillery = [
    ["Accept call for support",false],
    ["Yes",[2],"",-5,[["expression",'
        [nil,requestingPlayer,"loc",rSPAWN,player,{
            
                player sideChat format["%1 (%2) accepted your request for artillery support.", unitID(_this), getName(_this)];
                execVM (BON_ARTI_PATH+"dialog\openMenu.sqf");
            
        }] call RE;
    ']],"1","1"],
    ["No",[3],"",-5,[["expression",'
    [nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for artillery support", unitID(_this), getName(_this)]; }] call RE;
    ']],"1","1"]
];

query_Menu_AH64 = [
	["Accept call for support",false],
	["Yes",[2],"",-5,[["expression",'
		[nil,requestingPlayer,"loc",rSPAWN,player,{
			if (a10Mode == 2) then {
				player sideChat format["%1 (%2) accepted your request for support. Click a location on the map to designate for AH64 (Apache)", unitID(_this), getName(_this)];
				mapInUse = true;
				openMap true;
				onMapSingleClick "call spawnAH64;";
			} else {
				player sideChat format["%1 (%2) accepted your request for support. AH64 (Apache) inbound.", unitID(_this), getName(_this)];
				call spawnAH64;
			};
		}] call RE;
	']],"1","1"],
	["No",[3],"",-5,[["expression",'
	[nil,requestingPlayer,"loc",rSPAWN,player,{ player sideChat format["%1 (%2) Denied your request for support", unitID(_this), getName(_this)]; }] call RE;
	']],"1","1"]
]; 


spawnAH64 = {		
    private ["_startPos","_dir","_pos2","_vcl","_ai","_grp"];
    
    [nil,call compile (squadString(player)+"1"),"loc",rSPAWN,player,{ A10available = false; }] call RE;
	if (a10Mode == 2) then {
		hint "Position selected!";
		onMapSingleClick "";
		openMap [false,false];
		mapInUse = false;
		_startPos = getPosATL player;
		
		_dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
		_pos2 = [(_pos select 0) + (sin _dir)*5000,(_pos select 1) + (cos _dir)*8000,500];
		_vcl  = createVehicle ["AH64D_EP1",spawnPos,[],0,"NONE"];
		_vcl engineOn true;	
		_vcl setPosATL _pos2;
		_dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
		_vcl setDir _dir;
		_vcl setVelocity [(sin _dir)*100,(cos _dir)*100,20];
	
		moveOut player;
		player moveInDriver _vcl;
		[nil,nil,rSPAWN,[_vcl,player,_startPos,_pos],{
			_vcl  = _this select 0;
			_plr  = _this select 1;
			_pos  = _this select 3;	
			
			if (player == _plr) then {
				flyTime = "-";
				_vcl addEventHandler ["fired",{ (_this select 0) removeEventHandler ["fired",0]; flyTime = a10FlyTime;}];
				while { alive player } do {
					if (typeName flyTime != "STRING") exitWith {}; 
					hintSilent format[
						"Distance to target: %1m\nBearing-target offset: %2dgs"
					, round(player distance _pos), round([player,_pos] call getBearing)];					
				};
				curTime = time;
				waitUntil { 
					hintSilent format[
					"Time remaining: %1s\nDistance to target: %2m\nBearing-target offset: %3dgs"
					, round(flyTime - (time - curTime)), round(player distance _pos), round([player,_pos] call getBearing)];
					time - curTime > flyTime || !alive player
				};
				if (alive player && vehicle player == _vcl) then { 
					player setPosATL (_this select 2);
					if (lifeState player == "UNCONSCIOUS") then { player setUnconscious false; };
				 };
			};
			if isServer then {
				waitUntil { !isNull (driver _vcl) };
				waitUntil { isNull (driver _vcl) || !alive _vcl };
				if !alive _vcl exitWith {};
				_dir = getDir _vcl;
				_grp = createGroup civilian;
				_man = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
				_man assignAsDriver _vcl;
				_man moveInDriver _vcl;

				_man2 = _grp createUnit [typeOf _plr, spawnPos, [], 0, "NONE"];
				_man2 assignAsGunner _vcl;
				_man2 moveInGunner _vcl;
				_vcl engineOn true;
				_pos2 = getPosATL _vcl;			
				_man doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
				waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
				if alive _vcl then { deleteVehicle _vcl; };
				deleteVehicle _man;
				deleteVehicle _man2;
				deleteGroup _grp;
			};
		}] call RE;
	} else {
		_grp = group player;
		_pos  = getPosATL player;
		_dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
		_pos2 = [(_pos select 0) + (sin _dir)*5000,(_pos select 1) + (cos _dir)*5000,500];
		_arr = [_pos2, 180, "AH64D_EP1", _grp] call bis_fnc_spawnvehicle;
		_vcl = _arr select 0;
		_ai = (_arr select 1) select 0;
		_ai2 = (_arr select 1) select 1;
		_vcl engineOn true;	
		_vcl setPosATL _pos2;
		_dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
		_vcl setDir _dir;
		_vcl setVelocity [(sin _dir)*100,(cos _dir)*100,20];
		_vcl lockDriver true;
		_vcl lockturret [[0],true];

		flyTime = a10FlyTime*2;
		curTime = time;
		waitUntil { 
			hintSilent format[
			"Apache AH64 standby, taking orders!\n\nTime remaining: %1s"
			, round((flyTime*1.5) - (time - curTime))];
			time - curTime > (flyTime*1.5) || !alive _ai || !alive _vcl
		};
		if (alive _vcl) then {
			player sideChat format["Apache to %1: We are bingo fuel, RTB. See you soon! Apache over and out.",unitID(player)];
			hint "Apache AH64 is RTB";
			_grp = createGroup civilian;
			[_vcl] join _grp;
			[_ai2] join _grp;
			_vcl doMove [(_pos2 select 0) + (sin _dir)*10000,(_pos2 select 1) + (cos _dir)*10000,0];
			waitUntil { nearestPlayers(getPosATL _vcl, 3000, true, "count") == 0 || !alive _vcl };
			deleteVehicle _vcl;
		} else {
			hint "Apache AH64 was destroyed";
			_grp = createGroup west;
			if (alive _ai) then { [_ai] join _grp; };
		};
	};
};