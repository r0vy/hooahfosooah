
		if !isNil "actionLoadout1" then { baseflag removeAction actionLoadout1; actionLoadout1 = nil; };
		actionLoadout1 = baseflag addAction ["Daytime SL : Loadout #1","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_M72A2";
		_ok = [player, "ACE_M72A2"] call ACE_fnc_PutWeaponOnBack;
		
		player addWeapon "ACE_G36A1_AG36_UP_F";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";

		player addMagazine "SmokeShellRed";
		
		player addMagazine "ACE_HuntIR_M203";
		player addMagazine "ACE_HuntIR_M203";
		player addMagazine "ACE_HuntIR_M203";
		player addMagazine "ACE_HuntIR_M203";
		player addWeapon "ACE_HuntIR_monitor";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";

		player addMagazine "PipeBomb";


		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		player addWeapon "ACE_DAGR";

		player addWeapon "ACE_Map_Tools";
	
		player addWeapon "ACE_CharliePack_ACU";

		_ok = [player, "ACE_Bandage", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 1] call ACE_fnc_PackMagazine;	
		_ok = [player, "SmokeShellRed", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M7A3", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "200Rnd_556x45_M249", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "1Rnd_HE_M203", 4] call ACE_fnc_PackMagazine;





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

		player addWeapon "ACE_M72A2";
		_ok = [player, "ACE_M72A2"] call ACE_fnc_PutWeaponOnBack;

		player addWeapon "ACE_G36A2";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";


		player addMagazine "SmokeShellRed";
		player addMagazine "ACE_Flashbang";		
		player addMagazine "ACE_M7A3";	


		player addMagazine "ACE_HuntIR_M203";
		player addMagazine "ACE_HuntIR_M203";
		player addMagazine "ACE_HuntIR_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";

		player addMagazine "ACE_Knicklicht_IR";
		player addWeapon "ACE_DAGR";

		player addWeapon "ACE_HuntIR_monitor";

		player addMagazine "PipeBomb";


		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";

		player addWeapon "ACE_Map_Tools";
	
		player addWeapon "ACE_CharliePack_ACU";

		_ok = [player, "ACE_30Rnd_556x45_T_G36", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "1Rnd_HE_M203", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_C4_M", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 1] call ACE_fnc_PackMagazine;	
		_ok = [player, "ACE_Flashbang", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M7A3", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M2SLAM_M", 2] call ACE_fnc_PackMagazine;


		player selectWeapon "ACE_G36A2";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


	
	