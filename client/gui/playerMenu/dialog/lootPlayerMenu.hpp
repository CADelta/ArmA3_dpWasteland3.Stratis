#include "player_sys.sqf"

class lootPlayerMenu {

	idd = lootPlayerMenu_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
		
		class MainBG : w_RscPicture {
			idc = -1;
			text = "client\ui\ui_background_controlers_ca.paa";		
			moving = true;
			x = 0.0; y = 0.1;
			w = 0.5; h = 0.65;
		};
		
		class MainTitle : w_RscText {
			idc = -1;
			text = "Loot Player Menu";
			sizeEx = 0.04;
			shadow = 2;		
			x = 0.050; y = 0.112;
			w = 0.3; h = 0.05;
		};
		
		class moneyIcon : w_RscPicture {	
	  		idc = -1;
        	text = "client\ui\icons\money.paa";
        	x = 0.22; y = 0.55;
			w = 0.05 * 3 / 4; h = 0.05;
		};
		
		class moneyText : w_RscText {
			idc = loot_money_text;
			text = "";
			sizeEx = 0.03;
			x = 0.26; y = 0.54;
			w = 0.3; h = 0.05;
		};
	};
	
	class controls {
	
		class itemList : w_Rsclist {
			idc = loot_item_list;
			x = 0.02; y = 0.200;
			w = 0.32; h = 0.325;
		};
		
		class DropButton : w_RscButton {
			text = "Take";
			onButtonClick = "[] spawn takeItem";
			x = 0.02; y = 0.55;
			w = 0.15; h = 0.033 * safezoneH;
		};
		
		class DropcButton : w_RscButton {
			text = "Take Money";
			onButtonClick = "[] spawn takeMoney";
			x = 0.20; y = 0.60;
			w = 0.15; h = 0.033 * safezoneH;
		};
		
		class CloseButton : w_RscButton {
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.02; y = 0.68;
			w = 0.125; h = 0.033 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
	};
};