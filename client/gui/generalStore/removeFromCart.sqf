//	@file Name: removeFromCart.sqf
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

	//Grab access to the controls
	_dialog = findDisplay genstore_DIALOG;
	_cartlist = _dialog displayCtrl genstore_cart;
	_itemlist = _dialog displayCtrl genstore_item_list;
	_totalText = _dialog displayCtrl genstore_total;
	_buysell = _dialog displayCtrl genstore_buysell;

	_switchText = Ctrltext _buysell;

	//Get selected item.
	_selectedItem = lbCurSel _cartlist;
	_itemText = _cartlist lbText _selectedItem;

	if(_switchText == "Buy") then
	{
		{if (_itemText == _x select 0) then {_price = _x select 4;};} forEach generalStore;
		{if (_itemText == _x select 1) then {_price = _x select 2;};} forEach headgearArray;
		{if (_itemText == _x select 1) then {_price = _x select 2;};} forEach uniformArray;
		{if (_itemText == _x select 1) then {_price = _x select 2;};} forEach vestArray;
		{if (_itemText == _x select 1) then {_price = _x select 2;};} forEach backpackArray;
	}
	else
	{
		{if (_itemText == _x select 0) then {_price = _x select 5;};} forEach generalStore;
		_itemlistIndex = _itemlist lbAdd format ["%1",_itemText];
	};

	genStoreCart = genStoreCart - _price;
	_totalText CtrlsetText format ["Total: $%1", genStoreCart];

	//Remove selected item.
	_cartlist lbDelete _selectedItem;
};