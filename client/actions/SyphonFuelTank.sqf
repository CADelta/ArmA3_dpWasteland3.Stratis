//  @file Name: SyphonFuelTank.sqf
//  @file Author: AimZ =(dp)=, [CAD] Krycek

_vehicle = nearestobjects [player, ["Car", "Helicopter", "Tank", "Ship"], 4];
if (count _vehicle > 0) then
{
	_vehicle = _vehicle select 0;
};

_fuelAmount = 0.25;

switch true do
{
	case (_vehicle isKindOf "Air"): {_fuelAmount = 0.10;};
	case (_vehicle isKindOf "Tank"): {_fuelAmount = 0.10;};
	case (_vehicle isKindOf "Ship"): {_fuelAmount = 0.10;};
	case (_vehicle isKindOf "ATV_Base_EP1"): {_fuelAmount = 0.75;};
};

if (fuel _vehicle > 0.10) then
{
	if (player distance _vehicle < 4) then
	{
        if(!(local _vehicle)) then
		{
			defuelVehicle = [netId _vehicle,_fuelAmount];
			publicVariable "defuelVehicle";
		}
		else
		{
			_fuel = (fuel _vehicle) - _fuelAmount;
			if (_fuel < 0) then {_fuel = 0;};
			_vehicle setFuel _fuel;
		};

		player setVariable ["fuelFull",1,false];
		player setVariable["fuelEmpty",0,false];
		hint "Your jerry can is now full";
	}
	else
	{
		hint "Vehicle too far away.";
	};
}
else
{
	if (fuel _vehicle > 0) then
	{
		hint "No way I'll reach those last drops of fuel.";
	}
	else
	{
		hint "No fuel in vehicle.";
	};
};