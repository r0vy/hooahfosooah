
		if !isNil "actionLoadout1" then { baseflag removeAction actionLoadout1; actionLoadout1 = nil; };
		actionLoadout1 = baseflag addAction ["Day Assualt : Loadout #1","common\client\actions\noScript.sqf",'

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
		player addWeapon "M14_EP1";
		player addMagazine "20Rnd_762x51_DMR";
		player addMagazine "20Rnd_762x51_DMR";
		player addMagazine "20Rnd_762x51_DMR";
		player addMagazine "20Rnd_762x51_DMR";
		player addMagazine "20Rnd_762x51_DMR";
		player addMagazine "20Rnd_762x51_DMR";
		player addMagazine "20Rnd_762x51_DMR";
		player addMagazine "20Rnd_762x51_DMR";
		player addMagazine "20Rnd_762x51_DMR";

		player addMagazine "SmokeShellBlue";
		
		player addMagazine "PipeBomb";

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";

		
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		player selectWeapon "M14_EP1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout2" then { baseflag removeAction actionLoadout2; actionLoadout2 = nil; };
		actionLoadout2 = baseflag addAction ["Night Assault: Loadout #2","common\client\actions\noScript.sqf",'

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
		player addWeapon "M4A1_AIM_SD_camo";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";

		player addMagazine "PipeBomb";
		player addMagazine "ACE_Flashbang";
	
	

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		player addMagazine "ACE_Knicklicht_IR";

	
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";
	


		player selectWeapon "M4A1_AIM_SD_camo";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout3" then { baseflag removeAction actionLoadout3; actionLoadout3 = nil; };
		actionLoadout3 = baseflag addAction ["Day Sniper : Loadout #3","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_HK417_leupold";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";

		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";

		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";
		player addMagazine "ACE_20Rnd_762x51_B_HK417";




		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";

		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		player selectWeapon "ACE_HK417_leupold";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout4" then { baseflag removeAction actionLoadout4; actionLoadout4 = nil; };
		actionLoadout4 = baseflag addAction ["Night Sniper : Loadout #4","common\client\actions\noScript.sqf",'

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
		player addWeapon "M110_NVG_EP1";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";

		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";

		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";




		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";

		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		player selectWeapon "M110_NVG_EP1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 