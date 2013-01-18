
		if !isNil "actionLoadout1" then { baseflag removeAction actionLoadout1; actionLoadout1 = nil; };
		actionLoadout1 = baseflag addAction ["Day (Sean) : Loadout #1","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_SOC_M4A1_GL_AIMPOINT";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "ACE_Claymore_M";
		player addMagazine "ACE_M7A3";

		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";		
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		
		player addWeapon "ACE_Rucksack_MOLLE_ACU";

		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;

		_ok = [player, "30Rnd_556x45_Stanag", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Claymore_M", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "HandGrenade_West", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "ACE_SOC_M4A1_AIM";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout2" then { baseflag removeAction actionLoadout2; actionLoadout2 = nil; };
		actionLoadout2 = baseflag addAction ["Night (Sean) : Loadout #2","common\client\actions\noScript.sqf",'

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
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "ACE_Claymore_M";
		player addMagazine "ACE_M7A3";

		
		

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		
		player addWeapon "ACE_Rucksack_MOLLE_ACU";

		_ok = [player, "30Rnd_556x45_StanagSD", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Claymore_M", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "HandGrenade_West", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "ACE_SOC_M4A1_AIM_SD";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		