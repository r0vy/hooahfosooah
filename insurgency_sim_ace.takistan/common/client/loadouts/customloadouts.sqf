customLoadouts = { 

//TotalBoffin's loadouts
if ((getPlayerUID player) == "8256966") then {
execVM "common\client\loadouts\8256966.sqf";
};


//Sean's loadouts
if ((getPlayerUID player) == "4310278") then {
execVM "common\client\loadouts\4310278.sqf";
};


//Drxi's loadouts
if ((getPlayerUID player) == "3722182") then {
execVM "common\client\loadouts\3722182.sqf";
};


//Badger's loadouts
if ((getPlayerUID player) == "4755910") then {
execVM "common\client\loadouts\4755910.sqf";
};


//CHILLRA's loadouts
if ((getPlayerUID player) == "2081473") then {
execVM "common\client\loadouts\2081473.sqf";
};

//viper's loadouts
if ((getPlayerUID player) == "5170054") then {
execVM "common\client\loadouts\5170054.sqf";
};


//Monokoi's loadouts
if ((getPlayerUID player) == "10290438") then {
execVM "common\client\loadouts\10290438.sqf";
};

//Winter's loadouts
if ((getPlayerUID player) == "5315014") then {
execVM "common\client\loadouts\5315014.sqf";
};

//Default medic supplies
execVM "common\client\loadouts\medic.sqf";

execVM "common\client\loadouts\custom.sqf";

};