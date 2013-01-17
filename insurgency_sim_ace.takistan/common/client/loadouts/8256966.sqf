
		if !isNil "actionLoadout1" then { baseflag removeAction actionLoadout1; actionLoadout1 = nil; };
		actionLoadout1 = baseflag addAction ["Default : Loadout #1","common\client\actions\noScript.sqf",'

		removeAllWeapons player;
		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;
		[player, "WOB"] call ACE_fnc_RemoveGear;

		player addWeapon "NVGoggles";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		//Weapons
		player addWeapon "ACE_G36A1_AG36_UP_F";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";

		player addMagazine "SmokeShellRed";
		player addMagazine "SmokeShellRed";
		player addMagazine "SmokeShellRed";
		player addMagazine "HandGrenade_West";
		player addMagazine "HandGrenade_West";

		player addWeapon "ACE_Glock18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_SmokeRed_M203";
		player addMagazine "1Rnd_SmokeRed_M203";

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		player addMagazine "ACE_Knicklicht_IR";

		player addWeapon "ACE_KeyCuffs";

		
		player addWeapon "ACE_AssaultPack_BAF";

		_ok = [player, "30Rnd_556x45_G36", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_LargeBandage", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 6] call ACE_fnc_PackMagazine;	
		_ok = [player, "SmokeShellRed", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_SandBag_Magazine", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M86PDM", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_CLAYMORE_M", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Flashbang", 2] call ACE_fnc_PackMagazine;



		player selectWeapon "ACE_G36A1_AG36_UP_F";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout2" then { baseflag removeAction actionLoadout2; actionLoadout2 = nil; };
		actionLoadout2 = baseflag addAction ["Night : Loadout #2","common\client\actions\noScript.sqf",'

		removeAllWeapons player;
		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;
		[player, "WOB"] call ACE_fnc_RemoveGear;

		player addWeapon "NVGoggles";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		//Weapons
		player addWeapon "ACE_HK416_D14_ACOG_PVS14";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";

		player addMagazine "SmokeShellRed";
		player addMagazine "SmokeShellRed";
		player addMagazine "SmokeShellRed";
		player addMagazine "HandGrenade_West";
		player addMagazine "HandGrenade_West";

		player addWeapon "ACE_Glock18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";
	

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		player addMagazine "ACE_Knicklicht_IR";

		player addWeapon "ACE_KeyCuffs";

		player addWeapon "ACE_USPSD";
		player addMagazine "ACE_12Rnd_45ACP_USPSD";
		player addMagazine "ACE_12Rnd_45ACP_USPSD";
		player addMagazine "ACE_12Rnd_45ACP_USPSD";
		player addMagazine "ACE_12Rnd_45ACP_USPSD";
		
		
		player addWeapon "ACE_AssaultPack_BAF";

		_ok = [player, "30Rnd_556x45_Stanag", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_LargeBandage", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 6] call ACE_fnc_PackMagazine;	
		_ok = [player, "SmokeShellRed", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_TripFlare_M", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_SandBag_Magazine", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M86PDM", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_CLAYMORE_M", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Flashbang", 2] call ACE_fnc_PackMagazine;


		player selectWeapon "ACE_HK416_D14_ACOG_PVS14";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout3" then { baseflag removeAction actionLoadout3; actionLoadout3 = nil; };
		actionLoadout3 = baseflag addAction ["Silenced : Loadout #3","common\client\actions\noScript.sqf",'

		removeAllWeapons player;
		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;
		[player, "WOB"] call ACE_fnc_RemoveGear;

		player addWeapon "NVGoggles";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		//Weapons
		player addWeapon "ACE_SOC_M4A1_AIM_SD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";

		player addMagazine "SmokeShellRed";
		player addMagazine "SmokeShellRed";
		player addMagazine "SmokeShellRed";
		player addMagazine "HandGrenade_West";
		player addMagazine "HandGrenade_West";

		player addWeapon "ACE_USPSD";
		player addMagazine "ACE_12Rnd_45ACP_USPSD";
		player addMagazine "ACE_12Rnd_45ACP_USPSD";
		player addMagazine "ACE_12Rnd_45ACP_USPSD";
		player addMagazine "ACE_12Rnd_45ACP_USPSD";


		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		player addMagazine "ACE_Knicklicht_IR";

		player addWeapon "ACE_KeyCuffs";

		player addWeapon "ACE_AssaultPack_BAF";

		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;

		_ok = [player, "30Rnd_556x45_StanagSD", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_LargeBandage", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 6] call ACE_fnc_PackMagazine;	
		_ok = [player, "SmokeShellRed", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_TripFlare_M", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_SandBag_Magazine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M86PDM", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_CLAYMORE_M", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Flashbang", 2] call ACE_fnc_PackMagazine;


		player selectWeapon "ACE_SOC_M4A1_AIM_SD";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 