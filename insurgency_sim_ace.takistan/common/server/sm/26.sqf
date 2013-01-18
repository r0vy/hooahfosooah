#include "functions.sqf"
current_playergroupname = playergroupname;

AmmoKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 2;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 3;
	"Bo_GBU12_LGB" createVehicle _pos;
	sleep random 3;
	"Bo_GBU12_LGB" createVehicle _pos;
};


["Task28","Side Mission: Mountain Camping","<br/><br/>Mountain Camping<br/><br/>Recent insurgent activity near Hazar Bagh and Chardarakt suggest the possibility of the presence of an insurgent base near those towns. Our intelligence services believe that an organized group of former Takistani Army Special Forces are camping in the area north of Hazar Bagh. Your team is tasked with scouting the area and neutralizing any enemy activity.<br/><br/>Destroy any vehicle and ammo, take no prisoners.<br/><br/><br/>Creator: WhiteRaven",playergroupname] call SHK_Taskmaster_add;

_tent = createVehicle ["Land_tent_east", [11625.746, 3888.158, -0.00067138672], [], 0, "NONE"];
_tent setPos [11625.746, 3888.158, -0.00067138672];

waitUntil { nearestPlayers(getPosATL (_tent), 1000, true, "count") > 0 };

_this = createVehicle ["Land_CamoNetB_EAST_EP1", [11650.966, 3899.2314, -0.00018310547], [], 0, "NONE"];
_this setPos [11650.966, 3899.2314, -0.00018310547];


_this = createVehicle ["Land_CamoNetB_EAST_EP1", [11587.116, 3909.3875, 0.00091552734], [], 0, "NONE"];
_this setPos [11587.116, 3909.3875, 0.00091552734];


_this = createVehicle ["Land_CamoNetB_EAST_EP1", [11666.363, 3858.2595, 0.00030517578], [], 0, "NONE"];
_this setPos [11666.363, 3858.2595, 0.00030517578];


_group_0 = ["static","Grp","","east"] call getGroup;

_leader0 = _group_0 createUnit ["TK_Commander_EP1", [11613.889, 3897.3008], [], 0, "NONE"];
_leader0 setUnitRank "SERGEANT";
_this = _group_0 createUnit ["TK_Special_Forces_MG_EP1", [11614.482, 3891.4309, 6.1035156e-005], [], 0, "NONE"];
_this = _group_0 createUnit ["TK_Special_Forces_MG_EP1", [11607.478, 3892.3633, 0.00018310547], [], 0, "NONE"];
_this = _group_0 createUnit ["TK_Special_Forces_EP1", [11602.28, 3888.9502, -0.00012207031], [], 0, "NONE"];
_this = _group_0 createUnit ["TK_Special_Forces_EP1", [11614.343, 3884.0728, 0.00018310547], [], 0, "NONE"];

_group_1 = ["static","Grp","","east"] call getGroup;
_leader1 = _group_1 createUnit ["TK_Special_Forces_TL_EP1", [11769.637, 3877.7891, 6.1035156e-005], [], 0, "NONE"];
_leader1 setUnitRank "SERGEANT";
_this = _group_1 createUnit ["TK_Special_Forces_EP1", [11764.839, 3874.7463], [], 0, "NONE"];
_this = _group_1 createUnit ["TK_Special_Forces_EP1", [11771.326, 3868.7441, -0.00024414063], [], 0, "NONE"];
_this = _group_1 createUnit ["TK_Special_Forces_MG_EP1", [11776.39, 3872.0791, 6.1035156e-005], [], 0, "NONE"];
_this = _group_1 createUnit ["TK_Special_Forces_MG_EP1", [11759.583, 3874.8823, 0.00012207031], [], 0, "NONE"];
_this = _group_1 createUnit ["TK_Special_Forces_MG_EP1", [11769.887, 3866.0674, 0.00024414063], [], 0, "NONE"];


_tank1 = createVehicle ["T72_RU", [11650.934, 3898.9019, 6.1035156e-005], [], 0, "NONE"];
_tank1 setPos [11650.934, 3898.9019, 6.1035156e-005];

_group_2 = ["static","Grp","","east"] call getGroup;
_leader1 = _group_2 createUnit ["TK_Special_Forces_TL_EP1", [11567.407, 3992.4358, -6.1035156e-005], [], 0, "NONE"];
_leader1 setUnitRank "SERGEANT";
_this = _group_2 createUnit ["TK_Special_Forces_MG_EP1", [11560.138, 3989.1753, -0.00030517578], [], 0, "NONE"];
_this = _group_2 createUnit ["TK_Special_Forces_MG_EP1", [11573.578, 3990.0591, 0.00012207031], [], 0, "NONE"];
_this = _group_2 createUnit ["TK_Special_Forces_EP1", [11556.543, 3984.9102, -0.00036621094], [], 0, "NONE"];
_this = _group_2 createUnit ["TK_Special_Forces_EP1", [11579.186, 3987.1587, 6.1035156e-005], [], 0, "NONE"];

_group_3 = ["static","Grp","","east"] call getGroup;
_this = _group_3 createUnit ["TK_INS_Soldier_AA_EP1", [11498.037, 4344.2554], [], 0, "NONE"];
_this = _group_3 createUnit ["TK_INS_Soldier_Sniper_EP1", [11500.014, 4343.0117, -0.00018310547], [], 0, "NONE"];

_group_4 = ["static","Grp","","east"] call getGroup;
_this = _group_4 createUnit ["TK_INS_Soldier_AA_EP1", [11905.031, 3865.0789, 6.1035156e-005], [], 0, "NONE"];
_this = _group_4 createUnit ["TK_Soldier_Sniper_EP1", [11903.41, 3868.967, -6.1035156e-005], [], 0, "NONE"];

_group_5 = ["static","Grp","","east"] call getGroup;
_this = _group_5 createUnit ["TK_INS_Soldier_AA_EP1", [11250.469, 3787.155, -6.1035156e-005], [], 0, "NONE"];
_this = _group_5 createUnit ["TK_Soldier_SniperH_EP1", [11246.615, 3793.4312], [], 0, "NONE"];



_this = createVehicle ["Land_Carpet_EP1", [11583.778, 3933.0544, 0.00012207031], [], 0, "NONE"];
_this setPos [11583.778, 3933.0544, 0.00012207031];

_this = createVehicle ["Land_Carpet_EP1", [11588.67, 3932.3474, -0.00012207031], [], 0, "NONE"];
_this setPos [11588.67, 3932.3474, -0.00012207031];

_this = createVehicle ["Land_Carpet_EP1", [11625.576, 3889.0981, 0], [], 0, "NONE"];
_this setPos [11625.576, 3889.0981, 0];


_this = createVehicle ["Land_Carpet_2_EP1", [11622.972, 3889.4819, 6.1035156e-005], [], 0, "NONE"];
_this setPos [11622.972, 3889.4819, 6.1035156e-005];


_this = createVehicle ["Land_Carpet_2_EP1", [11627.144, 3886.6511, -6.1035156e-005], [], 0, "NONE"];
_this setPos [11627.144, 3886.6511, -6.1035156e-005];

_this = createVehicle ["Land_Water_pipe_EP1", [11622.782, 3886.5625, 0], [], 0, "NONE"];
_this setPos [11622.782, 3886.5625, 0];


_this = createVehicle ["Land_Wicker_basket_EP1", [11623.506, 3885.9575, 6.1035156e-005], [], 0, "NONE"];
_this setPos [11623.506, 3885.9575, 6.1035156e-005];

_this = createVehicle ["Land_Teapot_EP1", [11588.607, 3929.9199, 0], [], 0, "NONE"];
_this setPos [11588.607, 3929.9199, 0];


_this = createVehicle ["Land_Urn_EP1", [11589.588, 3929.6877, 6.1035156e-005], [], 0, "NONE"];
_this setPos [11589.588, 3929.6877, 6.1035156e-005];


_this = createVehicle ["Land_Sack_EP1", [11582.47, 3929.6973, 0.00024414063], [], 0, "NONE"];
_this setPos [11582.47, 3929.6973, 0.00024414063];

_this = createVehicle ["Land_tent_east", [11585.731, 3931.2966], [], 0, "NONE"];
_this setPos [11585.731, 3931.2966];

_this = createVehicle ["Land_Bucket_EP1", [11583.246, 3929.8611, -6.1035156e-005], [], 0, "NONE"];
_this setPos [11583.246, 3929.8611, -6.1035156e-005];


_this = createVehicle ["Land_Bucket_EP1", [11580.031, 3928.5474, -6.1035156e-005], [], 0, "NONE"];
_this setPos [11580.031, 3928.5474, -6.1035156e-005];

_this = createVehicle ["Land_Bucket_EP1", [11631.667, 3885.5627, 0], [], 0, "NONE"];
_this setPos [11631.667, 3885.5627, 0];


_this = createVehicle ["Land_Crates_EP1", [11628.909, 3890.0583, 0], [], 0, "NONE"];
_this setPos [11628.909, 3890.0583, 0];


_ammo1 = createVehicle ["TKBasicAmmunitionBox_EP1", [11584.69, 3907.0144, -0.00018310547], [], 0, "NONE"];
_ammo1 setPos [11584.69, 3907.0144, -0.00018310547];
_ammo1 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];


_ammo2 = createVehicle ["TKBasicWeapons_EP1", [11588.262, 3910.2158, 0], [], 0, "NONE"];
_ammo2 setPos [11588.262, 3910.2158, 0];
_ammo2 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

_ammo3 = createVehicle ["TKOrdnanceBox_EP1", [11586.806, 3905.8767, 0], [], 0, "NONE"];
_ammo3 setPos [11586.806, 3905.8767, 0];
_ammo3 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

_ammo4 = createVehicle ["TKSpecialWeapons_EP1", [11583.304, 3909.6165, 0.00018310547], [], 0, "NONE"];
_ammo4 setPos [11583.304, 3909.6165, 0.00018310547];
_ammo4 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

_ammo5 = createVehicle ["TKVehicleBox_EP1", [11665.001, 3857.8394, -6.1035156e-005], [], 0, "NONE"];
_ammo5 setPos [11665.001, 3857.8394, -6.1035156e-005];
_ammo5 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];


_group_6 = ["static","Grp","","east"] call getGroup;

_aitank1 = _group_6 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_aitank1 assignAsGunner _tank1;
_aitank1 moveInGunner _tank1;

_aitank2 = _group_6 createUnit ["TK_Soldier_Crew_EP1", [11648.943, 3887.3743, 0.00018310547], [], 0, "NONE"];
_aitank2 assignAsDriver _tank1;
_aitank2 moveInDriver _tank1;

_aitank3 = _group_6 createUnit ["TK_Soldier_Crew_EP1", [11646.893, 3886.4973], [], 0, "NONE"];
_aitank3 assignAsCommander _tank1;
_aitank3 moveInCommander _tank1;

_tank1 lockDriver true;
_tank1 lockCargo true;
_tank1 lockturret [[0],true];


_wp0 = _group_0 addWaypoint [[11624.327, 3888.2783, 6.1035156e-005], 0];
_wp0 setWaypointCombatMode "RED";
_wp0 setWaypointSpeed "LIMITED";

_wp1 = _group_1 addWaypoint [[11594.026, 3863.9717, 0], 0];
_wp1 setWaypointCombatMode "RED";
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "AWARE";

_wp11 = _group_1 addWaypoint [[11781.59, 3878.7522, 0], 0];
_wp11 setWaypointType "CYCLE";

_wp2 = _group_2 addWaypoint [[11573.423, 3861.4192, 0.00012207031], 0];
_wp2 setWaypointCombatMode "RED";
_wp2 setWaypointFormation "STAG COLUMN";
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointBehaviour "AWARE";

_wp21 = _group_2 addWaypoint [[11565.193, 3996.4229, -0.00042724609], 0];
_wp21 setWaypointType "CYCLE";

_wp3 = _group_3 addWaypoint [[11495.505, 4344.7324, 0], 0];
_wp3 setWaypointSpeed "LIMITED";
_wp3 setWaypointBehaviour "STEALTH";

_wp4 = _group_4 addWaypoint [[11901.427, 3870.72, 0], 0];
_wp4 setWaypointSpeed "LIMITED";
_wp4 setWaypointBehaviour "STEALTH";

_wp5 = _group_5 addWaypoint [[11223.964, 3798.3794, 0], 0];
_wp5 setWaypointCombatMode "RED";
_wp5 setWaypointSpeed "LIMITED";
_wp5 setWaypointBehaviour "STEALTH";







while {alive _tank1; alive _ammo1; alive _ammo2; alive _ammo3; alive _ammo4; alive _ammo5} do {
sleep 10;
};

["Task28","succeeded"] call SHK_Taskmaster_upd; 
{_x addscore +5;} foreach units current_playergroupname;