
		if !isNil "actionLoadout1" then { baseflag removeAction actionLoadout1; actionLoadout1 = nil; };
		actionLoadout1 = baseflag addAction ["Day Sniping : Loadout #1","common\client\actions\noScript.sqf",'

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
		player addWeapon "m8_carbine_pmc";
		_ok = [player, "m8_carbine_pmc"] call ACE_fnc_PutWeaponOnBack;

		player addWeapon "BAF_LRR_scoped";

		player addMagazine "5Rnd_86x70_L115A1";
		player addMagazine "5Rnd_86x70_L115A1";
		player addMagazine "5Rnd_86x70_L115A1";
		player addMagazine "5Rnd_86x70_L115A1";

		
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";

		player addMagazine "SmokeShellGreen";
		player addMagazine "SmokeShellRed";
		player addMagazine "PipeBomb";

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		player addMagazine "ACE_Knicklicht_IR";
		
		player addWeapon "ACE_Coyote_Pack_Black";
		
		_ok = [player, "5Rnd_86x70_L115A1", 5] call ACE_fnc_PackMagazine;
		_ok = [player, "30Rnd_556x45_Stanag", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "BAF_LRR_scoped";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		

		if !isNil "actionLoadout2" then { baseflag removeAction actionLoadout2; actionLoadout2 = nil; };
		actionLoadout2 = baseflag addAction ["Night Sniping : Loadout #2","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_HK416_D10_SD";
		_ok = [player, "ACE_HK416_D10_SD"] call ACE_fnc_PutWeaponOnBack;


		player addWeapon "M110_NVG_EP1";
		player addMagazine "ACE_20Rnd_762x51_S_M110";
		player addMagazine "ACE_20Rnd_762x51_S_M110";
		player addMagazine "ACE_20Rnd_762x51_S_M110";
		player addMagazine "ACE_20Rnd_762x51_S_M110";
		player addMagazine "ACE_20Rnd_762x51_S_M110";
		player addMagazine "ACE_20Rnd_762x51_S_M110";

		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";


		
		

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		player addMagazine "ACE_Knicklicht_IR";
		
		player addWeapon "ACE_Coyote_Pack_Black";

		_ok = [player, "ACE_20Rnd_762x51_S_M110", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "30Rnd_556x45_StanagSD", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;


		player selectWeapon "M110_NVG_EP1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 




		if !isNil "actionLoadout3" then { baseflag removeAction actionLoadout3; actionLoadout2 = nil; };
		actionLoadout3 = baseflag addAction ["Assault : Loadout #3","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_M136_CSRS";
		_ok = [player, "ACE_M136_CSRS"] call ACE_fnc_PutWeaponOnBack;

		player addWeapon "ACE_G36A1_AG36A1";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
	

		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";	
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "ACE_HuntIR_M203";

		player addMagazine "ACE_M34";
		player addMagazine "ACE_M34";
		player addMagazine "ACE_M34";

		player addMagazine "ACE_M4SLAM_M";
		player addMagazine "ACE_M4SLAM_M";

		player addMagazine "ACE_Claymore_M";
		
		player addWeapon "ACE_HuntIR_monitor";
		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Knicklicht_IR";

		
		player addWeapon "ACE_Coyote_Pack_Black";

		_ok = [player, "30Rnd_556x45_G36", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_HuntIR_M203", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "1Rnd_HE_M203", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 1] call ACE_fnc_PackMagazine;



		player selectWeapon "ACE_G36A1_AG36A1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout4" then { baseflag removeAction actionLoadout4; actionLoadout4 = nil; };
		actionLoadout4 = baseflag addAction ["Assault SD : Loadout #4","common\client\actions\noScript.sqf",'

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

		player addMagazine "ACE_M34";
		player addMagazine "ACE_M34";	

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Knicklicht_IR";

		
		player addWeapon "ACE_Coyote_Pack_Black";

		_ok = [player, "30Rnd_556x45_StanagSD", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M34", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Claymore_M", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M4SLAM_M", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 1] call ACE_fnc_PackMagazine;



		player selectWeapon "ACE_SOC_M4A1_AIM_SD";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 
		
		if !isNil "actionLoadout5" then { baseflag removeAction actionLoadout5; actionLoadout5 = nil; };
		actionLoadout5 = baseflag addAction ["Tac 50 Sniper : Loadout #5","common\client\actions\noScript.sqf",'

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

		player addWeapon "ACE_TAC50";

		player addMagazine "ACE_5Rnd_127x99_B_TAC50";
		player addMagazine "ACE_5Rnd_127x99_B_TAC50";
		player addMagazine "ACE_5Rnd_127x99_B_TAC50";
		player addMagazine "ACE_5Rnd_127x99_B_TAC50";
		player addMagazine "ACE_5Rnd_127x99_B_TAC50";
		player addMagazine "ACE_5Rnd_127x99_B_TAC50";
		player addMagazine "ACE_5Rnd_127x99_B_TAC50";
		player addMagazine "ACE_5Rnd_127x99_B_TAC50";

		
		player addMagazine "SmokeShell";
		player addMagazine "SmokeShellGreen";
		player addMagazine "SmokeShellRed";


		player addWeapon "ACE_Glock18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";



		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Knicklicht_IR";
		
		player addWeapon "ACE_Coyote_Pack_Black";
		
		_ok = [player, "ACE_5Rnd_127x99_B_TAC50", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "ACE_TAC50";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 

		if !isNil "actionLoadout6" then { baseflag removeAction actionLoadout6; actionLoadout6 = nil; };
		actionLoadout6 = baseflag addAction ["Marksman : Loadout #6","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_M136_CSRS";
		_ok = [player, "ACE_M136_CSRS"] call ACE_fnc_PutWeaponOnBack;

		player addWeapon "ACE_Mk12mod1";

		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";		

		player addMagazine "SmokeShellGreen";
		player addMagazine "SmokeShellRed";

		player addMagazine "HandGrenade_West";
		player addMagazine "HandGrenade_West";
		player addMagazine "HandGrenade_West";


		player addWeapon "ACE_USP";
		player addMagazine "ACE_12Rnd_45ACP_USP";
		player addMagazine "ACE_12Rnd_45ACP_USP";
		player addMagazine "ACE_12Rnd_45ACP_USP";
		player addMagazine "ACE_12Rnd_45ACP_USP";
		player addMagazine "ACE_12Rnd_45ACP_USP";
		player addMagazine "ACE_12Rnd_45ACP_USP";
		player addMagazine "ACE_12Rnd_45ACP_USP";
		player addMagazine "ACE_12Rnd_45ACP_USP";

		


		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		
		player addWeapon "ACE_Coyote_Pack_Black";
		
		_ok = [player, "30Rnd_556x45_Stanag", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "ACE_Mk12mod1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout7" then { baseflag removeAction actionLoadout7; actionLoadout7 = nil; };
		actionLoadout7 = baseflag addAction ["Automatic Rifleman : Loadout #7","common\client\actions\noScript.sqf",'

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
		player addWeapon "Mk_48_DES_EP1";

		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		
		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		
		player addWeapon "ACE_Coyote_Pack_Black";
		
		_ok = [player, "ACE_Battery_Rangefinder", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "Mk_48_DES_EP1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 
		
		if !isNil "actionLoadout8" then { baseflag removeAction actionLoadout8; actionLoadout8 = nil; };
		actionLoadout8 = baseflag addAction ["Assault SD : Loadout #8","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_M4A1_EOT_SD";

		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";
		player addMagazine "30Rnd_556x45_StanagSD";		

		player addMagazine "SmokeShellGreen";
		player addMagazine "SmokeShellRed";

		player addMagazine "HandGrenade_West";
		player addMagazine "HandGrenade_West";
		player addMagazine "HandGrenade_West";

		


		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		
		player addWeapon "ACE_Coyote_Pack_Black";
		
		_ok = [player, "30Rnd_556x45_StanagSD", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "ACE_M4A1_EOT_SD";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 

		if !isNil "actionLoadout9" then { baseflag removeAction actionLoadout9; actionLoadout9 = nil; };
		actionLoadout9 = baseflag addAction ["Dusty Day : Loadout #9","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_M136_CSRS";
		_ok = [player, "ACE_M136_CSRS"] call ACE_fnc_PutWeaponOnBack;
	
		player addWeapon "BAF_LRR_scoped";

		player addMagazine "5Rnd_86x70_L115A1";
		player addMagazine "5Rnd_86x70_L115A1";
		player addMagazine "5Rnd_86x70_L115A1";
		player addMagazine "5Rnd_86x70_L115A1";
		

		player addMagazine "SmokeShellGreen";
		player addMagazine "SmokeShellRed";

		player addWeapon "ACE_Glock18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";
		
		player addWeapon "ACE_Coyote_Pack_Black";
		
		_ok = [player, "5Rnd_86x70_L115A1", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "SmokeShellGreen", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "SmokeShellRed", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_33Rnd_9x19_G18", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "BAF_LRR_scoped";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 

		if !isNil "actionLoadout10" then { baseflag removeAction actionLoadout10; actionLoadout10 = nil; };
		actionLoadout10 = baseflag addAction ["Dusty Night : Loadout #10","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_M136_CSRS";
		_ok = [player, "ACE_M136_CSRS"] call ACE_fnc_PutWeaponOnBack;
	
		player addWeapon "M110_NVG_EP1";

		player addMagazine "ACE_20Rnd_762x51_T_SCAR";
		player addMagazine "ACE_20Rnd_762x51_T_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";
		player addMagazine "20Rnd_762x51_B_SCAR";

		

		player addMagazine "SmokeShellGreen";
		player addMagazine "SmokeShellRed";

		player addWeapon "ACE_Glock18";
		player addMagazine "ACE_33Rnd_9x19_G18";
		player addMagazine "ACE_33Rnd_9x19_G18";

		player addWeapon "ACE_Rangefinder_OD";
		player addMagazine "ACE_Battery_Rangefinder";

		player addMagazine "ACE_Knicklicht_IR";
		
		player addWeapon "ACE_Coyote_Pack_Black";
		
		_ok = [player, "20Rnd_762x51_B_SCAR", 6] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_20Rnd_762x51_T_SCAR", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "SmokeShellGreen", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "SmokeShellRed", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_33Rnd_9x19_G18", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Battery_Rangefinder", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;

		player selectWeapon "M110_NVG_EP1";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 
