//................................
// Based on Lzryde version, improved by Kol9yN special for ACE Insurgency
//................................
// Make box is Global!
if (isServer) then {
	fieldHospital = _this select 0;
	publicVariable "fieldHospital";  
};

// Settings
_amountInject = 120;
_amountKit = 60;
_amountBandage = 120;
_amountStretcher = 6;

// refresh every 30 minutes
_refreshTime = 1800;

// Loop
while {alive fieldHospital} do {
	// Clear cargo
	clearWeaponCargo fieldHospital;
	clearMagazineCargo fieldHospital;

	// Fill cargo
	fieldHospital addWeaponCargo ["ACE_Stretcher",_amountStretcher];
	fieldHospital addMagazineCargo ["ACE_Bandage",_amountBandage];
	fieldHospital addMagazineCargo ["ACE_Morphine",_amountInject];
	fieldHospital addMagazineCargo ["ACE_Epinephrine",_amountInject];
	fieldHospital addMagazineCargo ["ACE_Medkit",_amountKit];

	// Wait the duration of _refreshTime
	sleep _refreshTime;
};