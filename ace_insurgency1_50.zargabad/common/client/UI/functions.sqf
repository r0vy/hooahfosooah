fillOptionsDialog = {
	disableSerialization;
	private ["_display","_ctrl","_glindex","_index"];
	_disp = (uiNameSpace getVariable "INSURGENCY_OPTIONS");
	_ctrl = _disp displayCtrl 1001;
	_glindex = -1;
	{
		_index = _ctrl lbAdd _x;
		if (grasslayer == _index) then {_glindex = _index};
	} forEach ["Little Gras", "Default"];
};

respawnTags = {
	private ["_txt","_ctrlText","_bool","_color"];
	
	if camMap exitWith {};
	if (livesLeft == 0) exitWith {
		cutRsc["Rtags", "PLAIN"]; 	
		_color = "#347C17";
		if (!(str camPlayer in squadUnitStrings(squadString(player)))) then { _color = "#C11B17"; };
		_txt = format["%1: %2 (Spectating)", unitID(camPlayer), getName(camPlayer)];
		_ctrlText = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64434; 	
		_ctrlText ctrlSetStructuredText parseText format[
			"<t color='%2' shadow='1' shadowColor='#000000'>%1</t>"
		, _txt, _color];
	};
	_bool = nearestEastMen(getPosATL camPlayer,respawnRange,true,"count") == 0;		
	
	if (camPlayer != fieldHospital) then {
		_txt   = format["%1: %2 (Press Enter to Spawn)", unitID(camPlayer), getName(camPlayer)];
		_color = "#347C17";
		if !_bool then { 
			_txt   = format["%1: %2 (Cannot spawn while enemies near)", unitID(camPlayer), getName(camPlayer)]; 
			_color = "#C11B17";
		};
	} else {
		_txt   = "Main Base (Press Enter to Spawn)";
		_color = "#2554C7";
	};
	if (lifeState camPlayer == "UNCONSCIOUS") then {
		_txt   = format["%1: %2 (Cannot spawn on a critically wounded soldier)", unitID(camPlayer), getName(camPlayer)]; 
		_color = "#C11B17";
	};
	if (vehicle camPlayer call vclisFull) then {
		_txt   = format["%1: %2 (Cannot spawn while vehicle is full)", unitID(camPlayer), getName(camPlayer)];
		_color = "#C11B17";
	};

	cutRsc["Rtags", "PLAIN"]; 	
	_ctrlText = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64434; 	
	_ctrlText ctrlSetStructuredText parseText format[
		"<t color='%2' shadow='1' shadowColor='#000000'>%1</t><br/><br/><t color='#808080' shadow='1' shadowColor='#000000'>Left Arrow: Previous unit<br/>Right Arrow: Next unit<br/></t>"
	, _txt, _color];
}; 

playerTags = { 
	private ["_color","_cT","_ctrlOffset"];
    
    if (!isNull respawnCamera || isNull cursorTarget || !tagsOn || cameraView == "GUNNER") exitWith {}; 		
	_cT	= cursorTarget; 								
	if (!(str _cT in westPlayerStrings) || !(_cT isKindOf "man") || (!alive _cT && lifeState _cT != "DEAD-RESPAWN") ) exitWith {}; 	
	cutRsc["Rtags", "PLAIN"]; 	
	_ctrlOffset = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64435; 	
	_color = "#2554C7"; 
	if (str _cT in squadUnitStrings(squadString(player))) then { _color = "#347C17"; };
	if (lifeState _cT == "UNCONSCIOUS") then { _color = "#C11B17"; }; 
	if (lifeState _cT == "DEAD-RESPAWN") then { _color = "#736F6E"; }; 
	_ctrlOffset ctrlSetStructuredText parseText format[
		"<t color='%3' shadow='1' shadowColor='#000000'>%1<br/>%2</t>"
	, unitID(_cT), getName(_cT), _color]; 
}; 

eastPlayerTags = { 
    private ["_color","_cT","_ctrlOffset"];
    
    if (!isNull respawnCamera || isNull cursorTarget || !tagsOn || cameraView == "GUNNER") exitWith {}; 		
	_cT	= cursorTarget; 								
	if (!(str leader _cT in eastPlayerStrings) || !(_cT isKindOf "man") || !alive _cT ) exitWith {}; 	
	cutRsc["Rtags", "PLAIN"]; 	
	_ctrlOffset = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64435; 	
	_color = "#2554C7"; 
	if (_cT in units group player) then { _color = "#347C17"; };
	_ctrlOffset ctrlSetStructuredText parseText format[
		"<t color='%2' shadow='1' shadowColor='#000000'>%1</t>"
	, name _cT, _color]; 
}; 

vehicleTags = { 
	private ["_bool","_color","_crew","_ctrlOffset","_cT","_dist","_nVcls","_vcl","_ctrlCenter"];
    
    if (!isNull respawnCamera || isNull cursorTarget || !tagsOn || cameraView == "GUNNER") exitWith {}; 
	_cT		= cursorTarget; 		
	_dist = player distance _cT; 				
	if (_cT in westVehicles) then { 
		_crew = crew _cT;						
		if (count _crew == 0 || _dist < 4) exitWith {}; 
		_bool  = false; 
		_color = "#2554C7";
		for "_i" from 0 to (count _crew - 1) do { if (str (_crew select _i) in squadUnitStrings(squadString(player))) exitWith { _bool = true; }; }; 
		if (_bool) then { _color = "#347C17"; }; 
		cutRsc["Rtags", "PLAIN"]; 
		_ctrlOffset = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64435; 	
		_ctrlOffset ctrlSetStructuredText parseText format[
			"<t color='%2' shadow='1' shadowColor='#000000'>%1</t>"
		, crew _cT call crewToStr, _color]; 
	};
}; 

atEntryPoint = { 
	private ["_facing","_offset","_pos"];
    
    _offset = [0,0.5,-1.5];
	_pos    = _this modelToWorld _offset;
	_facing = false;
	if (player distance _pos < 3 && canSee(player,_pos,45)) then { _facing = true; };
	if (!alive _this || _this call vclisFull || !_facing) exitWith { false }; 
	true
}; 

superman = { 
	if (!DEBUG) exitWith {}; 
	player allowDamage false;
	case 57: { 	
		_vcl = vehicle player; 	
		if (_shift) then { 
			_vcl setVelocity[(velocity _vcl select 0),(velocity _vcl select 1),(velocity _vcl select 2)+1]; 
			if (_vcl == player) then { _handled=true; }; 	
		}; 
	}; 	
	case 17: { 
		_vcl = vehicle player; 
		if (_shift) then { 
			_vcl setVelocity[(velocity _vcl select 0)+(sin (getDir _vcl)),(velocity _vcl select 1)+(cos (getDir _vcl)),velocity _vcl select 2]; 	
			if (_vcl == player) then { _handled=true; }; 	
		}; 
	}; 	
	case 31: { 
		_vcl = vehicle player; 
		if (_shift) then { 
			_vcl setVelocity[(velocity _vcl select 0)-(sin (getDir _vcl)),(velocity _vcl select 1)-(cos (getDir _vcl)),velocity _vcl select 2]; 		
			if (_vcl == player) then { _handled=true; }; 	
		}; 
	}; 	
	case 30: { 
		_vcl = vehicle player; 
		if (_shift) then { 
			_vcl setVelocity[(velocity _vcl select 0)-(cos (getDir _vcl)),(velocity _vcl select 1)+(sin (getDir _vcl)),velocity _vcl select 2]; 	
			if (_vcl == player) then { _handled=true; }; 	
		}; 
	}; 	
	case 32: { 
		_vcl = vehicle player; 
		if (_shift) then { 
			_vcl setVelocity[(velocity _vcl select 0)+(cos (getDir _vcl)),(velocity _vcl select 1)-(sin (getDir _vcl)),velocity _vcl select 2]; 		
			if (_vcl == player) then { _handled=true; }; 	
		}; 
	}; 	
}; 