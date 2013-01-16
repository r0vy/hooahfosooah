#include "defines.sqf"
#include "functions.sqf"
#include "server\defines.sqf"
#include "server\cleanup\functions.sqf"
#include "server\markers\functions.sqf"
#include "server\AI\functions.sqf"
#include "server\AI\initUPS.sqf"
#include "server\caches\functions.sqf"
#include "server\vehicles\functions.sqf"

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

if (ambientCivilians == 1) then {
	nul0 = [] execVM "common\server\IEDdetect\IEDdetect_init.sqf";
	/* 200 - is the ambient radius from the player
	1 - is the minimum amount of civilians near the player
	70 - is the % of presence of a triggerman among them
	10 - is the scan interval time
	"house" - is the object classtype of what could potentially host triggermen bombs (there is always a 50% chance it will be a suicide bomber)
	0 - is the beeping (0=no beep, 1=beep, 2=random)
	100 - is the area to scan for suitable objects (e.g. "car") and attach the bomb to one of those, randomly. This is also the scan area for the triggerman to trigger the bomb
	5 - is the area to scan for hostiles that can instill fear in the triggerman (read above for how fear works).
	20 - is the area to scan for possible victims that will make the triggerman touch the bomb off.
	65 - is the % for the triggerman to be a suicide bomber instead
	WEST - is the side to consider enemy of the triggerman */
	nul0 = [200,1,70,10,"house",0,100,5,20,65,WEST] execVM "common\server\IEDdetect\IEDdetect_ambientBombers.sqf";
};

setDate [2010, Month, Day, Hour, Minute + (time/60)]; 
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
[] spawn { call spawnAIVehicles; };
#include "server\mainLoop.sqf"