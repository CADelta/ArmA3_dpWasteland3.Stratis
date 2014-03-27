//  @file Name: slayPlayer.sqf

if (isServer) exitWith {};

private ["_playerName"];
_playerName = _this select 0;

if (name player == _playerName) then
{
	player setdamage 1;
	Endmission "END1";
	failMission "END1";
	forceEnd;
	deletevehicle player;
};