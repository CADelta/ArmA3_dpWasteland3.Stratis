//	@file Name: populateGunStore.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#include "dialog\genstoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_itemlisttext = _dialog displayCtrl genstore_item_TEXT;
_itempicture = _dialog displayCtrl genstore_item_pic;
_itemlist = _dialog displayCtrl genstore_item_list;
_cartlist = _dialog displayCtrl genstore_cart;
_itemInfo = _dialog displayCtrl genstore_item_Info;

switch(_switch) do
{
	case 0:
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;
		_itempicture ctrlSettext "";
		_itemlisttext ctrlSettext "";
		_itemInfo ctrlSetStructuredText parseText "";

		// Populate the general store "general item" list
		{
			_itemlistIndex = _itemlist lbAdd format["%1",_x select 0];
		} forEach generalStore;
	};

	case 1:
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;
		_itempicture ctrlSettext "";
		_itemlisttext ctrlSettext "";
        _itemInfo ctrlSetStructuredText parseText "";

		// Populate the general store headgear list
		{
			_itemlistIndex = _itemlist lbAdd format["%1",_x select 1];
		} forEach headgearArray;
	};

	case 2:
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;
		_itempicture ctrlSettext "";
		_itemlisttext ctrlSettext "";
        _itemInfo ctrlSetStructuredText parseText "";

		// Populate the general store uniform list
		{
			_itemlistIndex = _itemlist lbAdd format["%1",_x select 1];
		} forEach uniformArray;
	};

	case 3:
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;
		_itempicture ctrlSettext "";
		_itemlisttext ctrlSettext "";
        _itemInfo ctrlSetStructuredText parseText "";

		// Populate the general store vest list
		{
			_itemlistIndex = _itemlist lbAdd format["%1",_x select 1];
		} forEach vestArray;
	};

	case 4:
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;
		_itempicture ctrlSettext "";
		_itemlisttext ctrlSettext "";
        _itemInfo ctrlSetStructuredText parseText "";

		// Populate the general store backpack list
		{
			_itemlistIndex = _itemlist lbAdd format["%1",_x select 1];
		} forEach backpackArray;
	};
};
