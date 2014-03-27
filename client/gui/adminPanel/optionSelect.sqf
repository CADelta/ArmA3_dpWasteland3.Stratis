//	@file Name: optionSelect.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

#define serverCADminMenu_option 50007
#define dpModMenu_option 50005
disableSerialization;

private ["_panelType","_displaydpMod","_displayServerCADmin","_dpModSelect","_serverCADminSelect"];

_uid = getPlayerUID player;
if ((_uid in dpModerators) OR (_uid in serverCADministrators)) then
{
	_panelType = _this select 0;

	_displaydpMod = uiNamespace getVariable "dpModMenu";
	_displayServerCADmin = uiNamespace getVariable "serverCADminMenu";

	if not (isNil "_displaydpMod") then {_dpModSelect = _displaydpMod displayCtrl dpModMenu_option;};
	if not (isNil "_displayServerCADmin") then {_serverCADminSelect = _displayServerCADmin displayCtrl serverCADminMenu_option;};

	switch (_panelType) do
	{
		case 0: //dpModerator panel
		{
			switch (lbCurSel _dpModSelect) do
			{
			    case 0: //Player Management
				{
	                closeDialog 0;
					execVM "client\gui\adminPanel\playerManagement.sqf";
				};
				case 1: //Object Management
				{
					closeDialog 0;
					execVM "client\gui\adminPanel\vehicleManagement.sqf";
				};
			};
		};
	    case 1: //Server CADministrator panel
	    {
			switch (lbCurSel _serverCADminSelect) do
			{
			    case 0: //Player Management
				{
	                closeDialog 0;
					execVM "client\gui\adminPanel\playerManagement.sqf";
				};

				case 1: //Object Management
				{
	                closeDialog 0;
					execVM "client\gui\adminPanel\vehicleManagement.sqf";
				};

			    case 2: //Debugging Tags
			    {
					execVM "client\gui\adminPanel\playerTags.sqf";
			    };

			    case 3: //Teleport
			    {
	                closeDialog 0;
	                openMap true;
	                hint "Click on map to teleport";
	                onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
			    };

	            case 4: //Money
			    {
					player setVariable ["cmoney", (player getVariable "cmoney") + 500, true];
			    };

			    case 5: //Allow Player Icons
			    {
					if (allowPlayerIcons == "ON") then
					{
						allowPlayerIcons = "OFF";
					}
					else
					{
						allowPlayerIcons = "ON";
					};
					publicVariableServer "allowPlayerIcons";
				};

				case 6: //Allow Groups
			    {
					if (allowGroups == "ON") then
					{
						allowGroups = "OFF";
					}
					else
					{
						allowGroups = "ON";
					};
					publicVariableServer "allowGroups";
			    };
			};
	    };
	};
}
else
{
	exit;
};
