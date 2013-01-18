//by Bon_Inf*

if(not isServer) exitWith {};


private ["_iedpos","_offset","_ied"];


_roads = Server nearRoads 20000;
_iedpositions = [];
_fakeiedpositions = [];
_fakeiedpositions2 = [];




for "_i" from 1 to bon_number_ieds do {

	for "_searchcount" from 1 to 10000 do {

		_j = (count _roads - 1) min (round random (count _roads));
		_iedpos = _roads select _j;

		if(
			{_iedpos distance _x < 500} count _iedpositions == 0 &&
			_iedpos distance (getMarkerPos format["respawn_%1",tfor_friendly_side]) > 500
		) exitWith{};

		_iedpos = nil;

	};

	if(not isNil "_iedpos") then {
		_roads = _roads - [_iedpos];
		_iedpositions = _iedpositions + [_iedpos];

		_j = (count bon_ied_container - 1) min (round random (count bon_ied_container));
		_ied = (bon_ied_container select _j) createVehicle position _iedpos;
		
		if(random 2 > 1) then {_offset = [-4.5 - random 6,0,0]} else {_offset = [4.5 + random 6,0,0]};
		_ied setPosATL (_iedpos modelToWorld _offset);
		_ied setPosATL [(getPosATL _ied select 0), (getPosATL _ied select 1), 0.01];

		_ied setVehicleInit format["
			det1 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 7 && _this == Hitman113'];
		",BON_IED_PATH]; 
		_ied setVehicleInit format["
			det2 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 7 && _this == Hitman123'];
		",BON_IED_PATH]; 
		_ied setVehicleInit format["
			det3 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 7 && _this == Hitman133'];
		",BON_IED_PATH]; 
		_ied setVehicleInit format["
			det4 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 7 && _this == Hitman143'];
		",BON_IED_PATH]; 
		_ied setVehicleInit format["
			det5 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 7 && _this == Hitman153'];
		",BON_IED_PATH]; 
		processInitCommands;
		_ied execFSM (BON_IED_PATH+"ied_sensor.fsm");

		_iedpos = nil;
		_ied = nil;
	};
};

//{
//	(createMarker [str round random 999999,position _x]) setMarkerType "Warning";
//} foreach _iedpositions;


for "_i" from 1 to bon_number_fake_ieds do {

	for "_searchcount" from 1 to 10000 do {

		_j = (count _roads - 1) min (round random (count _roads));
		_iedpos = _roads select _j;

		if(
			{_iedpos distance _x < 500} count _fakeiedpositions == 0 &&
			_iedpos distance (getMarkerPos format["respawn_%1",tfor_friendly_side]) > 500
		) exitWith{};

		_iedpos = nil;

	};

	if(not isNil "_iedpos") then {
		_roads = _roads - [_iedpos];
		_fakeiedpositions = _fakeiedpositions + [_iedpos];

		_j = (count bon_fake_ied_container - 1) min (round random (count bon_fake_ied_container));
		_ied = (bon_fake_ied_container select _j) createVehicle position _iedpos;
		
		if(random 2 > 1) then {_offset = [-4.5 - random 6,0,0]} else {_offset = [4.5 + random 6,0,0]};
		_ied setPosATL (_iedpos modelToWorld _offset);
		_ied setPosATL [(getPosATL _ied select 0), (getPosATL _ied select 1), 0.01];

		_iedpos = nil;
		_ied = nil;
	};
};


//{
//	(createMarker [str round random 999999,position _x]) setMarkerType "dot";
//} foreach _fakeiedpositions;


for "_i" from 1 to bon_number_fake_ieds2 do {

	for "_searchcount" from 1 to 10000 do {

		_j = (count _roads - 1) min (round random (count _roads));
		_iedpos = _roads select _j;

		if(
			{_iedpos distance _x < 500} count _fakeiedpositions2 == 0 &&
			_iedpos distance (getMarkerPos format["respawn_%1",tfor_friendly_side]) > 500
		) exitWith{};

		_iedpos = nil;

	};

	if(not isNil "_iedpos") then {
		_roads = _roads - [_iedpos];
		_fakeiedpositions2 = _fakeiedpositions2 + [_iedpos];

		_j = (count bon_fake_ied_container2 - 1) min (round random (count bon_fake_ied_container2));
		_ied = (bon_fake_ied_container2 select _j) createVehicle position _iedpos;
		_ied setFuel 0.05;
		_ied setDamage 0.4;
		
		if(random 2 > 1) then {_offset = [-4.5 - random 6,0,0]} else {_offset = [4.5 + random 6,0,0]};
		_ied setPosATL (_iedpos modelToWorld _offset);
		_ied setPosATL [(getPosATL _ied select 0), (getPosATL _ied select 1), 0.01];

		_iedpos = nil;
		_ied = nil;
	};
};


//{
//	(createMarker [str round random 999999,position _x]) setMarkerType "Pickup";
//} foreach _fakeiedpositions2;