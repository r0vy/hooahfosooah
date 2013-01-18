// by Bon_Inf*


_ied = _this select 0;
_current_eod = _this select 1;

_this select 0 removeAction (_this select 2);

_current_eod groupChat "Charge set. Detonation in T Minus 75 Seconds";
sleep 74;

_ied setvariable ["bon_ied_blowit",true,true];
_ied setvariable ["eod",_current_eod,true];
