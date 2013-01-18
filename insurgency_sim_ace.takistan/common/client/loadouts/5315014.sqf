
		if !isNil "actionLoadout1" then { baseflag removeAction actionLoadout1; actionLoadout1 = nil; };
		actionLoadout1 = baseflag addAction ["Assault Day : Loadout #1","common\client\actions\noScript.sqf",'

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
		player addWeapon "ACE_G36A2_AG36A2_F";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";

		player addMagazine "ACE_DM51A1";
		player addMagazine "ACE_DM51A1";
		player addMagazine "ACE_DM51A1";

		player addMagazine "ACE_DM25";
		player addMagazine "ACE_DM25";
	

		player addWeapon "ACE_HuntIR_monitor";
		player addWeapon "ACE_GlassesTactical";
		player addWeapon "ACE_DAGR";

		player addWeapon "ACE_Rangefinder_OD";
		player addWeapon "glock17_EP1";
		player addMagazine "17Rnd_9x19_glock17";
		player addMagazine "17Rnd_9x19_glock17";

		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";
		player addMagazine "1Rnd_HE_M203";

		player addMagazine "ACE_Battery_Rangefinder";

		player addWeapon "ACE_Map_Tools";
	
		player addWeapon "ACE_BackPack_ACR_FL";

		_ok = [player, "30Rnd_556x45_G36", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "17Rnd_9x19_glock17", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 2] call ACE_fnc_PackMagazine;	
		_ok = [player, "1Rnd_HE_M203", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_DM51A1", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_DM25", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Flashbang", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M7A3", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "Pipebomb", 1] call ACE_fnc_PackMagazine;
		_ok = [player, " ACE_HuntIR_M203", 1] call ACE_fnc_PackMagazine;





		player selectWeapon "ACE_G36A2_AG36A2_F";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


		if !isNil "actionLoadout2" then { baseflag removeAction actionLoadout2; actionLoadout2 = nil; };
		actionLoadout2 = baseflag addAction ["Assault Night : Loadout #2","common\client\actions\noScript.sqf",'

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
		player addMagazine "ACE_Medkit";


		//Weapons	
		player addWeapon "ACE_UMP45_AIM_SD";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";

		player addMagazine "ACE_DM51A1";
		player addMagazine "ACE_DM51A1";
		player addMagazine "ACE_DM51A1";

		player addMagazine "ACE_DM25";
		player addMagazine "ACE_DM25";
	

		player addWeapon "ACE_HuntIR_monitor";
		player addWeapon "ACE_GlassesTactical";
		player addWeapon "ACE_DAGR";


		player addWeapon "ACE_Rangefinder_OD";
		player addWeapon "UZI_SD_EP1";
		player addMagazine "ACE_30Rnd_9x19_S_UZI";
		player addMagazine "ACE_30Rnd_9x19_S_UZI";


		player addMagazine "ACE_Battery_Rangefinder";

		player addMagazine "ACE_Knicklicht_IR";


		player addWeapon "ACE_Map_Tools";
	
		player addWeapon "ACE_BackPack_ACR_FL";

		_ok = [player, "ACE_25Rnd_1143x23_S_UMP45", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_30Rnd_9x19_S_UZI", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 2] call ACE_fnc_PackMagazine;	
		_ok = [player, "ACE_DM51A1", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_DM25", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Flashbang", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_M7A3", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "Pipebomb", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Knicklicht_IR", 2] call ACE_fnc_PackMagazine;
	


		player selectWeapon "ACE_UMP45_AIM_SD";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 


	
	
		if !isNil "actionLoadout3" then { baseflag removeAction actionLoadout3; actionLoadout3 = nil; };
		actionLoadout3 = baseflag addAction ["Medic Day : Loadout #3","common\client\actions\noScript.sqf",'

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

		player addMagazine "ACE_Medkit";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";
		player addMagazine "ACE_Epinephrine";

		//Weapons	
		player addWeapon "ACE_G36A2";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";
		player addMagazine "30Rnd_556x45_G36";

		player addMagazine "ACE_DM51A1";
		player addMagazine "ACE_DM51A1";
		player addMagazine "ACE_DM51A1";

		player addMagazine "ACE_DM25";
		player addMagazine "ACE_DM25";
	

		player addWeapon "ACE_HuntIR_monitor";
		player addWeapon "ACE_GlassesTactical";
		player addWeapon "ACE_DAGR";


		player addWeapon "ACE_Rangefinder_OD";
		player addWeapon "glock17_EP1";
		player addMagazine "17Rnd_9x19_glock17";
		player addMagazine "17Rnd_9x19_glock17";

		player addMagazine "ACE_Battery_Rangefinder";

		player addWeapon "ACE_Map_Tools";
	
		player addWeapon "ACE_BackPack_ACR_FL";

		_ok = [player, "30Rnd_556x45_G36", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "17Rnd_9x19_glock17", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 6] call ACE_fnc_PackMagazine;	
		_ok = [player, "ACE_DM51A1", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_DM25", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "Pipebomb", 1] call ACE_fnc_PackMagazine;





		player selectWeapon "ACE_G36A2";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 



		if !isNil "actionLoadout4" then { baseflag removeAction actionLoadout4; actionLoadout4 = nil; };
		actionLoadout4 = baseflag addAction ["Medic Night : Loadout #4","common\client\actions\noScript.sqf",'

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

		player addMagazine "ACE_Medkit";
		player addMagazine "ACE_Bandage";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Morphine";
		player addMagazine "ACE_Epinephrine";


		//Weapons	
		player addWeapon "ACE_UMP45_AIM_SD";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";
		player addMagazine "ACE_25Rnd_1143x23_S_UMP45";

		player addMagazine "ACE_DM51A1";
		player addMagazine "ACE_DM51A1";
		player addMagazine "ACE_DM51A1";

		player addMagazine "ACE_DM25";
		player addMagazine "ACE_DM25";
	

		player addWeapon "ACE_HuntIR_monitor";
		player addMagazine "ACE_Knicklicht_IR";
		player addWeapon "ACE_GlassesTactical";
		player addWeapon "ACE_DAGR";
		


		player addWeapon "ACE_Rangefinder_OD";
		player addWeapon "UZI_SD_EP1";
		player addMagazine "ACE_30Rnd_9x19_S_UZI";
		player addMagazine "ACE_30Rnd_9x19_S_UZI";


		player addMagazine "ACE_Battery_Rangefinder";

		player addWeapon "ACE_Map_Tools";
	
		player addWeapon "ACE_BackPack_ACR_FL";

		_ok = [player, "ACE_25Rnd_1143x23_S_UMP45", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_30Rnd_9x19_S_UZI", 3] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Bandage", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 10] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 5] call ACE_fnc_PackMagazine;	
		_ok = [player, "ACE_DM51A1", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_DM25", 2] call ACE_fnc_PackMagazine;
		_ok = [player, "Pipebomb", 1] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Knicklicht_IR", 2] call ACE_fnc_PackMagazine;
	


		player selectWeapon "ACE_UMP45_AIM_SD";
		reload player;

		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 