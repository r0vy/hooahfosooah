current_playergroupname = _this select 0;

PlaneKilled = { 	
	_pos	= getPosATL(_this);

	sleep random 3;
	"Bo_GBU12_LGB" createVehicle _pos;

	sleep 4;
	["Task9c","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
}; 




["Task9c","Side Mission: Falling","<br/><br/>Falling<br/><br/>With no fuel in Nagara and limited supplies in the surrounding area, Insurgency forces are struggling to keep moving. US Forces radar unit have picked up a plane inbound to Rasman airbase. Local intelligence suggest that is one of the Insurgency forces leaders on their way to Loy Manara but it's likely the plane is low on fuel and was looking to fuel at the airbase north west of Rasman.<br/><br/>Take out the plane to eliminate the Insugency leader.",current_playergroupname] call SHK_Taskmaster_add;
	

	_pos  = [5433, 11188, 0];
	_dir  = ((_pos select 0) - (CENTERPOS select 0)) atan2 ((_pos select 1) - (CENTERPOS select 1)); 
	_pos2 = [(_pos select 0) + (sin _dir)*3000,(_pos select 1) + (cos _dir)*3000,500];
	_arr = [_pos2, 90, "An2_TK_EP1", EAST] call bis_fnc_spawnvehicle;

	_vcl = _arr select 0;
	_ai = (_arr select 1) select 0;
	_vcl engineOn true;	
	_vcl setPosATL _pos2;
	_dir  = ((_pos select 0) - (_pos2 select 0)) atan2 ((_pos select 1) - (_pos2 select 1)); 
	_vcl setDir _dir;
	_vcl setVelocity [(sin _dir)*100,(cos _dir)*100,20];
	_vcl landAt 0;
	_vcl setFuel 0.25;
	_vcl addMPEventHandler["MPKilled", { deleteVehicle _ai; (_this select 0) spawn PlaneKilled; }];




