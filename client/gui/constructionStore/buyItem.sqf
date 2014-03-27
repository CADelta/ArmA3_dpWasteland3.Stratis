//  @file Name: buyItem.sqf
//  @file Author: [CAD] Krycek

#include "dialog\constructionstoreDefines.sqf";
disableSerialization;
if(constructionstoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

private ["_switch"];

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;

// Grab access to the controls
_dialog = findDisplay constructionshop_DIALOG;
_cartlist = _dialog displayCtrl constructionshop_cart;
_totalText = _dialog displayCtrl constructionshop_total;
_playerMoneyText = _Dialog displayCtrl constructionshop_money;
_size = lbSize _cartlist;

		for [{_x = 0}, {_x <= _size}, {_x = _x + 1}] do
		{
			_itemText = _cartlist lbText _x;
			{
				if(_itemText == _x select 0) then
				{
					_class = [];
					_class set [0,_x select 1];
					_position = getPos player;

					pvar_createBaseObject = [_class, _position, player];
					publicVariableServer "pvar_createBaseObject";
				};
			}forEach constructionContainerList;


			{
				if(_itemText == _x select 0) then
				{
					_class = [];
					_class set [0,_x select 1];
					_position = getPos player;

					pvar_createBaseObject = [_class, _position, player];
					publicVariableServer "pvar_createBaseObject";
				};
			}forEach constructionBuildingList;


			{
				if(_itemText == _x select 0) then
				{
					_class = [];
					_class set [0,_x select 1];
					_position = getPos player;

					pvar_createBaseObject = [_class, _position, player];
					publicVariableServer "pvar_createBaseObject";
				};
			}forEach constructionVariousList;
		};

		player setVariable["cmoney",_playerMoney - constructionstoreCart,true];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		constructionstoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", constructionstoreCart];
		lbClear _cartlist;
