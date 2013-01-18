current_playergroupname = playergroupname;

GasKilled = { 	
	_pos	= getPosATL(_this);

	sleep random 3;
	"Bo_GBU12_LGB" createVehicle _pos;

	sleep random 3;
	"ARTY_R_227mm_HE" createVehicle _pos;

	sleep random 3;
	"Bo_GBU12_LGB" createVehicle [3090.6931,  9850.4004];

	sleep 4;

	["Task9","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;

	sleep 4;

	[current_playergroupname] execVM ("common\server\sm\7b.sqf");
}; 




["Task9","Side Mission: Gas Gas Gas","<br/><br/>Gas Gas Gas<br/><br/>Insurgency forces are using the gas pumps in Nagara for their offroad vehicles. The petrol is stored in the large tanks near the gas station.<br/><br/>Locate the storage tanks and destroy them.",current_playergroupname] call SHK_Taskmaster_add;

	_gas = createVehicle ["Land_Fuel_tank_big", [3090.3025, 9829.9521], [], 0, "NONE"];
	_gas setDir -104.55649;
	_gas addEventHandler["Killed", { (_this select 0) spawn GasKilled; }];

	_gas = createVehicle ["Land_Fuel_tank_big", [3098.7896, 9831.0576], [], 0, "NONE"];
	_gas setDir -104.55649;
	_gas addEventHandler["Killed", { (_this select 0) spawn GasKilled; }];
