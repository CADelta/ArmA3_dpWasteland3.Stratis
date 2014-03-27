//  @file Name: controlStoreGuy.sqf
//  @file Author: [CAD] Krycek

if(!isDedicated) exitWith {};

private ["_guy","_location","_position"];

_guy = _this select 0;
_location = _this select 1;

// get the position of the marker
_guyObject = objectFromNetId _guy;
_position = getMarkerPos _location;
_position set [2, 0.2];
_guyObject setPosATL _position;

//_guy disableAI 'MOVE'; _guy DisableAI 'ANIM'; _guy disableAI 'FSM';

while {true} do
{
	// get distance
	if (_guyObject distance _position > 5) then
	{
		_guyObject setPosATL _position;
	};

	sleep 60;
};
