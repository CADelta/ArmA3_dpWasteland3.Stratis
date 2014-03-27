//	@file Name: generalStoreItemInfo.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#include "dialog\genstoreDefines.sqf";
disableSerialization;

//Initialize Values
_item_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_itemList = _dialog displayCtrl genstore_item_list;
_itemListText = _dialog displayCtrl genstore_item_TEXT;
_picture = _dialog displayCtrl genstore_item_pic;
_buysell = _dialog displayCtrl genstore_buysell;
_itemInfo = _dialog displayCtrl genstore_item_Info;

//Get Selected Item
_selectedItem = lbCurSel _itemList;
_itemText = _itemList lbText _selectedItem;

//Check which state we want to be in.
_switchText = Ctrltext _buysell;
if (_switchText == "Buy") then
{
	{
	    if(_itemText == _x select 0) then
		{
			_price = _x select 4;
            _picLink = _x select 3;
            _picture ctrlSetText _picLink;
            _itemInfo ctrlSetStructuredText parseText ((_x select 2));
			_itemListText ctrlSetText format ["Price: $%1", _price];
		}
	} forEach generalStore;

	{
		if(_itemText == _x select 1) then
		{
			_item_type = _x select 0;
			_price = _x select 2;

			_item = (configFile >> "CfgWeapons" >> _item_type);
			_itemInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText (_item >> "displayName"), getText (_item >> "descriptionShort")]);

			_picLink = getText (_item >> "picture");
			_picture ctrlSettext _picLink;
			_itemListText ctrlSetText format ["Price: $%1", _price];
		}
	} forEach headgearArray;

	{
		if(_itemText == _x select 1) then
		{
			_item_type = _x select 0;
			_price = _x select 2;

			_item = (configFile >> "CfgWeapons" >> _item_type);
			_itemInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText (_item >> "displayName"), getText (_item >> "descriptionShort")]);

			_picLink = getText (_item >> "picture");
			_picture ctrlSettext _picLink;
			_itemListText ctrlSetText format ["Price: $%1", _price];
		}
	} forEach uniformArray;

	{
		if(_itemText == _x select 1) then
		{
			_item_type = _x select 0;
			_price = _x select 2;

			_item = (configFile >> "CfgWeapons" >> _item_type);
			_itemInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText (_item >> "displayName"), getText (_item >> "descriptionShort")]);

			_picLink = getText (_item >> "picture");
			_picture ctrlSettext _picLink;
			_itemListText ctrlSetText format ["Price: $%1", _price];
		}
	} forEach vestArray;

	{
		if(_itemText == _x select 1) then
		{
			_item_type = _x select 0;
			_price = _x select 2;

			_item = (configFile >> "CfgVehicles" >> _item_type);
			_itemInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText (_item >> "displayName"), getText (_item >> "descriptionShort")]);

			_picLink = getText (_item >> "picture");
			_picture ctrlSettext _picLink;
			_itemListText ctrlSetText format ["Price: $%1", _price];
		}
	} forEach backpackArray;
}
else
{
	{
	    if(_itemText == _x select 0) then
		{
			_price = _x select 5;
            _picLink = _x select 3;
            _picture ctrlSetText _picLink;
            _itemInfo ctrlSetStructuredText parseText ((_x select 2));
			_itemListText ctrlSetText format ["Price: $%1", _price];
		}
	} forEach generalStore;
};
