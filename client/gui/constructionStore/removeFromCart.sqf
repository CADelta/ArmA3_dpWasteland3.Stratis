//  @file Name: removeFromCart.sqf
//  @file Author: [CAD] Krycek

#include "dialog\constructionstoreDefines.sqf";
disableSerialization;

if (local player) then {

	//Initialize Values
	_price = 0;
	_checkWeapon = "";
	_checkAmmo = "";
	_checkAccessor = "";

	//Grab access to the controls
	_dialog = findDisplay constructionshop_DIALOG;
	_cartlist = _dialog displayCtrl constructionshop_cart;
	_totalText = _dialog displayCtrl constructionshop_total;

	//Get selected item.
	_selectedItem = lbCurSel _cartlist;
	_itemText = _cartlist lbText _selectedItem;

	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach constructionContainerList;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach constructionBuildingList;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach constructionVariousList;

	constructionstoreCart = constructionstoreCart - _price;
	_totalText CtrlsetText format["Total: $%1", constructionstoreCart];

	//Remove selected item.
	_cartlist lbDelete _selectedItem;
};