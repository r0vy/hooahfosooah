#include "functions.sqf"
current_playergroupname = playergroupname;

VictimKilled = { 	

	_pos	= getPosATL(_this);

	sleep random 2;
	"ARTY_R_227mm_HE" createVehicle _pos;
	sleep 4;

	["Task27","failed"] call SHK_Taskmaster_upd;
};



["Task27","Side Mission: Dressed to Kill","<br/><br/>Dressed to Kill<br/><br/>Takistan locals have reported that a local business man is standing at one of the T juntions of Khushab. He appears to be very distressed and wearing what appears to be a bomb vest under his suit.<br/><br/>Secure the area, locate the business man, clear away other cilivians and then disarm the bomb before it blows.",playergroupname] call SHK_Taskmaster_add;


_msc = createVehicle ["Misc_TyreHeapEP1", [1598.00,5675.00], [], 0, "NONE"];

waitUntil { nearestPlayers(getPosATL (_msc), 600, true, "count") > 0 };

disarm1 = false;
disarm2 = false;


_group  = ["static","Grp","","civilian"] call getGroup;

victim = _group createUnit ["Functionary2_EP1", [1602.00,5699.00], [], 0, "NONE"];
victim addEventHandler["Killed", { (_this select 0) spawn VictimKilled; }];
victim setCaptive true;

victim setVehicleInit "if !isNil 'actionDisarmBomb1' then { player removeAction actionDisarmBomb1; actionDisarmBomb1 = nil; };

 actionDisarmBomb1 = this addAction ['Disarm First Explosive Trigger','common\client\actions\noScript.sqf','
		_this select 0 removeAction (_this select 2);
		[""Disarm First Trigger"", ""Disarming first explosive trigger"", ""This will take some time!"", 60] spawn playerHint;
		_disarmtrigger1 = false;
		_disarmtime = time;		
		while {!_disarmtrigger1} do {
	
 		 player playMove ""AinvPknlMstpSlayWrflDnon_medic"";
 		 sleep 3;
			if (time - _disarmtime > 60) then {
			_disarmtrigger1 = true;
			_this select 0 setVariable [""Trigger1Disarmed"",True,True];
			};
		};	
',1,false,true,'','_this distance _target < 4'];";
processInitCommands;




//_group  = ["static","Grp","","east"] call getGroup;
//
//_ai1  = _group createUnit ["TK_INS_Soldier_AA_EP1", [1646.00,5391.00], [], 0, "NONE"];
//_ai1  = _group createUnit ["TK_INS_Soldier_MG_EP1", [1245.00,5591.00], [], 0, "NONE"];
//_ai1  = _group createUnit ["TK_INS_Soldier_2_EP1", [1785.00,5645.00], [], 0, "NONE"];


while {!disarm1} do {
sleep 10;
_trigger1disarmed = if (isnil {victim getvariable "Trigger1Disarmed"}) then {false} else {true};

	if (_trigger1disarmed) then {
		disarm1 = true; 
		victim setVehicleInit "if !isNil 'actionDisarmBomb2' then { player removeAction actionDisarmBomb2; actionDisarmBomb2 = nil; };
		
		actionDisarmBomb2 = this addAction ['Disarm Second Explosive Trigger','common\client\actions\noScript.sqf','
		_this select 0 removeAction (_this select 2);
		[""Disarm Second Trigger"", ""Disarming second explosive trigger"", ""This will take some time!"", 60] spawn playerHint;
		_disarmtrigger2 = false;
		_disarmtime = time;		
			while {!_disarmtrigger2} do {
	
 			 player playMove ""AinvPknlMstpSlayWrflDnon_medic"";
 			 sleep 3;
				if (time - _disarmtime > 60) then {
				_disarmtrigger2 = true;
				_this select 0 setVariable [""Trigger2Disarmed"",True,True];
				};
			};	
		',1,false,true,'','_this distance _target < 4'];";
		processInitCommands;
	};

};


_sniper  = _group createUnit ["TK_Soldier_SniperH_EP1", [1934.00, 5955.00], [], 0, "NONE"];
_sniper setskill 1;
_sniper domove (getpos _msc);
_sniper	setUnitPos "DOWN";


_ai2  = _group createUnit ["TK_INS_Soldier_EP1", [1194.00,5846.00], [], 0, "NONE"];
_ai2 doMove (getpos _msc);
_ai2  = _group createUnit ["TK_INS_Soldier_MG_EP1", [1195.00,5845.00], [], 0, "NONE"];
_ai2 doMove (getpos _msc);
_ai2  = _group createUnit ["TK_INS_Soldier_3_EP1", [1196.00,5847.00], [], 0, "NONE"];
_ai2 doMove (getpos _msc);

while {!disarm2} do {
_trigger2disarmed = if (isnil {victim getvariable "Trigger2Disarmed"}) then {false} else {true};
sleep 5;
	if (_trigger2disarmed) then {
		disarm2 = true; 
		victim setCaptive false;
		victim setBehaviour "SAFE";
		victim setUnitPos "UP";
		victim doMove [(getpos victim select 0) + random 500 - random 500,(getpos victim select 1) + random 500 - random 500,0];
		sleep 4;
		["Task27","succeeded"] call SHK_Taskmaster_upd;
		{_x addscore +5;} foreach units current_playergroupname;
	};
};