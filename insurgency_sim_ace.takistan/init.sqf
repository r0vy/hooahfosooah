if !isDedicated then { startLoadingScreen ["Loading...","RscLoadScreenCustom"]; };
enableSaving [false, false]; 
waitUntil { isServer || !isNull player }; 
waitUntil { !isNil "BIS_MPF_InitDone" }; 
waitUntil { BIS_MPF_InitDone }; 

// Global Variable Init
curTime				= time;    //mission start time
serverLoadHint      = false;   //server load hint message

execVM "bon_artillery\bon_arti_init.sqf";
execVM "BTK\Cargo Drop\Start.sqf";
BON = execVM "bon_ieds\init.sqf";

    [[
      ["Task1","Main Mission: Gather Intel / Destroy Weapons Caches","<br/><br/>Main Mission: Gather Intel and Destroy Weapons Caches<br/><br/>Your squad must gather Intel from Insurgency forces in the red squares and locate and destroy the hidden weapons caches. Insurgency forces may have intelligence on them, search their bodies to find information. This is a ongoing task until all weapons caches are found.<br/><br/>Intel collected can sometimes give you side missions. Completing side missions will award each of your squad with points.  "]

    ]] execvm "shk_taskmaster.sqf";

if (local player) then { call compile preprocessFileLineNumbers "initclient.sqf"; }; 
if (isServer) then { call compile preprocessFileLineNumbers "initserver.sqf"; }; 


