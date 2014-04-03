
#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay lootPlayerMenu_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(isNil {dropActive}) then {dropActive = false};
disableSerialization;

private["_data","_corpse","_ctemp","_ptemp"];
_data = GET_SELECTED_DATA(loot_item_list);

_corpse = nearestobjects [player, ["SoldierWB","SoldierEB","SoldierGB"], 5] select 1;

if (player distance _corpse < 5 && !alive _corpse) then
{

	if(_data == "") exitWith {
		player globalChat "YOU NEED TO SELECT AN ITEM TO TAKE!";
	};

	// Check if mutex lock is active.
	if(mutexScriptInProgress) exitWith {
		player globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
	};

	if(vehicle player != player) exitwith {
		player globalChat "YOU ARE CURRENTLY BUSY!";
	};

	mutexScriptInProgress = true;
	_currPlayerState = animationState player;
	//player playMoveNow "AmovPknlMstpSrasWpstDnon_Gear_AmovPknlMstpSrasWpstDnon";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_Putdown_AinvPknlMstpSnonWnonDnon";
	sleep 1;

	switch(_data) do
	{
		case "canfood": {
			_ctemp = _corpse getVariable ["canfood",0];
			_ptemp = player getVariable ["canfood",0];
			if (_ctemp > 0) then
			{
				_corpse setVariable["canfood",_ctemp-1,true];
				player setVariable["canfood",_ptemp+1,true];
			};
		};
		//case "fuelFull": {player setVariable["fuelFull",(player getVariable "fuelFull")-1,true]; _temp = "Fuel_can" createVehicle (position player); _temp setVariable["fuel", true, true]; _temp setPos _pos;};
		//case "fuelEmpty": {player setVariable["fuelEmpty", (player getVariable "fuelEmpty")-1,true]; _temp = "Fuel_can" createVehicle (position player); _temp setVariable["fuel", false, true]; _temp setPos _pos;};
		case "repairkits": {
			_ctemp = _corpse getVariable ["repairkits",0];
			_ptemp = player getVariable ["repairkits",0];
			if (_ctemp > 0) then
			{
				_corpse setVariable["repairkits",_ctemp-1,true];
				player setVariable["repairkits",_ptemp+1,true];
			};
		};
		case "water": {
			_ctemp = _corpse getVariable ["water",0];
			_ptemp = player getVariable ["water",0];
			if (_ctemp > 0) then
			{
				_corpse setVariable["water",_ctemp-1,true];
				player setVariable["water",_ptemp+1,true];
			};
		};
		case "medkits": {
			_ctemp = _corpse getVariable ["medkits",0];
			_ptemp = player getVariable ["medkits",0];
			if (_ctemp > 0) then
			{
				_corpse setVariable["medkits",_ctemp-1,true];
				player setVariable["medkits",_ptemp+1,true];
			};
		};
	};

	mutexScriptInProgress = false;
	player playMoveNow _currPlayerState;
}
else
{
	player globalChat "NO CORPSE TO LOOT!";
	closeDialog 0;
};


