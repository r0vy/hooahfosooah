#include "functions.sqf"
current_playergroupname = playergroupname;

["Task25","Side Mission: Mine..mine..mine","<br/><br/>Mine..mine..mine<br/><br/>Insurgency forces have wreaked havoc on the local Takistan population by placing IEDs across Hazar Bagh, so much so that the local civilians want to leave the area. Locals say there at least 10 suspicious items, maybe even a dozen around the place.<br/><br/>You have been given some brief training on how to dispose of the IEDS, you MUST approach any suspected IED prone and move at a crawl (since civilians have been moving around these IEDs are suspected to be less sensitive than normal which should allow you to move around slowly), if you are near to an IED you can use a delayed detonation option and you have 60 seconds before the controlled explosion occurs, remember you must always move at a SLOW crawl around IEDs. Always keep yourselves well spread out to avoid one device taking out your squad...and tread carefully!<br/><br/>Visit Hazar Bagh, remove any Insurgency forces and clear the village of any explosive devices.",playergroupname] call SHK_Taskmaster_add;


_msc = createVehicle ["Land_Misc_Garb_Heap_EP1", [11632.00,2517.00], [], 0, "NONE"];
_msc2 = createVehicle ["Misc_TyreHeapEP1", [11844.00,2598.00], [], 0, "NONE"];

waitUntil { nearestPlayers(getPosATL (_msc2), 1000, true, "count") > 0 };


_mine1 = createVehicle ["Land_IED_v2_PMC", [11630.00,2532.00], [], 0, "NONE"];
_mine1 setVehicleInit format["mineaction1 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine1 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


_mine2 = createVehicle ["Land_IED_v3_PMC", [11724.00,2567.00], [], 0, "NONE"];
_mine2 setVehicleInit format["mineaction2 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine2 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


_mine3 = createVehicle ["Land_IED_v4_PMC", [11846.00,2586.00], [], 0, "NONE"];
_mine3 setVehicleInit format["mineaction3 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine3 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


_mine4 = createVehicle ["Land_IED_v1_PMC", [11786.00,2609.00], [], 0, "NONE"];
_mine4 setVehicleInit format["mineaction4 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine4 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";

_mine5 = createVehicle ["Land_IED_v2_PMC", [11755.00,2580.00], [], 0, "NONE"];
_mine5 setVehicleInit format["mineaction5 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine5 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";

_mine6 = createVehicle ["Land_IED_v3_PMC", [11820.00,2634.00], [], 0, "NONE"];
_mine6 setVehicleInit format["mineaction6 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine6 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


_mine7 = createVehicle ["Land_IED_v4_PMC", [11944.00,2629.00], [], 0, "NONE"];
_mine7 setVehicleInit format["mineaction7 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine7 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


_mine8 = createVehicle ["Land_IED_v1_PMC", [11895.00,2619.00], [], 0, "NONE"];
_mine8 setVehicleInit format["mineaction8 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine8 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";

_mine9 = createVehicle ["Land_IED_v1_PMC", [11853.00,2606.00], [], 0, "NONE"];
_mine9 setVehicleInit format["mineaction9 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine9 execFSM (BON_IED_PATH+"mine_sensor.fsm");

_mine10 = createVehicle ["Land_IED_v4_PMC", [11906.00,2548.00], [], 0, "NONE"];
_mine10 setVehicleInit format["mineaction10 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine10 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";

_mine11 = createVehicle ["Land_IED_v1_PMC", [11821.00,2568.00], [], 0, "NONE"];
_mine11 setVehicleInit format["mineaction11 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine11 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";


_mine12 = createVehicle ["Land_IED_v3_PMC", [11749.00,2556.00], [], 0, "NONE"];
_mine12 setVehicleInit format["mineaction12 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine12 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";

_mine13 = createVehicle ["Land_IED_v3_PMC", [11807.00,2574.00], [], 0, "NONE"];
_mine13 setVehicleInit format["mineaction13 = this addAction ['<t color=""#FFCC00"">Detonate IED - delayed</t>','%1blow.sqf',[],1,false,true,'','_this distance _target < 4'];",BON_IED_PATH];
_mine13 setVehicleInit "this execFSM (""bon_ieds\mine_sensor.fsm"");";

processInitCommands;

_group  = ["static","Grp","","east"] call getGroup;

_ai  = _group createUnit ["TK_INS_Soldier_AA_EP1", [11895.00,2619.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_4_EP1", [11895.00,2619.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_2_EP1", [11895.00,2619.00], [], 0, "NONE"];

_ai  = _group createUnit ["TK_INS_Soldier_EP1", [11821.00,2568.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_EP1", [11821.00,2568.00], [], 0, "NONE"];
_ai  = _group createUnit ["TK_INS_Soldier_3_EP1", [11821.00,2568.00], [], 0, "NONE"];

_ieds = nearestObjects [[11840.00,2610.00,0], ["Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v3_PMC","Land_IED_v4_PMC"], 225];
sleep 5;
_ied_cnt = count _ieds;

while {_ied_cnt != 0} do {
	sleep 5;
	_ieds = nearestObjects [[11840.00,2610.00,0], ["Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v3_PMC","Land_IED_v4_PMC"], 200];
	sleep 5;
	_ied_cnt = count _ieds;
//	hint format["%1 ieds", _ied_cnt];
	sleep 15;
};

["Task25","succeeded"] call SHK_Taskmaster_upd;
{_x addscore +5;} foreach units current_playergroupname;


