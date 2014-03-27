//  @file Name: createMenuActions.sqf
//  @file Author: AimZ =(dp)=, [CAD] Krycek

if (isServer) exitWith {};

diag_log format["*** createMenuActions Started ***"];

private ["_vehiclePlayer"];

aActionsIDs = [];

aActionsIDs = aActionsIDs + [player addAction["Scanner", "client\actions\useScanner.sqf", [], 1, false, false, "", 'scannerBattery > 60 && !scanningInProgress']];

aActionsIDs = aActionsIDs + [player addAction["Loot Dead Body", "client\gui\playerMenu\loadLootPlayerMenu.sqf", [], 1, false, false, "", '_object = nearestObjects [player, ["SoldierWB","SoldierEB","SoldierGB"], 5]; if (count _object > 1) then {_object = _object select 1;} else {_object = player;}; player distance _object < 5 && !alive _object']];

aActionsIDs = aActionsIDs + [player addAction["Use The Gun Store", "client\gui\gunStore\loadGunStore.sqf", [], 1, false, false, "", 'player distance (nearestObjects [player, ["C_man_polo_4_F"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Use The General Store", "client\gui\generalStore\loadGenStore.sqf", [], 1, false, false, "", 'player distance (nearestObjects [player, ["C_man_polo_6_F"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Use The Construction Store", "client\gui\constructionStore\loadConstructionStore.sqf", [], 1, false, false, "", 'player distance (nearestObjects [player, ["C_man_polo_5_F"],  5] select 0) < 5']];

aActionsIDs = aActionsIDs + [player addAction["Refuel Jerry Can", "client\actions\refuelFuelCan.sqf", [], 1, false, false, "", 'player distance (nearestObjects [player, ["Land_FuelStation_Feed_F", "Land_MetalBarrel_F"], 3] select 0) < 3 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1)']];
aActionsIDs = aActionsIDs + [player addAction["Syphon Fuel", "client\actions\SyphonFuelTank.sqf", [], 1, false, false, "", 'player distance (nearestObjects [player, ["Car", "Helicopter", "Tank"], 4] select 0) < 3 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1) AND vehicle player == player']];

aActionsIDs = aActionsIDs + [player addAction["Take food from Sack", "noscript.sqf", '_nobj = (nearestObjects [player, ["Land_Sacks_goods_F"],  5] select 0); _nobj setVariable["food",(_nobj getVariable "food")-1,true]; player setVariable["canfood",(player getVariable "canfood")+1,true]; player playmove "AinvPknlMstpSlayWrflDnon"; if(_nobj getVariable "food" < 1) then {hint "You have taken some food.\nFood sack is empty.";} else {hint format["You have taken some food.\n(Food left: %1)", (_nobj getVariable "food")];};',0,false,false,"",'player distance (nearestObjects [player, ["Land_Sacks_goods_F"],  5] select 0) < 5 and (player getVariable "canfood") < 3 and (nearestObjects [player, ["Land_Sacks_goods_F"],  5] select 0) getVariable "food" > 0']];
aActionsIDs = aActionsIDs + [player addAction["Tap water from Barrel","noscript.sqf",'_nobj = (nearestObjects [player, ["Land_CanisterPlastic_F"],  5] select 0);_nobj setVariable["water",(_nobj getVariable "water")-1,true];player setVariable["water",(player getVariable "water")+1,true];player playmove "AinvPknlMstpSlayWrflDnon";if(_nobj getVariable "water" < 1) then {hint "You have taken some water.\nCanister is empty.";}else{hint format["You have taken some water.\n(Water left: %1)", (_nobj getVariable "water")];};',0,false,false,"",'player distance (nearestObjects [player, ["Land_CanisterPlastic_F"],  5] select 0) < 5 and (player getVariable "water") < 4 and (nearestObjects [player, ["Land_CanisterPlastic_F"],  5] select 0) getVariable "water" > 0']];

aActionsIDs = aActionsIDs + [player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 1, false, false, "", 'mutexScriptInProgress']];


_vehiclePlayer = vehicle player;
playerMenuId = _vehiclePlayer addAction [format ["<img size='0.75' color='#BE6300' shadow='1' image='client\ui\player_menu.paa'/>"], loadPlayerMenu,[],-10,false,false,"","local player"];

while {alive player} do
{
	if (vehicle player != _vehiclePlayer) then
	{
		_vehiclePlayer removeAction playerMenuId;
		_vehiclePlayer = vehicle player;
		playerMenuId = _vehiclePlayer addAction [format ["<img size='0.75' color='#BE6300' shadow='1' image='client\ui\player_menu.paa'/>"], loadPlayerMenu,[],-10,false,false,"","local player"];
	};
	sleep 2;
};

_vehiclePlayer removeAction playerMenuId;

diag_log format["*** createMenuActions Finished ***"];
