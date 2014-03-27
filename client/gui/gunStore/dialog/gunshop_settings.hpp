// @ file Name: gunshop_settings.hpp
// @ file Author: [CAD] Krycek

#include "gunstoreDefines.sqf"

class gunshopd {

	idd = gunshop_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[0] execVM 'client\gui\gunStore\populateGunStore.sqf'";

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

			idc = gunshop_gun_pic;						// Picture
			text = "";

			x = 0.52475 * safeZoneW + safeZoneX;
			y = 0.245 * safeZoneH + safeZoneY;
			w = 0.08 * safeZoneW;
			h = 0.08 * safeZoneH;
		};

		class ItemSelectedPrice: w_RscStructuredText {

			idc = gunshop_gun_TEXT;						// Price
			text = "";

			x = 0.4915 * safeZoneW + safeZoneX;
			y = 0.36 * safeZoneH + safeZoneY;
			w = 0.1465 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class ItemSelectedInfo: w_RscStructuredText {

			idc = gunshop_gun_Info;						// Info
			text = "";

			x = 0.4915 * safeZoneW + safeZoneX;
			y = 0.51 * safeZoneH + safeZoneY;
			w = 0.1465 * safeZoneW;
			h = 0.167 * safeZoneH;
		};

		class DialogTitleText: w_RscText {

			idc = -1;
			text = "Gun Store Menu";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.175 * safeZoneH + safeZoneY;
			w = 0.085 * safeZoneW;
			h = 0.045 * safeZoneH;
		};

		class PlayerMoneyText: w_RscText {

			idc = gunshop_money;
			text = "Cash:";

			x = 0.648 * safeZoneW + safeZoneX;
			y = 0.175 * safeZoneH + safeZoneY;
			w = 0.085 * safeZoneW;
			h = 0.045 * safeZoneH;
		};

		class CartTotalText: w_RscText {

			idc = gunshop_total;
			text = "Total: $0";

			x = 0.648 * safeZoneW + safeZoneX;
			y = 0.675 * safeZoneH + safeZoneY;
			w = 0.1 * safeZoneW;
			h = 0.045 * safeZoneH;
		};
	};
	
	class controls {
		
		class SelectionList: w_RscListbox {

			idc = gunshop_gun_list;				// List
			onLBSelChanged = "[] execvm 'client\gui\gunStore\weaponInfo.sqf'";

			x = 0.3 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.1795 * safeZoneW;
			h = 0.45 * safeZoneH;
		};

		class CartList: w_RscListbox {

			idc = gunshop_cart;					// Cart
			onLBSelChanged = "[] execvm 'client\gui\gunStore\weaponInfo.sqf'";

			x = 0.65 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.14 * safeZoneW;
			h = 0.45 * safeZoneH;
		};

		class AddToCart: w_RscButton {

			text = "Add";
			onButtonClick = "[] execVM 'client\gui\gunStore\addToCart.sqf'";

			x = 0.53225 * safeZoneW + safeZoneX;
			y = 0.41 * safeZoneH + safeZoneY;
			w = 0.065 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class RemoveFromCart: w_RscButton {

			text = "Remove";
			onButtonClick = "[] execVM 'client\gui\gunStore\removeFromCart.sqf'";

			x = 0.53225 * safeZoneW + safeZoneX;
			y = 0.46 * safeZoneH + safeZoneY;
			w = 0.065 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class BuyToPlayer: w_RscButton {

			text = "Buy to Player";
			onButtonClick = "[0] execVM 'client\gui\gunStore\buyGuns.sqf'";

			x = 0.65 * safeZoneW + safeZoneX;
			y = 0.750 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
			color[] = {0.1,0.95,0.1,1};
		};

		class BuySellEquipment: w_RscButton {

			text = "Sell Current Weapon";
			onButtonClick = "[] execVM 'client\gui\gunStore\sellWeapon.sqf'";

			x = 0.512 * safeZoneW + safeZoneX;
			y = 0.750 * safeZoneH + safeZoneY;
			w = 0.096 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class CancelButton: w_RscButton {

			idc = -1;
			text = "Cancel";
			onButtonClick = "closeDialog 0;";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.750 * safeZoneH + safeZoneY;
			w = 0.072 * safeZoneW;
			h = 0.04 * safeZoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class StoreButton0: w_RscButton {

			idc = -1;
			text = "Guns";
			onButtonClick = "[0] execVM 'client\gui\gunStore\populateGunStore.sqf'";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.225 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton1: w_RscButton {

			idc = -1;
			text = "Rifles";
			onButtonClick = "[1] execVM 'client\gui\gunStore\populateGunStore.sqf'";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.275 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton2: w_RscButton {

			idc = -1;
			text = "Launchers";
			onButtonClick = "[2] execVM 'client\gui\gunStore\populateGunStore.sqf'";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.325 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton3: w_RscButton {

			idc = -1;
			text = "Attachments";
			onButtonClick = "[3] execVM 'client\gui\gunStore\populateGunStore.sqf'";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.375 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton4: w_RscButton {

			idc = -1;
			text = "Ammo";
			onButtonClick = "[4] execVM 'client\gui\gunStore\populateGunStore.sqf'";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.425 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton5: w_RscButton {

			idc = -1;
			text = "Ordnance";
			onButtonClick = "[5] execVM 'client\gui\gunStore\populateGunStore.sqf'";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.475 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

		class StoreButton6: w_RscButton {

			idc = -1;
			text = "Accessories";
			onButtonClick = "[6] execVM 'client\gui\gunStore\populateGunStore.sqf'";

			x = 0.2 * safeZoneW + safeZoneX;
			y = 0.525 * safeZoneH + safeZoneY;
			w = 0.088 * safeZoneW;
			h = 0.04 * safeZoneH;
		};

	};
};
