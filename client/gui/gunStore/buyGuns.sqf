//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [CAD] Krycek
//	@file Args: [int (0 = buy to player 1 = buy to crate)]		<--- Not used anymore, since buy to crate is no longer an option!

#include "dialog\gunstoreDefines.sqf";
disableSerialization;
if (gunStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

private ["_name"];

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_cartlist = _dialog displayCtrl gunshop_cart;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_size = lbSize _cartlist;

for [{_x = 0}, {_x <= _size}, {_x = _x + 1}] do
{
	_itemText = _cartlist lbText _x;
	{
		if (_itemText == _x select 1) then
		{
			_class = _x select 0;
			_weapon = (configFile >> "CfgWeapons" >> _class);
			_type = getNumber (_weapon >> "type");
			_displayName = getText (_weapon >> "displayName");

			_playerSlots = [player] call BIS_fnc_invSlotsEmpty;

			//Side Arm
			if (_type == 2) then
			{
				//if ((_playerSlots select 1) >= 1) then
				if ((handgunWeapon player) == "") then
				{
					player addWeapon _class;
				}
				else
				{
					{if (_x select 0 == _class) then {_price = _x select 2; _name = _x select 1;};}forEach gunsArray;
					gunStoreCart = gunStoreCart - _price;
					hint format ["You do not have space for this Gun: %1",_name];
				};
			};
		};
	} forEach gunsArray;

	{
		if (_itemText == _x select 1) then
		{
			_class = _x select 0;
			_weapon = (configFile >> "CfgWeapons" >> _class);
			_type = getNumber (_weapon >> "type");
			_displayName = getText (_weapon >> "displayName");

			_playerSlots = [player] call BIS_fnc_invSlotsEmpty;

			//Primary Weapon
			if (_type == 1) then
			{
				//if ((_playerSlots select 0) >= 1) then
				if ((primaryWeapon player) == "") then
				{
					player addWeapon _class;
				}
				else
				{
					{if (_x select 0 == _class) then {_price = _x select 2; _name = _x select 1;};}forEach riflesArray;
					gunStoreCart = gunStoreCart - _price;
					hint format ["You do not have space for this Rifle: %1",_name];
				};
			};
		};
	} forEach riflesArray;

	{
		if (_itemText == _x select 1) then
		{
			_class = _x select 0;
			_weapon = (configFile >> "CfgWeapons" >> _class);
			_type = getNumber (_weapon >> "type");
			_displayName = getText (_weapon >> "displayName");

			_playerSlots = [player] call BIS_fnc_invSlotsEmpty;

			//Launcher
			if (_type == 4) then
			{
				//if ((_playerSlots select 2) >= 1) then
				if ((secondaryWeapon player) == "") then
				{
					player addWeapon _class;
				}
				else
				{
					{if (_x select 0 == _class) then {_price = _x select 2; _name = _x select 1;};}forEach launchersArray;
					gunStoreCart = gunStoreCart - _price;
					hint format ["You do not have space for this Launcher: %1",_name];
				};
			};
		};
	} forEach launchersArray;

	{
        if (_itemText == _x select 1) then
        {
            _class = _x select 0;

			if (player canAdd _class) then
			{
				player addItem _class;
			}
			else
			{
				{if (_x select 0 == _class) then {_price = _x select 2; _name = _x select 1;};}forEach attachmentsArray;
				gunStoreCart = gunStoreCart - _price;
				hint format ["You do not have space for this item: %1",_name];
				sleep 0.5;
			};
		};
    } forEach attachmentsArray;

	{
		if (_itemText == _x select 1) then
		{
			_class = _x select 0;
			_mag = (configFile >> "CfgMagazines" >> _class);
			_type = (getNumber(_mag >> "type"));
			_displayName = getText (_mag >> "displayName");

			if (player canAdd _class) then
			{
				player addMagazine _class;
			}
			else
			{
				{if (_x select 0 == _class) then {_price = _x select 2; _name = _x select 1;};}forEach ammoArray;
				gunStoreCart = gunStoreCart - _price;
				hint format ["You do not have space for this Ammo: %1",_name];
				sleep 0.5;
			};
		}
	} forEach ammoArray;

	{
		if (_itemText == _x select 1) then
		{
			_class = _x select 0;
			_mag = (configFile >> "CfgMagazines" >> _class);
			_type = getNumber (_mag >> "type");
			_displayName = getText (_mag >> "displayName");

			if (player canAdd _class) then
			{
				player addMagazine _class;
			}
			else
			{
				{if (_x select 0 == _class) then {_price = _x select 2; _name = _x select 1;};}forEach ordnanceArray;
				gunStoreCart = gunStoreCart - _price;
				hint format ["You do not have space for this item: %1",_name];
				sleep 0.5;
			};
		}
	} forEach ordnanceArray;

	{
        if (_itemText == _x select 1) then
        {
            _class = _x select 0;

			if (player canAdd _class) then
			{
				if (_x select 3 == "binoc") then
				{
					player addWeapon _class;
				};
				if (_x select 3 == "item") then
				{
					player addItem _class;
				};
			}
			else
			{
				{if (_x select 0 == _class) then {_price = _x select 2; _name = _x select 1;};}forEach accessoriesArray;
				gunStoreCart = gunStoreCart - _price;
				hint format ["You do not have space for this item: %1",_name];
				sleep 0.5;
			};
		};
    } forEach accessoriesArray;
};

player setVariable["cmoney",_playerMoney - gunStoreCart,true];
_playerMoneyText CtrlsetText format ["Cash: $%1", player getVariable "cmoney"];

gunStoreCart = 0;
_totalText CtrlsetText format ["Total: $%1", gunStoreCart];
lbClear _cartlist;
