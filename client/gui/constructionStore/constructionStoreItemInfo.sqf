//  @file Name: constructionStoreItemInfo.sqf
//  @file Author: [CAD] Krycek

#include "dialog\constructionstoreDefines.sqf";

disableSerialization;

//Initialize Values
_itemType = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay constructionshop_DIALOG;
_itemList = _dialog displayCtrl constructionshop_con_list;
_itemListText = _dialog displayCtrl constructionshop_con_TEXT;
_picture = _dialog displayCtrl constructionshop_con_pic;
_itemInfo = _dialog displayCtrl constructionshop_con_Info;

//Get Selected Item
_selectedItem = lbCurSel _itemList;
_itemText = _itemList lbText _selectedItem;

//Check Items Price
{
	if(_itemText == _x select 0) then
	{
		_itemType = _x select 1;
		_price = _x select 2;

		_item = (configFile >> "CfgVehicles" >> _itemType);
	    _itemInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText (_item >> "displayName"), getText (_item >> "descriptionShort")]);

		_picLink = _x select 3;
	    //_picLink = getText(_item >> "picture");
		_picture ctrlSetText _picLink;
		_itemListText ctrlSetText format ["Price: $%1", _price];
	}
} forEach constructionContainerList;

{
	if(_itemText == _x select 0) then
	{
		_itemType = _x select 1;
		_price = _x select 2;

		_item = (configFile >> "CfgVehicles" >> _itemType);
	    _itemInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_item >> "displayName"),getText(_item >> "descriptionShort")]);

		_picLink = _x select 3;
	    //_picLink = getText(_item >> "picture");
		_picture ctrlSetText _picLink;
		_itemListText ctrlSetText format ["Price: $%1", _price];
	}
} forEach constructionBuildingList;

{
	if(_itemText == _x select 0) then
	{
		_itemType = _x select 1;
		_price = _x select 2;

		_item = (configFile >> "CfgVehicles" >> _itemType);
	    _itemInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_item >> "displayName"),getText(_item >> "descriptionShort")]);

		_picLink = _x select 3;
	    //_picLink = getText(_item >> "picture");
		_picture ctrlSetText _picLink;
		_itemListText ctrlSetText format ["Price: $%1", _price];
	}
} forEach constructionVariousList;
