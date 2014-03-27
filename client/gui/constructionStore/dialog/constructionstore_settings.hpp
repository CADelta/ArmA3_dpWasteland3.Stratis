// @ file Name: constructionstore_settings.hpp
// @ file Author: [CAD] Krycek

#include "constructionstoreDefines.sqf"

class constructionshopd {

	idd = constructionshop_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[0] execVM 'client\gui\constructionStore\populateConstructionStore.sqf'";

	class controlsBackground {
		
		class MainBackground: w_RscPicture
		{
			idc = -1;
			text = "client\ui\ui_background_controlers_ca.paa";

			x = 0.1875 * safeZoneW + safeZoneX;
			y = 0.15 * safeZoneH + safeZoneY;
			w = 0.837499 * safeZoneW;
			h = 0.661111 * safeZoneH;
		};
		
		class ItemSelectedPicture: w_RscPicture {
			
			idc = constructionshop_con_pic;				// Picture
			text = "";

			x = 0.52975 * safeZoneW + safeZoneX;
			y = 0.245 * safeZoneH + safeZoneY;
			w = 0.07 * safeZoneW;
			h = 0.09 * safeZoneH;
		};

		class ItemSelectedPrice: w_RscStructuredText {

			idc = constructionshop_con_TEXT;			// Price
			text = "";

			x = 0.4915 * safeZoneW + safeZoneX;
			y = 0.36 * safeZoneH + safeZoneY;
			w = 0.1465 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class ItemSelectedInfo: w_RscStructuredText {

			idc = constructionshop_con_Info;			// Info
			text = "";

			x = 0.4915 * safeZoneW + safeZoneX;
			y = 0.51 * safeZoneH + safeZoneY;
			w = 0.1465 * safeZoneW;
			h = 0.167 * safeZoneH;
		};

		class DialogTitleText: w_RscText {

			idc = -1;
			text = "Construction Store Menu";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.175 * safeZoneH + safeZoneY;
			w = 0.085 * safeZoneW;
			h = 0.045 * safeZoneH;
		};

		class PlayerMoneyText: w_RscText {

			idc = constructionshop_money;
			text = "Cash:";

			x = 0.648 * safeZoneW + safeZoneX;
			y = 0.175 * safeZoneH + safeZoneY;
			w = 0.085 * safeZoneW;
			h = 0.045 * safeZoneH;
		};

		class CartTotalText: w_RscText {

			idc = constructionshop_total;
			text = "Total: $0";

			x = 0.648 * safeZoneW + safeZoneX;
			y = 0.675 * safeZoneH + safeZoneY;
			w = 0.1 * safeZoneW;
			h = 0.045 * safeZoneH;
		};
	};
	
	class controls {
		
		class SelectionList: w_RscListbox {

			idc = constructionshop_con_list;			// List
			onLBSelChanged = "[] execvm 'client\gui\constructionStore\constructionStoreItemInfo.sqf'";

			x = 0.3 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.1795 * safeZoneW;
			h = 0.45 * safeZoneH;
		};

		class CartList: w_RscListbox {

			idc = constructionshop_cart;				// Cart
			onLBSelChanged = "[] execvm 'client\gui\constructionStore\constructionStoreItemInfo.sqf'";

			x = 0.65 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.14 * safeZoneW;
			h = 0.45 * safeZoneH;
		};

		class AddToCart: w_RscButton {

			idc = -1;
			onButtonClick = "[] execVM 'client\gui\constructionStore\addToCart.sqf'";
			text = "Add";

			x = 0.53225 * safeZoneW + safeZoneX;
			y = 0.41 * safeZoneH + safeZoneY;
			w = 0.065 * safeZoneW;
			h = 0.04 * safeZoneH;

		};

		class RemoveFromCart: w_RscButton {

			idc = -1;
			onButtonClick = "[] execVM 'client\gui\constructionStore\removeFromCart.sqf'";
			text = "Remove";

			x = 0.53225 * safeZoneW + safeZoneX;
			y = 0.46 * safeZoneH + safeZoneY;
			w = 0.065 * safeZoneW;
			h = 0.04 * safeZoneH;

		};

		class BuyToPlayer: w_RscButton {

			idc = -1;
			onButtonClick = "[0] execVM 'client\gui\constructionStore\buyItem.sqf'";
			text = "Buy to Ground";

			x = 0.65 * safeZoneW + safeZoneX;
			y = 0.750 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
			color[] = {0.1,0.95,0.1,1};

		};

		class CancelButton: w_RscButton {

			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = "Cancel";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.750 * safeZoneH + safeZoneY;
			w = 0.072 * safeZoneW;
			h = 0.04 * safeZoneH;
			color[] = {0.95,0.1,0.1,1};

		};

		class StoreButton0: w_RscButton {

			idc = -1;
			onButtonClick = "[0] execVM 'client\gui\constructionStore\populateconstructionStore.sqf'";
			text = "Containers";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton1: w_RscButton {

			idc = -1;
			onButtonClick = "[1] execVM 'client\gui\constructionStore\populateconstructionStore.sqf'";
			text = "Buildings";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.275 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton2: w_RscButton {

			idc = -1;
			onButtonClick = "[2] execVM 'client\gui\constructionStore\populateconstructionStore.sqf'";
			text = "Various";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.325 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};
	};
};
