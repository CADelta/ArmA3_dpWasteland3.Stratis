//  @file Name: resetPlayerTeam.sqf

if (isServer) exitWith {};

private ["_playerName"];
_playerName = _this select 0;

if (name player == _playerName) then
{
	client_firstSpawn = nil;
};