
		if !isNil "actionLoadout1" then { baseflag removeAction actionLoadout1; actionLoadout1 = nil; };
		actionLoadout1 = baseflag addAction ["Machine Gunner : Loadout #1","common\client\actions\noScript.sqf",'

		removeAllWeapons player;
		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;
		[player, "WOB"] call ACE_fnc_RemoveGear;

		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		//Weapons
		player addWeapon "M249_m145_EP1";
		player addMagazine "200Rnd_556x45_M249";
		player addMagazine "200Rnd_556x45_M249";
		player addMagazine "200Rnd_556x45_M249";
		player addMagazine "200Rnd_556x45_M249";
		player addMagazine "200Rnd_556x45_M249";
		player addMagazine "200Rnd_556x45_M249";
	
		

		player addMagazine "ACE_Knicklicht_IR";
		player addWeapon "ACE_Map_Tools";
		player addWeapon "ACE_MX2A";




		player selectWeapon "M249_m145_EP1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout2" then { baseflag removeAction actionLoadout2; actionLoadout2 = nil; };
		actionLoadout2 = baseflag addAction ["Grenadier : Loadout #2","common\client\actions\noScript.sqf",'

		removeAllWeapons player;
		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;
		[player, "WOB"] call ACE_fnc_RemoveGear;


		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		//Weapons
		player addWeapon "ACE_G36A2_AG36A2";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";



		player addMagazine "ACE_C4_M";
		player addMagazine "ACE_C4_M";
		player addMagazine "ACE_M34";
		player addMagazine "ACE_M34";

		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		
	

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Knicklicht_IR";
		player addWeapon "ACE_HuntIR_monitor";
		player addWeapon "ACE_DAGR";
		player addWeapon "ACE_MX2A";
		
		
		player addWeapon "ACE_AssaultPack_BAF";

		_ok = [player, "ACE_30Rnd_556x45_T_G36", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_HuntIR_M203", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "SmokeShellYellow", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_C4_M", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M34", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M86PDM", 2] call ACE_fnc_PackMagazine;	
		_ok = [player, "ACE_M7A3", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "1Rnd_HE_M203", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "Pipebomb", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Claymore_M", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 2] call ACE_fnc_PackMagazine;


		player selectWeapon "ACE_G36A2_AG36A2";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 

	
		if !isNil "actionLoadout3" then { baseflag removeAction actionLoadout3; actionLoadout3 = nil; };
		actionLoadout3 = baseflag addAction ["Squad Leader Night : Loadout #3","common\client\actions\noScript.sqf",'

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

		player addWeapon "ACE_MP7_RSAS";
		_ok = [player, "ACE_MP7_RSAS"] call ACE_fnc_PutWeaponOnBack;

		//Weapons
		player addWeapon "M110_TWS_EP1";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "ACE_40Rnd_B_46x30_MP7";
		player addMagazine "ACE_40Rnd_B_46x30_MP7";
		player addMagazine "ACE_40Rnd_B_46x30_MP7";
		player addMagazine "ACE_40Rnd_B_46x30_MP7";



		player addMagazine "ACE_Battery_Rangefinder";
		player addMagazine "BAF_L109A1_HE";



		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Knicklicht_IR";

		player addWeapon "ACE_Map_Tools";
		player addWeapon "ACE_HuntIR_monitor";
		player addWeapon "ACE_DAGR";

		player addWeapon "ACE_AssaultPack_BAF";

		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;

		_ok = [player, "20Rnd_762x51_B_SCAR", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_40Rnd_B_46x30_MP7", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "M110_TWS_EP1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 

		if !isNil "actionLoadout4" then { baseflag removeAction actionLoadout4; actionLoadout4 = nil; };
		actionLoadout4 = baseflag addAction ["Rifleman : Loadout #4","common\client\actions\noScript.sqf",'

		removeAllWeapons player;
		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;
		[player, "WOB"] call ACE_fnc_RemoveGear;


		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";


		//Weapons
		player addWeapon "ACE_G36A2_Bipod";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";
		player addMagazine "ACE_30Rnd_556x45_T_G36";



		player addMagazine "HandGrenade_West";
		player addMagazine "HandGrenade_West";

		player addMagazine "ACE_Flashbang";
		player addMagazine "ACE_Flashbang";

		player addMagazine "ACE_M7A3";
		player addMagazine "ACE_M7A3";

		
	

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Knicklicht_IR";
		player addWeapon "ACE_HuntIR_monitor";
		player addWeapon "ACE_DAGR";
		player addWeapon "ACE_MX2A";
		
		
		player addWeapon "ACE_AssaultPack_BAF";

		_ok = [player, "ACE_30Rnd_556x45_T_G36", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "HandGrenade_West", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "NVGoggles", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "SmokeShell", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Flashbang", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M7A3", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 2] call ACE_fnc_PackMagazine;


		player selectWeapon "ACE_G36A2_Bipod";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 