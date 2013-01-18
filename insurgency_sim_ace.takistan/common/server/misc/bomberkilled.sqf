_killed = _this select 0;
_killer = _this select 1;

if (isPlayer _killer) then {
	player groupChat format ["Suicide bomber was killed by %1. Well done!", name _killer];
	_killed addMagazine "PipeBomb";
	_killer addscore +11;
};
