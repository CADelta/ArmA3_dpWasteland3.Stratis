//	@file Name: refuel.sqf
//	@file Original Author: TAW_Tonic
//  @file Author: [404] Costlyy
//  @file Modified by: AimZ =(dp)=, [CAD] Krycek

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith
{
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_currVehicle","_currVehicleType","_fuelAmount","_stringEscapePercent","_iteration","_loopSpeed","_iterationAmount","_iterationPercentage"];

_currVehicles = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 5];
_currVehicle = objNull;
_currVehicleType = "";
if (count _currVehicles > 0) then
{
	_currVehicle = _currVehicles select 0;
	_currVehicleType = typeOf _currVehicle;
};
_stringEscapePercent = "%"; // Required to get the % sign into a formatted string.
_iteration = 0;

// PRECONDITION: Check player is not in a car (driver/passenger etc).
if(vehicle player != player) exitWith { player globalChat localize "STR_WL_Errors_InVehicle"; };
// PRECONDITION: Check for vehicle near-by, if exists then select closest.
if(isNil{_currVehicle}) exitWith {hint "No vehicle within range";};
// PRECONDITION: Vehicle accepts fuel.
if(_currVehicle isKindOf "Bicycle") exitWith {hint "You can't refuel a bicycle, silly!";};
// PRECONDITION: Vehicle actually needs fuel.
if((fuel _currVehicle) >= 0.99) exitWith {hint "Vehicle has full fuel tank, no point in refueling.";};

_fuelAmount = 0.25;

switch true do
{
	case (_currVehicle isKindOf "Air"): {_fuelAmount = 0.10;};
	case (_currVehicle isKindOf "Tank"): {_fuelAmount = 0.10;};
	case (_currVehicle isKindOf "Motorcycle"): {_fuelAmount = 0.75;};
	case (_currVehicle isKindOf "ATV_Base_EP1"): {_fuelAmount = 0.75;};
};

mutexScriptInProgress = true;
_currPlayerState = animationState player;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";

_totalDuration = 5; // 5 seconds duration
_iterationAmount = _totalDuration;

for "_iteration" from 1 to _iterationAmount do
{
	player setVariable["fuelFull",0,true];
	player setVariable["fuelEmpty",1,true];

    if(vehicle player != player) exitWith { // Player is in a vehicle
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
		player setVariable["fuelEmpty",0,true];
		player setVariable["fuelFull",1,true];
	};

  	if (doCancelAction) exitWith {// Player selected "cancel action".
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
   		player playMoveNow _currPlayerState;
        doCancelAction = false;
        mutexScriptInProgress = false; // Do this here to remove "Cancel Action" ASAP!
		player setVariable["fuelEmpty",0,true];
		player setVariable["fuelFull",1,true];
	};

	if (!(alive player)) exitWith {// If the player dies, revert state.
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
		player setVariable["fuelEmpty",0,true];
		player setVariable["fuelFull",1,true];
	};

	if(player distance _currVehicle > 5) exitWith { // If the player leaves, revert state.
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
		player setVariable["fuelEmpty",0,true];
		player setVariable["fuelFull",1,true];
	};

  	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then { // Keep the player locked in medic animation for the full duration of the loop.
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

   	_iterationAmount = _iterationAmount - 1;
	_iterationPercentage = floor (_iteration / _totalDuration * 100);

	2 cutText [format["Vehicle refuel %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
	sleep 1;

  	if (_iteration >= _totalDuration) exitWith		// Success conditions
   	{
		sleep 1;
		2 cutText ["", "PLAIN DOWN", 1];
    	player playMoveNow _currPlayerState;

        if(!(local _currVehicle)) then
		{
			refuelVehicle = [netId _currVehicle,_fuelAmount];
			publicVariable "refuelVehicle";
		}
		else
		{
			_currVehicle setFuel ((fuel _currVehicle) + _fuelAmount);
		};
   	};
};

mutexScriptInProgress = false;