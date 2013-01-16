getQuantity = {
    private ["_str","_unit","_wep2","_arr","_wep","_quantity"];
    
    if isEast exitWith { "" };
	scopeName "main";
	_str = "";
	_wep = _this;
	_quantity = call compile format["quantity%1", _wep];
	if (!isNil "_quantity") then { 
        _str = str(_quantity - nearestWeapons(_wep,CENTERPOS,AORADIUS,true,"count")); 
    };
	if (_wep in limitedGearList) then {
		for "_i" from 0 to (count limitedSquadGear - 1) do { 
			_arr = limitedSquadGear select _i;
			if (_wep in _arr) then {
				for "_j" from 0 to (count _arr - 1) do {
					_wep2  = _arr select _j;
					{	
						if (!isNil _x) then {
							_unit = call compile _x;
							if (_unit hasWeapon _wep2 && !isDead(_unit) && alive _unit) exitWith { _str = format["H-%1-%2", squadNumber(_unit), unitNumber(_unit)]; breakTo "main"; };
						};	
					} forEach squadUnitStrings(squadString(player));
				};
			};
		};
	};
	_str
};

loadout = { 
    private ["_magTypeOld","_type","_typeOld","_magTypeNew","_typeNew","_count","_quantity"];
    
    removeAllWeapons player; 
    removeAllItems player; 
	if (!isNull (unitBackpack player)) then { removeBackpack player; };
	{ 
		_quantity = _x call getQuantity;
		if (_quantity != "" && _quantity != "1" && _quantity != "2") then {
			_type = getNumber(configFile >> "CfgWeapons" >> _x >> "type"); 
			respawnWeapons = respawnWeapons - [_x];
			if (_type == 1 || _type == 5) then { respawnWeapons = respawnWeapons + [startWeapon]; };
			_magTypeOld    = getArray(configFile >> "CfgWeapons" >> _x >> "magazines") select 0;
			if !(_magTypeOld in respawnMagazines) then { _magTypeOld    = getArray(configFile >> "CfgWeapons" >> _x >> "magazines") select 1; };
			_typeOld       = getNumber(configFile >> 'CfgMagazines' >> _magTypeOld >> 'type');
			_magTypeNew    = getArray(configFile >> "CfgWeapons" >> startWeapon >> "magazines") select 0;
			_typeNew       = getNumber(configFile >> 'CfgMagazines' >> _magTypeNew >> 'type');
			_count = count respawnMagazines;
			 respawnMagazines = respawnMagazines - [_magTypeOld];
			 for "_i" from 0 to ((_count - count respawnMagazines)*(_typeOld/_typeNew) - 1) do {
			 	respawnMagazines = respawnMagazines + [_magTypeNew];
			};
		};
	} forEach respawnWeapons;
	{ player addMagazine _x; } forEach respawnMagazines;
	{ 
		if (getNumber(configFile >> "CfgWeapons" >> _x >> "type") > 0) then {
			player addWeapon _x; 
		} else { player addBackpack _x; };
	} forEach respawnWeapons;
	player selectWeapon primaryWeapon player;
}; 

replaceInventoryAmmo = {
	private ["_magazines","_newMag","_oldMags","_replacement","_inc","_size","_type"];
    
	_newMag        = _this select 0;
 	_oldMags       = _this select 1;
 	_magazines     = _this select 2;
 	if isNil "_newMag" exitWith { _magazines };
 	if ((_oldMags select 0) == "20rnd_762x51_B_SCAR" && !((_oldMags select 0) in _magazines)) then { _oldMags set[0, "20Rnd_762x51_B_SCAR"]; };
	_replacement   = [];
	_inc           = getNumber(configFile >> 'CfgMagazines' >> _newMag >> 'type');
	_size          = 128;
	if (_inc >= 256) then { _size = 3072; };
	{
		_type = getNumber(configFile >> 'CfgMagazines' >> _x >> 'type');
		if (_type == _inc || _type == _inc*2 || _type == _inc/2 || _type == _inc*6 || _type == _inc/6) then { _size = _size - _type; };
	} forEach (_magazines - _oldMags);
	for "_i" from _inc to _size step _inc do { _replacement = _replacement + [_newMag] };		
	_magazines = (_magazines - _oldMags) + _replacement;
	_magazines
};

displayInventory = {
	private ["_inventorySlots","_loadout","_miscItemSlots","_sidearmInventorySlots","_wSlot","_sSlot","_iSlot","_count","_space","_inventoryGUI","_sidearmInvGUI","_miscInvGUI"];
    
	_loadout = _this;
	_inventoryGUI = 3503;
	_sidearmInvGUI = 3515;
	_miscInvGUI = 3523;

	for [{_count = 0},{_count < 12},{_count = _count + 1}] do {CtrlSetText[_inventoryGUI + _count,"\Ca\UI\Data\ui_gear_mag_gs.paa"]};
	for [{_count = 0},{_count < 8},{_count = _count + 1}] do {CtrlSetText[_sidearmInvGUI + _count,"\Ca\UI\Data\ui_gear_mag_gs.paa"]};
	for [{_count = 0},{_count < 12},{_count = _count + 1}] do {CtrlSetText[_miscInvGUI + _count,"\Ca\UI\Data\ui_gear_eq_gs.paa"]};

	_inventorySlots = [];
	_sidearmInventorySlots = [];
	_miscItemSlots = [];
	_wSlot = 0;
	_sSlot = 0;
	_iSlot = 0;

	{
		_space = getNumber(configFile >> 'CfgMagazines' >> _x >> 'type');
		if (_space >= 256) then {
			ctrlSetText[_inventoryGUI + _wSlot, getText(configFile >> 'CfgMagazines' >> _x >> 'picture')];
			_wSlot = _wSlot + 1;
			_inventorySlots = _inventorySlots + [_x];
			for [{_count = _space/256 - 1},{_count > 0},{_count = _count - 1}] do {
				ctrlSetText[_inventoryGUI + _wSlot,""];
				_wSlot = _wSlot + 1;
				_inventorySlots = _inventorySlots + [""];
			};
		};
		if (_space == 16) then {
			ctrlSetText[_sidearmInvGUI + _sSlot,getText(configFile >> 'CfgMagazines' >> _x >> 'picture')];
			_sSlot = _sSlot + 1;
			_sidearmInventorySlots = _sidearmInventorySlots + [_x];
			for [{_count = _space/16 - 1},{_count > 0},{_count = _count - 1}] do {
				ctrlSetText[_sidearmInvGUI + _sSlot,""];
				_sSlot = _sSlot + 1;
				_sidearmInventorySlots = _sidearmInventorySlots + [""];
			};
		};		
		if (_space == 0) then {
			_space = getNumber(configFile >> 'CfgWeapons' >> _x >> 'type');
			ctrlSetText[_miscInvGUI + _iSlot, getText(configFile >> 'CfgWeapons' >> _x >> 'picture')];
			_iSlot = _iSlot + 1;
			_miscItemSlots = _miscItemSlots + [_x];
			for [{_count = _space/131072 - 1},{_count > 0},{_count = _count - 1}] do {
				ctrlSetText[_miscInvGUI + _iSlot,""];
				_iSlot = _iSlot + 1;
				_miscItemSlots = _miscItemSlots + [""];
			};
		};
	} forEach _loadout;

	[_inventorySlots,_sidearmInventorySlots,_miscItemSlots]

};

gearDialog = {
    private ["_updateFiller","_list","_id","_currentRow","_currentData","_currentValue","_currentItem","_listMagazines","_quantity","_skip","_oldMags","_currentMags","_currentMagazines","_slist","_index","_type","_currentWeapons","_displayInv","_u","_currentSpecials","_currentItems","_currentMag","_currentMagValue","_currentPrimary","_currentSecondary","_currentSidearm","_sideGear","_picture","_i","_data","_inventorySlots","_sidearmInventorySlots","_miscItemSlots","_updateUnit","_slot","_x","_magTypeOld","_typeOld","_magTypeNew","_typeNew","_count","_weapons","_ammo","_filler","_lastFiller","_primaries","_secondaries","_sidearms","_misc","_all","_lb","_lbm","_primaryIDC","_secondaryIDC","_sidearmIDC","_specialIDC","_display","_totalWeapons","_fillerIDC","_fillerTypes","_listPictures","_old","_replaceArray","_getMagazines","_fillList","_addMagazine","_addItem"];

    if dialog exitWith { closeDialog 0; };

	createDialog "RscGear";

	_primaries = primaries;
	_secondaries = secondaries;
	_sidearms = sidearms;
	_misc = misc;
	_all = _primaries + _secondaries + _sidearms + _misc;

	lbChange       = false;
	lbMainAction   = "";
	inventoryClick = -1;
	WF_Gear_Action = "";

	primClicked = false;
	secoClicked = false;
	sideClicked = false;
	saveLoadout = false;
	buyLoadout = false;
	_displayInv = false;
	_updateUnit = true;
	_updateFiller = false;

	disableSerialization;
	_lb = 3700;
	_lbm = 3701;
	_primaryIDC = 3500;
	_secondaryIDC = 3501;
	_sidearmIDC = 3502;
	_specialIDC = 3535;
	_display = findDisplay 16000;

	_totalWeapons = count primaries + count secondaries + count sidearms;

	_fillerIDC = [3401,3402,3403,3404,3405];
	_fillerTypes = ["all","primaries","secondaries","sidearms","misc"];
	_inventorySlots = [];
	_lastFiller = "nil";
	_id = _fillerTypes find "primaries";
	_list = [];
	_listPictures = [];
	_listMagazines = [];
	_miscItemSlots = [];
	_sidearmInventorySlots = [];
	(_display DisplayCtrl (_fillerIDC select _id)) ctrlSetTextColor [0.7, 1, 0.7, 1];

	_currentItem = "";
	_currentMags = [];
	_currentMagValue = 0;
	_currentData = "";
	_currentValue = "";

	_currentPrimary = "";
	_currentSecondary = "";
	_currentSidearm = "";
	_old = "";

	_currentWeapons = [];
	_currentSpecials = [];
	_currentItems = [];
	_currentMagazines = [];

	//--- Set command is just terrific...
	_replaceArray = {
		private ["_array","_indexExcluded","_newArray","_x"];
		
		_array = _this select 0;
		_indexExcluded = _this select 1;
		
		_newArray = [];
		for [{_x = 0},{_x < count(_array)},{_x = _x + 1}] do {
			if (_x != _indexExcluded) then {
				_newArray = _newArray + [_array select _x];
			};
		};
		
		_newArray
	};

	_getMagazines = {
		private ["_artm","_tm"];
		
		_tm   = getArray(configFile >> "CfgWeapons" >> _this >> "magazines");
		_artm = _tm;
		{
			if (!(_x in legalMagazines)) then {_artm = _artm - [_x]};
		} forEach _tm;
		_artm
	};

	_fillList = {
		private ["_list","_filler","_i","_listBox","_listBoxArray","_u","_quant","_class","_char","_name","_pic"];
		
		_list    = _this select 0;
		_filler  = _this select 1;
		_listBox = _this select 2;
		_listBoxArray = [];
		_u = 0;
		_i = 0;
		{
			_quant = _x call getQuantity;
			if (_filler == "magazine") then { _quant = ""; };
			_class = "CfgMagazines";
			if ( (!(_x in legalMagazines) || (_x in legalMagazines && _x in secondaries)) && _filler != "magazine") then { _class = "CfgWeapons"; };
			_name  = getText(configFile >> _class >> _x >> "displayName");
			_pic   = getText(configFile >> _class >> _x >> "picture");
			if (_name == "") then {
				_name  = toArray(_x);
				for "_j" from 0 to (count _name - 1) do {
					_char = [_name select _j];
					if (toString(_char) == "_" || _j >= (count _name - 3)) then { _name set[_j,toArray(" ") select 0]; };
				};
				_name = toString(_name);
				_pic   = getText(configFile >> "cfgVehicles" >> _x >> "picture");
			};
			lnbAddRow [_listBox,[_quant,_name]];
			lnbSetPicture [_listBox,[_i,0],_pic];				
			lnbSetData [_listBox,[_i,0],_filler];
			lnbSetData [_listBox,[_i,1],_quant];
			lnbSetValue [_listBox,[_i,0],_u];
			_i = _i + 1;
			_u = _u + 1;
		} forEach _list;	
		lnbSetCurSelRow [_listBox,0]
	};

	_addMagazine = {
		private ["_type","_mag","_magazines","_size","_inc"];
		
		_magazines = _this select 0;
		_mag       = _this select 1;	
		_inc       = getNumber(configFile >> "CfgMagazines" >> _mag >> "type");
		_size      = 128;
		if (_inc >= 256) then { _size = 3072; };

		{	
			_type = getNumber(configFile >> "CfgMagazines" >> _x >> "type");
			if (_type == _inc || _type == _inc*2 || _type == _inc/2 || _type == _inc*6 || _type == _inc/6) then {
				_size = _size - getNumber(configFile >> "CfgMagazines" >> _x >> "type");
			};
		} forEach _magazines;
		if (_size >= _inc) then {_magazines = _magazines + [_mag]; };
		_magazines
	};

	_addItem = {
		private ["_items","_limit","_mag","_size"];
		
		_items = _this select 0;
		_mag = _this select 1;
		_size = 0;
		_limit = 12;
		
		{_size = _size + 1} forEach _items;
		
		if (_size + 1 <= _limit) then {_items = _items + [_mag]};
		
		_items
	};

	server setVariable ["filler", "all"];

	while {alive player && dialog} do {
	scopeName "main";
	_filler = server getVariable "filler";

	//--- _filler Changed.
	if (_filler != _lastFiller || _updateFiller) then {	
		_updateFiller = false;
		_list = call compile format["_%1", _filler];
		lnbClear _lb;
		[_list,_filler,_lb] call _fillList;
		_id = _fillerTypes find _filler;
		{(_display displayCtrl _x) ctrlSetTextColor [1, 1, 1, 1]} forEach _fillerIDC;
		(_display displayCtrl (_fillerIDC select _id)) ctrlSetTextColor [0.7, 1, 0.7, 1];
		//--- Update the list since the _filler changed.
		lbChange = true;
	};
	
	//--- List Selection Changed.
	if lbChange then {
		lbChange = false;
		_currentRow = lnbCurSelRow _lb;
		_currentData = lnbData[_lb,[_currentRow,0]];
		_currentValue = lnbValue[_lb,[_currentRow,0]];
		_currentItem = _list select _currentValue;
		lnbClear _lbm;		
		_listMagazines = _currentItem call _getMagazines;
		[_listMagazines,'magazine',_lbm] call _fillList;
	};

	//--- Player have clicked on one of the listbox.
	if (lbMainAction != "") then {	
		_quantity = lnbData [_lb,[lnbCurSelRow _lb, 1]];
		if (lbMainAction != "addWeapon") then { _quantity = ""; };
		if (_quantity == "NA") exitWith { player groupChat "this item is not available"; lbMainAction = ""; };	
		if (_quantity == "0") exitWith { player groupChat "unavailable at this time"; lbMainAction = ""; };		
		if (_quantity != "1" && _quantity != "2" && _quantity != "") exitWith { player groupChat "your squad is already using a weapon of this type"; lbMainAction = ""; };	
		switch lbMainAction do {	
			case "addWeapon": {		
				_skip = true;
				if (_filler == "primaries" || _filler == "secondaries" || _filler == "sidearms" || _filler == "all") then {
					if (_currentItem in misc) then {_skip = false;_currentValue = _currentValue - _totalWeapons};
					if (_skip) then {						
						_slist = call compile format ["_%1",_currentData];
						_index = _slist find _currentItem;
						_type = getNumber(configFile >> "CfgWeapons" >> _currentItem >> "type");
						if (_type == 0) then { _currentData = "secondary"; };
						if (_type == 4 && getNumber(configFile >> "CfgWeapons" >> _currentPrimary >> "type") == 5) exitWith { player groupChat "you cannot carry two heavy weapons"; lbMainAction = ""; breakTo "main"; };
						if (_type == 5 && _currentSecondary != "") exitWith { player groupChat "you cannot carry two heavy weapons"; lbMainAction = ""; breakTo "main"; };
						if (_index != -1) then {
							if (_type == 1 || _type == 5) then {_currentData = "primary"} else {
								if (_type == 4) then {_currentData = "secondary"} else {
									if (_type == 2) then {_currentData = "sidearm"};
								};
							};
							if (
							(_currentData == "primary" && _currentItem in limitedGearList && _currentSecondary in limitedGearList)
							|| (_currentData == "secondary" && _currentItem in limitedGearList && _currentPrimary in limitedGearList)
							) exitWith { player groupChat "you cannot use two different specialised weapons"; lbMainAction = ""; breakTo "main"; };
							call compile format ["
								_old = _current%1;
								_currentWeapons = _currentWeapons - [_current%1];
								_current%1 = _slist select _index;
								_picture   = getText(configFile >> ""CfgWeapons"" >> _currentItem >> ""picture"");
								if (_type == 0) then { _picture = getText(configFile >> ""CfgVehicles"" >> _currentItem >> ""picture""); };
								ctrlSetText[_%1IDC,_picture]
							",_currentData];
								_currentMags = _currentItem call _getMagazines;
								_oldMags     = [];
								if (!isNil "_old") then { _oldMags = _old call _getMagazines; };
								_currentMagazines = [_currentMags select 0,_oldMags,_currentMagazines] call replaceInventoryAmmo;
						};						
						_currentWeapons = _currentWeapons + [_currentItem];
						_displayInv = true;
					};
				};
				if (_filler == "misc" || !_skip) then {
					_type = getNumber(configFile >> "CfgWeapons" >> _currentItem >> "type");
					if (_type == 0 || _type == 65536) then { 
						_type = getNumber(configFile >> "CfgMagazines" >> _currentItem >> "type");	
						if (_type == 16 || _type >= 256) then {
							_currentMagazines = [_currentMagazines,_currentItem] call _addMagazine;
							_displayInv = true;
						};
					};
					if (_type == 4096 && count _currentSpecials < 3 && !(_currentItem in _currentSpecials)) then {
						_currentSpecials = _currentSpecials + [_currentItem];
						_u = 0;
						{
							_index = misc find _x;
							ctrlSetText[_specialIDC + _u,getText(configFile >> "CfgWeapons" >> _x >> "picture")];
							_u = _u + 1;
						} forEach _currentSpecials;
						_displayInv = true;
					};
					if (_type == 131072) then {						
						if (!(_currentItem in _currentItems)) then {
							_currentItems = [_currentItems,_currentItem] call _addItem;
							_displayInv = true;
						};
					};
				};				
			};

			case "addMagazine": {
				_currentMagValue = lnbValue[_lbm,[lnbCurSelRow _lbm,0]];
				_currentMag = _currentItem call _getMagazines select _currentMagValue;
				_currentMagazines = [_currentMagazines,_currentMag] call _addMagazine;
				_displayInv = true;
			};
		};
		lbMainAction = "";
	};
	
	//--- Remove a weapon by clicking on it.
	if (primClicked) then {primClicked = false;if (_currentPrimary != "") then  {ctrlSetText [_primaryIDC,"\ca\ui\data\ui_gear_gun_gs.paa"];_index = primaries find _currentPrimary;_currentWeapons = _currentWeapons - [_currentPrimary];_currentPrimary = "";_displayInv = true}};
	if (secoClicked) then {secoClicked = false;if (_currentSecondary != "") then  {ctrlSetText [_secondaryIDC,"\ca\ui\data\ui_gear_sec_gs.paa"];_index = secondaries find _currentSecondary;_currentWeapons = _currentWeapons - [_currentSecondary];_currentSecondary = "";_displayInv = true}};
	if (sideClicked) then {sideClicked = false;if (_currentSidearm != "") then  {ctrlSetText [_sidearmIDC,"\ca\ui\data\ui_gear_hgun_gs.paa"];_index = sidearms find _currentSidearm;_currentWeapons = _currentWeapons - [_currentSidearm];_currentSidearm = "";_displayInv = true}};
	
	if (_updateUnit) then {
		_currentWeapons = respawnWeapons;
		_currentMagazines = respawnMagazines;
		_currentSpecials = [];
		_currentItems = [];
		
				
		_currentPrimary = "";
		_currentSecondary = "";
		_currentSidearm = "";

		_sideGear = _currentWeapons;
		{if (!(_x in _all)) then {_sideGear = _sideGear - [_x]}} forEach _currentWeapons;
		_currentWeapons = _sideGear;

		_sideGear = _currentMagazines;
		{if (!(_x in misc) && !(_x in legalMagazines)) then {_sideGear = _sideGear - [_x]}} forEach _currentMagazines;
		_currentMagazines = _sideGear;
		
		ctrlSetText [_primaryIDC,"\ca\ui\data\ui_gear_gun_gs.paa"];
		ctrlSetText [_secondaryIDC,"\ca\ui\data\ui_gear_sec_gs.paa"];
		ctrlSetText [_sidearmIDC,"\ca\ui\data\ui_gear_hgun_gs.paa"];
		ctrlSetText [3535,"\Ca\UI\Data\ui_gear_eq_gs.paa"];
		ctrlSetText [3536,"\Ca\UI\Data\ui_gear_eq_gs.paa"];

		{
			_index = primaries find _x;
			if (_index != -1) then {_currentPrimary = primaries select _index; ctrlSetText[_primaryIDC,getText(configFile >> "CfgWeapons" >> _x >> "picture")]};
			_index = secondaries find _x;
			if (_index != -1) then {
				_currentSecondary = secondaries select _index;
				_picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");
				if (_picture == "") then { _picture = getText(configFile >> "CfgVehicles" >> _x >> "picture"); }; 
				ctrlSetText[_secondaryIDC,_picture];
			};
			_index = sidearms find _x;
			if (_index != -1) then {_currentSidearm = sidearms select _index;ctrlSetText[_sidearmIDC,getText(configFile >> "CfgWeapons" >> _x >> "picture")]};
			_index = misc find _x;
			if (_index != -1) then {
				_type = getNumber(configFile >> "CfgWeapons" >> _x >> "type");
				if (_type == 0) then { _type = getNumber(configFile >> "CfgMagazines" >> _x >> "type"); };				
				switch _type do {
					case 4096: {
						_currentSpecials = _currentSpecials + [_x];
						_u = 0;
						{
							_i = misc find _x;
							ctrlSetText[_specialIDC + _u,getText(configFile >> "CfgWeapons" >> _x >> "picture")];
							_u = _u + 1;
						} forEach _currentSpecials;
					};
					case 131072: {
						_currentItems = _currentItems + [_x];
					};
				};
			};
		} forEach _currentWeapons;

		_currentWeapons = _currentWeapons - misc;
		_data = (_currentMagazines + _currentItems) call DisplayInventory;
		_inventorySlots = _data select 0;
		_sidearmInventorySlots = _data select 1;
		_miscItemSlots = _data select 2;
		_updateUnit = false;
	};
	
	//--- Remove a magazine by clicking on it.
	if (inventoryClick != -1) then {
		//--- Main Inventory.
		if (inventoryClick > 3502 && inventoryClick < 3515) then {
			_slot = inventoryClick - 3503;
			if (_slot < count _inventorySlots) then {
				_index = _currentMagazines find (_inventorySlots Select _slot);
				if (_index != -1) then {_currentMagazines = [_currentMagazines,_index] call _replaceArray};
			};
		};
		//--- Handgun Inventory
		if (inventoryClick > 3514 && inventoryClick < 3523) then {
			_slot = inventoryClick - 3515;
			if (_slot < count _sidearmInventorySlots) then {
				_index = _currentMagazines find (_sidearmInventorySlots Select _slot);
				if (_index != -1) then {_currentMagazines = [_currentMagazines,_index] call _replaceArray};
			};
		};
		//--- Misc Inventory
		if (inventoryClick > 3522 && inventoryClick < 3535) then {
			_slot = inventoryClick - 3523;
			if (_slot < count _miscItemSlots) then {
				_index = _currentItems find (_miscItemSlots Select _slot);
				if (_index != -1) then {_currentItems = [_currentItems,_index] call _replaceArray};
			};
		};
		//--- Remove a special item.
		if (inventoryClick == 3535 || inventoryClick == 3536) then {
			_slot = inventoryClick - 3535;
			if (_slot < count _currentSpecials) then {
				_currentSpecials = _currentSpecials - [_currentSpecials select _slot];
				for [{_x = 0},{_x < 2},{_x = _x + 1}] do {ctrlSetText[_specialIDC + _x,"\Ca\UI\Data\ui_gear_eq_gs.paa"]};
				_u = 0;
				{
					_index = misc find _x;
					ctrlSetText[_specialIDC + _u,getText(configFile >> "CfgWeapons" >> _x >> "picture")];
					_u = _u + 1;
				} forEach _currentSpecials;				
			};
		};
		InventoryClick = -1;
		_displayInv = true;
	};
	
	//--- Custom UA.
	if (WF_Gear_Action != "") then {
		switch (WF_Gear_Action) do {
			case "reload": {
				if !(isNil "respawnWeapons") then {
					_currentPrimary = "";
					_currentSecondary = "";
					_currentSidearm = "";
					_currentWeapons = [];
					_currentItems = [];
					_currentSpecials = [];
					{
						_index = primaries find _x;
						if (_index != -1) then {_currentWeapons = _currentWeapons + [_x];_currentPrimary = _x;ctrlSetText[_primaryIDC,getText(configFile >> "CfgWeapons" >> _x >> "picture")]} else {
							_index = secondaries find _x;
							if (_index != -1) then {_currentWeapons = _currentWeapons + [_x];_currentSecondary = _x;ctrlSetText[_secondaryIDC,getText(configFile >> "CfgWeapons" >> _x >> "picture")]} else {
								_index = sidearms find _x;
								if (_index != -1) then {_currentWeapons = _currentWeapons + [_x];_currentSidearm = _x;ctrlSetText[_sidearmIDC,getText(configFile >> "CfgWeapons" >> _x >> "picture")]};
							};
						};
						_index = misc find _x;
						if (_index != -1) then {
							_type = getNumber(configFile >> "CfgWeapons" >> _x >> "type");
							if (_type == 0) then { _type = getNumber(configFile >> "CfgMagazines" >> _x >> "type"); };
							switch _type do {
								case 4096: {
									_currentSpecials = _currentSpecials + [_x];
								};
								case 131072: {
									_currentItems = _currentItems + [_x];
								};
							};
						};
					} forEach respawnWeapons;
					if (_currentPrimary == "") then  {ctrlSetText [_primaryIDC,"\ca\ui\data\ui_gear_gun_gs.paa"]};
					if (_currentSecondary == "") then  {ctrlSetText [_secondaryIDC,"\ca\ui\data\ui_gear_sec_gs.paa"]};
					if (_currentSidearm == "") then  {ctrlSetText [_sidearmIDC,"\ca\ui\data\ui_gear_hgun_gs.paa"]};
					_currentMagazines = respawnMagazines;
					for [{_x = 0},{_x < 2},{_x = _x + 1}] do {ctrlSetText[_specialIDC + _x,"\Ca\UI\Data\ui_gear_eq_gs.paa"]};
					_u = 0;
					{
						_index = misc find _x;
						ctrlSetText[_specialIDC + _u,getText(configFile >> "CfgWeapons" >> _x >> "picture")];
						_u = _u + 1;
					} forEach _currentSpecials;

					_displayInv = true;
				};
			};
			case "clear": {
				_currentPrimary = "";
				_currentSecondary = "";
				_currentSidearm = "";
				_currentWeapons = [];
				_currentItems = [];
				_currentSpecials = [];
				_currentMagazines = [];
				ctrlSetText [_primaryIDC,"\ca\ui\data\ui_gear_gun_gs.paa"];
				ctrlSetText [_secondaryIDC,"\ca\ui\data\ui_gear_sec_gs.paa"];
				ctrlSetText [_sidearmIDC,"\ca\ui\data\ui_gear_hgun_gs.paa"];
				for [{_x = 0},{_x < 2},{_x = _x + 1}] do {ctrlSetText[_specialIDC + _x,"\Ca\UI\Data\ui_gear_eq_gs.paa"]};
				_displayInv = true;
			};
		};
		WF_Gear_Action = "";
	};

	//Kit Limiting
	_quantity = _currentPrimary call getQuantity;
	if (_quantity != "" && _quantity != "1" && _quantity != "2") then { 
		_currentWeapons = _currentWeapons - [_currentPrimary] + [startWeapon];
		_magTypeOld    = getArray(configFile >> "CfgWeapons" >> _currentPrimary >> "magazines") select 0;
		if !(_magTypeOld in respawnMagazines) then { _magTypeOld    = getArray(configFile >> "CfgWeapons" >> _currentPrimary >> "magazines") select 1; };
		_typeOld       = getNumber(configFile >> 'CfgMagazines' >> _magTypeOld >> 'type');
		_magTypeNew    = getArray(configFile >> "CfgWeapons" >> startWeapon >> "magazines") select 0;
		_typeNew       = getNumber(configFile >> 'CfgMagazines' >> _magTypeNew >> 'type');
		_count         = count respawnMagazines;
		respawnMagazines = respawnMagazines - [_magTypeOld];
		for "_i" from 0 to ((_count - count respawnMagazines)*(_typeOld/_typeNew) - 1) do {
				respawnMagazines = respawnMagazines + [_magTypeNew];
		};
		respawnWeapons = respawnWeapons - [_currentPrimary] + [startWeapon];
		_currentPrimary = startWeapon; 
		_updateFiller = true;
		_updateUnit = true;
	};
	_quantity = _currentSecondary call getQuantity;
	if (_quantity != "" && _quantity != "1" && _quantity != "2") then { 
		_currentWeapons = _currentWeapons - [_currentSecondary]; 
		_magTypeOld    = getArray(configFile >> "CfgWeapons" >> _currentSecondary >> "magazines") select 0;
		if !(_magTypeOld in respawnMagazines) then { _magTypeOld    = getArray(configFile >> "CfgWeapons" >> _currentSecondary >> "magazines") select 1; };
		_typeOld       = getNumber(configFile >> 'CfgMagazines' >> _magTypeOld >> 'type');
		_magTypeNew    = getArray(configFile >> "CfgWeapons" >> _currentPrimary >> "magazines") select 0;
		_typeNew       = getNumber(configFile >> 'CfgMagazines' >> _magTypeNew >> 'type');
		_count         = count respawnMagazines;
		 respawnMagazines = respawnMagazines - [_magTypeOld];
		 for "_i" from 0 to ((_count - count respawnMagazines)*(_typeOld/_typeNew) - 1) do {
			 respawnMagazines = respawnMagazines + [_magTypeNew];
		};
		respawnWeapons = respawnWeapons - [_currentSecondary]; 
		_currentSecondary = ""; 
		_updateFiller = true;	
		_updateUnit = true;		
	};	
	
	//--- Show inventory (Icons).
	if (_displayInv) then {
		_displayInv = false;
		_data = (_currentMagazines + _currentItems) call displayInventory;
		_inventorySlots = _data select 0;
		_sidearmInventorySlots = _data select 1;
		_miscItemSlots = _data select 2;
	};
	
	//--- Buy a loadout.
	if (buyLoadout) then {
		buyLoadout = false;
		respawnWeapons = _currentWeapons + _currentSpecials + _currentItems;
		respawnMagazines = _currentMagazines;
		if (player distance HQ < 50 && isWest) then { hint "Weapons updated!"; call loadout; _updateFiller = true; };
		_weapons = (_currentWeapons + _currentSpecials + _currentItems);
		_ammo = _currentMagazines;
		_data = (_currentMagazines + _currentItems) call displayInventory;
		_inventorySlots = _data select 0;
		_sidearmInventorySlots = _data select 1;
		_miscItemSlots = _data select 2;		
	};					

	_lastFiller = _filler;
	sleep 0.05;
};

};
	