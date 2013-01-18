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


["Task29","Side Mission: Vulture's Nest","<br/><br/>Vulture's Nest<br/><br/>Recent insurgent activity near Nagara suggests the possibility of the presence of an insurgent base near that town. Our intelligence services believe that an organized group of former Takistani Army Special Forces are camping in the area south-west of Nagara, in the Naygul Valley. Your team is tasked with scouting the area and neutralizing any enemy activity.<br/><br/>Destroy any vehicle and ammo, take no prisoners.<br/><br/><br/>Creator: WhiteRaven",playergroupname] call SHK_Taskmaster_add;


  _this = createVehicle ["Land_fortified_nest_big_EP1", [1442.1886, 8744.3945, 0.00033569336], [], 0, "CAN_COLLIDE"];
  _this setPos [1442.1886, 8744.3945, 0.00033569336];

  _this = createVehicle ["Land_CamoNetVar_EAST", [1626.1605, 8793.2715, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1626.1605, 8793.2715, 6.1035156e-005];

  _this = createVehicle ["Land_CamoNetVar_EAST", [1639.7609, 8804.6924, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1639.7609, 8804.6924, -7.6293945e-005];

  _this = createVehicle ["Land_Misc_Garb_Heap_EP1", [1688.5286, 8842.9219, 0.00018310547], [], 0, "CAN_COLLIDE"];
  _this setPos [1688.5286, 8842.9219, 0.00018310547];

_mine1 = createVehicle ["Land_IED_v2_PMC", [1688.5286, 8842.9219, 0.00018310547], [], 0, "NONE"];
_mine1 setVehicleInit format["det1 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 6'];",BON_IED_PATH];
_mine1 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";
processInitCommands;

  _this = createVehicle ["Land_Misc_Garb_Heap_EP1", [1698.1642, 8850.5234, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1698.1642, 8850.5234, 4.5776367e-005];

  _this = createVehicle ["Land_bags_EP1", [1637.5999, 8806.6396, 0.00015258789], [], 0, "CAN_COLLIDE"];
  _this setPos [1637.5999, 8806.6396, 0.00015258789];

  _this = createVehicle ["Land_bags_EP1", [1622.4332, 8794.9629, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1622.4332, 8794.9629, -3.0517578e-005];

  _this = createVehicle ["Land_bags_EP1", [1640.8198, 8803.2822, 0.00010681152], [], 0, "CAN_COLLIDE"];
  _this setPos [1640.8198, 8803.2822, 0.00010681152];


waitUntil { nearestPlayers(getPosATL (_mine1), 1000, true, "count") > 0 };

  _this = createVehicle ["ACamp_EP1", [1625.2142, 8811.6465, 0], [], 0, "CAN_COLLIDE"];
  _this setPos [1625.2142, 8811.6465, 0];

  _this = createVehicle ["ACamp", [1631.338, 8811.8818, -0.00024414063], [], 0, "CAN_COLLIDE"];
  _this setPos [1631.338, 8811.8818, -0.00024414063];

  _this = createVehicle ["ACamp", [1609.8258, 8804.5723, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1609.8258, 8804.5723, 9.1552734e-005];

  _this = createVehicle ["ACamp", [1614.9061, 8809.9375, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1614.9061, 8809.9375, 3.0517578e-005];

  _this = createVehicle ["ACamp", [1647.8762, 8820.6533, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1647.8762, 8820.6533, -4.5776367e-005];

  _this = createVehicle ["ACamp", [1638.7354, 8817.3926, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1638.7354, 8817.3926, -4.5776367e-005];

  _this = createVehicle ["ACamp", [1629.1217, 8807.1797, -0.00036621094], [], 0, "CAN_COLLIDE"];
  _this setPos [1629.1217, 8807.1797, -0.00036621094];

  _this = createVehicle ["ACamp", [1604.1515, 8810.2285, 0.00015258789], [], 0, "CAN_COLLIDE"];
  _this setPos [1604.1515, 8810.2285, 0.00015258789];

  _this = createVehicle ["ACamp", [1612.3965, 8789.9102, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1612.3965, 8789.9102, 9.1552734e-005];

  _this = createVehicle ["ACamp", [1631.9879, 8787.8564, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1631.9879, 8787.8564, -7.6293945e-005];

  _this = createVehicle ["ACamp", [1642.147, 8796.1855, 0.00015258789], [], 0, "CAN_COLLIDE"];
  _this setPos [1642.147, 8796.1855, 0.00015258789];

  _this = createVehicle ["ACamp", [1415.099, 8742.5967, -0.0009765625], [], 0, "CAN_COLLIDE"];
  _this setPos [1415.099, 8742.5967, -0.0009765625];

  _this = createVehicle ["ACamp", [1421.5867, 8749.1152, 0.0012817383], [], 0, "CAN_COLLIDE"];
  _this setPos [1421.5867, 8749.1152, 0.0012817383];

  _this = createVehicle ["ACamp", [1431.9526, 8736.8125, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1431.9526, 8736.8125, 6.1035156e-005];

  _this = createVehicle ["ACamp", [1431.9314, 8756.6338, 0.00024414063], [], 0, "CAN_COLLIDE"];
  _this setPos [1431.9314, 8756.6338, 0.00024414063];

  _this = createVehicle ["ACamp", [1443.0637, 8731.5469, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [1443.0637, 8731.5469, 6.1035156e-005];


_group_0 = ["static","Grp","","east"] call getGroup;
  _leader0 = _group_0 createUnit ["TK_Commander_EP1", [1430.4558, 8748.9512, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _leader0 setUnitRank "LIEUTENANT";
  _this = _group_0 createUnit ["TK_Special_Forces_EP1", [1424.6981, 8745.0459, 0.00015258789], [], 0, "CAN_COLLIDE"];
  _this = _group_0 createUnit ["TK_Special_Forces_EP1", [1434.1334, 8746.3008, 0.00012207031], [], 0, "CAN_COLLIDE"];
  _this = _group_0 createUnit ["TK_Special_Forces_MG_EP1", [1424.8799, 8751.5195, 0.00036621094], [], 0, "CAN_COLLIDE"];
  _this = _group_0 createUnit ["TK_Special_Forces_EP1", [1430.1448, 8744.5332, 0.00015258789], [], 0, "CAN_COLLIDE"];
  _this = _group_0 createUnit ["TK_Special_Forces_MG_EP1", [1427.9663, 8753.958, 9.1552734e-005], [], 0, "CAN_COLLIDE"];

_group_1 = ["static","Grp","","east"] call getGroup;
  _leader1 = _group_1 createUnit ["TK_Special_Forces_TL_EP1", [1599.981, 8804.4336, 0.00021362305], [], 0, "CAN_COLLIDE"];
  _leader1 setUnitRank "LIEUTENANT";
  _this = _group_1 createUnit ["TK_Special_Forces_MG_EP1", [1603.7257, 8796.6348, 0], [], 0, "CAN_COLLIDE"];
  _this = _group_1 createUnit ["TK_Special_Forces_MG_EP1", [1606.8042, 8802.2422, -0.00018310547], [], 0, "CAN_COLLIDE"];
  _this = _group_1 createUnit ["TK_Special_Forces_EP1", [1599.1394, 8810.04, 0.00018310547], [], 0, "CAN_COLLIDE"];
  _this = _group_1 createUnit ["TK_Special_Forces_EP1", [1594.7167, 8799.3945, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _this = _group_1 createUnit ["TK_Special_Forces_EP1", [1605.9758, 8807.9092, 0.00012207031], [], 0, "CAN_COLLIDE"];
  _this = _group_1 createUnit ["TK_Special_Forces_EP1", [1591.3802, 8809.9336, 0.0002746582], [], 0, "CAN_COLLIDE"];

_group_2 = ["static","Grp","","east"] call getGroup;
  _leader2 = _group_2 createUnit ["TK_Soldier_SniperH_EP1", [1729.4366, 9081.7012, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _leader2 setUnitRank "CORPORAL";
  _this = _group_2 createUnit ["TK_Soldier_AA_EP1", [1728.7863, 9086.7412, 0.00045776367], [], 0, "CAN_COLLIDE"];
  _this = _group_2 createUnit ["TK_Soldier_Spotter_EP1", [1726.7286, 9084.6182, 3.0517578e-005], [], 0, "CAN_COLLIDE"];

_group_3 = ["static","Grp","","east"] call getGroup;
  _leader3 = _group_3 createUnit ["TK_Soldier_Sniper_Night_EP1", [2023.7174, 8801.5107, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _leader3 setUnitRank "CORPORAL";
  _this = _group_3 createUnit ["TK_Soldier_Spotter_EP1", [2024.3217, 8805.6846, -3.0517578e-005], [], 0, "CAN_COLLIDE"];

_group_4 = ["static","Grp","","east"] call getGroup;
  _leader4 = _group_4 createUnit ["TK_Soldier_Sniper_Night_EP1", [774.38635, 8825.2969, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _leader4 setUnitRank "CORPORAL";
  _this = _group_4 createUnit ["TK_Soldier_AA_EP1", [772.09106, 8824.0732, -0.00061035156], [], 0, "CAN_COLLIDE"];

_group_6 = createGroup _center_0;
  _leader6 = _group_6 createUnit ["TK_Soldier_Sniper_Night_EP1", [1153.7631, 8107.8799, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _leader6 setUnitRank "SERGEANT";
  _this = _group_6 createUnit ["TK_Soldier_AA_EP1", [1158.4436, 8107.2358, 6.1035156e-005], [], 0, "CAN_COLLIDE"];

_group_7 = createGroup _center_0;
  _leader7 = _group_7 createUnit ["TK_Special_Forces_EP1", [1421.989, 8790.2842, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _leader7 setUnitRank "CORPORAL";
  _this = _group_7 createUnit ["TK_Special_Forces_MG_EP1", [1418.1168, 8792.8154, 0.0007019043], [], 0, "CAN_COLLIDE"];
  _this = _group_7 createUnit ["TK_Special_Forces_EP1", [1416.9314, 8788.8662, 0.00030517578], [], 0, "CAN_COLLIDE"];
  _this = _group_7 createUnit ["TK_Special_Forces_EP1", [1414.0211, 8791.5996, -0.0007019043], [], 0, "CAN_COLLIDE"];
  _this = _group_7 createUnit ["TK_Special_Forces_EP1", [1423.0437, 8794.0498, -0.00036621094], [], 0, "CAN_COLLIDE"];


_this = _group_0 addWaypoint [[1450.8489, 8749.668, -9.1552734e-005], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_1 = _this;

_this = _group_1 addWaypoint [[1700.4647, 8839.0732, 0.0001373291], 0];
_this setWaypointCombatMode "WHITE";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "AWARE";
_waypoint_2 = _this;

_this = _group_1 addWaypoint [[1585.4636, 8792.6279, 9.1552734e-005], 0];
_this setWaypointType "CYCLE";
_waypoint_3 = _this;

_this = _group_7 addWaypoint [[1601.1301, 8868.2139, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "AWARE";
_waypoint_4 = _this;

_this = _group_7 addWaypoint [[1406.8866, 8784.6016, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_5 = _this;

_this = _group_2 addWaypoint [[1251.392, 8885.7441, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_6 = _this;

_this = _group_2 addWaypoint [[1738.0673, 9079.3721, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_7 = _this;

_this = _group_3 addWaypoint [[1559.9198, 8487.4131, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_8 = _this;

_this = _group_3 addWaypoint [[2034.8636, 8805.1631, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_9 = _this;

_this = _group_6 addWaypoint [[2474.5884, 8647.7588], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_10 = _this;

_this = _group_6 addWaypoint [[1167.7894, 8102.5718, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_11 = _this;

_this = _group_4 addWaypoint [[1610.1885, 9241.2627, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_12 = _this;

_this = _group_4 addWaypoint [[759.00403, 8832.3789, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_13 = _this;

  _ammo1 = createVehicle ["TKBasicAmmunitionBox_EP1", [1624.3156, 8794.2578, 0], [], 0, "CAN_COLLIDE"];
  _ammo1 setPos [1624.3156, 8794.2578, 0];
  _ammo1 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

  _ammo2 = createVehicle ["TKBasicWeapons_EP1", [1626.9874, 8793.1543, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
  _ammo2 setPos [1626.9874, 8793.1543, 9.1552734e-005];
  _ammo2 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

  _ammo3 = createVehicle ["TKLaunchers_EP1", [1622.4283, 8792.0947, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _ammo3 setPos [1622.4283, 8792.0947, 3.0517578e-005];
  _ammo3 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

  _ammo4 = createVehicle ["TKOrdnanceBox_EP1", [1643.2631, 8805.9199, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
  _ammo4 setPos [1643.2631, 8805.9199, -7.6293945e-005];
  _ammo4 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

  _ammo5 = createVehicle ["TKSpecialWeapons_EP1", [1637.0232, 8803.4766, 0.00010681152], [], 0, "CAN_COLLIDE"];
  _ammo5 setPos [1637.0232, 8803.4766, 0.00010681152];
  _ammo5 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];


while {alive _ammo1; alive _ammo2; alive _ammo3; alive _ammo4; alive _ammo5} do {
sleep 10;
};

["Task29","succeeded"] call SHK_Taskmaster_upd; 
{_x addscore +5;} foreach units current_playergroupname;


[current_playergroupname] execVM ("common\server\sm\27b.sqf");