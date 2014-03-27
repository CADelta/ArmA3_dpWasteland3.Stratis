//	@file Name: repair.sqf
//	@file Original Author: TAW_Tonic
//  @file Author: [404] Costlyy
//  @file Modified by: AimZ =(dp)=

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_currVehicle","_currVehicleType","_stringEscapePercent","_iteration","_loopSpeed","_iterationAmount","_iterationPercentage"];

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
if(isNil{_currVehicle}) exitWith { hint "No vehicle within range"; };

if(((damage _currVehicle) > 0) OR !(canMove _currVehicle) OR (_currVehicle isKindOf "Air") OR ((count crew _currVehicle > 0) AND (count(configFile >> "CfgVehicles" >> (_currVehicleType) >> "Turrets") > 0) AND !(canFire _currVehicle))) then {

    mutexScriptInProgress = true;
    _currPlayerState = animationState player;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";

    _totalDuration = 5; // 5 seconds duration
	_iterationAmount = _totalDuration;

	for "_iteration" from 1 to _iterationAmount do {

        if(vehicle player != player) exitWith { // Player is in a vehicle
			2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
		};

        if (doCancelAction) exitWith {// Player selected "cancel action".
    		2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
      		doCancelAction = false;
    		player playMoveNow _currPlayerState;
		};

   		if (!(alive player)) exitWith {// If the player dies, revert state.
			2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
		};

		if(player distance _currVehicle > 5) exitWith { // If the player leaves, revert state.
			2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
		};

    	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then { // Keep the player locked in medic animation for the full duration of the loop.
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};

     	_iterationAmount = _iterationAmount - 1;
		_iterationPercentage = floor (_iteration / _totalDuration * 100);

		2 cutText [format["Vehicle repair %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		sleep 1;

     	if (_iteration >= _totalDuration) exitWith { // Success conditions
    		sleep 1;
			2 cutText ["", "PLAIN DOWN", 1];
      		player playMoveNow _currPlayerState;
  			player setVariable["repairkits",(player getVariable "repairkits")-1,false];
      		_currVehicle setDamage 0;
   		};
    };
} else {
	//{[_currVehicle, _x, 0] call client_setHit;} forEach ["HitGlass1", "HitGlass2", "HitGlass3", "HitGlass4", "HitGlass5", "HitGlass6"];
	hint "Vehicle does not need repairing";
};

sleep 1;
2 cutText ["", "PLAIN DOWN", 1];
mutexScriptInProgress = false;