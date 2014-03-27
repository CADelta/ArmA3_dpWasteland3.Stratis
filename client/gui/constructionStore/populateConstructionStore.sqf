//  @file Name: populateConstructionStore.sqf
//  @file Author: [CAD] Krycek

#include "dialog\constructionstoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay constructionshop_DIALOG;
_cStoreListText = _dialog displayCtrl constructionshop_con_TEXT;
_cStorePicture = _dialog displayCtrl constructionshop_con_pic;
_cStoreList = _dialog displayCtrl constructionshop_con_list;
_cStoreInfo = _dialog displayCtrl constructionshop_con_Info;

switch(_switch) do
{
	case 0:
	{
		//Clear the list
		lbClear _cStoreList;
		_cStoreList lbSetCurSel -1;
		_cStorePicture ctrlSettext "";
		_cStoreListText ctrlSettext "";
        _cStoreInfo ctrlSetStructuredText parseText "";

		// Populate the Construction Store list
		{
			_cStorelistIndex = _cStoreList lbAdd format["%1",_x select 0];
		} forEach constructionContainerList;
	};
	case 1:
	{
		//Clear the list
		lbClear _cStoreList;
		_cStoreList lbSetCurSel -1;
		_cStorePicture ctrlSettext "";
		_cStoreListText ctrlSettext "";
        _cStoreInfo ctrlSetStructuredText parseText "";

		// Populate the Construction Store list
		{
			_cStorelistIndex = _cStoreList lbAdd format["%1",_x select 0];
		} forEach constructionBuildingList;
	};
	case 2:
	{
		//Clear the list
		lbClear _cStoreList;
		_cStoreList lbSetCurSel -1;
		_cStorePicture ctrlSettext "";
		_cStoreListText ctrlSettext "";
        _cStoreInfo ctrlSetStructuredText parseText "";

		// Populate the Construction Store list
		{
			_cStorelistIndex = _cStoreList lbAdd format["%1",_x select 0];
		} forEach constructionVariousList;
	};
};