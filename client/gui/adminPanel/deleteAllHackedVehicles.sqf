//  @file Name: deleteAllHackedVehicles.sqf
//  @file Author: [CAD] Krycek

private ["_allVehicles","_check","_vehicleType"];

{
	if (format ["%1", _x getVariable "authorisedVehicle"] != "1") then
	{
		_vehicleType = format ["%1", typeOf _x];
		if(!(_vehicleType isKindOf "Civilian") && !(_vehicleType isKindOf "SoldierWB") && !(_vehicleType isKindOf "SoldierEB") && !(_vehicleType isKindOf "Logic")) then
		{
			deleteVehicle _x;
		};
	};
} forEach vehicles;

player commandChat "All Hacked Vehicles Deleted";

closeDialog 0;
execVM "client\gui\adminPanel\vehicleManagement.sqf";
