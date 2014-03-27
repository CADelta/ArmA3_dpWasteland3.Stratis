#define serverCADminMenu_dialog 50006
#define serverCADminMenu_option 50007

class serverCADminMenu
{
	idd = serverCADminMenu_dialog;
	movingEnable=1;
	onLoad = "uiNamespace setVariable ['serverCADminMenu', _this select 0]";

	class controlsBackground
	{
		class serverCADminMenu_Title:w_RscText
		{
			idc=-1;
			text="Menu";
			x=0.35;
			y=0.14;
			w=0.088;
			h=0.035;
		};

		class serverCADminMenu_background:w_RscBackground
		{
			idc=-1;
			x=0.28;
			y=0.10;
			w=0.42;
			h=0.74;
		};
	};

	class controls
	{
		class serverCADminMenu_options:w_Rsclist
		{
			idc = serverCADminMenu_option;
			x=0.35;
			y=0.21;
			w=0.31;
			h=0.49;
		};

		class serverCADminMenu_activate:w_RscButton
		{
			idc=-1;
			text="Select";
			onButtonClick = "[1] execVM 'client\gui\adminPanel\optionSelect.sqf'";
			x=0.40;
			y=0.74;
			w=0.22;
			h=0.071;
		};
	};
};