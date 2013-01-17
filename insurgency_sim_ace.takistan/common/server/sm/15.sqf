#include "functions.sqf"
current_playergroupname = playergroupname;

_vehicle_at_base = false;

["Task17","Side Mission: Wagons Roll","<br/><br/>Wagons Roll<br/><br/>An armoured motorcade was escorting the CEO of ION Inc. from Timurkalay to Feruz Abad. Radio contact with the vehicles was lost just before they reached Anar. The vehicles are likely to have been ambushed by Insurgency forces. At this time we do not have a precise location of the three vehicle convoy. The armoured vehicle contains classified documents which cannot fall into enemy hands.<br/><br/>Locate the motorcade, search for any survivors and rescue the armoured vehicle. Returning the vehicle to the service point at your main base.",playergroupname] call SHK_Taskmaster_add;


_vehicle = createVehicle ["ArmoredSUV_PMC", [6321.2617, 5036.3218, 3.0517], [], 0, "NONE"];
_vehicle setDir -53.342667;
_vehicle setFuel 0.12;
_vehicle setVehicleArmor 0.6;
_vcl setVehicleAmmo 0.4;
_vehicle setPos [6321.2617, 5036.3218, 3.0517578];


_vcl2 = createVehicle ["ArmoredSUV_PMC", [6337.2412, 5027.8481], [], 0, "NONE"];
_vcl2 setDir -14.639078;
_vcl2 setVehicleArmor 0.4;
_vcl2 setFuel 0.12;
_vcl2 setVehicleAmmo 0.4;
_vcl2 setPos [6337.2412, 5027.8481];


_vcl = createVehicle ["SUV_PMC", [6328.8955, 5150.5464], [], 0, "NONE"];
_vcl setDir -102.16188;;
_vcl setVehicleArmor 0.1;
_vcl setFuel 0.1;
_vcl setVehicleAmmo 0;
_vcl setPos [6328.8955, 5150.5464, 3.0];

_vcl4  = createVehicle ["Pickup_PK_TK_GUE_EP1",[6327.8955, 5154.5464],[],0,"NONE"];


waitUntil { nearestPlayers(getPosATL (_vcl), 1000, true, "count") > 0 };

	_group  = ["static","Grp","","east"] call getGroup;
	
	_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [6321.5854, 5041.5396], [], 0, "NONE"];
	_ai allowFleeing 0;
	_ai doWatch _vcl2;
	_ai setPos [6321.1073, 5042.0347, 3.0];

	_ai = _group createUnit ["TK_INS_Soldier_4_EP1", [6334.7192, 5025.0967], [], 0, "NONE"];
	_ai assignAsGunner _vcl2;
	_ai moveInGunner _vcl2;
	_ai setPos [6323.7192, 5042.0967, 3.0];

	_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [6323.562, 5039.5952], [], 0, "NONE"];
	_ai allowFleeing 0;
	_ai doWatch _vcl2;
	_ai setPos [6323.562, 5039.5952, 3.0];

	_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [6323.562, 5039.5952], [], 0, "NONE"];
	_ai allowFleeing 0;
	_ai doWatch _vcl2;
	_ai setPos [6323.562, 5039.5952, 3.0];

	_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [6322.0073, 5041.0347], [], 0, "NONE"];
	_ai allowFleeing 0;
	_ai assignAsGunner _vcl4;
	_ai moveInGunner _vcl4;
	_ai setPos [6324.8955, 5156.5464];

	_group2  = ["vip_static","Grp","","west"] call getGroup;

	_man  = _group2 createUnit ["Soldier_PMC", [6321.0073, 5040.0347], [], 0, "NONE"];
	_man setPos [6321.0073, 5040.0347, 3.0];
	_man setDir -180.97284;
	_man setVehicleArmor 0;
	
	_man  = _group2 createUnit ["Soldier_M4A3_PMC", [6324.1792, 5040.0435], [], 0, "NONE"];
	_man setPos [6324.1792, 5040.0435, 3.0];
	_man setDir -180.97284;
	_man setVehicleArmor 0;

	_man  = _group2 createUnit ["Soldier_M4A3_PMC", [6328.8955, 5154.5464], [], 0, "NONE"];
	_man setVehicleArmor 0;

	_man  = _group2 createUnit ["Soldier_PMC", [6324.8955, 5156.5464], [], 0, "NONE"];
	_man setVehicleArmor 0;

while {!_vehicle_at_base} do {

	if (_vehicle distance vehicleServicePoint < 20) then {
	["Task17","succeeded"] call SHK_Taskmaster_upd;
	_vehicle_at_base = true;
	{_x addscore +5;} foreach units current_playergroupname;
	};
};

