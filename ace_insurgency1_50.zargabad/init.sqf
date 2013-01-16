if !isDedicated then { startLoadingScreen ["Loading...","RscLoadScreenCustom"]; };
enableSaving [false, false]; 
waitUntil { isServer || !isNull player }; 
waitUntil { !isNil "BIS_MPF_InitDone" }; 
waitUntil { BIS_MPF_InitDone }; 

// Global Variable Init
curTime				= time;    //mission start time
serverLoadHint      = false;   //server load hint message

if (isServer) then {

// ACE Modules
	ace_sys_wounds_enabled = true;							publicVariable "ace_sys_wounds_enabled";
	ace_sys_wounds_noai = false;							publicVariable "ace_sys_wounds_noai";
	ace_sys_wounds_leftdam = 0.5;							publicVariable "ace_sys_wounds_leftdam";
	ace_sys_wounds_all_medics = false;						publicVariable "ace_sys_wounds_all_medics";
	ace_sys_wounds_no_rpunish = true;						publicVariable "ace_sys_wounds_no_rpunish";
	ace_sys_wounds_auto_assist_any = true;					publicVariable "ace_sys_wounds_auto_assist_any";
	ace_sys_wounds_ai_movement_bloodloss = true;			publicVariable "ace_sys_wounds_ai_movement_bloodloss";
	ace_sys_wounds_player_movement_bloodloss = true;		publicVariable "ace_sys_wounds_player_movement_bloodloss";
	ace_sys_wounds_auto_assist = true;						publicVariable "ace_sys_wounds_auto_assist";

	ace_sys_aitalk_enabled = true;							publicVariable "ace_sys_aitalk_enabled";
	ace_sys_aitalk_radio_enabled = true;					publicVariable "ace_sys_aitalk_radio_enabled";
	ace_sys_aitalk_talkforplayer = true;					publicVariable "ace_sys_aitalk_talkforplayer";
	if !(player hasWeapon "ACE_Earplugs") then {player addWeapon "ACE_Earplugs";};
};

//Ammobox init
stuffbox allowDamage false;
stuffbox lock false;
stuffbox setVehicleLock "UNLOCKED";
_null = [stuffbox] execVM "common\client\gear\AmmoCrate.sqf";
_null = [fieldHospital] execVM "common\client\gear\HospitalCargo.sqf";

if (local player) then { call compile preprocessFileLineNumbers "initclient.sqf"; }; 
if (isServer) then { call compile preprocessFileLineNumbers "initserver.sqf"; }; 
