#include "player_sys.sqf"

class playerSettings
{

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground
	{
		
		class MainBG : w_RscPicture
		{
			idc = -1;
			text = "client\ui\ui_background_controlers_ca_new.paa";		
			moving = true;
//			x = 0.0;
//			y = 0.1;
//			w = 1.0;
//			h = 0.65;
			x = -0.342;
			y = -0.25;
			w = 2.35;
			h = 1.55;
		};
		
		class MainTitle : w_RscText
		{
			idc = -1;
			text = "Player Inventory Menu";
			sizeEx = 0.04;
			shadow = 2;		
			x = 0.260;
			y = 0.112;
			w = 0.3;
			h = 0.05;
		};
		
		class moneyIcon : w_RscPicture
		{
	  		idc = -1;
        	text = "client\ui\icons\money.paa";
        	x = 0.02;
			y = 0.32;
			w = 0.05 * 3 / 4;
			h = 0.05;
		};
		
		class waterIcon : w_RscPicture
		{
	  		idc = -1;
        	text = "client\ui\icons\water.paa";
        	x = 0.015;
			y = 0.19;
			w = 0.05 * 3 / 4;
			h = 0.05;
		};
		
		class foodIcon : w_RscPicture
		{
      		idc = -1;
        	text = "client\ui\icons\food.paa";
        	x = 0.02;
			y = 0.26;
			w = 0.05 * 3 / 4;
			h = 0.05;
		};
		
		class moneyText : w_RscText
		{
			idc = money_text;
			text = "";
			sizeEx = 0.04;
			x = 0.06;
			y = 0.313;
			w = 0.3;
			h = 0.05;
		};
		
		class foodText : w_RscText
		{
			idc = food_text;
			sizeEx = 0.04;
			text = "";
			x = 0.06;
			y = 0.254;
			w = 0.3;
			h = 0.05;
		};
		
		class waterText : w_RscText
		{
			idc = water_text;
			text = "";
			sizeEx = 0.04;
			x = 0.06;
			y = 0.193;
			w = 0.3;
			h = 0.05;
		};

		class distanceText : w_RscText
		{
			idc = view_range_text;
			text = "View range:";
			sizeEx = 0.035;
			x = 0.03;
			y = 0.40;
			w = 0.3;
			h = 0.02;
		};			
	};
	
	class controls
	{
	
		class itemList : w_Rsclist
		{
			idc = item_list;
			x = 0.49;
			y = 0.200;
			w = 0.235;
			h = 0.325;
			
		};

		class playerList : w_Rsclist
		{
			idc = give_to_list;
			x = 0.240;
			y = 0.200;
			w = 0.235;
			h = 0.325;
		};
		
		class DropButton : w_RscButton
		{
			text = "Give";
			//onButtonClick = "[1] spawn itemfnc";
			onButtonClick = "[1] execVM 'client\gui\playerMenu\itemfnc.sqf'";
			x = 0.350;
			y = 0.55;
			w = 0.125;
			h = 0.033 * safezoneH;
		};
		
		class UseButton : w_RscButton
		{
			text = "Use";
			//onButtonClick = "[0] spawn itemfnc";
			onButtonClick = "[0] execVM 'client\gui\playerMenu\itemfnc.sqf'";
			x = 0.49;
			y = 0.55;
			w = 0.125;
			h = 0.033 * safezoneH;
		};

		class moneyInput: w_RscCombo
		{
			idc = money_value;
			x = 0.240;
			y = 0.605;
			w = .105;
			h = .030;
		};
		
		class DropcButton : w_RscButton
		{
			text = "Give Money";
			onButtonClick = "[] spawn giveMoney";
			x = 0.350;
			y = 0.6;
			w = 0.125;
			h = 0.033 * safezoneH;
		};
		
		class CloseButton : w_RscButton
		{
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.02;
			y = 0.68;
			w = 0.125;
			h = 0.033 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class GroupsButton : w_RscButton
		{
			idc = groupButton;
			text = "Group Management";
			onButtonClick = "[] spawn loadGroupManagement";
			x = 0.150;
			y = 0.68;
			w = 0.225;
			h = 0.033 * safezoneH;
		};

		class btnDistanceNear : w_RscButton
		{
			text = "Near";
			onButtonClick = "setViewDistance 1200; setObjectViewDistance 600;";
			x = 0.02;
			y = 0.45;
			w = 0.125;
			h = 0.033 * safezoneH;
			toolTip = "ViewDistance = 1200 | ObjectViewDistance = 600";
		};

		class btnDistanceMedium : w_RscButton
		{
			text = "Medium";
			onButtonClick = "setViewDistance 2000; setObjectViewDistance 1000;";
			x = 0.02;
			y = 0.50;
			w = 0.125;
			h = 0.033 * safezoneH;
			toolTip = "ViewDistance = 2000 | ObjectViewDistance = 1000";
		};

		class btnDistanceFar : w_RscButton
		{
			text = "Far";
			onButtonClick = "setViewDistance 2500; setObjectViewDistance 1500;";
			x = 0.02;
			y = 0.55;
			w = 0.125;
			h = 0.033 * safezoneH;
			toolTip = "ViewDistance = 2500 | ObjectViewDistance = 1500";
		};
		
		class btnDistanceInsane : w_RscButton
		{
			text = "Insane";
			onButtonClick = "setViewDistance 3000; setObjectViewDistance 2000;";
			x = 0.02;
			y = 0.60;
			w = 0.125;
			h = 0.033 * safezoneH;
			toolTip = "ViewDistance = 3000 | ObjectViewDistance = 2000";
		};
	};
};