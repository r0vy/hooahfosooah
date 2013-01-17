		if !isNil "actionLoadout999" then { baseflag removeAction actionLoadout999; actionLoadout999 = nil; };
		actionLoadout999 = baseflag addAction ["Equip Medic Supplies","common\client\actions\noScript.sqf",'

		//Removes all presaved items from backpack
		[player, "BTH"] call ACE_fnc_RemoveGear;
		

		player addWeapon "ACE_Rucksack_MOLLE_ACU_Medic";

		_ok = [player, "ACE_Bandage", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Morphine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Epinephrine", 8] call ACE_fnc_PackMagazine;
		_ok = [player, "ACE_Medkit", 6] call ACE_fnc_PackMagazine;	
		_ok = [player, "SmokeShellRed", 2] call ACE_fnc_PackMagazine;


		hint "Custom loadout successfully loaded!";


		',2,false,true,"",""]; 
