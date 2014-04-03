//	@file Name: hud.hpp
//	@file Author: [404] Deadbeat, [CAD] Krycek

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_scanner_idc 3602
#define hud_website_idc 3603
#define	hud_activity_icon_idc 3604
#define	hud_activity_textbox_idc 3605

class WastelandHud
{
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 1.1;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";
	
	class controlsBackground
	{
		class WastelandHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.4; 
			h = 0.65;
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			shadow = 2;
			text = "";
			class Attributes
			{
				align = "right";
			};
		};
		class WastelandHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0.20 / SafeZoneH)));
			w = 0.14; 
			h = 0.30;
			lineSpacing = 6;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			shadow = 2;
			text = "100 Status";
			class Attributes
			{
				align = "right";
			};
		};
		class WastelandHud_Website:w_RscText
		{
			idc = hud_website_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.66 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0.04 / SafeZoneH)));
			w = 0.64; 
			h = 0.10;
			lineSpacing = 6;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			shadow = 2;
			text = "<t color='#91aa87' shadow='2' size='1.0'>dp Wasteland 3.0 - dp-clan.enjin.com</t>";
			class Attributes
			{
				align = "right";
			};
		};
		class WastelandHud_Scanner:w_RscText
		{
			idc = hud_scanner_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX;
            y = safeZoneY + (safeZoneH * (1 - (0.23 / SafeZoneH)));		// 0.20
			w = 0.30;		// 0.24
			h = 0.30;
			lineSpacing = 6;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			shadow = 2;
			text = "Scanner Battery 100%\nScanning...";
			class Attributes
			{
				align = "left";
			};
		};
		class WastelandHud_ActivityIcon:w_RscText		// Territory System Icon
		{
			idc = hud_activity_icon_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.03;
			x = safeZoneX + (safeZoneW * 0.177);
			y = safeZoneY + (safeZoneH * 0.011);
			w = (0.06 * 3/4) * safezoneW;
			h = 0.10 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes
			{
				align = "center";
				valign = "middle";
			};
		};
		class WastelandHud_ActivityTextBox:w_RscText	// Territory System Text Box
		{
			idc = hud_activity_textbox_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.03;
			x = safeZoneX + (safeZoneW * 0.225);
			y = safeZoneY + (safeZoneH * 0.011);
			w = 0.22 * safezoneW;
			h = 0.05 * safezoneH;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 1;
			class Attributes
			{
				align = "left";
				valign = "middle";
			};
		};
	};
};
