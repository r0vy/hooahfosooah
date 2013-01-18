onMouseMove = { 
	private ["_xS","_yS","_xC","_yC","_zC"];

    if (isNull respawnCamera || camPlayer == fieldHospital || dialog) exitWith {};	
	_xS = (_this select 1)/45;	
	_yS = (_this select 2)/25;
	if (abs _xS < abs _yS) then { _xS = 0; };	
	if (abs _yS < abs _xS) then { _yS = 0; };	
	
	_xC = (camAttachCoords select 0) - _xS;
	if (_xC >  3) then { _xC =  3; };
	if (_xC < -3) then { _xC = -3; };
	_yC = camAttachCoords select 1;
	if (_xC <= 0) then { _yC = _yC + _xS; };
	if (_xC >  0) then { _yC = _yC - _xS; };
	if (_yC >  0) then { _yC =  0; };
	if (_yC < -3 && camPlayer isKindOf "man") then { _yC = -3; };
	if (_yC < -3 && !(camPlayer isKindOf "man")) then { _yC = -7; };
	_zC = (camAttachCoords select 2) + _yS;
	if (_zC >  7) then { _zC =  7; };
	if (_zC < -2) then { _zC = -2; };
	
	camAttachCoords = [_xC,_yC,_zC];
	respawnCamera attachTo [vehicle camPlayer, camAttachCoords];
	respawnCamera camSetTarget vehicle camPlayer;	
	respawnCamera camCommit 0;	
}; 