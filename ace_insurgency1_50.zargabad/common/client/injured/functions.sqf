handleDamage = { 
    private ["_unit","_hitArea","_damage","_shooter","_ammoUsed","_bool"];
    
    _unit		= _this select 0; 
	_hitArea	= _this select 1; 
	_damage		= _this select 2; 
	_shooter	= _this select 3; 
	_ammoUsed	= _this select 4; 
	_bool			= (_hitArea == "legs" || _hitArea == "hands") && (handsHit _unit == 1 || !canStand _unit); 

	if (!alive _unit) exitWith { _damage}; 
	if (_hitArea == "" && vehicle player == player) exitWith {0}; 

	if (lifeState _unit == "UNCONSCIOUS") exitWith { 
		bloodloss = bloodloss + _damage; 
		if (bloodloss > 100) then { bloodloss = 100; };
		hintSilent ("Approximate bloodloss: "+str(round bloodloss)+"%\nCritical bloodloss: 30%"); 
		if (bloodloss >= bloodloosCrit) then { player setDamage 1; }; 
		0
	};

	if (vehicle _unit != _unit && _damage > 0.9 && lifeState _unit != "UNCONSCIOUS") exitWith { 
		_unit setUnconscious true;
		_unit setDamage 0.8; 	
		0.8
	}; 

	if (_hitArea == "body" && _damage > 0.9 && lifeState _unit != "UNCONSCIOUS") exitWith { 
		_unit setUnconscious true; 
		_unit setDamage 0.8; 	
		0.8	
	}; 

	if (_bool && _damage > 0.9 && lifeState _unit != "UNCONSCIOUS") exitWith { 	
		_unit setUnconscious true; 
		_unit setDamage 0.8;
		_damage
	}; 

	_damage
}; 

handleHeal = { 	
    private ["_healPlace","_injured","_anim","_pWep","_posh","_posi","_dy","_dx","_dir"];
    
    _injured 	 = _this select 0;	
	_healPlace = "healPlace0";
	_anim      = animationState _injured;
	if (_anim == draggedAnim || _anim in carriedAnims) exitWith { player groupChat "you must release the soldier first!"; false	};
	_pWep      = primaryWeapon player;
	if (_pWep == "") exitWith { player groupChat "due to scripting limitations you need a primaryWeapon to perform this action"; };
	if (currentWeapon player != _pWep) then {
		player selectWeapon _pWep;
		sleep 2;
	};
	if ((player distance (_injured modelToWorld healPlace1))<((_injured modelToWorld healPlace0) distance player)) then { _healPlace = "healPlace1"; }; 
	if (_healPlace == "healPlace0") then { 		 
		player attachTo [_injured, healPlace0]; 
		player playActionNow "medicStartRightSide"; 		
	} else { 
		player attachTo [_injured, healPlace1]; 
		player playActionNow "medicStart"; 		
	}; 
	
	sleep 0.001; 
	_posh = player modelToWorld [0,0,0]; 
	_posi = _injured modelToWorld healInjuredModelChestPos; 
	_dy 	= (_posh select 1) - (_posi select 1); 
	_dx 	= (_posh select 0) - (_posi select 0); 
	_dir = getDir player; 
	player setDir (270 - (_dy atan2 _dx) - direction _injured);	
	
	[nil, _injured, "loc", rSPAWN, player, { 
		_healer     = _this;
		nMedics     = nMedics + 1;
		if (animationState player != "ainjppnemstpsnonwrfldnon") then { 
			player playAction "agonyStart"; 
		}; 
		curTime = time - 1; 	
		waitUntil { animationState _healer in healAnims };
		waitUntil { 
			if (animationState player != "ainjppnemstpsnonwrfldnon") then { 
				player playAction "agonyStart"; 
			}; 
			!alive player || !(animationState _healer in healAnims) || round(time - curTime)*nMedics >= round(minHealTime + bloodloss) 
		};
		nMedics     = nMedics - 1;
		if (alive player && animationState _healer in healAnims) then { player setDamage 0; }; 
	}] call RE; 
	waitUntil { animationState player in healAnims };
	curTime = time;
	waitUntil { !(animationState player in healAnims) || !alive _injured || damage _injured == 0};
	if (lifeState player == "ALIVE") exitWith { 
		detach player;
		player switchAction "medicStart"; 
		player playActionNow "medicStop";
		true
 	}; 	
 	false
};

injuredLoop = { 
    private ["_bool","_agony"];
    {
		if (lifeState _x == "UNCONSCIOUS") then {
			_agony = format["%1inAgony", _x];
			_bool = missionNamespace getVariable _agony;
			if isNil "_bool" then { 
				missionNamespace setVariable [_agony, false]; 
				_bool = false;
			};
			if !_bool then {
				missionNamespace setVariable [_agony, true];
				_x spawn animations;
			};
		}; 
	} forEach playableUnits; 		
}; 

ppEffects = { 	
	//if (isNil "ppEffectsOn") then { ppEffectsOn = false; }; 
	//if (isNil "ppUnconscious") then { ppUnconscious = ppEffectCreate [["radialblur", 170], ["colorcorrections", 1580]]; }; 
	if (alive player && lifeState player == "UNCONSCIOUS" && floor((time - curTime)*10 % 5) == 0) then { 	
		if!(ppEffectsOn) then { ppEffectsOn = true; { _x ppEffectEnable true } forEach ppUnconscious; }; 	
		ppUnconscious select 0 ppEffectAdjust [random 0.005 + 0.0025, random 0.005 + 0.0025, 0.0, 0.0]; 
		ppUnconscious select 0 ppEffectCommit 0.5; 
		ppUnconscious select 1 ppEffectAdjust [1.0, 1.0, 0.0, random 0.6, 0.0, 0.0, random 0.6, 0.0, 1.0, 1.0, 1.0, 0.199, 0.587, 0.114, 0.0]; 
		ppUnconscious select 1 ppEffectCommit 0.5; 
	}; 
	if ((!alive player || lifeState player != "UNCONSCIOUS") && ppEffectsOn) then { 
		{ _x ppEffectEnable false} forEach ppUnconscious; 
		ppEffectsOn = false; 
	}; 
}; 

initBloodloss = { 
    private ["_anim"];
    
    curTime	= time; 
	nMedics	= 0;
	if (animationState player in healAnims) then {
		detach player;
		player switchAction "medicStart"; 
 		player playActionNow "medicStop";
	};
	if (animationState player in (draggerAnims+[carrierAnim]+carriedAnims+[draggedAnim])) then {
		detach player;
		player switchAction "released";
	};
	waitUntil { !(animationState player in healAnims) };
	if (vehicle player == player) then { player playAction "agonyStart"; };
	if (!captive player) then { [nil,player, rSETCAPTIVE, true] call RE; }; 	
	while{ alive player && damage player > 0}do{ 
		waitUntil { nMedics == 0 }; 
		if (round(time - curTime) % bloodlossFreq == 0) then { 			
			if (bloodloss >= bloodloosCrit) exitWith { player setDamage 1; }; 
			hint ("Approximate bloodloss: "+str(round bloodloss)+"%\nCritical bloodloss: 30%"); 
			_anim = animationState player;
			if (_anim == draggedAnim || _anim in carriedAnims) exitWith {}; 
			if (!captive player) then { [nil,player, rSETCAPTIVE, true] call RE; }; 	
			player playAction "agonyStart";
			waitUntil { animationState player == "ainjppnemstpsnonwrfldnon"}; 
			curTime = time;		
			waitUntil {
				_anim = animationState player;
				if (_anim != "ainjppnemstpsnonwrfldnon" && _anim != draggedAnim && !(_anim in carriedAnims)) then { 
					player playAction "agonyStart"; 
				}; 
				(time - curTime) > bloodloss*bloodlossFreq/bloodloosCrit || nMedics > 0
			};
		}; 	
		bloodloss = bloodloss + bloodloosCrit/reviveTime; 	
		sleep 1; 
	}; 
	if (captive player) then { [nil,player, rSETCAPTIVE, false] call RE; }; 	
	player setUnconscious false; 
	if (!alive player) exitWith {}; 
	player playAction "agonyStop"; 	
}; 

animations = {
	if isWest then {
		_this removeAllEventHandlers "handleHeal"; 
		_this addEventHandler ["handleHeal", { _this spawn handleHeal; }]; 
		_this sideChat (switch floor random 2 do { case 0: { "[ugh]"}; case 1: { "[aaah]"}; default { "[arrrrrrrghhhhhh]"}}); 
	};
	if (player == _this) then { [] spawn initBloodloss; }; 
	while { lifeState _this == "UNCONSCIOUS"} do { 	
		if (vehicle _this != _this) then { 
		_this playAction "GestureAgonyCargo";
		//dismount player if driver or gunner and injured 
		if (player == driver _this || player == gunner _this) then {
			_this enablesimulation false;
			waitUntil { (speed _this) < 5 };
			moveOut _this;
			_this sideChat "Injured player dismounted!";
			_this enablesimulation true;
			};
		waitUntil { vehicle _this == _this };
		if (player == _this) then { player playAction "agonyStart"; };
		};
		waitUntil { vehicle _this != _this || animationState _this == "ainjppnemstpsnonwrfldnon" || lifeState _this != "UNCONSCIOUS" }; 
		_this playAction "GestureSpasm" + str floor random 7; 	
		waitUntil { vehicle _this != _this || animationState _this != "ainjppnemstpsnonwrfldnon" || lifeState _this != "UNCONSCIOUS" };
		_this playAction "GestureNod";		
	}; 
	waitUntil { !isNull _this }; 
	_this removeAllEventHandlers "handleHeal"; 
	missionNamespace setVariable [format["%1inAgony", _this], false]; 
};
