_killed = _this select 0;
_killer = _this select 1;

if (isPlayer _killer) then {
	player groupChat format ["A civilian car was destroyed by %1!", name _killer];
	_killer addscore -4;
};
