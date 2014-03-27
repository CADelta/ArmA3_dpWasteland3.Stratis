//	@file Name: buysellSwitch.sqf
//	@file Author: [404] Deadbeat

#include "dialog\genstoreDefines.sqf";
disableSerialization;

_dialog = findDisplay genstore_DIALOG;
_buysell = _dialog displayCtrl genstore_buysell;

//Check which state we want to be in.
_switchText = Ctrltext _buysell;
if(_switchText == "Buy") then
{
	[] execVM "client\gui\generalStore\buyItems.sqf";
}
else
{
	[] execVM "client\gui\generalStore\sellItems.sqf";
};