//	Name: init.sqf
//	Author: AimZ =(dp)=, [CAD] Krycek

if (isServer) exitWith {};

diag_log format["****** clientInit Started ******"];

// Public variable events
"currentDate" addPublicVariableEventHandler {[] call clientTimeSync};		// Calling clientTimeSync.sqf! Only thing that this does is: setDate currentDate; (currentDate is a PVAR made in serverVars.sqf and used in serverTimeSync.sqf)
"messageSystem" addPublicVariableEventHandler {[] call serverMessage};
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"pvar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

"allowPlayerIcons" addPublicVariableEventHandler {hint format["Player Icons %1", allowPlayerIcons];};
"allowGroups" addPublicVariableEventHandler {if(allowGroups == "OFF") then {[player] joinSilent grpNull;}; hint format["Groups %1", allowGroups];};

"refuelVehicle" addPublicVariableEventHandler
{
	_data = _this select 1;
	_currVehicle = _data select 0;
	_fuelAmount = _data select 1;
	if (_currVehicle != "") then
	{
		_obj = objectFromNetId _currVehicle;
		if (_obj != objNull) then
		{
			if (local _obj) then
			{
				_fuel = ((fuel _obj) + _fuelAmount);
				if (_fuel > 1) then
				{
					_fuel = 1;
				};
				_obj setFuel _fuel;
				refuelVehicle = ["",0];
				publicVariable "refuelVehicle";
			};
		};
	};
};

"defuelVehicle" addPublicVariableEventHandler
{
	_data = _this select 1;
	_currVehicle = _data select 0;
	_fuelAmount = _data select 1;
	if (_currVehicle != "") then
	{
		_obj = objectFromNetId _currVehicle;
		if (_obj != objNull) then
		{
			if (local _obj) then
			{
				_fuel = ((fuel _obj) - _fuelAmount);
				if (_fuel < 0) then
				{
					_fuel = 0;
				};
				_obj setFuel _fuel;
				defuelVehicle = ["",0];
				publicVariable "defuelVehicle";
			};
		};
	};
};

// Initialise
[] call clientVars;
[] call briefing;

// wait for the player to be ingame before continuing
waitUntil {!isNull player};
waitUntil {vehicle player == player};
waitUntil {!visibleMap};
sleep 2;

// One time only setup
[] call initPlayer;

// Update map markers
[] call createTownMarkers;
[] call createGunStoreMarkers;
[] call createGeneralStoreMarkers;
[] call createConstructionStoreMarkers;
[] call updateMissionsMarkers;


// ************************************ Part of Territory System - START ************************************

// Territory system enabled?
if (count (call config_territory_markers) > 0) then
{
	territoryActivityHandler = compileFinal preprocessFileLineNumbers "territory\client\territoryActivityHandler.sqf";
	[] execVM "territory\client\createCaptureTriggers.sqf";
};

// ************************************ Part of Territory System - END ************************************


//[] spawn {_objects = nearestObjects [getMarkerPos "Town_1", ["House_F"], 28000]; {_x allowDamage false;_x enableSimulation false;sleep 0.01;} forEach _objects;};		// This is with enableSimulation false.	***CAD***
[] spawn {_objects = nearestObjects [getMarkerPos "Town_1", ["House_F"], 28000]; {_x allowDamage false;sleep 0.01;} forEach _objects;};									// I believe this sets every building to be invulnerable and I have removed enableSimulation false, since the previously know performance gain does not apply anymore. It's now part of the netcode :)	***CAD***

// Player setup
//sleep 2;
[] call PlayerSetup;
[] spawn createMenuActions;
[] spawn initSurvival;
[] call createKeyboardEvent;

// Start HUD drawing
[] spawn rechargeScanner;
[] spawn playerHud;

[] spawn drawPlayerIcons;
[] spawn getPlayerData;
[] spawn getDebugData;

{
	if (isPlayer _x && {!isNil ("addScore_" + (getPlayerUID _x))}) then
	{
		_x spawn removeNegativeScore;
	};
} forEach playableUnits;

// 3rd Party Scripts:
// FPS Fix - Vehicle Manager - Thx AgentRev :)
[] execVM "addons\scripts\fpsFix_vehicleManager.sqf";

diag_log format["******** clientInit Finished ********"];
