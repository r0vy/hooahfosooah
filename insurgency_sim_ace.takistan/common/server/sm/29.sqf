#include "functions.sqf"
current_playergroupname = playergroupname;

  _ammo1_at_base = false;

AmmoKilled = { 	
	_pos	= getPosATL(_this);
	sleep random 3;
	"Bo_GBU12_LGB" createVehicle _pos;
        sleep 2;
	["Task31","failed"] call SHK_Taskmaster_upd;
};


["Task31","Side Mission: Provision","<br/><br/>Provision<br/><br/>A C130 had to paradrop an ammo crate for some troops in Nur, but a strong wind brought the crate far from its destination point. Now those troops don't need those weapons anymore, and your team is tasked to find the ammo crate and bring it back to our HQ. It should have landed in the desert area south of Par-e Siah Oil Fields. Enemy units are probably on their way to the site.<br/><br/><br/>Idea: N.Rodrigues<br/>Creator: WhiteRaven",playergroupname] call SHK_Taskmaster_add;

  _ammo1 = createVehicle ["USSpecialWeapons_EP1", [8251.9424, 10345.851, -0.00022888184], [], 250, "NONE"];
  _ammo1 addEventHandler["Killed", { (_this select 0) spawn AmmoKilled; }];

waitUntil { nearestPlayers(getPosATL (_ammo1), 1000, true, "count") > 0 };

_group_0 = ["static","Grp","","east"] call getGroup;
  _this = _group_0 createUnit ["TK_INS_Soldier_2_EP1", [8462.3232, 10288.564, -4.5776367e-005], [], 0, "NONE"];
  _this setUnitRank "CORPORAL";
  _this = _group_0 createUnit ["TK_INS_Soldier_4_EP1", [8464.7109, 10293.277], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_AT_EP1", [8467.9072, 10289.027, 1.5258789e-005], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_MG_EP1", [8468.1631, 10280.571, -0.0001373291], [], 0, "NONE"];
  _this = _group_0 createUnit ["TK_INS_Soldier_MG_EP1", [8464.4033, 10284.133, 0.00010681152], [], 0, "NONE"];

_group_1 = ["static","Grp","","east"] call getGroup;
  _this = _group_1 createUnit ["TK_INS_Soldier_3_EP1", [8216.4971, 10526.055, -0.0012969971], [], 0, "NONE"];
  _this setUnitRank "CORPORAL";
  _this = _group_1 createUnit ["TK_INS_Soldier_EP1", [8217.7705, 10532.763, 0.00067138672], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_AAT_EP1", [8222.7764, 10523.257, 0.0014343262], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_AT_EP1", [8210.377, 10530.752, -0.00021362305], [], 0, "NONE"];
  _this = _group_1 createUnit ["TK_INS_Soldier_MG_EP1", [8225.7051, 10532.212, 0.00025939941], [], 0, "NONE"];

_group_2 = ["static","Grp","","east"] call getGroup;
  _this = _group_2 createUnit ["TK_INS_Soldier_AA_EP1", [8374.3164, 10149.846, 7.6293945e-005], [], 0, "NONE"];
  _this setUnitRank "CORPORAL";
  _this = _group_2 createUnit ["TK_INS_Soldier_2_EP1", [8378.833, 10145.928, 7.6293945e-005], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_AT_EP1", [8369.043, 10148.784, 0.00012207031], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_2_EP1", [8372.3711, 10143.483, -0.00019836426], [], 0, "NONE"];
  _this = _group_2 createUnit ["TK_INS_Soldier_MG_EP1", [8361.7188, 10144.68, -0.00012207031], [], 0, "NONE"];

_group_3 = ["static","Grp","","east"] call getGroup;
  _this = _group_3 createUnit ["TK_INS_Soldier_4_EP1", [8095.6641, 10178.995, 0], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_2_EP1", [8083.5703, 10186.487, 0], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_AT_EP1", [8108.9111, 10192.828, 0], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_MG_EP1", [8087.0254, 10165.738, 0], [], 0, "NONE"];
  _this = _group_3 createUnit ["TK_INS_Soldier_MG_EP1", [8067.6631, 10169.659, 1.5258789e-005], [], 0, "NONE"];



  _uralzu = createVehicle ["Ural_ZU23_TK_GUE_EP1", [8279.2764, 10336.008, -0.00022888184], [], 250, "NONE"];
  _uralzu setPos [8279.2764, 10336.008, -0.00022888184];
_group_4 = ["static","Grp","","east"] call getGroup;
_crew1 = _group_4 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew1 assignAsGunner _uralzu;
_crew1 moveInGunner _uralzu;
_crew2 = _group_4 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew2 assignAsDriver _uralzu;
_crew2 moveInDriver _uralzu;


  _uazags = createVehicle ["UAZ_AGS30_TK_EP1", [8168.085, 10257.662, -6.1035156e-005], [], 200, "NONE"];
  _uazags setPos [8168.085, 10257.662, -6.1035156e-005];
_group_5 = ["static","Grp","","east"] call getGroup;
_crew3 = _group_5 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew3 assignAsGunner _uazags;
_crew3 moveInGunner _uazags;
_crew4 = _group_5 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew4 assignAsDriver _uazags;
_crew4 moveInDriver _uazags;


  _offgun = createVehicle ["Offroad_DSHKM_TK_GUE_EP1", [8374.4404, 10427.208, -0.0013122559], [], 200, "NONE"];
  _offgun setPos [8374.4404, 10427.208, -0.0013122559];
_group_6 = ["static","Grp","","east"] call getGroup;
_crew5 = _group_6 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew5 assignAsGunner _offgun;
_crew5 moveInGunner _offgun;
_crew6 = _group_6 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew6 assignAsDriver _offgun;
_crew6 moveInDriver _offgun;

  _offrpg = createVehicle ["Offroad_SPG9_TK_GUE_EP1", [8202.1338, 10420.326, 0.00022888184], [], 200, "NONE"];
  _offrgp setPos [8202.1338, 10420.326, 0.00022888184];
_group_7 = ["static","Grp","","east"] call getGroup;
_crew7 = _group_7 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew7 assignAsGunner _offrpg;
_crew7 moveInGunner _offrpg;
_crew8 = _group_7 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew8 assignAsDriver _offrpg;
_crew8 moveInDriver _offrpg;

  _tank1 = createVehicle ["T55_TK_EP1", [8266.9014, 10330.738, -7.6293945e-005], [], 200, "NONE"];
  _tank1 setPos [8266.9014, 10330.738, -7.6293945e-005];
_group_8 = ["static","Grp","","east"] call getGroup;
_crew9 = _group_8 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew9 assignAsGunner _tank1;
_crew9 moveInGunner _tank1;
_crew10 = _group_8 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_crew10 assignAsDriver _tank1;
_crew10 moveInDriver _tank1;
_crew11 = _group_8 createUnit ["TK_Soldier_Crew_EP1", [11646.893, 3886.4973, 0], [], 0, "NONE"];
_crew11 assignAsCommander _tank1;
_crew11 moveInCommander _tank1;


_this = _group_3 addWaypoint [[8245.4238, 10358.801], 100];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_0 = _this;

_this = _group_3 addWaypoint [[8136.1069, 10156.182], 100];
_this setWaypointType "CYCLE";
_waypoint_1 = _this;

_this = _group_2 addWaypoint [[8428.334, 10441.816], 100];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_2 = _this;

_this = _group_2 addWaypoint [[8320.5176, 10170.008], 100];
_this setWaypointType "CYCLE";
_waypoint_3 = _this;

_this = _group_1 addWaypoint [[8042.8633, 10304.735], 100];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "LINE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "AWARE";
_waypoint_4 = _this;

_this = _group_1 addWaypoint [[8249.2412, 10545.876], 100];
_this setWaypointType "CYCLE";
_waypoint_5 = _this;

_this = _group_0 addWaypoint [[8055.5405, 10472.988, 0], 100];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "NORMAL";
_this setWaypointBehaviour "AWARE";
_waypoint_6 = _this;

_this = _group_0 addWaypoint [[8441.6816, 10283.784, 0], 100];
_this setWaypointType "CYCLE";
_waypoint_7 = _this;


while {!_ammo1_at_base} do {

	if (_ammo1 distance vehicleServicePoint < 20) then {
	["Task31","succeeded"] call SHK_Taskmaster_upd;
	{_x addscore +5;} foreach units current_playergroupname;
	_ammo1_at_base = true;
	};
};