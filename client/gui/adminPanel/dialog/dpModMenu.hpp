#define dpModMenu_dialog 50004
#define dpModMenu_option 50005

class dpModMenu
{
	idd = dpModMenu_dialog;
	movingEnable=1;
	onLoad = "uiNamespace setVariable ['dpModMenu', _this select 0]";

	class controlsBackground {

		class dpModMenu_Title:w_RscText
		{
			idc=-1;
			text="Menu";
			x=0.35;
			y=0.14;
			w=0.088;
			h=0.035;
		};

		class dpModMenu_background:w_RscBackground
		{
			idc=-1;
			x=0.28;
			y=0.10;
			w=0.42;
			h=0.74;
		};
	};

	class controls {

		class dpModMenu_options:w_Rsclist
		{
			idc = dpModMenu_option;
			x=0.35;
			y=0.21;
			w=0.31;
			h=0.49;
		};

		class dpModMenu_activate:w_RscButton
		{
			idc=-1;
			text="Select";
			onButtonClick = "[0] execVM 'client\gui\adminPanel\optionSelect.sqf'";
			x=0.40;
			y=0.74;
			w=0.22;
			h=0.071;
		};
	};
};