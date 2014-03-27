// @ file Name: getDebugData.sqf

// collect all debug info to draw...
while {true} do
{
	_vehicleDebugArray = [];
	{
		if (!(isNull _x) && alive player) then
		{
			_timeout = _x getVariable ["timeout", -1];
			_status = _x getVariable ["status", "unknown"];
			_objectPos = visiblePosition _x;
			_objectDistance = _objectPos distance player;
			//_target = cursorTarget;
			//if (_target == _x && _timeout > -1 && _objectDistance <= 400 && _status == "alive") then
			if (_timeout > -1 && _objectDistance <= 400) then
			{
				_vehicleDebugArray set [count _vehicleDebugArray, _x];
			};
		};
		sleep 0.1;
	} forEach vehicles;

	vehicleDebugArray = + _vehicleDebugArray;

	_deadDebugArray = [];
	{
		if (!(isNull _x)) then
		{
			_timeout = _x getVariable ["timeout", -1];
			_objectPos = visiblePosition _x;
			_objectDistance = _objectPos distance player;

			if (_timeout > -1 && _objectDistance <= 400) then
			{
				_deadDebugArray set [count _deadDebugArray, _x];
			};
		};
		sleep 0.1;
	} forEach allDeadMen;
	deadDebugArray = + _deadDebugArray;
	sleep 1;
};