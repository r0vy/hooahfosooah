#include "functions.sqf"
current_playergroupname = _this select 0;

TankKilled = { 

	sleep 4;

	["Task29b","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
};


["Task29b","Side Mission: Vulture's Friends","<br/><br/>Vulture's Friends<br/><br/>The Special Forces group you attacked had friends in the bands of insurgents in this area. They are closing in to your position quickly from all directions. One of our recon units has spotted a tank in your area, moving towards you. Your new objective is to destroy that tank. Fight the other insurgents only for self-defence.<br/><br/><br/>Creator: WhiteRaven",current_playergroupname] call SHK_Taskmaster_add;

  _tank1 = createVehicle ["T55_TK_EP1", [1380.9452, 9611.6582, 0.00030517578], [], 200, "NONE"];
  _tank1 setPos [8266.9014, 10330.738, -7.6293945e-005];
  _tank1 addEventHandler["Killed", { (_this select 0) spawn TankKilled; }];

waitUntil { nearestPlayers(getPosATL (_tank1), 1000, true, "count") > 0 };

_group_0 = ["static","Grp","","east"] call getGroup;
  _leader0 = _group_0 createUnit ["TK_INS_Soldier_2_EP1", [1237.0774, 9390.6611], [], 0, "NONE"];
  _leader0 setUnitRank "CORPORAL";
  _this = _group_0 createUnit ["TK_INS_Soldier_EP1", [1254.9928, 9378.8916], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_4_EP1", [1223.7897, 9376.6406], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_AT_EP1", [1243.7216, 9363.7861], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_MG_EP1", [1230.8921, 9368.0566], [], 0, "NONE"];

_group_1 = ["static","Grp","","east"] call getGroup;
  _leader1 = _group_1 createUnit ["TK_INS_Soldier_MG_EP1", [939.10706, 8735.6787], [], 0, "NONE"];
  _leader1 setUnitRank "CORPORAL";
  _this = _group_1 createUnit ["TK_INS_Soldier_2_EP1", [929.64301, 8725.2803], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_3_EP1", [947.23895, 8727.6729], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_AT_EP1", [939.0163, 8724.9307], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_AA_EP1", [931.0683, 8734.2559], [], 0, "NONE"];

_group_2 = ["static","Grp","","east"] call getGroup;
  _leader2 = _group_2 createUnit ["TK_INS_Soldier_MG_EP1", [979.61414, 8239.6689, -0.002166748], [], 0, "NONE"];
  _leader2 setUnitRank "CORPORAL";
  _this = _group_2 createUnit ["TK_INS_Soldier_2_EP1", [978.46918, 8247.3311, -0.00033569336], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_4_EP1", [967.34662, 8238.8154, -0.0010986328], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_AT_EP1", [967.38995, 8247.3428, 0.00012207031], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_EP1", [972.51434, 8228.9756, -0.0024719238], [], 0, "NONE"];

_group_3 = ["static","Grp","","east"] call getGroup;
  _leader3 = _group_3 createUnit ["TK_INS_Soldier_AA_EP1", [2084.4929, 8425.1299, -0.00030517578], [], 0, "NONE"];
  _leader3 setUnitRank "CORPORAL";
  _this = _group_3 createUnit ["TK_INS_Soldier_MG_EP1", [2081.8989, 8421.0713, -9.1552734e-005], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_2_EP1", [2089.239, 8424.0439, 0.00021362305], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Bonesetter_EP1", [2087.1265, 8432.5127, -0.00024414063], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_AT_EP1", [2079.7219, 8427.6602, 0.00036621094], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_AAT_EP1", [2076.2266, 8422.9365, 0.00042724609], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_3_EP1", [2094.1519, 8434.1797, -0.00012207031], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_4_EP1", [2077.3687, 8417.1318, 0.00036621094], [], 0, "NONE"];

_group_4 = ["static","Grp","","east"] call getGroup;
  _leader4 = _group_4 createUnit ["TK_INS_Soldier_AA_EP1", [783.24207, 8921.6943, 0.00030517578], [], 0, "NONE"];
  _leader4 setUnitRank "CORPORAL";
  _this = _group_4 createUnit ["TK_INS_Bonesetter_EP1", [794.03223, 8940.0068, -6.1035156e-005], [], 0, "NONE"];
  _this = _group_4 createUnit ["TK_INS_Soldier_MG_EP1", [775.39728, 8922.6465, 0.00073242188], [], 0, "NONE"];
  _this = _group_4 createUnit ["TK_INS_Soldier_2_EP1", [754.07959, 8898.8018, 0.00054931641], [], 0, "NONE"];
  _this = _group_4 createUnit ["TK_INS_Soldier_4_EP1", [761.69373, 8928.0518, 0.00036621094], [], 0, "NONE"];
  _this = _group_4 createUnit ["TK_INS_Soldier_AAT_EP1", [764.82635, 8902.5137, 0.00030517578], [], 0, "NONE"];
  _this = _group_4 createUnit ["TK_INS_Soldier_AT_EP1", [752.77393, 8908.8291, -0.00012207031], [], 0, "NONE"];

_group_5 = ["static","Grp","","east"] call getGroup;
  _leader5 = _group_5 createUnit ["TK_INS_Soldier_TL_EP1", [1355.9452, 9611.6582, 0.00030517578], [], 0, "NONE"];
  _leader5 setUnitRank "CORPORAL";
  _this = _group_5 createUnit ["TK_INS_Soldier_MG_EP1", [1344.8253, 9610.6006, -0.00012207031], [], 0, "NONE"];
  _this = _group_5 createUnit ["TK_INS_Soldier_2_EP1", [1356.5839, 9599.5332, -0.00036621094], [], 0, "NONE"];
  _this = _group_5 createUnit ["TK_INS_Soldier_AT_EP1", [1345.7271, 9622.458, 6.1035156e-005], [], 0, "NONE"];
  _this = _group_5 createUnit ["TK_INS_Bonesetter_EP1", [1366.8838, 9605.3066, 0], [], 0, "NONE"];
  _crew1 = _group_5 createUnit ["TK_Soldier_Crew_EP1", [1336.0688, 9617.6318, -0.00018310547], [], 0, "NONE"];
  _crew1 assignAsGunner _tank1;
  _crew1 moveInGunner _tank1;
  _crew2 = _group_5 createUnit ["TK_Soldier_Crew_EP1", [1333.4189, 9609.5039, 6.1035156e-005], [], 0, "NONE"];
  _crew2 assignAsDriver _tank1;
  _crew2 moveInDriver _tank1;
  _crew3 = _group_5 createUnit ["TK_Soldier_Crew_EP1", [1327.5922, 9617.9854, 0], [], 0, "NONE"];
  _crew3 assignAsCommander _tank1;
  _crew3 moveInCommander _tank1;

_this = _group_1 addWaypoint [[1477.8481, 8750.2939, 1.2668762], 0];
_this setWaypointType "SAD";
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_0 = _this;

_this = _group_4 addWaypoint [[1630.1544, 8799.7373, 0], 0];
_this setWaypointType "SAD";
_this setWaypointCombatMode "RED";
_this setWaypointFormation "VEE";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_1 = _this;

_this = _group_2 addWaypoint [[1508.1584, 8729.2256], 0];
_this setWaypointType "SAD";
_this setWaypointCombatMode "RED";
_this setWaypointFormation "VEE";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_2 = _this;

_this = _group_3 addWaypoint [[1608.8765, 8780.457, 0], 0];
_this setWaypointType "SAD";
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_3 = _this;

_this = _group_0 addWaypoint [[1544.3684, 8834.9629], 0];
_this setWaypointType "SAD";
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_4 = _this;

_this = _group_5 addWaypoint [[2061.5239, 9096.6748, 0], 0];
_this setWaypointType "SAD";
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_5 = _this;


