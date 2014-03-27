//	@file Name: loaddpModeratorMenu.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#define dpModMenu_option 50005
disableSerialization;

private ["_start","_displaydpModerator","_dpModSelect","_panelOptions"];
_uid = getPlayerUID player;
if (_uid in dpModerators) then
{
	//hint "Welcome dp Moderator\nPress U to open the Moderator Menu";

	_start = createDialog "dpModMenu";	// Changed from ServerdpModMenu to dpModMenu

	_displaydpModerator = uiNamespace getVariable "dpModMenu";
	_dpModSelect = _displaydpModerator displayCtrl dpModMenu_option;

	_panelOptions = ["Player Management",
					"Object Management"
					];
	{
		_dpModSelect lbAdd _x;
	} forEach _panelOptions;
}
else
{
	exit;
};