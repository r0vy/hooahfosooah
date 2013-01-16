_object = _this select 0;
_chance = random 100;
if (_chance < 65) then {
	_trg=createTrigger["EmptyDetector", position _object];
	_trg setTriggerArea[8,8,0,false];
	_trg setTriggerActivation["WEST","PRESENT",false];
	_trg setTriggerStatements["this", "_bomb = nearestObject [getPos (thislist select 0), 'Car']; boom = 'R_57mm_HE' createVehicle position _bomb", ""];
};