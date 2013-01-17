class RscTitles {

class IntroScreen {
	idd=-1;
	movingEnable = true;
	fadein = 0;
	fadeout = 1;
	duration = 30;
	name="IntroScreen";
	onLoad = "uiNamespace setVariable ['IntroScreen', _this select 0]";
	class controls {
		class IntroScreen_Text {
			type = 0;
			idc = 10001;
			style = 0;
			x = 0;y = -0.2;w = 0.85;h = 0.4;
			font = "Zeppelin32";
			sizeEx = 0.08;
			colorText[] = {1.0, 1.0, 1.0, 0.9};
			colorBackground[]={ 1, 1, 1, 0 };
			shadow = 2;
			text ="";
		};
		class IntroScreen_Text2: IntroScreen_Text {
			idc = 10002;
			x= 0;y = 0.1;w = 0.85; 
			sizeEx = 0.05;
		};
		class IntroScreen_Text3: IntroScreen_Text {
			idc = 10003;
			x= 0;y = 0.2;w = 0.85;
			sizeEx = 0.035;
		};
		class IntroScreen_Text4: IntroScreen_Text {
			idc = 10004;
			x= 0;y = 0.25;w = 0.85;
			sizeEx = 0.035;
		};
		class IntroScreen_Text5: IntroScreen_Text {
			idc = 10005;
			x=0;y = 0.35;w = 0.85;
			sizeEx = 0.04;
			colorText[] = {1.0, 0.0, 0.0, 0.9};
		};
		class IntroScreen_Text6: IntroScreen_Text {
			idc = 10006;
			x=0;y = 0.40;w = 0.85;
			sizeEx = 0.035;
		};
		class IntroScreen_Text7: IntroScreen_Text {
			idc = 10007;
			x=0;y = 0.45;w = 0.85;
			sizeEx = 0.035;
		};
		class IntroScreen_Text8: IntroScreen_Text {
			idc = 10008;
			x=0;y = 0.50;w = 0.85;
			sizeEx = 0.035;
		};
		class IntroScreen_Text10: IntroScreen_Text {
			idc = 10011;
			colorText[] = {0.1, 0.86, 0.1, 0.9};
			x=0.5;y = 0.9;w = 0.85;
			sizeEx = 0.03;
		};
	};
};

	class Rtags { 
		idd=64431; 
		movingEnable = true; 
		fadein       =  0; 
		fadeout      =  0; 
		duration     =  0.2; 
		name				 = "TAGS_HUD"; 
		controls[]	 = { "camtag", "nametag", "interact"}; 
		onLoad			 = "uiNamespace setVariable ['TAGS_HUD', _this select 0]"; 
		class camtag { 
			type 							= CT_STRUCTURED_TEXT; 
			idc 							= 64434; 
			style 						= 0x00; 
			x 								= safeZoneX; 
			y 								= safeZoneY+safeZoneH/2+0.3; 
			w 								= safeZoneW; 
			h 								= safeZoneH; 
			font 							= "Zeppelin33"; 
			size 							= 0.03; 
			colorText[] 			= { 0, 0.4, 0.8, 0.8}; 
			colorBackground[]	={ 0,0,0,0.0}; 
			text 							= ""; 		
			class Attributes { 
				font 				= "Zeppelin33"; 
				color 			= "#347C17"; 
				align 			= "center"; 
				valign 			= "middle"; 
				shadow 			= "1"; 
				shadowColor = "#000000"; 
				size 				= "1"; 
			}; 	
		};
		class nametag { 
			type 							= CT_STRUCTURED_TEXT; 
			idc 							= 64435; 
			style 						= 0x00; 
			x 								= safeZoneX+ 0.1; 
			y 								= safeZoneY+safeZoneH/2+0.05; 
			w 								= safeZoneW; 
			h 								= safeZoneH; 
			font 							= "Zeppelin33"; 
			size 							= 0.03; 
			colorText[] 			= { 0, 0.4, 0.8, 0.8}; 
			colorBackground[]	={ 0,0,0,0.0}; 
			text 							= ""; 		
			class Attributes { 
				font 				= "Zeppelin33"; 
				color 			= "#2B60DE"; 
				align 			= "center"; 
				valign 			= "middle"; 
				shadow 			= "1"; 
				shadowColor = "#000000"; 
				size 				= "1"; 
			}; 	
		}; 
		class interact { 
			type 							= CT_STRUCTURED_TEXT; 
			idc 							= 64436; 
			style							= 0x00; 			
			x 								= safeZoneX; 
			y 								= safeZoneY+safeZoneH/2+0.2; 
			w 								= safeZoneW; 
			h 								= safeZoneH; 
			font 							= "Zeppelin33"; 
			size 							= 0.03; 
			colorText[] 			= { 1, 1, 0, 0.8}; 
			colorBackground[]	={ 0,0,0,0.0}; 
			text 							= ""; 
			class Attributes { 
				font 				= "Zeppelin33"; 
				color 			= "#2B60DE"; 
				align 			= "center"; 
				valign 			= "middle"; 
				shadow 			= "1"; 
				shadowColor = "#000000"; 
				size 				= "1"; 
			}; 
		}; 
	};
}; 