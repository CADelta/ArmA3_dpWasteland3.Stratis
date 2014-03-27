//	@file Name: removeFromCart.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

if (local player) then
{
	//Initialize Values
	_price = 0;
	_checkWeapon = "";
	_checkAmmo = "";
	_checkAccessor = "";

	//Grab access to the controls
	_dialog = findDisplay gunshop_DIALOG;
	_cartlist = _dialog displayCtrl gunshop_cart;
	_totalText = _dialog displayCtrl gunshop_total;

	//Get selected item.
	_selectedItem = lbCurSel _cartlist;
	_itemText = _cartlist lbText _selectedItem;

	{if(_itemText == _x select 1) then{_price = _x select 2;}}forEach gunsArray;
	{if(_itemText == _x select 1) then{_price = _x select 2;}}forEach riflesArray;
	{if(_itemText == _x select 1) then{_price = _x select 2;}}forEach launchersArray;
	{if(_itemText == _x select 1) then{_price = _x select 2;}}forEach attachmentsArray;
	{if(_itemText == _x select 1) then{_price = _x select 2;}}forEach ammoArray;
	{if(_itemText == _x select 1) then{_price = _x select 2;}}forEach ordnanceArray;
	{if(_itemText == _x select 1) then{_price = _x select 2;}}forEach accessoriesArray;

	gunStoreCart = gunStoreCart - _price;
	_totalText CtrlsetText format["Total: $%1", gunStoreCart];

	//Remove selected item.
	_cartlist lbDelete _selectedItem;
};