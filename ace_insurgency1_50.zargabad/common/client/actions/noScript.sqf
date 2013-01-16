private "_code";

_code = _this select 3; 
if ((typeName _code) == "ARRAY") then { 
	{ call compile _x; } forEach _code; 
} else { 
	call compile _code;
}; 

