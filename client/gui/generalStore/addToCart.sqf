//	@file Name: addToCart.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#include "dialog\genstoreDefines.sqf";
disableSerialization;

if (local player) then
{
	//Initialize Values
	_price = 0;
	_checkWeapon = "";
	_checkAmmo = "";
	_checkAccessor = "";

	// Grab access to the controls
	_dialog = findDisplay genstore_DIALOG;
	_itemlist = _dialog displayCtrl genstore_item_list;
	_cartlist = _dialog displayCtrl genstore_cart;
	_totalText = _dialog displayCtrl genstore_total;
	_buysell = _dialog displayCtrl genstore_buysell;

	_switchText = Ctrltext _buysell;

	//Get Selected Item
	_selectedItem = lbCurSel _itemlist;
	_itemText = _itemlist lbText _selectedItem;

	if (_switchText == "Buy") then
	{
		{if (_itemText == _x select 0) then {_price = _x select 4;};} forEach generalStore;
		{if (_itemText == _x select 1) then {_price = _x select 2;};} forEach headgearArray;
		{if (_itemText == _x select 1) then {_price = _x select 2;};} forEach uniformArray;
		{if (_itemText == _x select 1) then {_price = _x select 2;};} forEach vestArray;
		{if (_itemText == _x select 1) then {_price = _x select 2;};} forEach backpackArray;
	}
	else
	{
		{If (_x select 0 == _itemText) then {_price = _x select 5;};} forEach generalStore;
		_itemlist lbDelete _selectedItem;
	};

	genStoreCart = genStoreCart + _price;
	_totalText CtrlsetText format ["Total: $%1", genStoreCart];

	_cartlist lbAdd format ["%1", _itemText];
};