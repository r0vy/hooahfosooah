#include "functions.sqf"
current_playergroupname = playergroupname;

HeartsKilled = { 

	sleep 4;
	["Task21","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};

["Task21","Side Mission: Ace of Hearts","<br/><br/>Ace of Hearts<br/><br/>US Forces believe one of the higher ranking Insurgency leaders is being flown into Loy Manara airport for a rally planned for tomorrow in Chak Chak. The US have code named this target Ace of Hearts. Local Takistan intelligence west of Jaza have spotted a small aircraft landing and that an armoured vehicle was just seen leaving the airfield heading west.<br/><br/>The Ace of Hearts is believed to be in the armoured vehicle. Locate armoured vehicle and destroy it before it reaches Chak Chak.",playergroupname] call SHK_Taskmaster_add;



_vehicle  = createVehicle ["BRDM2_TK_EP1",[8180.00,2236.00,0],[],0,"NONE"];
_vehicle addEventHandler["Killed", { (_this select 0) spawn HeartsKilled; }];


_vcl2  = createVehicle ["BTR40_MG_TK_INS_EP1",[8178.00,2234.00,0],[],0,"NONE"];

waitUntil { nearestPlayers(getPosATL (_vcl2), 1000, true, "count") > 0 };


	_group  = ["static","Grp","","east"] call getGroup;
	


	

	_ai  = _group createUnit ["TK_INS_Soldier_AR_EP1", [8180.00,2240.00], [], 0, "NONE"];
	_ai assignAsGunner _vehicle;
	_ai moveInGunner _vehicle;

	_ai  = _group createUnit ["TK_INS_Soldier_AR_EP1", [8182.00,2241.00], [], 0, "NONE"];
	_ai assignAsGunner _vcl2;
	_ai moveInGunner _vcl2;

	_driver  = _group createUnit ["TK_INS_Soldier_MG_EP1", [8180.00,2238.00], [], 0, "NONE"];
	_driver assignAsDriver _vehicle;
	_driver moveInDriver _vehicle;
	sleep 2;
	_driver doMove [4359.00,501.00,0];
	_driver addEventHandler["Killed", { (_this select 0) spawn HeartsKilled; }];

	_driver2  = _group createUnit ["TK_INS_Soldier_AR_EP1", [8180.00,2239.00], [], 0, "NONE"];
	_driver2 assignAsDriver _vcl2;
	_driver2 moveInDriver _vcl2;
	_driver2 doFollow _driver;

		

	
