//	@file Name: loadGunStore.sqf
//	@file Author: [404] Deadbeat

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

_gunshopDialog = createDialog "gunshopd";
gunStoreCart = 0;

_Dialog = findDisplay gunshop_DIALOG;
_playerMoney = _Dialog displayCtrl gunshop_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format["Cash: $%1", _money];
