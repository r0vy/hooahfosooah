private ["_PGroup","_WCTime","_BCTime"];

_PGroup     		= group pilotController;
_WCTime     		= time;
_BCTime    			= time;

while { true } do { 
	call westVehicleChecker;
	if (heliRC == 1) then {
		call pilotAI;	
	};
	call quickCleanup;	
	call longCleanup;	
	if (livesLeft == 0 && time > 30) then {
		if (nearestPlayers(CENTERPOS,AORADIUS,true,"count") == 0) then { endMission "LOSER"; };
	};
	
	SYNCweather =[date,overCast,0,fog]; 
	publicVariable "SYNCweather";
	if (DEBUG) then { server globalChat format["Weather: date %1 - overcast %2 - rain %3 - fog %4", SYNCweather select 0, SYNCweather select 1, SYNCweather select 2, SYNCweather select 3]; };
	sleep 60;
}; 