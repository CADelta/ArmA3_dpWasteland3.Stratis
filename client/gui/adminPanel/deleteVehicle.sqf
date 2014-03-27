//	@file Name: deleteVehicle.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#define vehicleManagementDialog 12000
#define vehicleManagementListBox 12001

disableSerialization;

private ["_switch","_vehicleType","_vehicleSummary","_vehicle","_selectedItem","_selectedItemData"];

_uid = getPlayerUID player;
if ((_uid in dpModerators) || (_uid in serverCADministrators)) then
{
	_dialog = findDisplay vehicleManagementDialog;
	_vehicleListBox = _dialog displayCtrl vehicleManagementListBox;

	_selectedItem = lbCurSel _vehicleListBox;
	_selectedItemData = _vehicleListBox lbData _selectedItem;

	player commandChat format ["Deleting %1", _selectedItemData];
	{
	    _vehicle = _x;
		if (str (_vehicle) == _selectedItemData) then
	    {
	        {
	            _x leaveVehicle _vehicle;
	        } forEach crew _vehicle;
	       	deleteVehicle _vehicle;
	    };
	} forEach vehicles;

	player commandChat "Vehicle Deleted";

	/*closeDialog 0;
	execVM "client\gui\adminPanel\vehicleManagement.sqf";*/

	_vehicleListBox lbData 1;
}
else
{
	exit;
};