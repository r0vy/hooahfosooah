addActions = { 

// Disabled for ACE version
//	if !isNil "actionLoadout" then { HQ removeAction actionLoadout; actionLoadout = nil; };
//	actionLoadout = HQ addAction ["Loadout","common\client\actions\noScript.sqf","[] spawn gearDialog;",1,false,true,"",""]; 
		
	if !isNil "actionHQDeploy" then { player removeAction actionHQDeploy; actionHQDeploy = nil; };
	actionHQDeploy = player addAction ["Deploy HQ","common\client\actions\noScript.sqf",'
		_pos = getPosATL MHQ;
		if (count (_pos isFlatEmpty [0,0,0.2,20,0,false,MHQ]) == 0) exitWith { player groupChat "Cannot deploy here. The terrain is unsuitable"; };
		{ moveOut _x } forEach crew MHQ;
		MHQ setPosATL spawnPos;
		sleep 0.5;
		HQ setPosATL _pos;
		HQ setDir getDir MHQ;
		HQ setVariable ["hqdT",time,true];
	',1,false,true,"",'vehicle _target == _target && _target distance MHQ < 4'];
	
	if !isNil "actionHQMobilise" then { HQ removeAction actionHQMobilise; actionHQMobilise = nil; };
	actionHQMobilise = HQ addAction ["Mobilise HQ (only do this if requested)","common\client\actions\noScript.sqf",'
		if (lifeState player == "UNCONSCIOUS") exitWith {};
		if (mhqDeployTimer == -1) exitWith { player groupChat "The HQ is bolted in place, you cannot redeploy!"; };
		_timePassed = HQ getVariable ["hqdT",0]; 
		_dT = mhqDeployTimer - (time - _timePassed);
		if (_dT > 0 && _timePassed != 0) exitWith { player groupChat format ["You have to wait approx. %1 minutes to mobilize the MHQ.", (round((abs _dT)/60))]; }; 
		_leader = call compile squadLeader(player);
		_str = "You need a squad leader to mobilise the HQ";
		if (isNil "_leader") exitWith { player groupChat _str; };
		if (isNull _leader || !isPlayer _leader) exitWith { player groupChat _str; };
		if (!alive _leader || isDead(_leader)) exitWith { player groupChat "Your squad leader is dead!"; };
		player sideChat format["Sent request to %1 (%2).", unitID(_leader), getName(_leader)];
		[nil,_leader,"loc",rSPAWN,player,{
			requestingPlayer = _this; 
			player sideChat format["%1, (%2) is requesting permission to mobilise the HQ. Accept?", unitID(_this), getName(_this)];
			showCommandingMenu "#USER:query_Menu_MHQ"; 
		}] call RE;	
	',1,false,true,"",''];
	
	if !isNil "actionBagsDeploy" then { player removeAction actionBagsDeploy; actionBagsDeploy = nil; };
	actionBagsDeploy = player addAction ["Deploy ammo crates","common\client\actions\noScript.sqf","
		_cT = cursorTarget;
		_bags = call compile format[""bags%1"", _cT];
		_pos = _cT modelToWorld [0,-5,0];
		_bags setDir (getDir _cT);
		_bags setPosATL [_pos select 0,_pos select 1,0];
	",1,false,true,"",'
		_cT = cursorTarget; 		
		if !isNull _cT then { 
			if (!(typeOf _cT in (westVehicleClasses-[ATVTYPE]-[HELITYPE])) || !alive _cT) exitWith {};
			_pos = _cT modelToWorld [0,-3,0];
			_bags = call compile format["bags%1", _cT];
			alive _cT && player distance _pos < 3 && _bags distance spawnPos < 50
		};
	']; 	
	
	if !isNil "actionBagsLoad" then { player removeAction actionBagsLoad; actionBagsLoad = nil; };
	actionBagsLoad = player addAction ["Load ammo crates","common\client\actions\noScript.sqf","
		cursorTarget setPosATL [0,0,0];
	",1,false,true,"",'
		_cT = cursorTarget; 		
		if !isNull _cT then { 
			if !(typeOf _cT == "USLaunchers_EP1") exitWith {};
			_vcl = call compile format["humv1%1", unitNumber(_cT)];
			player distance _cT < 3 && _cT distance _vcl < 10
		};
	']; 
		
	if !isNil "actionTyre" then { player removeAction actionTyre; actionTyre = nil; };
	actionTyre = player addAction ["Change tyre","common\client\actions\noScript.sqf","[] spawn changeTyre",1,false,true,"",'
		_cT = cursorTarget;
		if !isNull _cT then { 
			if !(typeOf _cT in westVehicleClasses) exitWith {};
			alive _cT && !canMove _cT && _cT call getTyre != "";
		};
	']; 

	if !isNil "actionGetAway" then { player removeAction actionGetAway; actionGetAway = nil; };
	actionGetAway = player addAction ["Verbal Command: Get Away From Here!","common\client\actions\noScript.sqf",'
	_civ = cursorTarget;
	[server,server,"loc",rSPAWN,_civ,{
	_nearmen = (getPos _this) nearEntities ["Man",25];
	player groupChat "Get out of the area!";
	sleep random 3;

		for "_j" from 0 to (count _nearmen - 1) do {				
			_man = _nearmen select _j; 
			

				if (side _man == CIVILIAN) then {
				sleep random 0.5;
				//player groupChat format["debug: moving civilian %1",_j];
				_man setBehaviour "SAFE";
				_man setUnitPos "UP";
				_man doMove [(getpos _man select 0) + random 200 - random 200,(getpos _man select 1) + random 200 - random 200,0];
				};
		};
	}] call RE;
	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 25 && (cursorTarget isKindof "TK_CIV_Takistani_Base_EP1" ||  cursorTarget isKindof "Woman_EP1") && alive cursorTarget};
	']; 


	if !isNil "actionStopGetDown" then { player removeAction actionStopGetDown; actionStopGetDown = nil; };
	actionStopGetDown = player addAction ["Verbal Command: Stop! Get Down!","common\client\actions\noScript.sqf",'
	_civ = cursorTarget;
	[server,server,"loc",rSPAWN,_civ,{
	_nearmen = (getPos _this) nearEntities ["Man",30];
	player groupChat "Stop! Get down!";
	sleep random 3;
		for "_j" from 0 to (count _nearmen - 1) do {				
			_man = _nearmen select _j; 
			

				if (side _man == CIVILIAN) then {
				sleep random 0.5;
				//player groupChat format["debug: moving civilian %1",_j];
				doStop _man;
				_man setBehaviour "SAFE";
				_man setUnitPos "DOWN";
				};
		};
	}] call RE;
	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 25 && (cursorTarget isKindof "TK_CIV_Takistani_Base_EP1" ||  cursorTarget isKindof "Woman_EP1") && alive cursorTarget};
	']; 

	if !isNil "actionQuestionCiv" then { player removeAction actionQuestionCiv; actionQuestionCiv = nil; };
	actionQuestionCiv = player addAction ["Question Civilian","common\client\actions\noScript.sqf",'
	_cT = cursorTarget;
	
	[server,server,"loc",rSPAWN,[_cT,player],{
		_civ = _this select 0;
		_plr = _this select 1;
		doStop _civ;
		_civ lookAt _plr;
	}] call RE;

	hint "You greet the civilian and try to start a conversation with them..."; 

	_anim = "aidlpercmstpsraswrfldnon_idlesteady01n";
	player playMove _anim;
	sleep 5;
	
	
	_alreadyquestioned = _cT getVariable "questioned";
		if(if(isNil "_alreadyquestioned") then {true} else {not _alreadyquestioned}) then{
			_cT setVariable ["questioned",true,true];
			if(random 100 > 85 ) then {
				playergroupname = group player;
				publicVariable "playergroupname";
				_cache = nearestObjects[getPosATL player, [cacheType], AORADIUS] select 0;
				if (isNil "_cache") exitWith { hint "Currently, there is no intel on caches within your AO. Time to move on and look elsewhere!"; };
				[nil,nil,rSPAWN,_cache,{ 
					if (isServer) then { _this call createIntel; }; 
				
				hint "A civilian has provided information on the location of an ammo cache. A marker has been added to the map."; 
				}] call RE; 
		

				} else {

				_response = ["This civilian does not appear to understand english.","This civilian does not have any useful information.","This civilian does not understand you.","This civilian tells you to leave them alone.", "This civilian has no information but asks about compensation for the loss of their goat.", "This civilian is very hostile to you and tells you to get lost."];

				_randomResponse = _response select (random (count _response - 1));
				hint parseText format ["<t color=""#ffff00"">%1</t>",_randomResponse];



			};
		}else{
			hint "This civilian has already been questioned.";
		};		
	',6,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 10 && (cursorTarget isKindof "TK_CIV_Takistani_Base_EP1" ||  cursorTarget isKindof "Woman_EP1") && alive cursorTarget};
	']; 

	if !isNil "actionSearchInsurgent" then { player removeAction actionSearchInsurgent; actionSearchInsurgent = nil; };
	actionSearchInsurgent = player addAction ["Search Body","common\client\actions\noScript.sqf",'
				_body = cursorTarget;

				hint "Searching the body..."; 

				_anim = "aidlpknlmstpslowwrfldnon_idlesteady02";
				player playMove _anim;
				waitUntil { animationState player == _anim };
				waitUntil { animationState player != _anim };
				sleep 2.5;			
				if(random 100 > 85) then {
											
							[nil,nil,rSPAWN,player,{
							_player = _this;

							playergroupname = group _player;
							publicVariable "playergroupname";
							
							_cache = nearestObjects[getPosATL _player, ["GuerillaCacheBox_EP1"], 8000] select 0;
							if (isNil "_cache") exitWith { hint "Currently, there is no intel on caches within your AO. Time to move on and look elsewhere!"; };
							if (isServer) then { _cache call createIntel; }; 
							
							hint "You found some new intelligence on the location of an ammo cache. A marker has been added to the map."; 
							}] call RE; 

							} else {
								
							hint "No useful intelligence was found on this body.";
							sleep 1;
							if(random 100 > 85) then {
								hint "This insurgent fell on his IED, run!";
								sleep 10;
								_bodyIED = "ARTY_Sh_122_HE" createVehicle (getpos _body);
							};
						};
				sleep 1;
				hideBody _body;
				r_body = [_body];
				publicVariable "r_body";
				sleep 4;
				deleteVehicle _body;
						
				

	',6,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && (cursorTarget isKindOf "TK_Soldier_base_EP1" || cursorTarget isKindOf "TK_INS_Soldier_Base_EP1") && !alive cursorTarget};
	']; 


	
	if !isNil "actionPullout" then { player removeAction actionPullout; actionPullout = nil; };
	actionPullout = player addAction ["Pull Out Injured","common\client\actions\noScript.sqf",'
	_anim = "AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow";
	player playMove _anim;
	waitUntil { animationState player == _anim };
	waitUntil { animationState player != _anim };
	{	if (lifestate _x == "UNCONSCIOUS") then { moveOut _x; }; } foreach crew cursorTarget;	
	',1,false,true,"",'
		_cT = cursorTarget; 
		if !isNull _cT then { 
			if !(_cT isKindOf "LandVehicle" || _cT isKindOf "Air") exitWith {};
			_crew = crew _cT;
			_bool = false;
			{	if (lifestate _x == "UNCONSCIOUS") exitWith {	_bool = true;	}; } foreach _crew;			
			_bool && _target distance _cT < 5
		};
	']; 
	
	if !isNil "actionLoadInjured" then { player removeAction actionLoadInjured; actionLoadInjured = nil; };
	actionLoadInjured = player addAction ["Load Injured Into Vehicle","common\client\actions\noScript.sqf",'
	_dragged = (nearestPlayers(getPosATL player,5,false,"array") - [player]);
		{ 
			_anim = animationState _x;
			if (_anim in carriedAnims) exitWith { _dragged = _x; }; 
		} forEach _dragged;
		if (typeName _dragged == "ARRAY") then { _dragged = _dragged select 0; };		
		detach _dragged;
		player playAction "released";
		[nil,_dragged,"loc",rSWITCHACTION,"released"] call RE;
		sleep 0.8;
		[nil,_dragged,"loc",rSPAWN,cursorTarget,{player moveInCargo _this;}] call RE;
	',1,false,true,"",'
		_cT = cursorTarget; 
		if !isNull _cT then { 
			if !(_cT isKindOf "LandVehicle" || _cT isKindOf "Air") exitWith {};
			_cT distance player < 5 && _cT emptyPositions "Cargo" > 0 && animationState player == carrierAnim
		};
	'];
	
	if !isNil "actionDrag" then { player removeAction actionDrag; actionDrag = nil; };
	actionDrag = player addAction ["Drag","common\client\actions\noScript.sqf",'
		_cT = cursorTarget;
		player playActionNow "grabdrag";
		sleep 1;
		[nil,_cT,"loc",rSPAWN,player,{
		  detach player;
			player switchMove "ainjppnemstpsnonwrfldb_still";
			player attachTo [_this, [0.1, 1.01, 0]];
			sleep 0.001;
			player setDir 180;
		}] call RE;		
	',1,false,true,"",'
		_cT = cursorTarget; 
		if !isNull _cT then { _target distance _cT < 3 && lifeState _cT == "UNCONSCIOUS" && !(animationState _target in (draggerAnims+[carrierAnim])) && animationState _cT == "ainjppnemstpsnonwrfldnon" }
	'];
	
	if !isNil "actionCarry" then { player removeAction actionCarry; actionCarry = nil; };
	actionCarry = player addAction ["Carry","common\client\actions\noScript.sqf",'
		_dragged = (nearestPlayers(getPosATL player,5,false,"array") - [player]);
		{ if (animationState _x == draggedAnim) exitWith { _dragged = _x; }; } forEach _dragged;
		if (typeName _dragged == "ARRAY") then { _dragged = _dragged select 0; };		
		detach _dragged;
		[nil,_dragged,rSWITCHMOVE,"ainjpfalmstpsnonwrfldnon_carried_up"] call RE;
		player switchMove "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon";
		sleep 10;
		_dragged attachTo [player,[0,-0.1,-1.2], "RightShoulder"];
		[nil, _dragged, rSETDIR, 180] call RE;		
	',1,false,true,"",'animationState _target in draggerAnims'];

	if !isNil "actionDrop" then { player removeAction actionDrop; actionDrop = nil; };	
	actionDrop = player addAction ["Drop","common\client\actions\noScript.sqf",'
		_dragged = (nearestPlayers(getPosATL player,5,false,"array") - [player]);
		{ 
			_anim = animationState _x;
			if (_anim == draggedAnim || _anim in carriedAnims) exitWith { _dragged = _x; }; 
		} forEach _dragged;
		if (typeName _dragged == "ARRAY") then { _dragged = _dragged select 0; };		
		detach _dragged;
		player playAction "released";
		if (animationState _dragged in carriedAnims) exitWith { 
			[nil,_dragged,"loc",rSWITCHMOVE,"AinjPfalMstpSnonWrflDnon_carried_down"] call RE;				
		};
		[nil,_dragged,"loc",rSWITCHACTION,"released"] call RE;		
		',1,false,true,"",'animationState _target in (draggerAnims+[carrierAnim])'
	];

	if !isNil "actionRearm" then { player removeAction actionRearm; actionRearm = nil; };
	actionRearm = player addAction ["Rearm stationary weapon","common\client\actions\noScript.sqf","
	_vcl = cursorTarget;
	player groupChat ""rearming..."";
	player playMove ""ainvpknlmstpslaywrfldnon_medic"";
	curTime = time;
	waitUntil{ animationState player == ""ainvpknlmstpslaywrfldnon_medic""};  
	waitUntil{ animationState player != ""ainvpknlmstpslaywrfldnon_medic""}; 
	if (time - curTime > 7) then { _vcl setVehicleAmmo 1; };
	",1,false,true,"",'
	_cT = cursorTarget;
	if !isNull _cT then { _cT isKindOf "staticWeapon" && alive _cT }
	']; 




	if !isNil "doRepairVecs" then { player removeAction doRepairVecs; doRepairVecs = nil; };
	doRepairVecs = player addAction ["Repair Vehicles at HQ (Squad Leaders)","common\client\actions\noScript.sqf",'
		_timePas = HQ getVariable ["RepVecs",0];
		_rT = 60 - (time - _timePas);
		if (_rT > 0 && _timePas != 0) exitWith { player groupChat format ["You have to wait approx. %1 minutes to repair vehicles near MHQ.", (round((abs _rT)/60))]; };
	_gleader = call compile squadLeader(player);
		_str = "Only squad leader can repair vehicles near HQ!";
		if (isNil "_gleader") exitWith { player groupChat _str; };
		if (isNull _gleader || !isPlayer _gleader) exitWith { player groupChat _str; };
	for "_i" from 0 to (count westVehicleStrings - 1) do {
		_str = westVehicleStrings select _i;
		_vcl = call compile _str;
	if (typeName _vcl=="OBJECT") then {
		if (damage _vcl < 0.99 && _vcl distance (baseflag) < 40 && !(player in _vcl)) then {
		_vcl setDamage 0;
		hint "Vehicles Repaired!";
		HQ setVariable ["RepVecs",time,true];
		};
	};
};
',1,false,true,"",'vehicle _target == _target && _target distance HQ < 7'];


	

	
	claymores = [];

	if !isNil "actionClaymore" then { player removeAction actionClaymore; actionClaymore = nil; };
	actionClaymore = player addAction ["Place Improvised Claymore","common\client\actions\noScript.sqf",'
	_cT = cursorTarget;
	_this select 0 removeMagazine "PipeBomb";
	_pos = getPosATL (_this select 0);
	_dir = getDir (_this select 0);
	player playMove "amovpknlmstpsraswrfldnon_gear";
	sleep 2;
	_object = createVehicle ["Explosive", _pos,[], 0, "NONE"];
	_object setPos [(_pos select 0) + 1 * sin _dir,(_pos select 1) + 1 * cos _dir,(_pos select 2)];
	_object setDir _dir;	

	_object setVehicleInit "
	actionProximityCharge = this addAction [""Set Proximity Sensor"",""common\client\actions\noScript.sqf"",''(_this select 0) removeAction (_this select 2);
	hint ""Setting up sensor on claymore. Step away."";
	sleep 15;
	hint ""Claymore sensor: ACTIVE"";
	(_this select 0) setVehicleInit ""this execFSM (""""bon_ieds\claymore_sensor.fsm"""");""; processInitCommands;
	'',1,false,true,"""",""
	_cT = cursorTarget; _target distance _cT < 5""];

	";

	processInitCommands;

	claymores = claymores + [_object];
	call addActionDetonateClaymore;

	 ',1,false,true,"",'
	 //check if player have satchel charge in inventory
	 _haveSatchel = magazines player;
	 _magSatchel = "PipeBomb";
	 _magSatchel in _haveSatchel'];


	breachcharges = [];

	if !isNil "actionBreachingCharge" then { player removeAction actionBreachingCharge; actionBreachingCharge = nil; };
	actionBreachingCharge = player addAction ["Place Improvised Breaching Charge","common\client\actions\noScript.sqf",'
	_cT = cursorTarget;
	_this select 0 removeMagazine "PipeBomb";
	_pos = getPosATL (_this select 0);
	_dir = getDir (_this select 0);
	player playMove "amovpknlmstpsraswrfldnon_gear";
	sleep 2;
	_object = createVehicle ["Explosive", _pos,[], 0, "NONE"];
	_object setPos [(_pos select 0) + 1 * sin _dir,(_pos select 1) + 1 * cos _dir,(_pos select 2)];
	
	breachcharges = breachcharges + [_object];
	call addActionDetonateCharge;

	 ',1,false,true,"",'//check if player have satchel charge in inventory	
	 _haveSatchel = magazines player;
	 _magSatchel = "PipeBomb";
	 _magSatchel in _haveSatchel'];

	

	if !isNil "actionBuildCamo" then { player removeAction actionBuildCamo; actionBuildCamo = nil; };
	actionBuildCamo = player addAction ["Deploy Camo Net : Light Desert","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;
	_vehicle setvariable ["deployed",true,true];

	["Deploying Camo Net", "Deploying camo net, placing over vehicle", "This will take some time!", 30] spawn playerHint;
	_built_camo = false;
	_build_time = time;
		
		while {!_built_camo} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _build_time > 27) then {
			_built_camo = true;
			};
		};	

	_camo = createVehicle ["Land_CamoNetB_NATO_EP1", (_vehicle modelToWorld [0,0,0]), [], 0, "NONE"];
	_vehicle setvariable ["lightdesert_deployed",true,true];	
	_camo setDir ((direction _vehicle) -180);
	_camo setPos (_vehicle modelToWorld [0,0,-2.3]);

	',1,false,true,"",'if !isNull cursorTarget then { _pos = cursortarget modelToWorld [0,-3,0]; _pos distance player < 3 && (cursorTarget isKindof "Car" || cursorTarget isKindof "Tank") && (typeOf cursorTarget in westVehicleClasses || cursorTarget isKindof "M1A2_US_TUSK_MG_EP1") && isNil{ cursortarget getVariable "deployed" } };'];

	if !isNil "actionBuildCamoDark" then { player removeAction actionBuildCamoDark; actionBuildCamoDark = nil; };
	actionBuildCamoDark = player addAction ["Deploy Camo Net : Dark Desert","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;
	_vehicle setvariable ["deployed",true,true];

	["Deploying Camo Net", "Deploying camo net, placing over vehicle", "This will take some time!", 30] spawn playerHint;
	_built_camo = false;
	_build_time = time;
		
		while {!_built_camo} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _build_time > 27) then {
			_built_camo = true;
			};
		};	

	_camo = createVehicle ["Land_CamoNetB_EAST_EP1", (_vehicle modelToWorld [0,0,0]), [], 0, "NONE"];
	_vehicle setvariable ["darkdesert_deployed",true,true];	
	_camo setDir ((direction _vehicle) -180);
	_camo setPos (_vehicle modelToWorld [0,0,-2.3]);

	',1,false,true,"",'if !isNull cursorTarget then { _pos = cursortarget modelToWorld [0,-3,0]; _pos distance player < 3 && (cursorTarget isKindof "Car" || cursorTarget isKindof "Tank") && (typeOf cursorTarget in westVehicleClasses || cursorTarget isKindof "M1A2_US_TUSK_MG_EP1") && isNil{ cursortarget getVariable "deployed" } };'];


	if !isNil "actionRemoveCamo" then { player removeAction actionRemoveCamo; actionRemoveCamo = nil; };
	actionRemoveCamo = player addAction ["Stow Camo Net","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;
	
	_camo = nearestObject [_vehicle, "Land_CamoNetB_NATO_EP1"];
	if !isNull _camo then { 

	["Stowing Camo Net", "Stowing camo net back into vehicle", "This will take some time!", 20] spawn playerHint;
	_removed_camo = false;
	_remove_time = time;

	
		
		while {!_removed_camo} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _remove_time > 17) then {
			_removed_camo  = true;
			};
		};	

	deleteVehicle _camo; 
	_vehicle setVariable ["deployed",nil];
	_vehicle setVariable ["lightdesert_deployed",nil];
	} else { 
		hint "Camo Net is already stowed or vehicle is too far from Camo Net to stow."; 
	};

	',1,false,true,"",'!isNil{cursortarget getVariable "lightdesert_deployed"};'];

	if !isNil "actionRemoveCamoDark" then { player removeAction actionRemoveCamoDark; actionRemoveCamoDark = nil; };
	actionRemoveCamoDark = player addAction ["Stow Camo Net","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;
	
	_camo = nearestObject [_vehicle, "Land_CamoNetB_EAST_EP1"];
	if !isNull _camo then { 

	["Stowing Camo Net", "Stowing camo net back into vehicle", "This will take some time!", 20] spawn playerHint;
	_removed_camo = false;
	_remove_time = time;

	
		
		while {!_removed_camo} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _remove_time > 17) then {
			_removed_camo  = true;
			};
		};	

	deleteVehicle _camo; 
	_vehicle setVariable ["deployed",nil];
	_vehicle setVariable ["darkdesert_deployed",nil];
	} else { 
		hint "Camo Net is already stowed or vehicle is too far from Camo Net to stow."; 
	};

	',1,false,true,"",'!isNil{cursortarget getVariable "darkdesert_deployed"};'];

	if !isNil "actionBuildBarrier" then { player removeAction actionBuildBarrier; actionBuildBarrier = nil; };
	actionBuildBarrier = player addAction ["Deploy H-Barrier","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;

	["Deploying H-Barrier", "Building H-Barrier in front of vehicle", "This will take some time!", 60] spawn playerHint;
	_built_barrier = false;
	_build_time = time;
		
		while {!_built_barrier} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _build_time > 56) then {
			_built_barrier = true;
			};
		};	

	_barrier = createVehicle ["Land_HBarrier5", (_vehicle modelToWorld [2,5,-2.3]), [], 0, "NONE"];	
	_barrier setDir ((direction _vehicle) -180);
	_barrier setPos (_vehicle modelToWorld [2,5,-2.3]);

	',1,false,true,"",'if !isNull cursorTarget then { _pos = cursortarget modelToWorld [0,-3,0]; _pos distance player < 3 && (cursorTarget isKindof "Car" || cursorTarget isKindof "Tank") && (typeOf cursorTarget in westVehicleClasses || cursorTarget isKindof "M1A2_US_TUSK_MG_EP1") };'];



	if !isNil "actionRemoveBarrier" then { player removeAction actionRemoveBarrier; actionRemoveBarrier = nil; };
	actionRemoveBarrier = player addAction ["Remove H-Barrier","common\client\actions\noScript.sqf",'

	_barrier = cursorTarget;

	["Removing H-Barrier", "Removing H-Barrier", "This will take some time!", 30] spawn playerHint;
	_removed_barrier = false;
	_remove_time = time;
		
		while {!_removed_barrier} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _remove_time > 27) then {
			_removed_barrier  = true;
			};
		};	

	deleteVehicle _barrier;

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && cursorTarget isKindof "Land_HBarrier5"};'];





	if !isNil "actionDragSandbag" then { player removeAction actionDragSandbag; actionDragSandbag = nil; };
	actionDragSandbag = player addAction ["Drag","common\client\actions\noScript.sqf",'

		_object_dragged = cursortarget;
		player playMove "acinpknlmstpsraswrfldnon";
		_object_dragged attachto [player,[0,1.3,0.5]];
		player removeAction actionCarry;
		sleep 0.1;
		WaitUntil {!Alive player || ((animationstate player == "acinpknlmstpsraswrfldnon") || (animationstate player == "acinpknlmwlksraswrfldb"))};
		While {Alive player && (animationstate player == "acinpknlmstpsraswrfldnon") || (animationstate player == "acinpknlmwlksraswrfldb")} do
		{
		sleep 0.1;
		};
		detach _object_dragged;

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && ( cursorTarget isKindof "Land_BagFenceLong" || cursorTarget isKindof "RoadCone" || cursorTarget isKindof "TargetEpopup" || cursorTarget isKindof "ACE_Hostage_Target_1" ) };'];


	if !isNil "actionBuildSandbag" then { player removeAction actionBuildSandbag; actionBuildSandbag = nil; };
	actionBuildSandbag = player addAction ["Deploy Sandbags","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;

	["Deploying Sandbags", "Deploying draggable sandbags in front of vehicle", "This will take some time!", 30] spawn playerHint;
	_built_bags = false;
	_build_time = time;
		
		while {!_built_bags} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _build_time > 27) then {
			_built_bags = true;
			};
		};	

	_bags = createVehicle ["Land_BagFenceLong", (_vehicle modelToWorld [2,5,-2.3]), [], 0, "NONE"];	
	_bags setDir ((direction _vehicle) -180);
	_bags setPos (_vehicle modelToWorld [2,5,-2.3]);

	',1,false,true,"",'if !isNull cursorTarget then { _pos = cursortarget modelToWorld [0,-3,0]; _pos distance player < 3 && (cursorTarget isKindof "Car" || cursorTarget isKindof "Tank") && (typeOf cursorTarget in westVehicleClasses || cursorTarget isKindof "M1A2_US_TUSK_MG_EP1") };'];

	
	if !isNil "actionRemoveSandbag" then { player removeAction actionRemoveSandbag; actionRemoveSandbag = nil; };
	actionRemoveSandbag = player addAction ["Remove Sandbags","common\client\actions\noScript.sqf",'

	_bag = cursorTarget;

	["Removing Sandbags", "Removing Sandbags", "This will take some time!", 15] spawn playerHint;
	_removed_bags = false;
	_remove_time = time;
		
		while {!_removed_bags} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _remove_time > 13) then {
			_removed_bags  = true;
			};
		};	

	deleteVehicle _bags;

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && cursorTarget isKindof "Land_BagFenceLong"};'];

	if !isNil "actionBuildRoadcone" then { player removeAction actionBuildRoadcone; actionBuildRoadcone = nil; };
	aactionBuildRoadcone = player addAction ["Deploy Road Cones","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;

	["Deploying Road Cones", "Deploying draggable road cones at rear of vehicle", "This will take some time!", 10] spawn playerHint;
	_built_cone = false;
	_build_time = time;
		
		while {!_built_cone} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 7;
			if (time - _build_time > 7) then {
			_built_cone = true;
			};
		};	

	_cone = createVehicle ["RoadCone", (_vehicle modelToWorld [2,5,-1.8]), [], 0, "NONE"];	
	_cone setPos (_vehicle modelToWorld [0,-5,-1.8]);
	_cone = createVehicle ["RoadCone", (_vehicle modelToWorld [2,5,-1.8]), [], 0, "NONE"];	
	_cone setPos (_vehicle modelToWorld [2,-5,-1.8]);
	_cone = createVehicle ["RoadCone", (_vehicle modelToWorld [2,5,-1.8]), [], 0, "NONE"];	
	_cone setPos (_vehicle modelToWorld [4,-5,-1.8]);

	',1,false,true,"",'if !isNull cursorTarget then { _pos = cursortarget modelToWorld [0,-3,0]; _pos distance player < 3 && (cursorTarget isKindof "Car" || cursorTarget isKindof "Tank") && (typeOf cursorTarget in westVehicleClasses || cursorTarget isKindof "M1A2_US_TUSK_MG_EP1") };'];

	
	if !isNil "actionRemoveCone" then { player removeAction actionRemoveCone; actionRemoveCone = nil; };
	actionRemoveCone = player addAction ["Remove Road cone","common\client\actions\noScript.sqf",'

	_cone = cursorTarget;
	["Removing Road Cone", "Removing Road Cone", "This will only take a second or two.", 2] spawn playerHint;
	sleep 1;

	deleteVehicle _cone;

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && cursorTarget isKindof "RoadCone"};'];

	if !isNil "actionRemoveTarget" then { player removeAction actionRemoveTarget; actionRemoveTarget = nil; };
	actionRemoveTarget = player addAction ["Remove Training Target","common\client\actions\noScript.sqf",'

	_target = cursorTarget;
	["Removing Training Target", "Removing Training Target", "This will only take a second or two.", 2] spawn playerHint;
	sleep 1;

	deleteVehicle _target;

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && cursorTarget isKindof "TargetEpopup" || cursorTarget isKindof "ACE_Hostage_Target_1"};'];

};

addActionDetonateCharge = {

	if !isNil "actionDetonateCharge" then { player removeAction actionDetonateCharge; actionDetonateCharge = nil; };
	actionDetonateCharge = player addAction ["Detonate Breaching Charge","common\client\actions\noScript.sqf",'
	_this select 0 removeAction (_this select 2);

	{
	_chargePos = getPosATL _x;

	sleep random 2;
	"M_AT5_AT" createVehicle _chargePos;
	deleteVehicle _x;
	} forEach breachcharges;
	breachcharges = [];
	
	 ',1,false,true,"",''];
};

addActionDetonateClaymore = {
	
	if !isNil "actionDetonateClaymore" then { player removeAction actionDetonateClaymore; actionDetonateClaymore = nil; };
	actionDetonateClaymore = player addAction ["Detonate Claymore","common\client\actions\noScript.sqf",'
	_this select 0 removeAction (_this select 2);
		
	{ 
	_chargePos = getPosATL _x;
	_chargeDir = getDir _x;

	sleep random 2;
	deleteVehicle _x;
	"Grenade" createVehicle _chargePos;
	"Grenade" createVehicle [(_chargePos select 0) + 6 * sin _chargeDir,(_chargePos select 1) + 6 * cos _chargeDir,(_chargePos select 2)];
	"Grenade" createVehicle [(_chargePos select 0) + 15 * sin _chargeDir,(_chargePos select 1) + 15 * cos _chargeDir,(_chargePos select 2)];
	"Grenade" createVehicle [(_chargePos select 0) + 25 * sin _chargeDir,(_chargePos select 1) + 25 * cos _chargeDir,(_chargePos select 2)];
	"Grenade" createVehicle [(_chargePos select 0) + 15 * sin _chargeDir,(_chargePos select 1) + 25 * cos _chargeDir,(_chargePos select 2)];
	"Grenade" createVehicle [(_chargePos select 0) + 25 * sin _chargeDir,(_chargePos select 1) + 15 * cos _chargeDir,(_chargePos select 2)];
	"Grenade" createVehicle [(_chargePos select 0) + 1 * sin _chargeDir,(_chargePos select 1) + 20 * cos _chargeDir,(_chargePos select 2)];
	"Grenade" createVehicle [(_chargePos select 0) + 20 * sin _chargeDir,(_chargePos select 1) + 1 * cos _chargeDir,(_chargePos select 2)];
	"Grenade" createVehicle [(_chargePos select 0) + 1 * sin _chargeDir,(_chargePos select 1) + 15 * cos _chargeDir,(_chargePos select 2)];
	"Grenade" createVehicle [(_chargePos select 0) + 15 * sin _chargeDir,(_chargePos select 1) + 1 * cos _chargeDir,(_chargePos select 2)];

	} forEach claymores;
	claymores = [];
	
	 ',1,false,true,"",''];
};



	


changeTyre = {	
    private ["_vcl","_tyre"];
    _vcl    = cursorTarget;
	_tyre	= _vcl call getTyre; 	
	player groupChat "changing tyre..."; 
	player playMove "ainvpknlmstpslaywrfldnon_medic"; 
	sleep 3; 
	waitUntil { animationState player != "ainvpknlmstpslaywrfldnon_medic"}; 
	[nil, nil, rSPAWN, [_vcl, _tyre], { 
		(_this select 0) setHit [_this select 1, 0]; 	
		(_this select 0) setVelocity[0,0,1]; 	
	}] call RE; 
};

getTyre = { 
    private ["_offset","_pos"];
    _offset = 	[-1,1.7,-2];
	_pos = _this modelToWorld _offset;
	if (player distance _pos < 1.5 && canSee(player,_pos,45)) exitWith { "wheel_1_1_steering" };
	_offset = 	[-1,-1.7,-2];
	_pos = _this modelToWorld _offset; 
	if (player distance _pos < 1.5 && canSee(player,_pos,45)) exitWith { "wheel_1_2_steering" }; 
	_offset = 	[1,1.7,-2]; 
	_pos = _this modelToWorld _offset;
	if (player distance _pos < 1.5 && canSee(player,_pos,45)) exitWith { "wheel_2_1_steering" }; 
	_offset = 	[1,-1.7,-2];
	_pos = _this modelToWorld _offset;
	if (player distance _pos < 1.5 && canSee(player,_pos,45)) exitWith { "wheel_2_2_steering" };
};

addActionWearBelt = {
	if !isNil "CanWearBelt" then { _this removeAction CanWearBelt; CanWearBelt = nil; };
	CanWearBelt = _this addAction ["Wear belt","common\client\actions\noScript.sqf",'
	if !isNil ((_this select 0) getVariable "BeltWorn") exitWith {} ; 
	_this select 0 removeAction (_this select 2);
	_this select 0 removeMagazine "BAF_ied_v3";
	_this select 0 setVariable ["BeltWorn",1,true];
	_this select 0 call addActionDisarmBelt;
	_this select 0 call addActionExplodeBelt;
 ',1,false,true,"",'
 //check if player have ied in inventory
 _haveIED = magazines _this;
 _magIED = "BAF_ied_v3";
 _magIED in _haveIED
	'];
		};

addActionDisarmBelt = {
	CanDisarmBelt = _this addAction ["Disarm belt","common\client\actions\noScript.sqf",'
	_this select 0 removeAction (_this select 2);
	_this select 0 setVariable ["BeltWorn",nil];
	_this select 0 addMagazine "BAF_ied_v3";
	_this select 0 removeAction CanExplodeBelt;
	_this select 0 call addActionWearBelt;
 ',1,false,true,"",""];
		};
		
addActionExplodeBelt = {
	CanExplodeBelt = _this addAction ["Explode belt!","common\client\actions\noScript.sqf",'
	_this select 0 removeAction (_this select 2);
	_this select 0 removeAction CanDisarmBelt;
	_this select 0 setVariable ["BeltWorn",nil];
	"ARTY_Sh_122_HE" createVehicle getPos (_this select 0);

 ',1,false,true,"",'
 !isNil{_this getVariable "BeltWorn"}
 '];
	};

addActionProximityIED = {
	if !isNil "ProximityIED" then { _this removeAction ProximityIED;ProximityIED = nil; };
	ProximityIED = _this addAction ["Set IED Pressure Plate","common\client\actions\noScript.sqf",'
	if !isNil ((_this select 0) getVariable "ProximitySet") exitWith {} ; 
	hint "Setting up IED pressure plate. IED will be active in 30 seconds. Move away from the area!";
	_anim = "aidlpknlmstpslowwrfldnon_idlesteady02";
	player playMove _anim;
	
	_this select 0 removeAction (_this select 2);
	_this select 0 removeMagazine "BAF_ied_v1";
		_pos = getPosATL (_this select 0);
		_dir = getDir (_this select 0);
	_mine1 = createVehicle ["Land_IED_v1_PMC", _pos,[], 0, "NONE"];
	sleep 30;
	hint "Pressure plate is active. Do not return to the area.";
	_mine1 setPos [(_pos select 0) + 1 * sin _dir,(_pos select 1) + 1 * cos _dir,(_pos select 2)-0.01];
	_mine1 setVehicleInit "det1 = this addAction [""<t color=""""#FFCC00"""">Detonate IED - delayed</t>"",""bon_ieds\blow.sqf"",[],1,false,true,"""",""_this distance _target < 7 && _this == Hitman113""];";
	_mine1 setVehicleInit "det2 = this addAction [""<t color=""""#FFCC00"""">Detonate IED - delayed</t>"",""bon_ieds\blow.sqf"",[],1,false,true,"""",""_this distance _target < 7 && _this == Hitman123""];";
	_mine1 setVehicleInit "det3 = this addAction [""<t color=""""#FFCC00"""">Detonate IED - delayed</t>"",""bon_ieds\blow.sqf"",[],1,false,true,"""",""_this distance _target < 7 && _this == Hitman133""];";
	_mine1 setVehicleInit "det4 = this addAction [""<t color=""""#FFCC00"""">Detonate IED - delayed</t>"",""bon_ieds\blow.sqf"",[],1,false,true,"""",""_this distance _target < 7 && _this == Hitman143""];";
	_mine1 setVehicleInit "det5 = this addAction [""<t color=""""#FFCC00"""">Detonate IED - delayed</t>"",""bon_ieds\blow.sqf"",[],1,false,true,"""",""_this distance _target < 7 && _this == Hitman153""];";
	_mine1 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";
	processInitCommands;
	_this select 0 call addActionProximityIED;
 ',1,false,true,"",'
 //check if player have ied in inventory
 _haveIED = magazines _this;
 _magIED = "BAF_ied_v1";
 _magIED in _haveIED
	'];
		};


addActionStickyIED = {
	if !isNil "StickyIED" then { _this removeAction StickyIED;StickyIED = nil; };
	StickyIED = _this addAction ["Attach IED","common\client\actions\noScript.sqf",'
	_cT = cursorTarget;
	if !isNil ((_this select 0) getVariable "ProximitySet") exitWith {} ; 
	hint "Attempting to attach IED to object you are looking at.";
	player playMove "amovpknlmstpsraswrfldnon_gear";
	_this select 0 removeAction (_this select 2);
	_this select 0 removeMagazine "BAF_ied_v1";
		_pos = getPosATL (_this select 0);
		_dir = getDir (_this select 0);
	_mine1 = createVehicle ["Land_IED_v1_PMC", _pos,[], 0, "NONE"];
	_mine1 attachTo [_cT,[0,0,0]];
	IEDcharges = IEDCharges + [_mine1];
	_mine1 call addActionDetonateIED;
	_this select 0 call addActionStickyIED;
 ',1,false,true,"",'
 //check if player have ied in inventory
 _haveIED = magazines _this;
 _magIED = "BAF_ied_v1";
 _magIED in _haveIED
	'];
		};


addActionDetonateIED = {
	if !isNil "actionDetonateIED" then { player removeAction actionDetonateIED; actionDetonateIED = nil; };
	actionDetonateIED = player addAction ["Detonate Attached IED","common\client\actions\noScript.sqf",'
	_this select 0 removeAction (_this select 2);
	{
	_chargePos = getPosATL _x;

	sleep random 2;
	"ARTY_Sh_105_HE" createVehicle _chargePos;
	deleteVehicle _x;
	} forEach IEDcharges;
	IEDcharges = [];
	
	 ',3,false,true,"",''];
};


addActionStartCampFire = {
	if !isNil "CanStartCampFire" then { _this removeAction CanStartCampFire; CanStartCampFire = nil; };
	CanStartCampFire = _this addAction ["Build Campfire","common\client\actions\noScript.sqf",'
	_this select 0 removeAction (_this select 2);
	_this select 0 removeMagazine "FlareWhite_GP25";
	_pos = getPosATL (_this select 0);
	_dir = getDir (_this select 0);
	player playMove "amovpknlmstpsraswrfldnon_gear";
	sleep 5;
	_fire = createVehicle ["Land_Campfire_burning", _pos,[], 0, "NONE"];
	_fire setPos [(_pos select 0) + 2 * sin _dir,(_pos select 1) + 2 * cos _dir,(_pos select 2)-0.1];
	_this select 0 call addActionStartCampFire;

 ',1,false,true,"",'
 //check if player have flare in inventory
 _haveFlare = magazines _this;
 _magFlare = "FlareWhite_GP25";
 _magFlare in _haveFlare
	'];
		};



addActionStartFire = {
	if !isNil "CanStartFire" then { _this removeAction CanStartFire; CanStartFire = nil; };
	CanStartFire = _this addAction ["Start Fire","common\client\actions\noScript.sqf",'
	_cT = cursorTarget;
	_this select 0 removeAction (_this select 2);
	_this select 0 removeMagazine "FlareWhite_GP25";
	_pos = getPosATL (_this select 0);
	_dir = getDir (_this select 0);
	player playMove "amovpknlmstpsraswrfldnon_gear";
	sleep 5;
	_object = createVehicle ["Fuel_can", _pos,[], 0, "NONE"];
	_object setPos [(_pos select 0) + 3 * sin _dir,(_pos select 1) + 3 * cos _dir,(_pos select 2)-0.05];
	_fire=[_object,3.9,time,false,true] spawn BIS_Effects_Burn;
	r_fire = [_object, getpos(_object)];
	publicVariable "r_fire";
	_this select 0 call addActionStartFire;

 ',1,false,true,"",'
 //check if player have flare in inventory
 _haveFlare = magazines _this;
 _magFlare = "FlareWhite_GP25";
 _magFlare in _haveFlare'];
		};


addActionThreatenCiv = {
	if !isNil "ThreatenCiv" then { _this removeAction ThreatenCiv; ThreatenCiv = nil; };
	ThreatenCiv = _this addAction ["Threaten Civilian","common\client\actions\noScript.sqf",'
	_cT = cursorTarget;

	_alreadythreatened = _cT getVariable "threatened";
		if(if(isNil "_alreadythreatened") then {true} else {not _alreadythreatened}) then{
			_cT setVariable ["threatened",true,true];
			if(random 1 > 0.7) then {
				
				if(random 1 > 0.7) then {
					hint "Civilian feels threatened and offers you a car to use, it should be nearby.";
					_pos = getPosATL (_this select 0);
				
					_dir = getDir (_this select 0);									
					_object = createVehicle ["Lada1_TK_CIV_EP1",[(_pos select 0) + 20,(_pos select 1) + 20,(_pos select 2)],[], 0, "NONE"];
					_pos = getPosATL _object;
					_object setPos _pos;
				} else {
					hint "Civilian feels threatened and offers you an old hunting rifle, it should be nearby.";
					_pos = getPosATL (_this select 0);
				
					_dir = getDir (_this select 0);									
					_wh = "WeaponHolder" createVehicle [(_pos select 0) + 1,(_pos select 1) + 1,(_pos select 2)];
					_wh addWeaponCargo ["huntingrifle",1];
					_wh addMagazineCargo ["5x_22_LR_17_HMR",4];
				};
		

				} else {
				hint "Civilian was threatened. Civilian tells you to get lost and they will not help you.";
			};
		}else{
			hint "This person has already been threatened";
		};		
	

 ',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 10 && (cursorTarget isKindof "TK_CIV_Takistani_Base_EP1" ||  cursorTarget isKindof "Woman_EP1") && alive cursorTarget};'];
		};


addActionExtras = {

	if !isNil "actionFistAttack" then { player removeAction actionFistAttack; actionFistAttack = nil; };
	actionFistAttack = player addAction ["Attack with Fist","common\client\actions\noScript.sqf",'player playMove "AmelPercMstpSnonWnonDnon_amaterUder3";',1,false,true,"",""];

	if !isNil "actionMelee" then { player removeAction actionMelee; actionMelee = nil; };
	actionMelee = player addAction ["Melee Attack","common\client\actions\noScript.sqf",'player playMove "AmelPercMstpSlowWrflDnon_StrokeGun";',1,false,true,"",""];

	if !isNil "actionBoxing" then { player removeAction actionBoxing; actionBoxing = nil; };
	actionBoxing = player addAction ["Boxing","common\client\actions\noScript.sqf",'player playMove "AmovPercMstpSnonWnonDnon_idle68boxing";',1,false,true,"",""];

	if !isNil "actionGoGoGo" then { player removeAction actionGoGoGo; actionGoGoGo = nil; };
	actionGoGoGo = player addAction ["GoGoGo","common\client\actions\noScript.sqf",'player playMove "AsigPercMstpSlowWrflDnon_AmovPercMrunSlowWrflDnon_GoGo";',1,false,true,"",""];

	if !isNil "actionHeliLanding" then { player removeAction actionHeliLanding; actionHeliLanding = nil; };
	actionHeliLanding = player addAction ["Guide Helicopter Down","common\client\actions\noScript.sqf",'player playMove "NavigationHeli";',1,false,true,"",""];

	if !isNil "actionLayDown" then { player removeAction actionLayDown; actionLayDown = nil; };
	actionLayDown = player addAction ["Lay Down","common\client\actions\noScript.sqf",'player playMove "AidlPpneMstpSnonWnonDnon_SleepC_layDown";',1,false,true,"",""];

	if !isNil "actionPushups" then { player removeAction actionPushups; actionPushups = nil; };
	actionPushups = player addAction ["Pushups","common\client\actions\noScript.sqf",'player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";',1,false,true,"",""];

	if !isNil "actionSitups" then { player removeAction actionSitups; actionSitups = nil; };
	actionSitups = player addAction ["Situps","common\client\actions\noScript.sqf",'player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";',1,false,true,"",""];

	if !isNil "actionKarta" then { player removeAction actionKarta; actionKarta = nil; };
	actionKarta = player addAction ["Karta Exercise","common\client\actions\noScript.sqf",'player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";',1,false,true,"",""];

	if !isNil "actionWalkingHandstand" then { player removeAction actionWalkingHandstand; actionWalkingHandstand = nil; };
	actionWalkingHandstand = player addAction ["Walking Handstand","common\client\actions\noScript.sqf",'player playMove "AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou";',1,false,true,"",""];

	if !isNil "actionDance" then { player removeAction actionDance; actionDance = nil; };
	actionDance = player addAction ["Dance","common\client\actions\noScript.sqf",'player playMove "ActsPercMstpSnonWnonDnon_DancingDuoIvan";player playMove "ActsPercMstpSnonWnonDnon_DancingDuoIvan";',1,false,true,"",""];

	if !isNil "actionDance2" then { player removeAction actionDance2; actionDance2 = nil; };
	actionDance2 = player addAction ["More Dancing","common\client\actions\noScript.sqf",'player playMove "ActsPercMstpSnonWnonDnon_DancingDuoStefan";',1,false,true,"",""];

};

addActionRemoveExtras = {
player removeAction actionFistAttack;
player removeAction actionMelee;
player removeAction actionBoxing;
player removeAction actionGoGoGo;
player removeAction actionHeliLanding;
player removeAction actionLayDown;
player removeAction actionPushups;
player removeAction actionSitups;
player removeAction actionWalkingHandstand;
player removeAction actionKarta;
player removeAction actionDance;
player removeAction actionDance2;
};


addActionBuildSandbag = {
	if !isNil "actionBuildSandbag" then { player removeAction actionBuildSandbag; actionBuildSandbag = nil; };
	actionBuildSandbag = player addAction ["Build Sandbags","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;

	["Building Sandbags", "Building Sandbags in front of vehicle", "This will take some time!", 30] spawn playerHint;
	_built_bags = false;
	_build_time = time;
		
		while {!_built_bags} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _build_time > 27) then {
			_built_bags = true;
			};
		};	

	_bags = createVehicle ["Land_BagFenceLong", (_vehicle modelToWorld [2,5,-2.3]), [], 0, "NONE"];	
	_bags setDir ((direction _vehicle) -180);
	_bags setPos (_vehicle modelToWorld [2,5,-2.0]);

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && (cursorTarget isKindof "Truck")};'];

};

addActionDragSandbag = {
	if !isNil "actionDragSandbag" then { player removeAction actionDragSandbag; actionDragSandbag = nil; };
	actionDragSandbag = player addAction ["Drag Sandbag","common\client\actions\noScript.sqf",'

		_object_dragged = cursortarget;
		player playMove "acinpknlmstpsraswrfldnon";
		_object_dragged attachto [player,[0,1.3,0.3]];
		player removeAction actionCarry;
		sleep 0.1;
		WaitUntil {!Alive player || ((animationstate player == "acinpknlmstpsraswrfldnon") || (animationstate player == "acinpknlmwlksraswrfldb"))};
		While {Alive player && (animationstate player == "acinpknlmstpsraswrfldnon") || (animationstate player == "acinpknlmwlksraswrfldb")} do
		{
		sleep 0.1;
		};
		detach _object_dragged;

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && cursorTarget isKindof "Land_BagFenceLong" };'];

};

addActionRemoveSandbag = {
	if !isNil "actionRemoveSandbag" then { player removeAction actionRemoveSandbag; actionRemoveSandbag = nil; };
	actionRemoveSandbag = player addAction ["Remove Sandbags","common\client\actions\noScript.sqf",'

	_bag = cursorTarget;

	["Removing Sandbags", "Removing Sandbags", "This will take some time!", 20] spawn playerHint;
	_removed_bags = false;
	_remove_time = time;
		
		while {!_removed_bags} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _remove_time > 17) then {
			_removed_bags  = true;
			};
		};	

	deleteVehicle _bags;

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && cursorTarget isKindof "Land_BagFenceLong"};'];
};

addActionDrop = {
	if !isNil "actionDrop" then { player removeAction actionDrop; actionDrop = nil; };	
	actionDrop = player addAction ["Drop","common\client\actions\noScript.sqf",'
		_dragged = (nearestPlayers(getPosATL player,5,false,"array") - [player]);
		{ 
			_anim = animationState _x;
			if (_anim == draggedAnim || _anim in carriedAnims) exitWith { _dragged = _x; }; 
		} forEach _dragged;
		if (typeName _dragged == "ARRAY") then { _dragged = _dragged select 0; };		
		detach _dragged;
		player playAction "released";
		if (animationState _dragged in carriedAnims) exitWith { 
			[nil,_dragged,"loc",rSWITCHMOVE,"AinjPfalMstpSnonWrflDnon_carried_down"] call RE;				
		};
		[nil,_dragged,"loc",rSWITCHACTION,"released"] call RE;		
		',1,false,true,"",'animationState _target in (draggerAnims+[carrierAnim])'
	];

};

addActionBuildWire = {
	if !isNil "actionBuildWire" then { player removeAction actionBuildWire; actionBuildWire = nil; };
	actionBuildWire = player addAction ["Build Barbed Wire","common\client\actions\noScript.sqf",'

	_vehicle = cursorTarget;

	["Building Barbed Wire", "Building Barbed Wire in front of vehicle", "This will take some time!", 30] spawn playerHint;
	_built_bags = false;
	_build_time = time;
		
		while {!_built_bags} do {
	 		_anim = "AinvPknlMstpSlayWrflDnon_medic";
			player playMove _anim;
	 		 sleep 8;
			if (time - _build_time > 27) then {
			_built_bags = true;
			};
		};	

	_bags = createVehicle ["Fort_RazorWire", (_vehicle modelToWorld [2,7,-2.3]), [], 0, "NONE"];	
	_bags setDir ((direction _vehicle) -180);
	_bags setPos (_vehicle modelToWorld [2,7,-2.0]);

	',1,false,true,"",'if !isNull cursorTarget then { cursorTarget distance player < 5 && (cursorTarget isKindof "Truck")};'];

};


