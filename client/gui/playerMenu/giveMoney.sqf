//	@file Name: giveMoney.sqf

#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(isNil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
disableSerialization;

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
};

private["_money","_otherPlayer","_nearestPlayers"];
_money = parsenumber(GET_SELECTED_DATA(money_value));
_otherPlayer = GET_SELECTED_DATA(give_to_list);

if((player getVariable "cmoney" < _money) OR (player getVariable "cmoney" < 0)) exitwith {hint format["You don't have $%1 to give", _money];};

mutexScriptInProgress = true;
_currPlayerState = animationState player;

_nearestPlayers = nearestobjects [player, ["B_Soldier_F","B_soldier_M_F","B_medic_F","B_soldier_repair_F","O_Soldier_F","O_soldier_M_F","O_medic_F","O_soldier_repair_F","I_Soldier_F","I_soldier_M_F","I_medic_F","I_soldier_repair_F"],  5];
{
	if (player distance _x < 5 && alive _x && name _x == _otherPlayer) then
	{
		player playMoveNow "AmovPercMstpSrasWpstDnon_gear";
		_x playMoveNow "AmovPercMstpSrasWrflDnon_gear_AmovPercMstpSrasWrflDnon";
		player setVariable["cmoney",(player getVariable "cmoney") - _money,true];
		_x setVariable["cmoney",(_x getVariable "cmoney") + _money,true];
		sleep 3;
	};
} forEach _nearestPlayers;

mutexScriptInProgress = false;
player playMoveNow _currPlayerState;