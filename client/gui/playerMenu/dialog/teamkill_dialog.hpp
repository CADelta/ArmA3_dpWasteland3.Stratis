#define tkDialog 3300
#define tkDialogTitle 3301
#define tkDialogText 3302
#define tkDialogForgive 3303
#define tkDialogAnnounce 3304
#define tkDialogPunish 3305

class TeamkillDialog {
	idd = tkDialog;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class MainBG:w_RscPicture {
			idc = -1;
			text = "client\ui\ui_background_controlers_ca.paa";
			moving = true;

			x = 0.25;
			y = 0.050;
			w = 0.90;
			h = 0.45 * (SafeZoneW / SafeZoneH);
		};

		class MainTitle:w_RscText {
			idc = tkDialogTitle;
			style = ST_CENTER;
			text = "You have been team killed.";
			sizeEx = 0.04;
			shadow = 2;
			
			x = 0.35;
			y = 0.125;
			w = 0.46;
			h = 0.03;
		};		
		class TeamkillText:w_RscText {
			idc = tkDialogText;
			type = CT_STRUCTURED_TEXT+ST_LEFT;
			size = 0.04;
			
			x = 0.26;
			y = 0.19;
			w = 0.65;
			h = 0.358;

			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "";
			
			class Attributes {
    			//font = "TahomaB";
    			align = "center";
    			valign = "middle";
    			shadow = 2;
  			};
		};
	};
	
	class controls {
		class ForgiveButton:w_RscButton {
			idc = tkDialogForgive;
			text = "Forgive";
			onButtonClick = "false call teamkillAction";

			size = 0.031;
			color[] = {0.10, 0.95, 0.10, 1};
			
			x = 0.30;
			y = 0.585;
			w = 0.16;
			h = 0.065;
		};

		class PunishButton:w_RscButton {
			idc = tkDialogPunish;
			text = "Punish";
			onButtonClick = "true call teamkillAction";

			size = 0.031;
			color[] = {0.95, 0.10, 0.10, 1};
			
			x = 0.71;
			y = 0.585;
			w = 0.16;
			h = 0.065;
		};

	};
};