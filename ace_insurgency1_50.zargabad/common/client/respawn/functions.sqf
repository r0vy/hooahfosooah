onPlayerKilled = {	
	if (livesLeft > 0 && time > 30) then { 
		westDeaths = westDeaths + 1; 
		publicVariable "westDeaths";
		hint parseText format["
			<t color=""#00FFFF"">West lives remaining:</t> %1
		",livesLeft]; 
	};	
	if (remoteControlling && heliRC == 1) then { call exitRC; };
	detach player;
	player setUnconscious false; 
	if (captive player) then { [nil,player, rSETCAPTIVE, false] call RE; }; 

	camPlayer   = objNull;
	deadPos     = getPosATL player;
	[server,server,"loc",rSPAWN,player,{ sleep remPlayerBodyTime; hideBody _this; sleep 10; deleteVehicle _this; }] call RE;
	
	if (INS_dynamicRespawn == 1) then {
        [] call INS_setRespawnDelay;
    } else {
        setPlayerRespawnTime INS_dynamicRespawn
    };
    INS_lastRespawnTime = time;
}; 

respawnSystem = {
	private ["_c","_vehicle","_arr","_camPlayer","_plrs","_ctrlText","_pos"];
	call disableSerialization;
	scopeName "main"; 
	_camPlayer    = objNull;
	respawnCamera = "camera" camCreate [0,0,0];
	respawnCamera cameraEffect ["INTERNAL","Back"];
	while {isDead(player) && time > 30} do {	
		if (isNull camPlayer || _camPlayer != camPlayer) then {
			_arr = groupMembers(true,"array")+[fieldHospital];
			if (livesLeft == 0) then { _arr = nearestPlayers(CENTERPOS,AORADIUS,true,"array"); };
			if (isNull camPlayer) then { camPlayer = _arr select 0;	};		
			camAttachCoords = [0,-3,1.5];
			if (camPlayer == fieldHospital) then { camAttachCoords = [-50, 0, 12]; };			
			respawnCamera camSetTarget camPlayer;
			titleText [" ","Black in", 2];	
			respawnCamera camCommit 0;			
			respawnCamera attachTo [camPlayer, camAttachCoords];
			_camPlayer = camPlayer;
			_vehicle   = camPlayer;	
			enterSpawn = false;
			_c         = 5;
		};
		if (alive camPlayer && !enterSpawn && isDead(player)) then {
			if (_c < 5) then { _c = 5; };
			if (_vehicle != vehicle camPlayer) then { 
				_vehicle   = vehicle camPlayer;
				respawnCamera attachTo [_vehicle, camAttachCoords];
				respawnCamera camSetTarget _vehicle;	
				respawnCamera camCommit 0;
			};
			call respawnTags;
		};
		if (_camPlayer == camPlayer && enterSpawn) then {
			_plrs = nearestPlayers(getPosATL camPlayer,300,true,"array");
			if (camPlayer != fieldHospital && (nearestEastMen(getPosATL camPlayer,respawnRange,true,"count") > 0
			|| vehicle camPlayer call vclisFull) ) exitWith { enterSpawn = false;	_c = 5; };	
			cutRsc["Rtags", "PLAIN"];
			_ctrlText = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64434; 	
			_ctrlText ctrlSetStructuredText parseText format[
				"<t color='%2' shadow='1' shadowColor='#000000'>Spawning in %1</t><br/><br/><t color='#808080' shadow='1' shadowColor='#000000'>Left Arrow: Previous unit<br/>Right Arrow: Next unit<br/></t>"
			, abs ceil _c, "#FFFFFF"]; 
			if ((ceil _c) <= 0) exitWith { breakTo "main"; };										
			_c = _c - 0.1;
		};
		if (!alive camPlayer) then { camPlayer = objNull; };
		sleep 0.1;
	};	 	
	if (!isNull camPlayer && alive camPlayer) then {
		call addActions; 		
		if (vehicle camPlayer != camPlayer) exitWith { (vehicle camPlayer) call moveInVehicle; };
		player setDir getDir camPlayer;
		player setPosATL getPosATL camPlayer;
	} else {
		_pos = startLocation modelToWorld [-8,-13+(squadNumber(player)-1)*6+(unitNumber(player)-1)*1.2,0];
		player setPosATL _pos;
		player setDir (getDir startLocation)+90;	
	}; 
	openMap [false,false];
	respawnCamera cameraEffect ["terminate","back"];
	camDestroy respawnCamera;	
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;	
};

INS_setRespawnDelay = {
        private ["_maxdelay","_timealive","_m","_newrespdelay"];
        _maxdelay = 120; //max. resp delay
        _timealive = time - INS_lastRespawnTime;
        //linearly decreasing delay
        _m = ( _maxdelay/3600) * -1;
        _newrespdelay = 5 max (_timealive * _m +  _maxdelay);
        setPlayerRespawnTime _newrespdelay;
       INS_lastRespawnTime = time + _newrespdelay;
        
};