current_playergroupname = _this select 0;

PowerKilled = { 

	sleep 2;
	
	["Task16b","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;

	sleep 4;

	[current_playergroupname] execVM ("common\server\sm\14c.sqf");
}; 


["Task16b","Side Mission: Short Fuse","<br/><br/>Short Fuse<br/><br/>Good job with taking out the power substation south of Loy Manara, power to the surrounding area has gone out. British Forces will be informed and will be on their way to the Loy Manara air base soon.<br/><br/>Over the Insurgency radio, engineers from Sultansafe have been ordered to the substation to reconnect the power supplies and get the power back on.<br/><br/>Ambush the engineers supply/salvage truck and convoy enroute to the substation. Destroy the truck to ensure the power grid remains offline.",current_playergroupname] call SHK_Taskmaster_add;


_vcl2  = createVehicle ["Offroad_DSHKM_TK_GUE_EP1",[6535.000, 2084.0000],[],0,"NONE"];
_vcl2 setdir 120;
_vcl2 setPos [6535.000, 2084.0000];

_vcl3  = createVehicle ["Pickup_PK_TK_GUE_EP1",[6560.000, 2084.0000],[],0,"NONE"];
_vcl3 setDir 120;
_vcl3 setPos [6560.000, 2084.0000];

_vcl4  = createVehicle ["UralSalvage_TK_EP1",[6580.000, 2084.0000],[],0,"NONE"];
_vcl4 setDir 120;
_vcl4 setPos [6580.000, 2084.0000];
_vcl4 addEventHandler["Killed", { (_this select 0) spawn PowerKilled; }];


	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [7272.0977, 200.74545], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [7102.0977, 235.74545], [], 0, "NONE"];
	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [7198.0977, 273.74545], [], 0, "NONE"];


	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [6537.000, 2084.0000], [], 0, "NONE"];
	_ai assignAsGunner _vcl2;
	_ai moveInGunner _vcl2;

	_driver  = _group createUnit ["TK_INS_Soldier_AR_EP1", [6537.000, 2086.000], [], 0, "NONE"];
	_driver assignAsDriver _vcl2;
	_driver moveInDriver _vcl2;
	_driver doMove [7294.00, 314.0000,0.0];

	_ai = _group createUnit ["TK_INS_Soldier_4_EP1", [6565.000, 2084.000], [], 0, "NONE"];
	_ai assignAsGunner _vcl3;
	_ai moveInGunner _vcl3;

	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [6567.000, 2084.0000], [], 0, "NONE"];
	_ai assignAsDriver _vcl3;
	_ai moveInDriver _vcl3;
	_ai doFollow _driver;

	_ai  = _group createUnit ["TK_INS_Soldier_AT_EP1", [6587.000, 2087.0000], [], 0, "NONE"];
	_ai moveInCargo _vcl4;

	_ai  = _group createUnit ["TK_INS_Soldier_MG_EP1", [6587.000, 2084.0000], [], 0, "NONE"];
	_ai assignAsDriver _vcl4;
	_ai moveInDriver _vcl4;
	_ai doFollow _driver;



