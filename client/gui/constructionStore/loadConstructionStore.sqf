//  @file Name: loadConstructionStore.sqf

#include "dialog\constructionstoreDefines.sqf";
disableSerialization;

_gunshopDialog = createDialog "constructionshopd";
constructionStoreCart = 0;

_Dialog = findDisplay constructionshop_DIALOG;
_playerMoney = _Dialog displayCtrl constructionshop_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format["Cash: $%1", _money];

