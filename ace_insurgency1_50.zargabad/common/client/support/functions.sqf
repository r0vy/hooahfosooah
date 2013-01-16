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
		[west,"HQ"] sideChat "CAS (A10) is now available for your squad";
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

if (heliRC == 1) then {
	BIS_MENU_GroupCommunication = [
		["Support",true],
		["Request CAS (A10)", [2], "", -5, [["expression", '
			if (lifeState player == "UNCONSCIOUS") exitWith {};
			if (a10Mode == 0) exitWith { [west,"HQ"] sideChat "CAS (A10) support is not available on this mission"; };
			_leader = call compile squadLeader(player);
			_str = "you need a squad leader to call for support";
			if (isNil "_leader") exitWith { player groupChat _str; };
			if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
			if (!alive _leader || isDead(_leader)) exitWith { player groupChat "your squad leader is dead!"; };
			player sideChat format["Sent request to %1 (%2) for support.", unitID(_leader), getName(_leader)];
			[nil,_leader,"loc",rSPAWN,player,{
				if (!A10available && !DEBUG) exitWith {
					[nil,_this,"loc",rSPAWN,player,{[west,"HQ"] sideChat "CAS (A10) support is currently not available for your squad";}] call RE;
				};						
				requestingPlayer = _this; 
				player sideChat format["%1 (%2) is requesting CAS support. Accept?", unitID(_this), getName(_this)];
				showCommandingMenu "#USER:query_Menu_CAS"; 
			}] call RE;		
		']], "1", "1"],
		["Control Helicopter", [3], "", -5, [["expression", '
			heli spawn controlChopper;
		']], "1", "1"]
	];
} else {
	BIS_MENU_GroupCommunication = [
		["Support",true],
		["Request CAS (A10)", [2], "", -5, [["expression", '
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

