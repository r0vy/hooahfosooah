onKeyPress = { 
	private ["_handled","_vcl","_cT","_dist","_nVcls","_list","_id","_size","_intensity","_key","_shift","_ctrl","_alt"];

    _key     = _this select 1; 
    _shift   = _this select 2; 
    _ctrl    = _this select 3; 
    _alt	 = _this select 4; 
    _handled = false; 
	
	if (difficultyEnabled "3rdPersonView" && _key in actionKeys "personView" && remoteControlling) exitWith { 
		if (cameraView == "INTERNAL") then { cameraOn switchCamera "EXTERNAL"; } else { cameraOn switchCamera "INTERNAL"; }; 
		true
	};
	if (_key in actionKeys "tacticalView") then { hint "Tactical View is disabled in Insurgency"; _handled=true; }; 
	
	if (_key in actionKeys "User15") then { hint "Halt"; player setvehicleinit "this playaction 'gestureFreeze'; "; processinitcommands; _handled=true; };
	if (_key in actionKeys "User16") then { hint "Go"; player setvehicleinit "this playaction 'GestureGo'; "; processinitcommands; _handled=true; };
	if (_key in actionKeys "User17") then { hint "Cover"; player setvehicleinit "this playaction 'GestureCover'; "; processinitcommands; _handled=true; };
	if (_key in actionKeys "User18") then { hint "Attack"; player setvehicleinit "this playaction 'GestureAttack'; "; processinitcommands; _handled=true; };
	if (_key in actionKeys "User19") then { hint "Advance"; player setvehicleinit "this playaction 'GestureAdvance'; "; processinitcommands; _handled=true; };
	if (_key in actionKeys "User20") then {	

	_body = player;
	_commandsound = "stop_down";
	_body say _commandsound;
	r_say = [_body, _commandsound];
	publicVariable "r_say";

	player groupChat "Stop! Lie down! : Wadareja! Permzakaa priooza!";
	[server,server,"loc",rSPAWN,player,{
	_nearmen = (getPos _this) nearEntities ["Man",30];
	sleep random 3;
		for "_j" from 0 to (count _nearmen - 1) do {				
			_man = _nearmen select _j; 
			

				if (side _man == CIVILIAN) then {
				sleep random 0.5;
				player groupChat format["debug: moving civilian %1",_j];
				doStop _man;
				_man setBehaviour "SAFE";
				_man setUnitPos "DOWN";
				};
		};
	}] call RE;

	_handled=true; 
};
	
	
	if (!alive player) exitWith {};
	
	if (_key in (actionKeys 'showmap')) then {
		if isNull respawnCamera exitWith {};
		camMap = !camMap;	
		openMap [camMap,camMap];
		if camMap then {
			mapAnimAdd [0,0.1,getPosATL camPlayer];
			mapAnimCommit;
		};			
	};	

	switch _key do { 
	
		//TAB key
		case 15: { 
			if (!_ctrl) exitWith {};
			if (useroptions != 1) exitWith {};
			if (!dialog) then { 
				createDialog "INSURGENCY_OPTIONS";
			} else { 
				closeDialog 0;
			}; 
		}; 
	
		//E key

		//N key
		case 49: {
			if (isNull respawnCamera) exitWith {};
			if (isNil "camNVG") then { camNVG = true; };	
			camUseNVG camNVG;
			camNVG = !camNVG;
		};
	
		if DEBUG then { call superman; };

		//W key
		case 17: { 			
			if (speed player == 0 && lifeState player != "UNCONSCIOUS") then { detach player; }; 		  
		}; 
		
		//S key
		case 31: { 	
			if (speed player == 0 && lifeState player != "UNCONSCIOUS") then { detach player; }; 
		}; 
		
		//Enter key
		case 28: {
			if (isNull respawnCamera || camMap || livesLeft == 0) exitWith {};
			if enterSpawn exitWith { enterSpawn = false; };
			if (!enterSpawn && camPlayer == fieldHospital) exitWith { enterSpawn = true; };
			if (nearestEastMen(getPosATL camPlayer,respawnRange,true,"count") > 0) exitWith {};
			if (vehicle camPlayer call vclisFull) exitWith {};
			if (lifeState camPlayer == "UNCONSCIOUS") exitWith {};	
			if !enterSpawn then { enterSpawn = true; };
		};
	
		//Left
		case 203: {
			if isNull respawnCamera exitWith {};
			_list     = [fieldHospital] + groupMembers(true,"array");
			if (livesLeft == 0) then { _list = nearestPlayers(CENTERPOS,AORADIUS,true,"array"); };
			_size     = count _list;
			_id       = _list find camPlayer;
			_id       = _id - 1;
			if (_id < 0) then { _id = _size - 1; };
			camPlayer =  _list select _id;
		};
	
	  //Right 
		case 205: {
			if isNull respawnCamera exitWith {};
			_list     = [fieldHospital] + groupMembers(true,"array");
			if (livesLeft == 0) then { _list = nearestPlayers(CENTERPOS,AORADIUS,true,"array"); };
			_size     = count _list;
			_id       = _list find camPlayer;
			_id       = _id + 1;
			if (_id == _size) then { _id = 0; };
			camPlayer =  _list select _id;
		};	
		//PAGE UP

		//PAGE DOWN

	};	
_handled; 	
}; 