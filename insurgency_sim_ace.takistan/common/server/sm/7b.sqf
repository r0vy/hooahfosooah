current_playergroupname = _this select 0;

FuelKilled = { 	
	_pos	= getPosATL(_this);

	sleep random 3;
	"Bo_GBU12_LGB" createVehicle _pos;

	sleep random 3;
	"Bo_GBU12_LGB" createVehicle _pos;

	sleep 4;

	["Task9b","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;

	sleep 4;

	[current_playergroupname] execVM ("common\server\sm\7c.sqf");
}; 




["Task9b","Side Mission: Running on Empty","<br/><br/>Running on Empty<br/><br/>The petrol supply at Nagara is now restricted. Radio chatter suggests Insurgency forces are bring a fuel tanker from Nur down to Nagara to keep the fuel flowing.<br/><br/>Ambush the fuel truck and ensure it doesn't get to Nagara fuel station.",current_playergroupname] call SHK_Taskmaster_add;

sleep 60;

_vehicle  = createVehicle ["UralRefuel_TK_EP1",[2026.00, 11722.00],[],0,"NONE"];
_vehicle setdir 90;
_vehicle addEventHandler["Killed", { (_this select 0) spawn FuelKilled; }];

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AR_EP1", [2016.00, 11736.00], [], 0, "NONE"];
_ai assignAsDriver _vehicle;
_ai moveInDriver _vehicle;
_ai doMove [3090.00, 9829.00];
