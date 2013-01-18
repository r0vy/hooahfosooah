current_playergroupname = playergroupname;


["Task15","Side Mission: Liquid Gold","<br/><br/>Liquid Gold<br/><br/>US Forces have identified the Nagara-1-Oilfield oil pumps as a new target. To reduce the fuel supplies to the Insurgency forces the pumps must be destroyed.<br/><br/>Destroy the oil pumps in the North West of the oilfield to disrupt the oil supply.",playergroupname] call SHK_Taskmaster_add;


_b1_down = false;
_b2_down = false;
_b3_down = false;


_objs = nearestObjects [[3289.84,11254.8,0], ["Land_Ind_Oil_Pump_EP1"], 120];
sleep 3;
_b1 = _objs select 0;
_b2 = _objs select 1;
_b3 = _objs select 2;

while {(!_b1_down) && (!_b2_down) && (!_b3_down)} do {
	if (!(alive  _b1) && !_b1_down) then {_b1_down = true};
	if (!(alive  _b2) && !_b2_down) then {_b2_down = true};
	if (!(alive  _b3) && !_b3_down) then {_b3_down = true};
	sleep 5;
};

Sleep 5;
["Task15","succeeded"] call SHK_Taskmaster_upd;
{_x addscore +5;} foreach units current_playergroupname;