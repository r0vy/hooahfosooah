
		if !isNil "actionLoadout1" then { baseflag removeAction actionLoadout1; actionLoadout1 = nil; };
		actionLoadout1 = baseflag addAction ["Day/Night + silent : Loadout #1","common\client\actions\noScript.sqf",'

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
		_ok = [player, "ACE_HK417_leupold"] call ACE_fnc_PutWeaponOnBack;
		


		player addWeapon "ACE_MP5SD";
		player addMagazine "30Rnd_9x19_MP5SD";
		player addMagazine "30Rnd_9x19_MP5SD";
		player addMagazine "30Rnd_9x19_MP5SD";
		player addMagazine "30Rnd_9x19_MP5SD";
		player addMagazine "30Rnd_9x19_MP5SD";


		player addMagazine "ACE_20Rnd_762x51_T_HK417";
		player addMagazine "ACE_20Rnd_762x51_T_HK417";
		player addMagazine "ACE_20Rnd_762x51_T_HK417";
		player addMagazine "ACE_20Rnd_762x51_T_HK417";


		player addMagazine "SmokeShell";
		player addMagazine "ACE_Flashbang";
		

		player addWeapon "ACE_Glock18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";


		
		player addWeapon "ACE_DAGR";
		player addWeapon "ACE_Kestrel4500";
		player addWeapon "ACE_HuntIR_monitor";
		player addWeapon "ACE_GlassesTactical";
		player addWeapon "ACE_Rangefinder_OD";

		player addMagazine "ACE_Medkit";
		player addMagazine "ACE_Medkit";
		player addMagazine "PipeBomb";
		
		
		player addWeapon "ACE_AssaultPack_BAF";

		_ok = [player, "30Rnd_9x19_MP5SD", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_20Rnd_762x51_T_HK417", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Knicklicht_IR", 2] call ACE_fnc_PackMagazine;


		player selectWeapon "ACE_MP5SD";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		