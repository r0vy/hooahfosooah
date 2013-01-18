_killed = _this select 0;
_killer = _this select 1;

if (isPlayer _killer) then {
	player groupChat format ["Suicide car bomb vehicle was destroyed by %1. Well done!", name _killer];
	_killer addscore +11;
};
