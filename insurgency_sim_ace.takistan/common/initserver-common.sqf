#include "defines.sqf"
#include "functions.sqf"
#include "server\defines.sqf"
#include "server\cleanup\functions.sqf"
#include "server\markers\functions.sqf"
#include "server\AI\functions.sqf"
#include "server\AI\initUPS.sqf"
#include "server\caches\functions.sqf"
#include "server\vehicles\functions.sqf"


sm_array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];


number_side_missions = count sm_array;

side_missions_random = sm_array call XfRandomArray;

current_counter = 0;
current_mission_counter = 0;

onPlayerConnected '
	_caches = cacheList; 
	for "_i" from 0 to (count _caches - 1) do { 
		_cache = _caches select _i; 
		{ 
			_x setMarkerPos (getMarkerPos _x); 
			_x setMarkerText (markerText _x); 
		} forEach cacheMarkers(_cache); 
	}; 
'; 

if (fixedTimeDate == 1) then {
setDate [2012, Month, Day, Hour, Minute + (time/60)];
};

setViewDistance VIEWDISTANCE;

_pos = randPos;
while { count (_pos isFlatEmpty [30,0,0.2,20,0,false,objNull]) == 0 || getTerrainHeightASL _pos <= 2 } do {
	_pos = randPos;
}; 
HQ setDir (((CENTERPOS select 0) - (_pos select 0)) atan2 ((CENTERPOS select 1) - (_pos select 1))+90);
HQ setPosATL _pos;
waitUntil { !isDead(HQ) };

if (INS_Roofguns == 1) then {
[] spawn { call spawnAIGuns; };};
[] spawn { call setupCaches; };
[] spawn { call setupExtraIntel; };
[] spawn { call spawnAIVehicles; };

#include "server\mainLoop.sqf"



