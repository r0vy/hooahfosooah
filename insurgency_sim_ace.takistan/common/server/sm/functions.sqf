#define westPlayerStrings	["Hitman111","Hitman112","Hitman113","Hitman114","Hitman115",\
							"Hitman121","Hitman122","Hitman123","Hitman124","Hitman125",\
							"Hitman131","Hitman132","Hitman133","Hitman134","Hitman135",\
							"Hitman141","Hitman142","Hitman143","Hitman144","Hitman145",\
							"Hitman151","Hitman152","Hitman153","Hitman154","Hitman155",\
							"Hitman161","Hitman162","Hitman163","Hitman164","Hitman165"]

nearestPlayers = {
	private ["_result","_pos","_range","_type","_alive"];
	_pos   = _this select 0;
	_range = _this select 1;
	_alive = _this select 2;
	_type  = _this select 3;
	if (_type == "count") then { _result = 0; } else { _result = []; };	
	{
		if (!isNil _x) then {
			_plr = call compile _x;
			if (!isNull _plr) then {
				if (_plr distance _pos <= _range && (alive _plr || !_alive)) then { 
					if (_type == "count") then { _result = _result + 1; } else { _result = _result + [_plr]; };
				};
			};
		};
	} forEach westPlayerStrings;
	_result
};
	
#define nearestPlayers(W,X,Y,Z)	([W,X,Y,Z] call nearestPlayers)