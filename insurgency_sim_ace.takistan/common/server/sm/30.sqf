#include "functions.sqf"
current_playergroupname = playergroupname;


AmmoKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 3;
	"Bo_GBU12_LGB" createVehicle _pos;
};

["Task32","Side Mission: Convoy Hunters","<br/><br/>Convoy Hunters<br/><br/>We have convoys passing every day through Imarat, bringing supply to our many FARPs and moving troops where needed. Every day these convoys get under fire of the militia when passing a precise point North-West of Imarat. We think that the insurgents have set up a hidden camp in that area, from which they fire on our vehicles. Find that camp and destroy any ammo supply they have, in order to cut once and for all the attacks to our convoys in that area. Neutralize any opposition if necessary.<br/><br/><br/>Creator: WhiteRaven",current_playergroupname] call SHK_Taskmaster_add;

  _ags1 = createVehicle ["AGS_TK_GUE_EP1", [7559.4868, 7516.8369, 0.00028991699], [], 0, "NONE"];
  _ags1 setPos [7559.4868, 7516.8369, 0.00028991699];

waitUntil { nearestPlayers(getPosATL (_ags1), 1000, true, "count") > 0 };

  _kord1 = createVehicle ["KORD_TK_EP1", [7443.2773, 7538.7378, -0.0002746582], [], 0, "NONE"];
  _kord1 setPos [7443.2773, 7538.7378, -0.0002746582];

  _kord2 = createVehicle ["KORD_TK_EP1", [7436.8276, 7487.2236, 9.1552734e-005], [], 0, "NONE"];
  _kord2 setPos [7436.8276, 7487.2236, 9.1552734e-005];

  _ammo1 = createVehicle ["TKOrdnanceBox_EP1", [7493.3452, 7415.793, 7.6293945e-005], [], 0, "NONE"];
  _ammo1 setPos [7493.3452, 7415.793, 7.6293945e-005];
  _ammo1 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

  _ammo2 = createVehicle ["TKVehicleBox_EP1", [7494.8101, 7418.3262, 0.00010681152], [], 0, "NONE"];
  _ammo2 setPos [7494.8101, 7418.3262, 0.00010681152];
  _ammo2 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

  _this = createVehicle ["Land_A_tent", [7489.4819, 7402.3198, -6.1035156e-005], [], 0, "NONE"];
  _this setPos [7489.4819, 7402.3198, -6.1035156e-005];

  _this = createVehicle ["Land_A_tent", [7492.8237, 7391.2671, 1.5258789e-005], [], 0, "NONE"];
  _this setPos [7492.8237, 7391.2671, 1.5258789e-005];

  _this = createVehicle ["Land_A_tent", [7509.2769, 7520.3213, 1.5258789e-005], [], 0, "NONE"];
  _this setPos [7509.2769, 7520.3213, 1.5258789e-005];

  _this = createVehicle ["Land_A_tent", [7514.9814, 7517.3086, 1.5258789e-005], [], 0, "NONE"];
  _this setPos [7514.9814, 7517.3086, 1.5258789e-005];

  _this = createVehicle ["Land_A_tent", [7513.6509, 7502.5112, -7.6293945e-005], [], 0, "NONE"];
  _this setPos [7513.6509, 7502.5112, -7.6293945e-005];

  _this = createVehicle ["Land_A_tent", [7483.7236, 7398.1729, 4.5776367e-005], [], 0, "NONE"];
  _this setPos [7483.7236, 7398.1729, 4.5776367e-005];

  _this = createVehicle ["Land_Bag_EP1", [7509.6997, 7511.8711, 6.1035156e-005], [], 0, "NONE"];
  _this setPos [7509.6997, 7511.8711, 6.1035156e-005];

  _this = createVehicle ["Land_Bag_EP1", [7509.1514, 7516.2266, -6.1035156e-005], [], 0, "NONE"];
  _this setPos [7509.1514, 7516.2266, -6.1035156e-005];

  _this = createVehicle ["Land_Basket_EP1", [7511.3027, 7516.3032, 0.00019836426], [], 0, "NONE"];
  _this setPos [7511.3027, 7516.3032, 0.00019836426];

  _this = createVehicle ["Land_Bowl_EP1", [7512.6836, 7507.5522, 0.00010681152], [], 0, "NONE"];
  _this setPos [7512.6836, 7507.5522, 0.00010681152];

  _this = createVehicle ["Land_Bucket_EP1", [7513.9805, 7511.6128, 0.00012207031], [], 0, "NONE"];
  _this setPos [7513.9805, 7511.6128, 0.00012207031];

  _this = createVehicle ["Land_Teapot_EP1", [7516.165, 7513.8467, -0.00015258789], [], 0, "NONE"];
  _this setPos [7516.165, 7513.8467, -0.00015258789];

  _this = createVehicle ["Land_Campfire", [7512.5713, 7513.687, 4.5776367e-005], [], 0, "NONE"];
  _this setPos [7512.5713, 7513.687, 4.5776367e-005];

  _this = createVehicle ["Land_bags_EP1", [7495.5562, 7421.1919, 9.1552734e-005], [], 0, "NONE"];
  _this setPos [7495.5562, 7421.1919, 9.1552734e-005];

  _this = createVehicle ["Land_bags_EP1", [7495.5952, 7415.7373, 0.00012207031], [], 0, "NONE"];
  _this setPos [7495.5952, 7415.7373, 0.00012207031];

  _this = createVehicle ["Barrel4", [7494.8525, 7414.377, -4.5776367e-005], [], 0, "NONE"];
  _this setPos [7494.8525, 7414.377, -4.5776367e-005];

  _this = createVehicle ["Land_bags_stack_EP1", [7491.3096, 7416.5347, -0.042816162], [], 0, "NONE"];
  _this setPos [7491.3096, 7416.5347, -0.042816162];

  _this = createVehicle ["Land_bags_stack_EP1", [7491.3882, 7418.4536, 1.5258789e-005], [], 0, "NONE"];
  _this setPos [7491.3882, 7418.4536, 1.5258789e-005];

  _this = createVehicle ["Land_A_tent", [7496.9385, 7429.6172, 0.0001373291], [], 0, "NONE"];
  _this setPos [7496.9385, 7429.6172, 0.0001373291];

  _this = createVehicle ["Land_A_tent", [7500.8872, 7451.9175, 0], [], 0, "NONE"];
  _this setPos [7500.8872, 7451.9175, 0];

_group_0 = ["static","Grp","","east"] call getGroup;
  _this = _group_0 createUnit ["TK_INS_Soldier_2_EP1", [7449.3384, 7703.8931, 0.00015258789], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_EP1", [7451.436, 7702.0317, 1.5258789e-005], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_EP1", [7446.7153, 7702.8657, 0.00010681152], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_4_EP1", [7443.9858, 7699.1089, 0.00019836426], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_AT_EP1", [7454.3003, 7699.2583, 1.5258789e-005], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_MG_EP1", [7446.6045, 7700.7202, 0.00024414063], [], 0, "NONE"];

_group_1 = ["static","Grp","","east"] call getGroup;
  _this = _group_1 createUnit ["TK_INS_Soldier_2_EP1", [7511.0869, 7542.4438, 0.00010681152], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_2_EP1", [7514.0635, 7540.8584, 6.1035156e-005], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_EP1", [7508.7886, 7540.0474, 0.00010681152], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_EP1", [7515.5288, 7537.9507, -9.1552734e-005], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_4_EP1", [7510.2241, 7535.582, 4.5776367e-005], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_3_EP1", [7512.9912, 7535.2354, -0.00015258789], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_AT_EP1", [7519.3237, 7535.1157, 3.0517578e-005], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_MG_EP1", [7510.3232, 7533.5283, 9.1552734e-005], [], 0, "NONE"];

_group_2 = ["static","Grp","","east"] call getGroup;
  _this = _group_2 createUnit ["TK_INS_Soldier_2_EP1", [7493.9629, 7351.3418, 4.5776367e-005], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_EP1", [7499.0625, 7348.5093, -0.00024414063], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_2_EP1", [7491.1392, 7350.354, 6.1035156e-005], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_3_EP1", [7494.9434, 7346.2114, 0.00012207031], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_AT_EP1", [7498.0635, 7345.0708, 6.1035156e-005], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_AT_EP1", [7503.376, 7345.3721, -6.1035156e-005], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_AAT_EP1", [7501.1982, 7342.98, 0.00015258789], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_4_EP1", [7496.3882, 7343.4077, -0.00024414063], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_4_EP1", [7481.4595, 7352.4468, 1.5258789e-005], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_MG_EP1", [7497.999, 7353.5483, -0.00021362305], [], 0, "NONE"];



_group_3 = ["static","Grp","","east"] call getGroup;
  _this = _group_3 createUnit ["TK_INS_Soldier_AA_EP1", [7363.5513, 7351.2124, 6.1035156e-005], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_AT_EP1", [7359.5337, 7349.2373, 0.00012207031], [], 0, "NONE"];

_group_4 = ["static","Grp","","east"] call getGroup;
  _this = _group_4 createUnit ["TK_INS_Soldier_AA_EP1", [7588.1396, 7309.8936, 0], [], 0, "NONE"];
  _this = _group_4 createUnit ["TK_INS_Soldier_Sniper_EP1", [7585.1538, 7310.1362, 0.00018310547], [], 0, "NONE"];

_group_6 = ["static","Grp","","east"] call getGroup;
  _this = _group_6 createUnit ["TK_INS_Soldier_Sniper_EP1", [7830.2407, 7234.103, 6.1035156e-005], [], 0, "NONE"];
  _this = _group_6 createUnit ["TK_INS_Soldier_Sniper_EP1", [7833.0547, 7232.5308, 0.00012207031], [], 0, "NONE"];


_group_12 = ["static","Grp","","east"] call getGroup;
_gunner1 = _group_12 createUnit ["TK_INS_Soldier_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_gunner1 assignAsGunner _kord1;
_gunner1 moveInGunner _kord1;

_gunner2 = _group_12 createUnit ["TK_INS_Soldier_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_gunner2 assignAsGunner _kord2;
_gunner2 moveInGunner _kord2;

_gunner3 = _group_12 createUnit ["TK_INS_Soldier_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_gunner3 assignAsGunner _ags1;
_gunner3 moveInGunner _ags1;

_this = _group_0 addWaypoint [[7484.0723, 7585.0786, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_1 = _this;

_this = _group_0 addWaypoint [[7447.3823, 7711.7163, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_2 = _this;

_this = _group_1 addWaypoint [[7468.6235, 7607.0664, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_3 = _this;

_this = _group_1 addWaypoint [[7519.6787, 7508.3223, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_4 = _this;

_this = _group_2 addWaypoint [[7503.064, 7469, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_5 = _this;

_this = _group_2 addWaypoint [[7489.2075, 7343.9575, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_6 = _this;

_this = _group_3 addWaypoint [[7101.4116, 7691.5986, 0], 100];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_7 = _this;

_this = _group_3 addWaypoint [[7348.3213, 7350.9321, 0], 100];
_this setWaypointType "CYCLE";
_waypoint_8 = _this;

_this = _group_4 addWaypoint [[7250.3145, 7274.1777], 200];
_this setWaypointBehaviour "STEALTH";
_waypoint_9 = _this;

_this = _group_4 addWaypoint [[7651.0469, 7302.2632], 200];
_this setWaypointType "CYCLE";
_waypoint_10 = _this;

_this = _group_6 addWaypoint [[7773.4097, 7731.2803], 0];
_this setWaypointCombatMode "RED";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_11 = _this;

_this = _group_6 addWaypoint [[7837.2515, 7219.7334, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_12 = _this;

while {alive _ammo1; alive _ammo2} do {
sleep 10;
};

["Task32","succeeded"] call SHK_Taskmaster_upd; 
{_x addscore +5;} foreach units current_playergroupname;