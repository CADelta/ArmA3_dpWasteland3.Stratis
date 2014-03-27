//	@file Name: populateSwitch.sqf
//	@file Author: [404] Deadbeat

#include "dialog\genstoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

_dialog = findDisplay genstore_DIALOG;
_iteminv = _dialog displayCtrl genstore_iteminventory;

_switchText = Ctrltext _iteminv;

if(_switchText == "Inventory") then
{
	[_switch] execVM "client\gui\generalStore\getInventory.sqf";
}
else
{
	[_switch] execVM "client\gui\generalStore\populateGenStore.sqf";
};