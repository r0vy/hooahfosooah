quickCleanup = {
    private ["_wep","_cargoTypes"];
    
    if (time - _WCTime < 10) exitWith {};
	_WCTime = time;
	{
		if (nearestPlayers(getPosATL _x,WEP_DESPAWN_RANGE,true,"count") == 0 
		 && nearestEastMen(getPosATL _x,WEP_DESPAWN_RANGE,true,"count") == 0) then { 
			if (typeOf _x == "Suitcase") exitWith { deleteVehicle _x; };
			if (typeOf _x == "WeaponHolder") exitWith { deleteVehicle _x; };
			if (typeOf _x == "Land_fortified_nest_small_EP1") exitWith { _x setPosATL spawnPos; };
			if ((_x isKindOf "StaticWeapon" || typeOf _x == "CraterLong") && nearestPlayers(getPosATL _x,SPAWNRANGE,true,"count") == 0) exitWith { deleteVehicle _x; };
			if (!alive _x && (_x isKindOf "LandVehicle" || _x isKindOf "Air") && nearestPlayers(getPosATL _x,SPAWNRANGE,false,"count") == 0) exitWith { deleteVehicle _x; };
			if (locked _x) exitWith {};
		};	
		sleep 0.005;				
	} forEach nearestObjects[CENTERPOS,["CraterLong","Suitcase","WeaponHolder","ReammoBox","AllVehicles","Land_fortified_nest_small_EP1"],AORADIUS];
};

longCleanup = {
    private ["_wUnits"];
    
    if (time - _BCTime < 600) exitWith {};
	_BCTime = time;
	{
		if (damage _x > 0.1 && damage _x < 1) then {
			_wUnits = nearestPlayers(getPosATL _x,SPAWNRANGE,true,"array");
			if (count _wUnits > 0 && arrCanSee(_wUnits,getPosATL _x,45,200)) exitWith {};
			_x setDamage 1;
			sleep 0.001;
		};
	} forEach nearestObjects[CENTERPOS,["House"],AORADIUS];
	{
		if !alive _x then {
			if (nearestPlayers(getPosATL _x,SPAWNRANGE,true,"count") == 0) then { deleteVehicle _x; };
			sleep 0.001;
		};
	} forEach nearestObjects[CENTERPOS,["Man"],AORADIUS];
	{ if (count units _x == 0) then { deleteGroup _x; }; sleep 0.001; } forEach allGroups;
};