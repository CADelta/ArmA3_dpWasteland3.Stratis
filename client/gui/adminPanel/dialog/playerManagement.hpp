#define playerMenuDialog 55500
#define playerMenuPlayerSkin 55501
#define playerMenuPlayerGun 55502
#define playerMenuPlayerItems 55503
#define playerMenuPlayerPos 55504
#define playerMenuPlayerList 55505
#define playerMenuSpectateButton 55506
#define playerMenuPlayerObject 55507
#define playerMenuPlayerHealth 55508
#define playerMenuWarnMessage 55509
#define playerMenuPlayerGroup 55510

class PlayerManagement
{
	idd = playerMenuDialog;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground
	{
		class MainBackground: w_RscPicture
		{
			idc = -1;
			text = "client\ui\ui_background_controlers_ca.paa";
			x = 0.1875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.938 * safezoneW;
			h = 0.661111 * safezoneH;
		};

		class DialogTitleText: w_RscText
		{
			idc = -1;
			text = "Player Management";

			x = 0.20 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.0844792 * safezoneW;
			h = 0.0448148 * safezoneH;
		};

		class PlayerObjectText: w_RscText
		{
			idc = playerMenuPlayerObject;
			text = "Slot:";
			sizeEx = 0.030;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerSkinText: w_RscText
		{
			idc = playerMenuPlayerSkin;
			text = "Skin:";
			sizeEx = 0.030;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerGunText: w_RscText
		{
			idc = playerMenuPlayerGun;
			text = "Money:";
			sizeEx = 0.030;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerItemsText: w_RscText
		{
			idc = playerMenuPlayerItems;
			text = "Items:";
			sizeEx = 0.030;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.30 * safezoneH + safezoneY;
			w = 0.40 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerHealthText: w_RscText
		{
			idc = playerMenuPlayerHealth;
			text = "Health:";
			sizeEx = 0.030;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerPosistionText: w_RscText
		{
			idc = playerMenuPlayerPos;
			text = "Position:";
			sizeEx = 0.030;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};
		
		class PlayerGroupText: w_RscText
		{
			idc = playerMenuPlayerGroup;
			text = "Group:";
			sizeEx = 0.030;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.40 * safezoneW;
			h = 0.04 * safezoneH;
		};
	};
	
	class controls
	{
		class PlayerEditBox: w_RscEdit
		{
			idc=playerMenuWarnMessage;
			x = 0.688 * safezoneW + safezoneX;
			y = 0.745 * safezoneH + safezoneY;
			w = 0.172 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerListBox: w_RscListbox
		{
			idc = playerMenuPlayerList;
			onLBSelChanged="[2,_this select 1] execVM ""client\gui\adminPanel\importvalues.sqf"";";
			x = 0.20 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.435 * safezoneW;
			h = 0.45 * safezoneH;
		};

		class SpectateButton: w_RscButton
		{
			idc = playerMenuSpectateButton;
			text = "Spectate";
			onButtonClick = "[0] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.2 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class CameraViewButton: w_RscButton
		{
			idc = -1;
			text = "View";
			onButtonClick = "[8] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.2 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class UnlockTeamSwitchButton: w_RscButton
		{
			idc = -1;
			text = "Unlock Team Switch";
			onButtonClick = "[3] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.256 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.120 * safezoneW;
			h = 0.04 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};

		class UnlockTeamKillerButton: w_RscButton
		{
			idc = -1;
			text = "Unlock Team Kill";
			onButtonClick = "[4] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.256 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.120 * safezoneW;
			h = 0.04 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};

		class RemoveAllMoneyButton: w_RscButton
		{
			idc = -1;
			text = "Remove All Money";
			onButtonClick = "[5] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.381 * safezoneW + safezoneX;
			y = 0.735 * safezoneH + safezoneY;
			w = 0.120 * safezoneW;
			h = 0.04 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class RemoveAllWeaponsButton: w_RscButton
		{
			idc = -1;
			text = "Remove All Weapons";
			onButtonClick = "[6] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.381 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.120 * safezoneW;
			h = 0.04 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class SlayButton: w_RscButton
		{
			idc = -1;
			text = "Slay";
			onButtonClick = "[2] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.507 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
		
		class CheckPlayerGearButton: w_RscButton
		{
			idc = -1;
			text = "Check Gear";
			onButtonClick = "[7] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.562 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.065 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class WarnButton: w_RscButton
		{
			idc = -1;
			text = "Warn";
			onButtonClick = "[1] execVM 'client\gui\adminPanel\playerSelect.sqf'";
			x = 0.632 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};
	};
};
