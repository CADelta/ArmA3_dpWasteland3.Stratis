//	@file Name: playerTags.sqf
//	@file Author: Battleguns

disableSerialization;

_uid = getPlayerUID player;
if (_uid in serverCADministrators) then
{
	if (isNil "pvmkr") then {pvmkr = 0;}; if (pvmkr == 0) then {pvmkr = 1; hint "Player Markers ON";} else {pvmkr = 0; hint "Player Markers OFF";};

	_playerMarkers = [];
	while {pvmkr == 1} do
	{
		if (visibleMap) then
		{
			// Move markers on the map
			{
				_position = getPos _x;
				_markerName = Format ["player_%1_pos", getPlayerUID _x];
				_markerName setMarkerPosLocal _position;
			} forEach _playerMarkers;

			// add marker to map. save to list of players..
			{
				if (!(_x in _playerMarkers)) then
				{
					_position = getPos _x;
					_markerName = Format ["player_%1_pos", getPlayerUID _x];
					createMarkerLocal [_markerName, _position];
					_markerName setMarkerShapeLocal "ICON";
					_markerName setMarkerTypeLocal "mil_dot";
					_markerName setMarkerColorLocal "ColorWhite";
					_markerName setMarkerSizeLocal [1,1];
					_markerName setMarkerTextLocal name _x;

					// add to array
					_playerMarkers set [count _playerMarkers, _x];
				};
			} forEach playableUnits;

			// remove markers from map, delete from array if no longer exists
			_deleteItems = ["DELETE_ME"];
			{
				if (!(_x in playableUnits)) then
				{
					_markerName = Format ["player_%1_pos", getPlayerUID _x];
					deleteMarkerLocal _markerName;
					_playerMarkers set [_forEachIndex, "DELETE_ME"];
				};
			} forEach _playerMarkers;
			_playerMarkers = _playerMarkers - _deleteItems;
		}
		else
		{
			{
				_markerName = Format ["player_%1_pos", getPlayerUID _x];
				deleteMarkerLocal _markerName;
			} forEach _playerMarkers;
			_playerMarkers = [];
		};

		sleep 1;
	};

	{
		_markerName = Format ["player_%1_pos", getPlayerUID _x];
		deleteMarkerLocal _markerName;
	} forEach _playerMarkers;
	_playerMarkers = [];

}
else
{
	exit;
};
