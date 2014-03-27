//	@file Name: populateGunStore.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=, [CAD] Krycek

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_gunlisttext = _dialog displayCtrl gunshop_gun_TEXT;
_gunpicture = _dialog displayCtrl gunshop_gun_pic;
_gunlist = _dialog displayCtrl gunshop_gun_list;
_gunInfo = _dialog displayCtrl gunshop_gun_Info;

switch(_switch) do
{
	case 0:
	{
		//Clear the list
		lbClear _gunlist;
		_gunlist lbSetCurSel -1;
		_gunpicture ctrlSettext "";
		_gunlisttext ctrlSettext "";
        _gunInfo ctrlSetStructuredText parseText "";

		// Populate the gun store guns list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
		} forEach gunsArray;
	};

	case 1:
	{
		//Clear the list
		lbClear _gunlist;
		_gunlist lbSetCurSel -1;
		_gunpicture ctrlSettext "";
		_gunlisttext ctrlSettext "";
        _gunInfo ctrlSetStructuredText parseText "";

		// Populate the gun store rifles list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
		} forEach riflesArray;
	};

	case 2:
	{
		//Clear the list
		lbClear _gunlist;
		_gunlist lbSetCurSel -1;
		_gunpicture ctrlSettext "";
		_gunlisttext ctrlSettext "";
        _gunInfo ctrlSetStructuredText parseText "";

		// Populate the gun store launchers list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
		} forEach launchersArray;
	};

	case 3:
	{
		//Clear the list
		lbClear _gunlist;
		_gunlist lbSetCurSel -1;
		_gunpicture ctrlSettext "";
		_gunlisttext ctrlSettext "";
        _gunInfo ctrlSetStructuredText parseText "";

		// Populate the gun store attachments list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
		} forEach attachmentsArray;
	};

	case 4:
	{
		//Clear the list
		lbClear _gunlist;
		_gunlist lbSetCurSel -1;
		_gunpicture ctrlSettext "";
		_gunlisttext ctrlSettext "";
        _gunInfo ctrlSetStructuredText parseText "";

		// Populate the gun store ammo list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
		} forEach ammoArray;
	};

	case 5:
	{
		//Clear the list
		lbClear _gunlist;
		_gunlist lbSetCurSel -1;
		_gunpicture ctrlSettext "";
		_gunlisttext ctrlSettext "";
        _gunInfo ctrlSetStructuredText parseText "";

		// Populate the gun store ordnance list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
		} forEach ordnanceArray;
	};

	case 6:
	{
		//Clear the list
		lbClear _gunlist;
		_gunlist lbSetCurSel -1;
		_gunpicture ctrlSettext "";
		_gunlisttext ctrlSettext "";
        _gunInfo ctrlSetStructuredText parseText "";

		// Populate the gun store accessories list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
		} forEach accessoriesArray;
	};
};