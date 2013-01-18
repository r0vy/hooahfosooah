[] spawn {
	private ["_pos","_doexit"];
	_tcounter = 0;
	_d_soundobjects = [
		["Land_Ind_Oil_Tower_EP1","Engine_factory2_EP1",[-2,-1,-5]],
		["Land_Ind_Oil_Tower_EP1","Factory01Sfx",[1.5,-2.7,-12.5]],
		["Land_A_Minaret_EP1","Muslim_prayer1",[0,-2,10]],
		["Land_House_C_1_v2_EP1","RadioMusic1_EP1",[0,-2,-2]],
		["Land_Ind_FuelStation_Shed_EP1","RadioMusic2_EP1",[0,-2,-2]],
		["Land_A_Mosque_big_minaret_2_EP1","Muslim_prayer2",[0,-2,12]],
		["Land_A_Minaret_Porto_EP1","Muslim_prayer2",[0,-2,12]]
	];
	_d_tmparray = [];
	for "_i" from 0 to count _d_soundobjects - 1 do {
		_d_tmparray set [count _d_tmparray, (_d_soundobjects select _i) select 0];
	};
	_d_array = nearestObjects [map_center, _d_tmparray, 9200]; //It's a stretch wrt performance, I know.
	for "_i" from 0 to count _d_array - 1 do {
		for "_j" from 0 to count _d_soundobjects - 1 do {
			_doexit = false;
			if (typeOf (_d_array select _i) == (_d_soundobjects select _j) select 0) then {
				_pos = [];
				if (count (_d_soundobjects select _j) > 2) then {
					_pos = (_d_array select _i) modelToWorld ((_d_soundobjects select _j) select 2);
				} else {
					_pos = getPos (_d_array select _i);
				};
				//_obj = "Sign_sphere100cm_EP1" createVehicleLocal _pos; _obj setPos _pos;
				_trigger = createTrigger ["EmptyDetector", _pos];
				_trigger setTriggerStatements ["true", "", ""];
				_trigger setSoundEffect ["NoSound", "", "", (_d_soundobjects select _j) select 1];
				_trigger setTriggerText ((_d_soundobjects select _j) select 1);
				_doexit = true;
			};
			if (_doexit) exitWith {
				_tcounter = _tcounter + 1;
			};
			sleep 0.03;
		};
	};
	_soundobjects = nil;
	_d_tmparray = nil;
	_d_array = nil;
};