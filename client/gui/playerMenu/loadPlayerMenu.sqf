//  @file Name: loadPlayerMenu.sqf

#include "dialog\player_sys.sqf";

if(isNil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};

disableSerialization;

private["_playerDialog","_Dialog","_foodtext","_watertext","_moneytext","_mvalue","_rogue","_uptime","_groupButton","_mIndex"];

if(!dialog) then
{
	_playerDialog = createDialog "playerSettings";

	_Dialog = findDisplay playersys_DIALOG;
	_foodtext = _Dialog displayCtrl food_text;
	_watertext = _Dialog displayCtrl water_text;
	_moneytext = _Dialog displayCtrl money_text;
	_mvalue = _Dialog displayCtrl money_value;
	_rogue = _Dialog displayCtrl rogue_text;
	_uptime = _Dialog displayCtrl uptime_text;
	_groupButton = _Dialog displayCtrl groupButton;
	_itemList = _dialog displayCtrl item_list;
	_playerList = _dialog displayCtrl give_to_list;

	_foodtext ctrlSettext format["%1 / 100", round(player getVariable "hunger")];
	_watertext ctrlSetText format["%1 / 100", round(player getVariable "thirst")];
	_moneytext ctrlSetText format["%1", player getVariable "cmoney"];

	if(player getVariable "canfood" > 0) then
	{
		_itemListIndex = _itemList lbAdd format["%1x - Canned Food", player getVariable "canfood"];
		_itemList lbSetData [(lbSize _itemList)-1, "canfood"];
	};

	if(player getVariable "water" > 0) then
	{
		_itemListIndex = _itemList lbAdd format["%1x - Water bottle", player getVariable "water"];
		_itemList lbSetData [(lbSize _itemList)-1, "water"];
	};

	if(player getVariable "fuelFull" == 1) then
	{
		_itemListIndex = _itemList lbAdd "Fuel Can";
		_itemList lbSetData [(lbSize _itemList)-1, "fuelFull"];
	};

	if(player getVariable "fuelEmpty" == 1) then
	{
		_itemListIndex = _itemList lbAdd "Empty Fuel Can";
		_itemList lbSetData [(lbSize _itemList)-1, "fuelEmpty"];
	};

	if(player getVariable "repairkits" > 0) then
	{
		_str = "Repair Kit";

		if(player getVariable "repairkits" > 1) then
		{
			_str = format ["%1x - Repair Kit", player getVariable "repairkits"];
		}
		else
		{
			_str = "Repair Kit"
		};

		_itemListIndex = _itemList lbAdd _str;
		_itemList lbSetData [(lbSize _itemList)-1, "repairkits"];
	};

	if(player getVariable "medkits" > 0) then
	{
		_str = "Medical kit";
		if(player getVariable "medkits" > 1) then {
			_str = format ["%1x - Medical kit", player getVariable "medkits"];
		}
		else
		{
			_str = "Medical kit";
		};
		_itemListIndex = _itemList lbAdd _str;
		_itemList lbSetData [(lbSize _itemList)-1, "medkits"];
	};

	_nearestPlayers = nearestobjects [player, ["B_Soldier_F","B_soldier_M_F","B_medic_F","B_soldier_repair_F","O_Soldier_F","O_soldier_M_F","O_medic_F","O_soldier_repair_F","I_Soldier_F","I_soldier_M_F","I_medic_F","I_soldier_repair_F"],  5];
	{
		if (player distance _x < 5 && alive _x && player != _x) then
		{
			_playerListIndex = _playerList lbAdd name _x;
			_playerList lbSetData [(lbSize _playerList)-1, name _x];
		};
	} forEach _nearestPlayers;

	_mIndex = _mvalue lbadd "$5"; _mvalue lbSetData [(lbSize _mvalue)-1, "5"];
	_mIndex = _mvalue lbadd "$15"; _mvalue lbSetData [(lbSize _mvalue)-1, "15"];
	_mIndex = _mvalue lbadd "$20"; _mvalue lbSetData [(lbSize _mvalue)-1, "20"];
	_mIndex = _mvalue lbadd "$50"; _mvalue lbSetData [(lbSize _mvalue)-1, "50"];
	_mIndex = _mvalue lbadd "$75"; _mvalue lbSetData [(lbSize _mvalue)-1, "75"];
	_mIndex = _mvalue lbadd "$100"; _mvalue lbSetData [(lbSize _mvalue)-1, "100"];
	_mIndex = _mvalue lbadd "$200"; _mvalue lbSetData [(lbSize _mvalue)-1, "200"];
	_mIndex = _mvalue lbadd "$300"; _mvalue lbSetData [(lbSize _mvalue)-1, "300"];
	_mIndex = _mvalue lbadd "$400"; _mvalue lbSetData [(lbSize _mvalue)-1, "400"];
	_mIndex = _mvalue lbadd "$500"; _mvalue lbSetData [(lbSize _mvalue)-1, "500"];
	_mIndex = _mvalue lbadd "$1000"; _mvalue lbSetData [(lbSize _mvalue)-1, "1000"];
	_mIndex = _mvalue lbadd "$2000"; _mvalue lbSetData [(lbSize _mvalue)-1, "2000"];
	_mIndex = _mvalue lbadd "$3000"; _mvalue lbSetData [(lbSize _mvalue)-1, "3000"];
	_mIndex = _mvalue lbadd "$4000"; _mvalue lbSetData [(lbSize _mvalue)-1, "4000"];
	_mIndex = _mvalue lbadd "$5000"; _mvalue lbSetData [(lbSize _mvalue)-1, "5000"];

	//  disable groups if allowGroups enabled
	if (allowGroups == "OFF") then
	{
	 	_groupButton ctrlShow false;
	};
};
