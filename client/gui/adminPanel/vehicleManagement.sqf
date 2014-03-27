//	@file Name: vehicleManagement.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#define vehicleManagementDialog 12000
#define vehicleManagementVehicleCount 12002
#define vehicleManagementCivButton 12007
#define vehicleManagementHeliButton 12008
#define vehicleManagementPlaneButton 12009
#define vehicleManagementTankButton 12010

disableSerialization;

private ["_start","_dialog","_vehicleCountText","_vehicleCount","_uid","_vehicleCivBtn","_vehicleHeliBtn","_vehiclePlaneBtn","_vehicleTankBtn"];

_uid = getPlayerUID player;
if ((_uid in dpModerators) OR (_uid in serverCADministrators)) then
{
	_start = createDialog "VehicleManagement";

	_dialog = findDisplay vehicleManagementDialog;
	_vehicleCountText = _dialog displayCtrl vehicleManagementVehicleCount;
	_vehicleCivBtn = _dialog displayCtrl vehicleManagementCivButton;
	_vehicleHeliBtn = _dialog displayCtrl vehicleManagementHeliButton;
	_vehiclePlaneBtn = _dialog displayCtrl vehicleManagementPlaneButton;
	_vehicleTankBtn = _dialog displayCtrl vehicleManagementTankButton;

	_uid = getPlayerUID player;
	_vehicleCount = 0;
	{
		_vehicleCount = _vehicleCount + 1;
	} forEach entities "LandVehicle";	//"All"

	_vehicleCountText ctrlSetText format["Objects of type 'LandVehicle' on Server: %1", _vehicleCount];

	if((_uid in dpModerators)) then
	{
		_vehicleCivBtn ctrlShow false;
	    _vehicleHeliBtn ctrlShow false;
	    _vehiclePlaneBtn ctrlShow false;
	    _vehicleTankBtn ctrlShow false;
	};
}
else
{
	exit;
};
