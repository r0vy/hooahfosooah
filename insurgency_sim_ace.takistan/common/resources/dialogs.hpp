
//--- Gear Menu.
class RscGear {
	movingEnable = 1;
	idd = 16000;
	
	class controlsBackground {
		class Mainback : RscPicture {
			x = 0.04;
			y = 0.01;
			w = 1.2549;
			h = 1.6732;
			moving = 1;
			text = "\ca\ui\data\igui_background_gear_ca.paa";
		};
	};
	
	class controls {
		class FilterButtonSidearm : RscClickableText {
			idc = 3400 + 4;
			style = 48 + 0x800;
			x = 0.300;
			y = 0.047;
			w = 0.086;
			h = 0.086;
			color[] = {1, 1, 1, 1};
			colorActive[] = subcolor1;
			text = "\CA\warfare2\images\GearIconSidearm.paa";
			action = "server setVariable ['filler', 'sidearms'];";
		};
		
		class FilterButtonMisc : FilterButtonSidearm {
			idc = 3400 + 5;
			x = 0.375;
			text = "\CA\warfare2\images\GearIconMisc.paa";
			action = "server setVariable ['filler', 'misc'];";
		};
		
		class FilterButtonSecondary : FilterButtonSidearm {
			idc = 3400 + 3;
			x = 0.225;
			text = "\CA\warfare2\images\GearIconSecondary.paa";
			action = "server setVariable ['filler', 'secondaries'];";
		};
		
		class FilterButtonPrimary : FilterButtonSidearm {
			idc = 3400 + 2;
			x = 0.15;
			text = "\CA\warfare2\images\GearIconPrimary.paa";
			action = "server setVariable ['filler', 'primaries'];";
		};
		
		class FilterButtonAll : FilterButtonSidearm {
			idc = 3400 + 1;
			x = 0.075;
			text = "\CA\warfare2\images\GearIconAll.paa";
			action = "server setVariable ['filler', 'all'];";
		};
		class ConClear : FilterButtonSidearm {
			idc = 3800;
			x = 0.902;
			y = 0.014;
			w = 0.032;
			h = 0.032;
			tooltip = "Gear: Clear the current loadout.";
			text = "common\client\images\i_clear.paa";
			action = "WF_Gear_Action = 'clear'";
		};
		class ConReload : ConClear {
			idc = 3800 + 1;
			x = 0.93;
			tooltip = "Gear: Reload the previous loadout.";
			text = "common\client\images\i_reload.paa";
			action = "WF_Gear_Action = 'reload'";
		};
		class MainList : RscListBoxA {
			idc = 3700;
			columns[] = {0.01, 0.25};
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			x = 0.043;
			y = 0.127676;
			w = 0.45;
			h = 0.52;
			
			onLBSelChanged = "lbChange = true;";
			onLBDblClick = "lbMainAction = 'addWeapon';";
		};
		class SecondaryList : RscListBoxA {
			idc = 3701;
			columns[] = {0.01, 0.25};
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			x = 0.043;
			y = 0.66;
			w = 0.45;
			h = 0.24;
			
			onLBDblClick = "lbMainAction = 'addMagazine';";
		};	
		class PrimaryWeapon : RscClickableText {
			idc = 3500;
			x = 0.502;
			y = 0.244;
			w = 0.286;
			h = 0.15;
			style = 48 + 0x800;
			soundDoubleClick[] = {"", 0.1, 1};
			colorBackground[] = {0.6, 0.83, 0.47, 1};
			colorBackgroundSelected[] = {0.6, 0.83, 0.47, 1};
			colorFocused[] = {0, 0, 0, 0};
			color[] = {0.85, 0.85, 0.85, 1};
			colorText[] = {0.85, 0.85, 0.85, 1};
			colorActive[] = {1, 1, 1, 1};
			text = "\Ca\UI\Data\ui_gear_gun_gs.paa";
			action = "primClicked = true";
		};
		
		class SecondaryWeapon : PrimaryWeapon {
			idc = 3500 + 1;
			y = 0.398;
			text = "\Ca\UI\Data\ui_gear_sec_gs.paa";
			action = "secoClicked = true";
		};
		
		class Sidearm : PrimaryWeapon {
			idc = 3500 + 2;
			x = 0.56;
			y = 0.551;
			w = 0.113;
			h = 0.15;
			text = "\Ca\UI\Data\ui_gear_hgun_gs.paa";
			action = "sideClicked = true";
		};
		
		class InventorySlot0 : PrimaryWeapon {
			idc = 3500 + 3;
			x = 0.79;
			y = 0.244;
			w = 0.055;
			h = 0.074;
			text = "\Ca\UI\Data\ui_gear_mag_gs.paa";
			action = "inventoryClick = 3503";
		};
		
		class InventorySlot1 : InventorySlot0 {
			idc = 3500 + 4;
			x = 0.847;
			y = 0.244;
			action = "inventoryClick = 3504;";
		};
		
		class InventorySlot2 : InventorySlot0 {
			idc = 3500 + 5;
			x = 0.904366;
			y = 0.244;
			action = "inventoryClick = 3505";
		};
		
		class InventorySlot3 : InventorySlot0 {
			idc = 3500 + 6;
			x = 0.79;
			y = 0.321;
			action = "inventoryClick = 3506";
		};
		
		class InventorySlot4 : InventorySlot0 {
			idc = 3500 + 7;
			x = 0.847;
			y = 0.321;
			action = "inventoryClick = 3507";
		};
		
		class InventorySlot5 : InventorySlot0 {
			idc = 3500 + 8;
			x = 0.904366;
			y = 0.321;
			action = "inventoryClick = 3508";
		};
		
		class InventorySlot6 : InventorySlot0 {
			idc = 3500 + 9;
			x = 0.79;
			y = 0.398;
			action = "inventoryClick = 3509";
		};
		
		class InventorySlot7 : InventorySlot0 {
			idc = 3500 + 10;
			x = 0.847;
			y = 0.398;
			action = "inventoryClick = 3510";
		};
		
		class InventorySlot8 : InventorySlot0 {
			idc = 3500 + 11;
			x = 0.904366;
			y = 0.398;
			action = "inventoryClick = 3511";
		};
		
		class InventorySlot9 : InventorySlot0 {
			idc = 3500 + 12;
			x = 0.79;
			y = 0.474;
			action = "inventoryClick = 3512";
		};
		
		class InventorySlot10 : InventorySlot0 {
			idc = 3500 + 13;
			x = 0.847;
			y = 0.474;
			action = "inventoryClick = 3513";
		};
		
		class InventorySlot11 : InventorySlot0 {
			idc = 3500 + 14;
			x = 0.904366;
			y = 0.474;
			action = "inventoryClick = 3514";
		};
		
		class SidearmInventorySlot0 : InventorySlot0 {
			idc = 3500 + 15;
			x = 0.674;
			y = 0.551;
			w = 0.055;
			h = 0.074;
			text = "\Ca\UI\Data\ui_gear_hgunmag_gs.paa";
			action = "inventoryClick = 3515";
		};
		
		class SidearmInventorySlot1 : SidearmInventorySlot0 {
			idc = 3500 + 16;
			x = 0.733;
			y = 0.551;
			action = "inventoryClick = 3516";
		};
		
		class SidearmInventorySlot2 : SidearmInventorySlot0 {
			idc = 3500 + 17;
			x = 0.79;
			action = "inventoryClick = 3517";
		};
		
		class SidearmInventorySlot3 : SidearmInventorySlot0 {
			idc = 3500 + 18;
			x = 0.847;
			action = "inventoryClick = 3518";
		};
		
		class SidearmInventorySlot4 : SidearmInventorySlot0 {
			idc = 3500 + 19;
			x = 0.674;
			y = 0.628;
			action = "inventoryClick = 3519";
		};
		
		class SidearmInventorySlot5 : SidearmInventorySlot0 {
			idc = 3500 + 20;
			x = 0.733;
			y = 0.628;
			action = "inventoryClick = 3520";
		};
		
		class SidearmInventorySlot6 : SidearmInventorySlot0 {
			idc = 3500 + 21;
			x = 0.79;
			y = 0.628;
			action = "inventoryClick = 3521";
		};
		
		class SidearmInventorySlot7 : SidearmInventorySlot0 {
			idc = 3500 + 22;
			x = 0.847;
			y = 0.628;
			action = "inventoryClick = 3522";
		};
		
		class MiscInventorySlot0 : InventorySlot0 {
			idc = 3500 + 23;
			x = 0.56;
			y = 0.705;
			w = 0.055;
			h = 0.074;
			colorActive[] = {0.85, 0.85, 0.85, 1};
			text = "\Ca\UI\Data\ui_gear_eq_gs.paa";
			action = "inventoryClick = 3523";
		};
		
		class MiscInventorySlot1 : MiscInventorySlot0 {
			idc = 3500 + 24;
			x = 0.617;
			y = 0.705;
			action = "inventoryClick = 3524";
		};
		
		class MiscInventorySlot2 : MiscInventorySlot0 {
			idc = 3500 + 25;
			x = 0.674;
			y = 0.705;
			action = "inventoryClick = 3525";
		};
		
		class MiscInventorySlot3 : MiscInventorySlot0 {
			idc = 3500 + 26;
			x = 0.733;
			y = 0.705;
			action = "inventoryClick = 3526";
		};
		
		class MiscInventorySlot4 : MiscInventorySlot0 {
			idc = 3500 + 27;
			x = 0.79;
			y = 0.705;
			action = "inventoryClick = 3527";
		};
		
		class MiscInventorySlot5 : MiscInventorySlot0 {
			idc = 3500 + 28;
			x = 0.847;
			y = 0.705;
			action = "inventoryClick = 3528";
		};
		
		class MiscInventorySlot6 : MiscInventorySlot0 {
			idc = 3500 + 29;
			x = 0.56;
			y = 0.782;
			action = "inventoryClick = 3529";
		};
		
		class MiscInventorySlot7 : MiscInventorySlot0 {
			idc = 3500 + 30;
			x = 0.617;
			y = 0.782;
			action = "inventoryClick = 3530";
		};
		
		class MiscInventorySlot8 : MiscInventorySlot0 {
			idc = 3500 + 31;
			x = 0.674;
			y = 0.782;
			action = "inventoryClick = 3531";
		};
		
		class MiscInventorySlot9 : MiscInventorySlot0 {
			idc = 3500 + 32;
			x = 0.733;
			y = 0.782;
			action = "inventoryClick = 3532";
		};
		
		class MiscInventorySlot10 : MiscInventorySlot0 {
			idc = 3500 + 33;
			x = 0.79;
			y = 0.782;
			action = "inventoryClick = 3533";
		};
		
		class MiscInventorySlot11 : MiscInventorySlot0 {
			idc = 3500 + 34;
			x = 0.847;
			y = 0.782;
			action = "inventoryClick = 3534";
		};
		
		class SpecialInventorySlot0 : InventorySlot0 {
			idc = 3500 + 35;
			x = 0.502;
			y = 0.09;
			w = 0.113;
			h = 0.15;
			colorActive[] = {0.85, 0.85, 0.85, 1};
			text = "\Ca\UI\Data\ui_gear_eq_gs.paa";
			action = "inventoryClick = 3535";
		};
		
		class SpecialInventorySlot1 : SpecialInventorySlot0 {
			idc = 3500 + 36;
			x = 0.847;
			y = 0.09;
			action = "inventoryClick = 3536";
		};
		
		class CA_Money_Value : RscText {
			idc = 3850;
			x = 0.727942;
			y = 0.86;
			SizeEx = 0.03;
			text = "";
			colorText[] = subcolor1;
		};
		
		class CA_GearLabel : CA_Money_Value {
			idc = 3852;
			style = 2;
			x = 0.502419;
			y = 0.0492156;
			w = 0.456;
			SizeEx = 0.03;
			text = "Respawn loadout:";
		};
		
		class Gear_Title : CA_Money_Value {
			idc = 3853;
			x = 0.047634;
			y = 0.01;
			text = "Gear Menu:";
		};
		
		class BuyButton : RscIGUIShortcutButton {
			idc = 3900;
			x = 0.0392 + 0.245*2;
			y = 0.897;
			w = 0.185;
			h = 0.052;
			text = "Save";
			action = "buyLoadout = true";
		};
		
		class CloseButton : BuyButton {
			idc = 3901;
			x = 0.0392 + 0.245;
			text = "Close";
			action = "closeDialog 0";
		};			
	};
};

#include "options.hpp"