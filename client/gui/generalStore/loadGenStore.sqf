//	@file Name: loadGunStore.sqf
//	@file Author: [404] Deadbeat

#include "dialog\genstoreDefines.sqf";
disableSerialization;

_genshopDialog = createDialog "genstored";
genStoreCart = 0;

_Dialog = findDisplay genstore_DIALOG;
_playerMoney = _Dialog displayCtrl genstore_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format["Cash: $%1", _money];