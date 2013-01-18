#include "functions.sqf"
current_playergroupname = playergroupname;


["Task30","Side Mission: Veteran Beavers","<br/><br/>Veteran Beavers<br/><br/>Aerial reconnaissance reports the presence of a roadblock in the Sar-e Sang Pass. This is completely blocking road communication between Sahke and Chack Chak. This is absolutely intolerable, and the roadblock must be removed as soon as possible. The drone conducting the reconnaissance was damaged and forced to return to base, so we don't have any more information.<br/><br/>Destroy the roadblock and neutralize any opposition.<br/><br/><br/>Creator: WhiteRaven",playergroupname] call SHK_Taskmaster_add;


  _msc = createVehicle ["Haystack", [4025.6084, 3149.6199, -0.00012207031], [], 0, "CAN_COLLIDE"];
  _msc setDir -40.563026;
  _msc setPos [4025.6084, 3149.6199, -0.00012207031];

waitUntil { nearestPlayers(getPosATL (_msc), 1000, true, "count") > 0 };

  _this = createVehicle ["Land_Dirthump03", [3993.0881, 3127.5823, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [3993.0881, 3127.5823, -3.0517578e-005];

  _this = createVehicle ["Land_Dirthump03_EP1", [4025.0061, 3161.27, -0.00015258789], [], 0, "CAN_COLLIDE"];
  _this setPos [4025.0061, 3161.27, -0.00015258789];

  _this = createVehicle ["Land_Campfire_burning", [4036.1633, 3126.99, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [4036.1633, 3126.99, 9.1552734e-005];

  _this = createVehicle ["Land_Campfire_burning", [4020.446, 3115.5403, 0.00033569336], [], 0, "CAN_COLLIDE"];
  _this setPos [4020.446, 3115.5403, 0.00033569336];

  _this = createVehicle ["Land_Campfire_burning", [3999.8779, 3165.3398, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [3999.8779, 3165.3398, 9.1552734e-005];

  _this = createVehicle ["Land_Campfire_burning", [3983.2107, 3151.8616, 0.00024414063], [], 0, "CAN_COLLIDE"];
  _this setPos [3983.2107, 3151.8616, 0.00024414063];

  _this = createVehicle ["Land_Campfire_burning", [3959.5444, 3112.1924, -0.00012207031], [], 0, "CAN_COLLIDE"];
  _this setPos [3959.5444, 3112.1924, -0.00012207031];

  _this = createVehicle ["Land_Campfire_burning", [4035.7034, 3090.4204, 0.00015258789], [], 0, "CAN_COLLIDE"];
  _this setPos [4035.7034, 3090.4204, 0.00015258789];

  _this = createVehicle ["Land_Campfire_burning", [4062.9102, 3095.6848, 0.00021362305], [], 0, "CAN_COLLIDE"];
  _this setPos [4062.9102, 3095.6848, 0.00021362305];

  _this = createVehicle ["Land_Campfire_burning", [3975.3262, 3189.4832, -0.00045776367], [], 0, "CAN_COLLIDE"];
  _this setPos [3975.3262, 3189.4832, -0.00045776367];

  _this = createVehicle ["Land_Campfire_burning", [3959.5349, 3178.844, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [3959.5349, 3178.844, 9.1552734e-005];

  _this = createVehicle ["Hhedgehog_concrete", [3979.814, 3118.365, -0.0002746582], [], 0, "CAN_COLLIDE"];
  _this setPos [3979.814, 3118.365, -0.0002746582];

  _this = createVehicle ["Hhedgehog_concrete", [3971.8455, 3117.1726, -0.00012207031], [], 0, "CAN_COLLIDE"];
  _this setPos [3971.8455, 3117.1726, -0.00012207031];

  _this = createVehicle ["Hhedgehog_concrete", [3963.6633, 3116.2544], [], 0, "CAN_COLLIDE"];
  _this setDir -9.8625669;
  _this setPos [3963.6633, 3116.2544];

  _this = createVehicle ["Hhedgehog_concrete", [3955.6985, 3114.334, 0.00012207031], [], 0, "CAN_COLLIDE"];
  _this setDir -16.560585;
  _this setPos [3955.6985, 3114.334, 0.00012207031];

  _this = createVehicle ["Hhedgehog_concrete", [3948.0439, 3112.0645, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _this setDir -15.751398;
  _this setPos [3948.0439, 3112.0645, -3.0517578e-005];

_group_3 = ["static","Grp","","east"] call getGroup;
  _leader3 = _group_3 createUnit ["TK_Special_Forces_TL_EP1", [3809.5906, 3093.5828, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _leader3 setUnitRank "SERGEANT";
  _this = _group_3 createUnit ["TK_Special_Forces_EP1", [3812.553, 3087.467, -0.00018310547], [], 0, "CAN_COLLIDE"];
  _this = _group_3 createUnit ["TK_Special_Forces_MG_EP1", [3805.1917, 3090.6658, 0.00012207031], [], 0, "CAN_COLLIDE"];
  _this = _group_3 createUnit ["TK_Special_Forces_MG_EP1", [3801.1899, 3086.9922, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _this = _group_3 createUnit ["TK_Special_Forces_EP1", [3813.8831, 3082.9487, 6.1035156e-005], [], 0, "CAN_COLLIDE"];

_group_4 = ["static","Grp","","east"] call getGroup;
  _leader4 = _group_4 createUnit ["TK_Special_Forces_TL_EP1", [3923.0359, 2970.3679, -0.00018310547], [], 0, "CAN_COLLIDE"];
  _leader4 setUnitRank "SERGEANT";
  _this = _group_4 createUnit ["TK_Special_Forces_EP1", [3919.3889, 2969.6348, -0.00024414063], [], 0, "CAN_COLLIDE"];
  _this = _group_4 createUnit ["TK_Special_Forces_EP1", [3924.98, 2967.9136, -0.00036621094], [], 0, "CAN_COLLIDE"];
  _this = _group_4 createUnit ["TK_Special_Forces_MG_EP1", [3915.5237, 2968.5361, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _this = _group_4 createUnit ["TK_Special_Forces_MG_EP1", [3926.1318, 2963.9143, 6.1035156e-005], [], 0, "CAN_COLLIDE"];

_group_5 = ["static","Grp","","east"] call getGroup;
  _leader5 = _group_5 createUnit ["TK_Special_Forces_TL_EP1", [4072.3401, 3237.4148, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _leader5 setUnitRank "SERGEANT";
  _this = _group_5 createUnit ["TK_Special_Forces_EP1", [4076.6057, 3237.033, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _this = _group_5 createUnit ["TK_Special_Forces_EP1", [4073.0029, 3242.8054, -0.00012207031], [], 0, "CAN_COLLIDE"];
  _this = _group_5 createUnit ["TK_Special_Forces_EP1", [4081.4224, 3237.3362, 0.00012207031], [], 0, "CAN_COLLIDE"];
  _this = _group_5 createUnit ["TK_Special_Forces_MG_EP1", [4074.5811, 3247.2402, 0.00012207031], [], 0, "CAN_COLLIDE"];

_group_6 = ["static","Grp","","east"] call getGroup;
  _leader6 = _group_6 createUnit ["TK_Special_Forces_EP1", [4114.5454, 2892.2893, -0.00030517578], [], 0, "CAN_COLLIDE"];
  _leader6 setUnitRank "SERGEANT";
  _this = _group_6 createUnit ["TK_Special_Forces_MG_EP1", [4117.3188, 2889.4956, -6.1035156e-005], [], 0, "CAN_COLLIDE"];

_group_8 = ["static","Grp","","east"] call getGroup;
  _leader8 = _group_8 createUnit ["TK_Soldier_Sniper_EP1", [4375.3535, 3196.9023, 0.00036621094], [], 0, "CAN_COLLIDE"];
  _leader8 setUnitRank "CORPORAL";
  _this = _group_8 createUnit ["TK_Soldier_Sniper_Night_EP1", [4379.3643, 3197.6013, -6.1035156e-005], [], 0, "CAN_COLLIDE"];

_group_9 = ["static","Grp","","east"] call getGroup;
  _leader9 = _group_9 createUnit ["TK_Soldier_SniperH_EP1", [3836.698, 2882.6902], [], 0, "CAN_COLLIDE"];
  _leader9 setUnitRank "CORPORAL";
  _this = _group_9 createUnit ["TK_INS_Soldier_AA_EP1", [3838.2627, 2881.7949, 0.00012207031], [], 0, "CAN_COLLIDE"];

_group_10 = ["static","Grp","","east"] call getGroup;
  _leader10 = _group_10 createUnit ["TK_Special_Forces_TL_EP1", [4390.0947, 2966.8767, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _leader10 setUnitRank "CORPORAL";
  _this = _group_10 createUnit ["TK_Special_Forces_EP1", [4393.2183, 2970.1147, 0.00018310547], [], 0, "CAN_COLLIDE"];
  _this = _group_10 createUnit ["TK_Special_Forces_EP1", [4394.2803, 2963.3672, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _this = _group_10 createUnit ["TK_Special_Forces_MG_EP1", [4398.7954, 2974.335], [], 0, "CAN_COLLIDE"];
  _this = _group_10 createUnit ["TK_Special_Forces_EP1", [4402.3809, 2961.5786], [], 0, "CAN_COLLIDE"];

_group_11 = ["static","Grp","","east"] call getGroup;
  _leader11 = _group_11 createUnit ["TK_Special_Forces_EP1", [3980.3894, 3200.5088, 0.00021362305], [], 0, "CAN_COLLIDE"];
  _leader11 setUnitRank "CORPORAL";
  _this = _group_11 createUnit ["TK_Special_Forces_MG_EP1", [3980.9045, 3197.8203, 0.00021362305], [], 0, "CAN_COLLIDE"];




  _kord1 = createVehicle ["KORD_TK_EP1", [3986.0322, 3013.2458, 0.00036621094], [], 0, "CAN_COLLIDE"];
  _kord1 setDir 64.6633;
  _kord1 setPos [3986.0322, 3013.2458, 0.00036621094];

  _kord2 = createVehicle ["KORD_TK_EP1", [4050.9229, 3237.1418, 0.00030517578], [], 0, "CAN_COLLIDE"];
  _kord2 setDir -142.52452;
  _kord2 setPos [4050.9229, 3237.1418, 0.00030517578];

  _ags1 = createVehicle ["AGS_TK_GUE_EP1", [4334.9854, 3040.0874], [], 100, "CAN_COLLIDE"];
  _ags1 setDir 290.17119;
  _ags1 setPos [4334.9854, 3040.0874];

  _ags2 = createVehicle ["AGS_TK_GUE_EP1", [3860.0798, 3071.0767, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _ags2 setDir 54.17119;
  _ags2 setPos [3860.0798, 3071.0767, -6.1035156e-005];

  _igla1 = createVehicle ["Igla_AA_pod_TK_EP1", [4390.8281, 3196.0432, -0.00012207031], [], 0, "CAN_COLLIDE"];
  _igla1 setPos [4390.8281, 3196.0432, -0.00012207031];

_group_12 = ["static","Grp","","east"] call getGroup;
_gunner1 = _group_12 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_gunner1 assignAsGunner _kord1;
_gunner1 moveInGunner _kord1;

_gunner2 = _group_12 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_gunner2 assignAsGunner _kord2;
_gunner2 moveInGunner _kord2;

_gunner3 = _group_12 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_gunner3 assignAsGunner _ags1;
_gunner3 moveInGunner _ags1;

_gunner4 = _group_12 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_gunner4 assignAsGunner _ags2;
_gunner4 moveInGunner _ags2;

_group_13 = ["static","Grp","","east"] call getGroup;
_gunner5 = _group_13 createUnit ["TK_Soldier_Crew_EP1", [11650.443, 3886.8948, 0.00024414063], [], 0, "NONE"];
_gunner5 assignAsGunner _igla1;
_gunner5 moveInGunner _igla1;



  _this = createVehicle ["BMP2Wreck", [4058.4229, 3097.4263, 0], [], 0, "CAN_COLLIDE"];
  _this setPos [4058.4229, 3097.4263, 0];
_mine1 = createVehicle ["Land_IED_v2_PMC", [4058.4229, 3097.4263, 0], [], 0, "NONE"];
_mine1 setVehicleInit format["det1 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH]; 
_mine1 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


  _this = createVehicle ["LADAWreck", [3944.5386, 3212.0979, -0.00033569336], [], 0, "CAN_COLLIDE"];
  _this setPos [3944.5386, 3212.0979, -0.00033569336];
_mine2 = createVehicle ["Land_IED_v2_PMC", [3944.5386, 3212.0979, -0.00033569336], [], 0, "NONE"];
_mine2 setVehicleInit format["det1 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine2 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


  _this = createVehicle ["SKODAWreck", [4009.7014, 3152.6602, -0.00012207031], [], 0, "CAN_COLLIDE"];
  _this setPos [4009.7014, 3152.6602, -0.00012207031];
_mine3 = createVehicle ["Land_IED_v2_PMC", [4009.7014, 3152.6602, -0.00012207031], [], 0, "NONE"];
_mine3 setVehicleInit format["det1 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine3 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


  _pipe1 = createVehicle ["Land_Misc_IronPipes_EP1", [4008.3745, 3136.4502, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _pipe1 setDir -207.42375;
  _pipe1 setPos [4008.3745, 3136.4502, -3.0517578e-005];
_mine4 = createVehicle ["Land_IED_v2_PMC", [4008.3745, 3136.4502, -3.0517578e-005], [], 0, "NONE"];
_mine4 setVehicleInit format["det1 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH]; 
_mine4 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";

  _this = createVehicle ["Land_Misc_Rubble_EP1", [4011.3728, 3121.9429, 0.00033569336], [], 0, "CAN_COLLIDE"];
  _this setDir 42.995472;
  _this setPos [4011.3728, 3121.9429, 0.00033569336];
_mine5 = createVehicle ["Land_IED_v2_PMC", [4011.3728, 3121.9429, 0.00033569336], [], 0, "NONE"];
_mine5 setVehicleInit format["det1 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH]; 
_mine5 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


processInitCommands;

  _pipe2 = createVehicle ["Land_Misc_IronPipes_EP1", [4014.4199, 3141.0093, -0.00012207031], [], 0, "CAN_COLLIDE"];
  _pipe2 setDir -33.656158;
  _pipe2 setPos [4014.4199, 3141.0093, -0.00012207031];


  _this = createVehicle ["T72WreckTurret", [4045.4087, 3071.4485, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _this setPos [4045.4087, 3071.4485, -3.0517578e-005];

  _this = createVehicle ["datsun02Wreck", [3966.3728, 3164.0085], [], 0, "CAN_COLLIDE"];
  _this setPos [3966.3728, 3164.0085];


_this = _group_6 addWaypoint [[4092.7083, 3036.8813, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "AWARE";
_waypoint_3 = _this;

_this = _group_6 addWaypoint [[4121.3672, 2886.5845, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_4 = _this;

_this = _group_4 addWaypoint [[3927.3079, 2979.2053, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_6 = _this;

_this = _group_3 addWaypoint [[3810.3523, 3096.6621, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_8 = _this;

_this = _group_10 addWaypoint [[4167.7378, 2918.0649, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "STAG COLUMN";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "AWARE";
_waypoint_9 = _this;

_this = _group_10 addWaypoint [[4407.2964, 2971.0542, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_10 = _this;

_this = _group_8 addWaypoint [[4108.1377, 3237.0698, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_11 = _this;

_this = _group_8 addWaypoint [[4419.7476, 3192.3257], 0];
_this setWaypointType "CYCLE";
_waypoint_12 = _this;

_this = _group_9 addWaypoint [[3867.9883, 2893.0747, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_13 = _this;

_this = _group_5 addWaypoint [[4067.5889, 3233.3848, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "STEALTH";
_waypoint_14 = _this;


_this = _group_12 addWaypoint [[3930.3889, 3288.5811, 0], 0];
_this setWaypointCombatMode "RED";
_this setWaypointFormation "WEDGE";
_this setWaypointSpeed "LIMITED";
_this setWaypointBehaviour "AWARE";
_waypoint_15 = _this;

_this = _group_12 addWaypoint [[3982.0781, 3198.8525, 0], 0];
_this setWaypointType "CYCLE";
_waypoint_16 = _this;


while {alive _pipe1; alive _pipe2} do {
sleep 10;
};

["Task30","succeeded"] call SHK_Taskmaster_upd; 
{_x addscore +5;} foreach units current_playergroupname;
