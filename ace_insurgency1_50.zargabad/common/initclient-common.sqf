// \initclient-common.sqf

#include "defines.sqf"
#include "functions.sqf"
#include "client\defines.sqf"
#include "client\variables.sqf"
#include "client\briefing.sqf"
#include "client\AI\functions.sqf"
#include "client\actions\functions.sqf"
#include "client\markers\functions.sqf"
#include "client\markers\createMarkers.sqf"
#include "client\misc\functions.sqf"
#include "client\misc\triggers.sqf"
#include "client\respawn\functions.sqf"
#include "client\support\functions.sqf"
#include "client\UI\functions.sqf"
#include "client\UI\onKeyPress.sqf"
#include "client\UI\onMouseMove.sqf"
player enableIRLasers true; 
player enableGunLights true; 
player setVariable ["BIS_noCoreConversations", true];

// Grass
grasslayer = 1;
setTerrainGrid 12.5;

// FSM for service point (vehicle repairs etc.)
execFSM "common\fsm\ServicePoint.fsm";

// Respawn system
INS_lastRespawnTime = time;

if isWest then { 
	//player addRating 1000000;
	player addEventHandler ["handleDamage", { _this call handleDamage; }]; 
	player addEventHandler ["killed",{ _this call onPlayerKilled; }]; 
	player addEventHandler ["respawn",{ titleCut ["", "BLACK IN", 10]; }]; 
	player addEventHandler ["fired",{ call firedEH; }]; 
	call addActions;
}; 
if isEast then {
	player setVariable ["INS_playerString",str player, true];
	player addEventHandler ["respawn",{removeAllWeapons player;}]; 
	};
if (isServer) then { [] spawn { call compile preprocessFileLineNumbers "initserver.sqf"; }; }; 
endLoadingScreen;

waitUntil { !(isNull (findDisplay 46)) }; 
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call onKeyPress"];
(findDisplay 46) displayAddEventHandler ["MouseMoving", "_this call onMouseMove"]; 
waitUntil { !isDead(HQ) || time > 30 };

// FSM for helicopter lift system
if (INS_HeliLiftSys == 1) then {
HelisCanLift = ["CH_47F_EP1","UH1Y","MH6J_EP1","BAF_Merlin_HC3_D","AW159_Lynx_BAF","MV22","UH60M_EP1"];
[] execFSM "common\fsm\HeliLift.fsm";
};

#include "client\mainLoop.sqf"