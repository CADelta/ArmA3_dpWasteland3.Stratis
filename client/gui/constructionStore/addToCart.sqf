//	@file Name: addToCart.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#include "dialog\constructionstoreDefines.sqf";
disableSerialization;

if (local player) then
{
	//Initialize Values
	_price = 0;

	// Grab access to the controls
	_dialog = findDisplay constructionshop_DIALOG;
	_conlist = _dialog displayCtrl constructionshop_con_list;
	_cartlist = _dialog displayCtrl constructionshop_cart;
	_totalText = _dialog displayCtrl constructionshop_total;

	//Get Selected Item
	_selectedItem = lbCurSel _conlist;
	_itemText = _conlist lbText _selectedItem;

	//Check Items Price
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach constructionContainerList;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach constructionBuildingList;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach constructionVariousList;

	constructionstoreCart = constructionstoreCart + _price;
	_totalText CtrlsetText format["Total: $%1", constructionstoreCart];

	_cartlist lbAdd format["%1",_itemText];
};