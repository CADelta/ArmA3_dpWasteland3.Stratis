//  @file Name: saveBaseObjectData.sqf

_objects = nearestObjects [getpos player, ["House_F"], 500];
_myId = 0;
{
	_position = getPos _x;
	_vehicle = typeof _x;

	diag_log format["class Item15"];
	diag_log format["{"];
	diag_log format["	position[]={%1,%2,%3};", _position select 0, _position select 1, _position select 2];
	diag_log format["	id=%1;",_myId];
	diag_log format["	side='EMPTY';"];
	diag_log format["	vehicle='%1';", _vehicle];
	diag_log format["	skill=0.60000002;"];
	diag_log format["};"];

	_myId = _myId + 1;
} forEach _objects;


