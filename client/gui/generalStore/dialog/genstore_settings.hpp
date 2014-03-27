// @ file Name: genstore_settings.hpp
// @ file Author: [CAD] Krycek

#include "genstoreDefines.sqf"

class genstored {

	idd = genstore_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[0] execVM 'client\gui\generalStore\populateGenStore.sqf'";

	class controlsBackground {

		class MainBackground: w_RscPicture {

			idc = -1;
			text = "client\ui\ui_background_controlers_ca.paa";

			x = 0.1875 * safeZoneW + safeZoneX;
			y = 0.15 * safeZoneH + safeZoneY;
			w = 0.837499 * safeZoneW;
			h = 0.661111 * safeZoneH;
		};
		
		class ItemSelectedPicture: w_RscPicture {

			idc = genstore_item_pic;					// Picture
			text = "";

			x = 0.53475 * safeZoneW + safeZoneX;
			y = 0.245 * safeZoneH + safeZoneY;
			w = 0.06 * safeZoneW;
			h = 0.08 * safeZoneH;
		};

		class ItemSelectedInfo: w_RscStructuredText {

			idc = genstore_item_Info;					// Info
			text = "";

			x = 0.4915 * safeZoneW + safeZoneX;
			y = 0.51 * safeZoneH + safeZoneY;
			w = 0.1465 * safeZoneW;
			h = 0.167 * safeZoneH;
		};

		class ItemSelectedPrice: w_RscStructuredText {

			idc = genstore_item_TEXT;					// Price
			text = "";

			x = 0.4915 * safeZoneW + safeZoneX;
			y = 0.36 * safeZoneH + safeZoneY;
			w = 0.1465 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class DialogTitleText: w_RscText {

			idc = -1;
			text = "General Store Menu";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.175 * safeZoneH + safeZoneY;
			w = 0.085 * safeZoneW;
			h = 0.045 * safeZoneH;
		};

		class PlayerMoneyText: w_RscText {

			idc = genstore_money;
			text = "Cash:";

			x = 0.648 * safeZoneW + safeZoneX;
			y = 0.175 * safeZoneH + safeZoneY;
			w = 0.085 * safeZoneW;
			h = 0.045 * safeZoneH;
		};

		class CartTotalText: w_RscText {

			idc = genstore_total;
			text = "Total: $0";

			x = 0.648 * safeZoneW + safeZoneX;
			y = 0.675 * safeZoneH + safeZoneY;
			w = 0.1 * safeZoneW;
			h = 0.045 * safeZoneH;
		};	
	};
	
	class controls {
		
		class SelectionList: w_RscListbox {

			idc = genstore_item_list;			// List
			onLBSelChanged = "[] execvm 'client\gui\generalStore\generalStoreItemInfo.sqf'";

			x = 0.3 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.1795 * safeZoneW;
			h = 0.45 * safeZoneH;
		};

		class CartList: w_RscListbox {

			idc = genstore_cart;				// Cart
			onLBSelChanged = "[] execvm 'client\gui\generalStore\generalStoreItemInfo.sqf'";

			x = 0.65 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.14 * safeZoneW;
			h = 0.45 * safeZoneH;
		};

		class AddToCart : w_RscButton {
			
			text = "Add";
			onButtonClick = "[] execVM 'client\gui\generalStore\addToCart.sqf'";
			
			x = 0.53225 * safeZoneW + safeZoneX;
			y = 0.41 * safeZoneH + safeZoneY;
			w = 0.065 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class RemoveFromCart : w_RscButton {

			text = "Remove";
			onButtonClick = "[] execVM 'client\gui\generalStore\removeFromCart.sqf'";

			x = 0.53225 * safeZoneW + safeZoneX;
			y = 0.46 * safeZoneH + safeZoneY;
			w = 0.065 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class CancelButton : w_RscButton {
			
			idc = -1;
			text = "Cancel";
			onButtonClick = "closeDialog 0;";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.750 * safeZoneH + safeZoneY;
			w = 0.072 * safeZoneW;
			h = 0.04 * safeZoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class SaleBuy : w_RscButton {
			
			idc = genstore_switch;

			text = "Sell Items";
			onButtonClick = "[] execVM 'client\gui\generalStore\switchMode.sqf'";

			x = 0.512 * safeZoneW + safeZoneX;
			y = 0.750 * safeZoneH + safeZoneY;
			w = 0.096 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class BuyToPlayer : w_RscButton {

			idc = genstore_buysell;

			text = "Buy";
			onButtonClick = "[0] execVM 'client\gui\generalStore\buysellSwitch.sqf'";

			x = 0.65 * safeZoneW + safeZoneX;
			y = 0.750 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
			color[] = {0.1,0.95,0.1,1};
		};

		class StoreButton0: w_RscButton {

			idc = genstore_iteminventory;
			text = "Items";
			onButtonClick = "[0] execVM 'client\gui\generalStore\populateSwitch.sqf'";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton1: w_RscButton {

			idc = -1;
			onButtonClick = "[1] execVM 'client\gui\generalStore\populateSwitch.sqf'";
			text = "Headgear";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.275 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton2: w_RscButton {

			idc = -1;
			onButtonClick = "[2] execVM 'client\gui\generalStore\populateSwitch.sqf'";
			text = "Uniform";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.325 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton3: w_RscButton {

			idc = -1;
			onButtonClick = "[3] execVM 'client\gui\generalStore\populateSwitch.sqf'";
			text = "Vests";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.375 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton4: w_RscButton {

			idc = -1;
			onButtonClick = "[4] execVM 'client\gui\generalStore\populateSwitch.sqf'";
			text = "Backpacks";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.425 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};
	};
};