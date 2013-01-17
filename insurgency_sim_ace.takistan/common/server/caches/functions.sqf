cacheKilled = { 	
    private ["_pos","_dur","_count"];
    
    _pos	= getPosATL(_this);
	curTime	= time; 
	_dur	= 5 + random 5; 
	"ARTY_R_227mm_HE" createVehicle _pos; 
	while{ true }do{ 
		"Warfare82mmMortar" createVehicle _pos; 
		if (random 100 > 70) then { "Sh_125_HE" createVehicle _pos; }; 
		if ((time - curTime) > _dur) exitWith { "ARTY_R_227mm_HE" createVehicle _pos; }; 
		sleep random 1; 
	}; 
	{ deleteMarker _x; } forEach cacheMarkers(_this); 
	deleteVehicle _this;
	sleep 1; 
	_count = count cacheList;
	[nil,nil,rHINT, parseText format["%1/%2 <t color='#80FF00'>ammo cache's</t> have been destroyed!", cacheCount - _count, cacheCount]] call RE; 
	if (_count == 0) then {
		[nil,nil,rSPAWN,[],{
			titleText["All ammo cache's have been destroyed!", "PLAIN"];
		}] call RE;
		sleep 20;
		endMission "END1";
	};
}; 

setupCaches = { 
	private ["_cachePos","_cacheHouse","_cache","_id","_positions","_type","_nWestUnits","_cacheHouses","_n","_m"];

	_cacheHouses = [CENTERPOS, AORADIUS, 6, true] call findHouses;
	for "_i" from 1 to cacheCount do { 	
		if DEBUG then { server globalChat format["cache%1 spawning...", _i]; };
		_cache = createVehicle [cacheType, spawnPos, [], 0, "None"];
		call compile format['
			_cache setVehicleInit "
				this setVehicleVarName ""cache%1"";
				cache%1 = this;
				clearWeaponCargo this;
				clearMagazineCargo this;

				this addWeaponCargo  [""NVGoggles"", 4];
				this addWeaponCargo [""SVD"", 1];
				this addMagazineCargo [""10Rnd_762x54_SVD"", 6];
				this addWeaponCargo [""AKS_74_NSPU"", 1];
				this addMagazineCargo [""30Rnd_545x39_AK"", 8];
				this addMagazineCargo [""30Rnd_762x39_SA58"", 8];
				this addWeaponCargo [""AK_74_GL_kobra"", 1];
				this addWeaponCargo [""Sa58V_RCO_EP1"", 1];
				this addMagazineCargo [""1Rnd_HE_GP25"", 8];
				this addMagazineCargo [""FlareWhite_GP25"", 12];
				this addMagazineCargo [""BAF_ied_v1"", 4];
				this addMagazineCargo [""BAF_ied_v3"", 4];

				this addBackpackCargo [""2b14_82mm_TK_INS_Bag_EP1"", 1];
				this addBackpackCargo [""Tripod_Bag"", 1];






			";
		', _i];
						
						
		_cache addEventHandler["Killed", { (_this select 0) spawn cacheKilled; }]; 
		while { count _cacheHouses > 1 } do { 
			_cacheHouse	= _cacheHouses select floor(random(count _cacheHouses - 1)); 
			_type		= typeOf _cacheHouse; 	
			_nWestUnits	= nearestObjects[getPosATL _cacheHouse, westSoldierClasses+[cacheType], cacheRadius]; 		
			if (count _nWestUnits == 0 && _type in CACHEHOUSEPOSITIONS) exitWith { 
				_id = CACHEHOUSEPOSITIONS find _type; 
				_positions = CACHEHOUSEPOSITIONS select (_id+1); 
				_cachePos = _cacheHouse buildingPos (_positions select floor(random(count _positions - 1))); 						
			}; 
			_cacheHouses = _cacheHouses - [_cacheHouse]; 
		}; 	
		_cache setPosATL _cachePos;
		if DEBUG then { server globalChat format["cache at %1", _cachePos]; };
		_hidecache = [nil, _cache, "per", rHideObject, true] call RE;

		_cacheHouse addEventHandler ["handleDamage", { 
			_damage = _this select 2; 
			_cache  = getPosATL (_this select 0) nearestObject cacheType;
			if (_damage > 0.9) then {	_cache setDamage 1;	};
			_damage
		}];
		if DEBUG then { [_cache, format["cache%1", _i]] call createDebugMarker; };		
	};
	processInitCommands;
}; 	

setupExtraIntel = { 
	private ["_intelPos","_intelHouse","_intel","_id","_positions","_type","_nWestUnits","_intelHouses","_n","_m"];

	_intelHouses = [CENTERPOS, AORADIUS, 6, true] call findHouses;
	for "_i" from 1 to 10 do { 	
		if DEBUG then { server globalChat format["intel%1 spawning...", _i]; };
		_intel = createVehicle [intelType, spawnPos, [], 0, "None"];
		_intel setVehicleInit "this setVehicleVarName ""intel%1"";
		
		actionCheckComputer = this addAction ['Check Computer','common\client\actions\noScript.sqf','
				_this select 0 removeAction (_this select 2);
				player playMove ""amovpknlmstpsraswrfldnon_gear"";
				sleep 5;
				_computer = _this select 0;
			[nil,nil,rSPAWN,player,{
							_player = _this;
							playergroupname = group _player;
							publicVariable ""playergroupname"";
							
							_cache = nearestObjects[getPosATL _player, [""GuerillaCacheBox_EP1""], 8000] select 0;
							if (isNil ""_cache"") exitWith { hint ""Currently, there is no intel on caches within your AO. Time to move on and look elsewhere!""; };
							if (isServer) then { _cache call createIntel; }; 
							hint ""A computer laptop has been found. You found some new intelligence on the location of an ammo cache. A marker has been added to the map.""; 												
			}] call RE;
		sleep 1;
		deleteVehicle _computer;
		',6,false,true,'','if !isNull cursorTarget then { cursorTarget distance player < 5 };']; ";
				
						

		while { count _intelHouses > 1 } do { 
			_intelHouse	= _intelHouses select floor(random(count _intelHouses - 1)); 
			_type		= typeOf _intelHouse; 	
			_nWestUnits	= nearestObjects[getPosATL _intelHouse, westSoldierClasses+[intelType], cacheRadius]; 		
			if (count _nWestUnits == 0 && _type in CACHEHOUSEPOSITIONS) exitWith { 
				_id = CACHEHOUSEPOSITIONS find _type; 
				_positions = CACHEHOUSEPOSITIONS select (_id+1); 
				_intelPos = _intelHouse buildingPos (_positions select floor(random(count _positions - 1))); 						
			}; 
			_intelHouses = _intelHouses - [_intelHouse]; 
		}; 	
		_intel setPosATL _intelPos;
		
		if DEBUG then { [_intel, format["intel%1", _i]] call createDebugMarker; };		
	};
	processInitCommands;
}; 	

