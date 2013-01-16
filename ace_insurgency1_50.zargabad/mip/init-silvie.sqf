//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: (AEF)Wolffy.au [CTB]
// Created: 20110315
// Contact: http://dev-heaven.net/projects/mip
// Purpose: Setup amibent civilian vehicles module
///////////////////////////////////////////////////////////////////

// http://community.bistudio.com/wiki/Ambient_Civilian_Vehicles
//BIS_silvie_mainscope setVariable ["debug", true];

// list of places where vehicles will be spawned. Can be location logic (created by BIS_fnc_locations), array in format [center,distance] or trigger. 
// BIS_silvie_mainscope setVariable ["townlist", [bis_loc_acityc_mogilevka,[position this,3000],trigger1]]; 

// object classes which will be excluded from list of building around which cars are generated. 
// BIS_silvie_mainscope setVariable ["blackList", ["house1","house2"]]; 

// Changing vehicle rarity numbers (e.g. to have village cars spawned in cities, or to disable spawning of given class completely with unusual number like 10). Default rarity numbers are set in config under rarityUrban value (in range from 0/village to 1/city) 
// BIS_silvie_mainscope setVariable ["vehicleRarity",["skodaRed",10,"skodaBlue",0.8]]; 
// add motorbikes and bicycles to Ambient Vehicles
BIS_silvie_mainscope setVariable ["vehicleRarity",[
        "MMT_Civ ", (random 1),
        "TT650_Civ", (random 1),
        "TT650_TK_CIV_EP1", (random 1),
        "Old_bike_TK_CIV_EP1", (random 1),
        "Old_moto_TK_Civ_EP1", (random 1)
]]; 

// formula on which basis system calculates number of vehicles for location. %1 is number of buildings (blacklisted objects are excluded) in 500 metres from location. 
// BIS_silvie_mainscope setVariable ["vehicleCount","round ((sqrt %1) * 1.5)"]; 
// Reduce vehicle count formula to try to reduce number of civilian vehicles
switch toLower(worldName) do {		
        case "chernarus": {
                BIS_silvie_mainscope setvariable ["vehicleCount","round ((sqrt %1) * 1.0)"];
        };
        case "eden": {
                BIS_silvie_mainscope setvariable ["vehicleCount","round ((sqrt %1) * 0.75)"];
        };
        case "fallujah": {
                BIS_silvie_mainscope setvariable ["vehicleCount","round ((sqrt %1) * 0.5)"];
        };
        case "isladuala": {
                BIS_silvie_mainscope setvariable ["vehicleCount","round ((sqrt %1) * 2.0)"];
        };
        case "takistan": {
                BIS_silvie_mainscope setvariable ["vehicleCount","round ((sqrt %1) * 1.0)"];
        };
        case "torabora": {
                BIS_silvie_mainscope setvariable ["vehicleCount","round ((sqrt %1) * 1.0)"];
        };
        case "utes": {
                BIS_silvie_mainscope setvariable ["vehicleCount","round ((sqrt %1) * 0.75)"];
        };
        case "zargabad": {
                BIS_silvie_mainscope setvariable ["vehicleCount","round ((sqrt %1) * 0.5)"];
        };
};

// custom init which is executed on every car. Vehicle can be accessed using _this variable. Init is executed as separate script, so sleep or waituntil commands can be used without limitations. 
// BIS_silvie_mainscope setVariable ["vehicleInit",{}]; 
BIS_silvie_mainscope setVariable ["vehicleInit",{
        if (random 1>0.6) then {
                _this lock true;
        } else {
                _this setFuel (random 1);
                _this setDamage (random 0.5);
        }
}];

// when creating car around building, if there is some road closer than this value, vehicle will be attached to this road instead of to building. 
// BIS_silvie_mainscope setVariable ["roadDistance",25]; 

// number of attempts to create vehicle (failed attempt is for instance when some road is detected near building, but it's crossroad). 
// BIS_silvie_mainscope setVariable ["attempts",10]; 
