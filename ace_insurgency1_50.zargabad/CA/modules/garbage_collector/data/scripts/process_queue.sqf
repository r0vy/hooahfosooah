scriptName "garbage_collector\data\scripts\process_queue.sqf";
/*
	File: process_queue.sqf
	Related: garbagecollector.fsm
	Author: Joris-Jan van 't Land

	Description:
	Process the garbage queue for the Garbage Collector FSM.
*/

private ["_queue"];

//--- Execute Functions
if (isnil "bis_fnc_init") then {
	(group BIS_GC) createunit ["FunctionsManager",position player,[],0,"none"];
};
waituntil {!isnil "BIS_fnc_init"};

_queue = BIS_GC getVariable "queue";

for "_i" from 0 to ((count _queue) - 1) do
{
	private ["_entry", "_time"];
	_entry = _queue select _i;
	_time = _entry select 1;

	//Check the object was in the queue for at least the assigned time (expiry date).
	if (_time <= time) then
	{
		private ["_object"];
		_object = _entry select 0;

		switch (typeName _object) do
		{
			case (typeName objNull):
			{
				//Player and his squadmates cannot be too close.
				//ToDo: use 'cameraOn' as well?
				if (({(_x distance _object) <= 500} count ([] call BIS_fnc_listPlayers)) == 0) then
				{
					deleteVehicle _object;
					_queue set [_i, -1];
				};
			};

			case (typeName grpNull):
			{
				//Make sure the group is empty.
				if (({alive _x} count (units _object)) == 0) then
				{
					deleteGroup _object;
					_queue set [_i, -1];
				};
			};

			default {};
		};
	};
};

_queue = _queue - [-1];
BIS_GC setVariable ["queue", _queue];

true