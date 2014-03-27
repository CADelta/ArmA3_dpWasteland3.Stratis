//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

disableSerialization;

diag_log format["*** playerHud Started ***"];

// ************************************ Part of Territory System - START ************************************

    private["_lastHealthReading", "_lastTerritoryName", "_lastTerritoryDescriptiveName", "_territoryCaptureIcon"];

    _lastHealthReading = 100; // Used to flash the health reading when it changes

    // Needed for territory system
    _lastTerritoryName = "";
    _lastTerritoryDescriptiveName = "";

    _displayTerritoryActivity = {
        private['_boldFont', '_descriptiveName', '_configEntry', '_territoryActionText', '_territoryAction', '_seconds', '_minutes'];

        _boldFont = "PuristaBold";

        _descriptiveName = "Unknown territory";

        // Expensive lookup for the HUD, so cache it
        if (_territoryName != _lastTerritoryName) then
        {
            // Look up the descriptive name of this territory
            _configEntry = [(call config_territory_markers), { _x select 0 == _territoryName }] call BIS_fnc_conditionalSelect;
            _descriptiveName = (_configEntry select 0) select 1;
            _lastTerritoryName = _territoryName;
            _lastTerritoryDescriptiveName = _descriptiveName;
        }
        else
        {
            _descriptiveName = _lastTerritoryDescriptiveName;
        };

        _territoryActionText = "";
        _territoryAction = _territoryActivity select 0;

        switch (_territoryAction) do
        {
            case "CAPTURE":
            {
                _territoryCaptureCountdown = round (_territoryActivity select 1);

                if (_territoryCaptureCountdown > 60) then
                {
                    _seconds = _territoryCaptureCountdown % 60;
                    _territoryCaptureCountdown = (_territoryCaptureCountdown - _seconds) / 60;
                    _minutes = _territoryCaptureCountdown % 60;

                    _territoryActionText = format["Capturing territory in about <t font='%1'>%2 minutes</t>", _boldFont, _minutes + 1];
                }
                else
                {
                    if (_territoryCaptureCountdown < 5) then
                    {
                        _territoryActionText = format["Territory transition in progress..."];
                    }
                    else
                    {
                        _territoryActionText = format["Capturing territory in <t font='%1'>%2 seconds</t>", _boldFont, _territoryCaptureCountdown];
                    };
                };
            };
            case "BLOCKEDATTACKER":
            {
                _territoryActionText = format["Territory capture blocked"];
            };
            case "BLOCKEDDEFENDER":
            {
                _territoryActionText = format["Territory under attack"];
            };
            case "RESET":
            {
                _territoryActionText = format["Territory capture started"];
            };
            default {};
        };

        _activityMessage = format["Location: <t font='%1'>%2</t><br/>%3", _boldFont, _descriptiveName, _territoryActionText];
        _topLeftIconText = "<img size='3' image='territory\client\icons\territory_cap_white.paa'/>";

        [_topLeftIconText, _activityMessage]
    };

// ************************************ Part of Territory System - END ************************************


private ["_ui", "_vitals", "_hudVehicle", "_decimalPlaces", "_health", "_tempString", "_yOffset", "_vehicle", "_x", "_y", "_thirstLevel", "_hungerLevel"];

while {true} do
{
    1000 cutRsc ["WastelandHud","PLAIN"];
	_ui = uiNameSpace getVariable "WastelandHud";
	_vitals = _ui displayCtrl 3600;
	_hudVehicle = _ui displayCtrl 3601;
	_hudScanner = _ui displayCtrl 3602;
    _hudActivityIcon = _ui displayCtrl 3604;
    _hudActivityTextbox = _ui displayCtrl 3605;

	//Calculate Health 0 - 100
	_decimalPlaces = 2;
	_health = damage player;
	_health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
	_health = 100 - (_health * 100);

    _vitals ctrlSetStructuredText parseText format ["%1 <img size='1.0' image='client\ui\icons\health.paa'/><br/>%2 <img size='1.0' image='client\ui\icons\water.paa'/><br/>%3 <img size='1.0' image='client\ui\icons\food.paa'/><br/>%4 <img size='1.0' image='client\ui\icons\money.paa'/>", _health, round (player getVariable ["thirst",0]), round (player getVariable ["hunger",0]), player getVariable ["cmoney",0]];

    _vitals ctrlCommit 0;

	_scanning = "...";
	if (scanningInProgress) then
	{
		_scanning = format["Scanning... %1 sec", ScannerProgress];
	}
	else
	{
		if (scannerBattery < 60) then
		{
			_scanning = "Recharging Battery...";
		}
		else
		{
			_scanning = "Scanner Available";
		};
	};

	_hudScanner ctrlSetStructuredText parseText format ["<img size='1.0' image='client\ui\icons\battery.paa'/> %1%2<br/>%3", scannerBattery, "%", _scanning];
	_hudScanner ctrlCommit 0;

	if (player != vehicle player) then
	{
		_tempString = "";
		_yOffset = 0.24;
		_vehicle = assignedVehicle player;
		{
			if((driver _vehicle == _x) || (gunner _vehicle == _x) || (commander _vehicle == _x)) then
			{
				if(driver _vehicle == _x) then
				{
					_tempString = format ["%1 %2 <img size='1.0' image='client\ui\icons\driver.paa'/><br/>",_tempString, (name _x)];
					_yOffset = _yOffset + 0.04;
				};
				if(gunner _vehicle == _x) then
				{
					_tempString = format ["%1 %2 <img size='1.0' image='client\ui\icons\gunner.paa'/><br/>",_tempString, (name _x)];
					_yOffset = _yOffset + 0.04;
				};
				if(commander _vehicle == _x) then
				{
					_tempString = format ["%1 %2 <img size='1.0' image='client\ui\icons\commander.paa'/><br/>",_tempString, (name _x)];
					_yOffset = _yOffset + 0.04;
				};
			}
			else
			{
				_tempString = format ["%1 %2 <img size='1.0' image='client\ui\icons\cargo.paa'/><br/>",_tempString, (name _x)];
				_yOffset = _yOffset + 0.04;
			};
		} forEach crew _vehicle;

		_hudVehicle ctrlSetStructuredText parseText _tempString;
		_x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
		_y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
		_hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
		_hudVehicle ctrlCommit 0;
	};

// ************************************ Part of Territory System - START ************************************

	// Territory system! Uses two new boxes in the top left of the HUD. We
    // can extend the system later to encompas other activities
    //
    // This does nothing if the system is not enabled, as TERRITORY_ACTIVITY is never set
    _activityIconStr = "";
    _activityMessage = "";
    _activityBackgroundAlpha = 0;

    // Activity does not show when the map is open
    if (!visibleMap) then
    {
        // Determine activity. Currently this is territory cap only
        _territoryActivity = player getVariable ["TERRITORY_ACTIVITY", []];
        _territoryName = player getVariable ["TERRITORY_OCCUPATION", ""];

        if (count _territoryActivity > 0 && {_territoryName != ""}) then
        {
            _activityDetails = [] call _displayTerritoryActivity;
            _activityIconStr = _activityDetails select 0;
            _activityMessage = _activityDetails select 1;
        };
    };

    // Show the UI if we have activity
    if (_activityIconStr != "" && {_activityMessage != ""}) then
    {
        _activityBackgroundAlpha = 0.4;
    };

    _hudActivityIcon ctrlSetBackgroundColor [0, 0, 0, _activityBackgroundAlpha];
    _hudActivityIcon ctrlSetStructuredText parseText _activityIconStr;
    _hudActivityIcon ctrlCommit 0;

    _hudActivityTextbox ctrlSetBackgroundColor [0, 0, 0, _activityBackgroundAlpha];
    _hudActivityTextbox ctrlSetStructuredText parseText _activityMessage;
    _hudActivityTextbox ctrlCommit 0;

// ************************************ Part of Territory System - END ************************************

    sleep 1;
};

diag_log format["*** playerHud Finished ***"];
