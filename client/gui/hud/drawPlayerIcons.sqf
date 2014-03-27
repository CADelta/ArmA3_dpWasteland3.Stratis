// @file Name: drawPlayerIcons.sqf
// @file Author: AimZ =(dp)=

// HUD graphics - should only have 1 script.. for player info, player names, player icons etc.

iconArray = [];
nameArray = [];
vehicleDebugArray = [];
deadDebugArray = [];

if (isNil "pvmkr") then {pvmkr = 0;};

addMissionEventHandler ["Draw3D",
{
	private
	[
		"_playerIcon",
		"_playerPos",
		"_playerName",
		"_playerPosATL",
		"_playerDistance",
		"_iconColour",
		"_iconSize",
		"_target",
		"_uid",
		"_map",
		"_timeOut",
		"_objectDistance",
		"_objectPos",
		"_timeLeft",
		"_lastTimeOut",
		"_scannerStrength"
	];

	_uid = getPlayerUID player;

	if (!visibleMap) then
	{
		// draw players tag and name (a coloured icon) for each player with 1000m
		{
			_playerPos = visiblePosition _x;
			_playerPosATL = getPosATL _x;
			_playerPos set [2, (_playerPosATL select 2) + 2.0];
			_playerDistance = _playerPos distance player;

			_scannerStrength = 1;
			if (allowPlayerIcons == "OFF") then
			{
				// 400 meters
				_scannerStrength = (scannerBattery * ((-0.0015 * (_playerPos distance player)) + 1)) / 100;
			}
			else
			{
				// 1000 - 1500 meters
				_scannerStrength = (-0.0005 * (_playerPos distance player)) + 1;
			};
			if (_scannerStrength > 1) then {_scannerStrength = 1;};
			if (_scannerStrength < 0) then {_scannerStrength = 0;};

			switch(str(side _x)) do
			{
				case "WEST": {_playerIcon = "\A3\ui_f\data\map\Markers\NATO\b_unknown.paa";_iconColour = [0,0,1,_scannerStrength];};
				case "EAST": {_playerIcon = "\A3\ui_f\data\map\Markers\NATO\o_unknown.paa";_iconColour = [1,0,0,_scannerStrength];};
				case "GUER": {_playerIcon = "\A3\ui_f\data\map\Markers\NATO\n_unknown.paa";_iconColour = [0,1,0,_scannerStrength];};
				default {_playerIcon = "\A3\ui_f\data\map\Markers\Military\unknown_ca.paa";_iconColour = [1,1,1,_scannerStrength];};
			};

			_iconSize = (-0.0004 * _playerDistance) + 0.6;
			if (_iconSize >= 0.6) then {_iconSize = 0.6};
			if (_iconSize <= 0.2) then {_iconSize = 0.2};

			// draw the icon
			drawIcon3D [_playerIcon, _iconColour, _playerPos, _iconSize, _iconSize, 0, "", 0, 0.03, "PuristaLight"];
		} forEach iconArray;

		if (pvmkr == 1 && _uid in serverCADministrators) then
		{
			{
				_playerPos = visiblePosition _x;
				_playerPosATL = getPosATL _x;
				_playerPos set [2, (_playerPosATL select 2) + 0.2];

				// 1500 meters
				_scannerStrength = (-0.0015 * (_playerPos distance player)) + 1;
				if (_scannerStrength > 1) then {_scannerStrength = 1;};
				if (_scannerStrength < 0) then {_scannerStrength = 0;};

				drawIcon3D ["", [1,1,1,_scannerStrength], _playerPos, 0, 0, 0, format ["%1 (%2m)", name _x, round (_x distance player)], 0, 0.03, "PuristaLight"];
			} forEach nameArray;

			{
				_objectPos = visiblePosition _x;
				_objectPosATL = getPosATL _x;
				_objectPos set [2, (_objectPosATL select 2) + 0.2];

				// 400 meters
				_scannerStrength = (-0.0015 * (_objectPos distance player)) + 1;
				if (_scannerStrength > 1) then {_scannerStrength = 1;};
				if (_scannerStrength < 0) then {_scannerStrength = 0;};

				_timeOut = _x getVariable ["timeout", time];
				_lastTimeOut = _x getVariable ["last_timeout", time];
				_timeLeft = _timeOut - _lastTimeOut;

				drawIcon3D ["", [1,1,1,_scannerStrength], _objectPos, 0, 0, 0, format["respawn in %1s", floor(_timeLeft)], 0, 0.03, "PuristaLight"];
			} forEach vehicleDebugArray;

			{
				_objectPos = visiblePosition _x;
				_objectPosATL = getPosATL _x;
				_objectPos set [2, (_objectPosATL select 2) + 0.2];

				// 400 meters
				_scannerStrength = (-0.0015 * (_objectPos distance player)) + 1;
				if (_scannerStrength > 1) then {_scannerStrength = 1;};
				if (_scannerStrength < 0) then {_scannerStrength = 0;};

				_timeOut = _x getVariable ["timeout", time];
				_lastTimeOut = _x getVariable ["last_timeout", time];
				_timeLeft = _timeOut - _lastTimeOut;

				drawIcon3D ["", [1,1,1,_scannerStrength], _objectPos, 0, 0, 0, format["respawn in %1s", floor(_timeLeft)], 0, 0.03, "PuristaLight"];
			} forEach deadDebugArray;
		}
		else
		{
			{
				_playerPos = visiblePosition _x;
				_playerPosATL = getPosATL _x;
				_playerPos set [2, (_playerPosATL select 2) + 0.2];

				// 400 meters
				_scannerStrength = 1;
				if (allowPlayerIcons == "OFF") then
				{
					_scannerStrength = (scannerBattery * ((-0.0015 * (_playerPos distance player)) + 1)) / 100;
				}
				else
				{
					_scannerStrength = (-0.0015 * (_playerPos distance player)) + 1;
				};
				if (_scannerStrength > 1) then {_scannerStrength = 1;};
				if (_scannerStrength < 0) then {_scannerStrength = 0;};

				drawIcon3D ["", [1,1,1,_scannerStrength], _playerPos, 0, 0, 0, name _x, 0, 0.03, "PuristaLight"];
			} forEach nameArray;
		};
	};
}];
