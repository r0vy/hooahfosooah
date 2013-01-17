private ["_sign","_weapons","_oldPlayerGroup","_playerGroupMembers","_pos","_oldUnit","_Block","_A10Timer","_c","_ctrlText","_PlayerGroup","_HQstate", "_dir", "_xpos", "_ypos", "_vector"]; 
call disableSerialization; 

_Block     	= 10;
_A10Timer	= time;
//_ArtyTimer 	= time;   // arty is definitely an overkill in Insurgency
_PlayerGroup 		= grpNull;
_HQstate 			= startLocation;

"r_say" addPublicVariableEventHandler {
	((_this select 1) select 0) say3D ((_this select 1) select 1);
};

"r_fire" addPublicVariableEventHandler {
_fire=[((_this select 1) select 0),3.9,time,false,true] spawn BIS_Effects_Burn;
};

"r_body" addPublicVariableEventHandler {
	hidebody ((_this select 1) select 0);
};

if (daytime > 6 && daytime < 19) then {
execVM "common\client\misc\ambient_sounds.sqf";
};


if isWest then {
	[] spawn { 
		while { true } do {
			//show cache when near
			call showCache;  
			sleep 10;
		};
	};
};

if isEast then {
	[] spawn { 
		while { true } do {
			//show cache when near
			call showCache;  
			sleep 10;
		};
	};
};


if isEast then {
	eastSpawnPos = getMarkerPos "respawn_east";
	eastPlayer = player;
	removeAllWeapons player;
};

if isWest then {
    player addWeapon "ACE_Earplugs";
    player addMagazine "ACE_Bandage";
    player addMagazine "ACE_Epinephrine";
    player addMagazine "ACE_Epinephrine";
    player addMagazine "ACE_Morphine";
    player addMagazine "ACE_Morphine";
    player addWeapon "ACE_GlassesGasMask_US";
    player addWeapon "ACE_GlassesBalaklava";
};

if isWest then {
	[] spawn { 
		call disableSerialization; 
		while { true } do {
			//UI
			call playerTags;  
			call vehicleTags;
			sleep 0.1;
		};
	};
};

if isWest then {
	[] spawn { 
		call disableSerialization;
		cutRsc ["IntroScreen", "PLAIN"];
		
		_hud = uiNamespace getVariable "IntroScreen";
		_control = _hud displayCtrl 10001;
		_control ctrlSetText "Insurgency Simulator";
		_control = _hud displayCtrl 10002;
		_control ctrlSetText "Welcome " + name player + " to this server!";
		_control = _hud displayCtrl 10003;
		_control ctrlSetText "Check the Map -> Notes section for lots of information on how to get started..";
		_control = _hud displayCtrl 10004;
		_control ctrlSetText "WANT A CUSTOM SET OF LOADOUTS? : Check totalboffin.blogspot.com!";
		_control = _hud displayCtrl 10005;
		_control ctrlSetText "Important information:";
		_control = _hud displayCtrl 10006;
		_control ctrlSetText "Please read Rules of Engagement in the Notes section before playing.";
		_control = _hud displayCtrl 10007;
		_control ctrlSetText "Roadside IEDs are present! Check Notes on how to remove (your squad get points!)";
		_control = _hud displayCtrl 10008;
		_control ctrlSetText "Don't shoot cilivians, you lose 5 points for each killed.";
		_control = _hud displayCtrl 10011;
		_control ctrlSetText "Check totalboffin.blogspot.com for information on updates to this mission.";


		
	};
};

if isWest then {
	[] spawn { 
		while { true } do {
			_rain = SYNCweather select 2;
			if (_rain < 0.01) then {
				//Start sandstorm.
				_particles = [player,0.5,0.8,false] call bis_fnc_sandstorm;
				if (DEBUG) then { player globalChat "sandstorm on";};
			} else {
				{
				deleteVehicle _x;
				} forEach _particles;
				if (DEBUG) then { player globalChat "sandstorm off";};
			};

			//Weather Sync
			 if (overCast != (SYNCweather select 1)) then 
				{ 0 setOvercast (SYNCweather select 1) ; };
				if (rain != (SYNCweather select 2)) then 
				{ 0 setRain (SYNCweather select 2) ; };
				if (fog != (SYNCweather select 3)) then 
				{ 0 setFog (SYNCweather select 3) ; };
					if (DEBUG) then { player globalChat format["Client Weather: date %1 - overcast %2 - rain %3 - fog %4", SYNCweather select 0, SYNCweather select 1, SYNCweather select 2, SYNCweather select 3]; };
				sleep 600;
				};
	};
};

if isEast then {
	[] spawn { 
		while { true } do {
			_rain = SYNCweather select 2;
			if (_rain < 0.01) then {
				//Start sandstorm.
				_particles = [player,0.5,0.8,false] call bis_fnc_sandstorm;
				if (DEBUG) then { player globalChat "sandstorm on";};
			} else {
				{
				deleteVehicle _x;
				} forEach _particles;
				if (DEBUG) then { player globalChat "sandstorm off";};
			};

			//Weather Sync
			 if (overCast != (SYNCweather select 1)) then 
				{ 0 setOvercast (SYNCweather select 1) ; };
				if (rain != (SYNCweather select 2)) then 
				{ 0 setRain (SYNCweather select 2) ; };
				if (fog != (SYNCweather select 3)) then 
				{ 0 setFog (SYNCweather select 3) ; };
					if (DEBUG) then { player globalChat format["Client Weather: date %1 - overcast %2 - rain %3 - fog %4", SYNCweather select 0, SYNCweather select 1, SYNCweather select 2, SYNCweather select 3]; };
				sleep 1800;
				};
	};
};

if isWest then {
	[] spawn { 
		_aiTimer = time;
		while { true } do {
			//AI			
			call aiSpawn;
			if (time - _aiTimer > 30) then { _aiTimer = time; call aiMonitor; };
			//call groupAI;
			sleep 0.1;
		};
	};
};

while { isWest } do { 

	//Injured
	//call injuredLoop; 
	//call ppEffects;
	
	//Markers
	call gridPath;
	if (markersEnabled == 1) then {
		call playerMarkers; 
		call vehicleMarkers; 
		call markerTexts;
	}; 

	//Misc
	call clearHouses;
	call oneShotM136; 
	call nameStrings;	
	if (_HQstate != startLocation) then { 
		if (_HQstate == HQ) then { hint "HQ mobilised!"; } else { hint "HQ deployed!"; "USFLAG" setMarkerPosLocal startPos;    
			};
		_HQstate = startLocation; 
	};
	if (getMarkerPos "USFLAG" distance (fieldHospital modelToWorld [0,0,0]) > 50) then {
		"USFLAG" setMarkerPos (fieldHospital modelToWorld [0,0,0]);
	};
	if (remoteControlling && heliRC == 1) then { 
		hintSilent "You are remotely controlling this vehicle. Press the 'Backspace' key at any time to exit."; 
		if (!alive cameraOn || !alive driver cameraOn || !alive player) then { call exitRC; };
	};
	//make sure the player returns to his original squad group unless he's piloting the heli
	_playerGroupMembers = groupMembers(true,"array");
	if ((count units group player == 1 && count _playerGroupMembers > 0) && lifeState player != "UNCONSCIOUS" && heliRC == 1) then {
		_PlayerGroup = group (_playerGroupMembers select 0);
		if (isNil "heli") exitWith { }; //'heli' might not be a valid object until initWestVehicle has run
		if (driver heli in units _PlayerGroup) exitWith {};
		_oldPlayerGroup = group player;
		[player] joinSilent _PlayerGroup;
		deleteGroup _oldPlayerGroup;
	};
	
	//Respawn
	if (isDead(player) && isNull respawnCamera) then { [] spawn respawnSystem; };
	if (livesLeft == 0 && time > 30) then {
		if (nearestPlayers(CENTERPOS,AORADIUS,true,"count") == 0) then { endMission "LOSER"; };
	};
	
	//Support
	if !(a10Mode == 0) then {
		call supportTimer;
	};
	
	// check to see if a player logged in as admin
	isAdmin = serverCommandAvailable "#kick";

	sleep 0.1; 
}; 

while { isEast } do { 

	//Injured
	//call injuredLoop;
	
	//Markers
	call AImarkers;
	call markerTexts;

	//Respawn
	if (isDead(player) && !visibleMap) then { 
		// allow east player to spawn again
		alreadyspawned = 0;
	
		hintSilent "To start playing, open your map and click on the ai unit you wish to teleport to.
If there are no ai units visible on the map it means no blufor players are near hostile areas and so no ai have spawned. In this case either wait awhile or join
the blufor team.";
	};
	if (!alive player && player != eastPlayer) then { 
	
		// respawn delay for east players
		if (INS_dynamicRespawn == 1) then {
			// no dynamic respawn for east players
			_c = 120;
		} else {
			_c = INS_dynamicRespawn;
		};
		
		waitUntil {
			cutRsc["Rtags", "PLAIN"];
			_ctrlText = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64434; 	
			_ctrlText ctrlSetStructuredText parseText format[
				"<t color='%2' shadow='1' shadowColor='#000000'>Respawn in %1</t>"
			, abs ceil _c, "#FFFFFF"]; 								
			_c = _c - 0.1;
			sleep 0.1;
			(ceil _c) <= 0
		};
		 
	};
	if (player distance eastSpawnPos > 10 && isDead(player)) then { player setPosATL eastSpawnPos; };
	if (player distance startPos < hqProtectionRing && !isDead(HQ)) then { 
		_pos = getPosATL player;
		_dir = getDirTo(player, startPos);
		if (_dir < 0) then { _dir = 360 + _dir; };
		_vector = [sin(_dir),cos(_dir)];
		_xpos	= (_pos select 0) - (_vector select 0);  
		_ypos	= (_pos select 1) - (_vector select 1);
		_pos 	= [_xpos,_ypos,0];
		player setPosATL _pos; 
		hintSilent "You are not allowed near the enemy's main base.";
	};
	
	//UI
	call eastPlayerTags;

	sleep 0.1; 
}; 
	