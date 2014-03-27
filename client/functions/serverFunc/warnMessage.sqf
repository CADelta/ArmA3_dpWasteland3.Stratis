//  @file Name: warnMessage.sqf
//  @file Author: [CAD] Krycek

if (isServer) exitWith {};

private ["_warnText","_playerName","_adminName","_message"];
_warnText = _this select 0;
_playerName = _this select 1;
//_adminName = _this select 2;

if (name player == _playerName) then
{
	_message = format ["Admin: %1", _warnText];		// I want to hide who the calling Admin is. Here is the original: _message = format ["Admin %2: %1", _warnText, _adminName]; <- Displays the admins name to the player being warned. This makes it impossible to hide your identity as Admin. Which could be good since, I at least, log in with a different player name so I don't spoke any potential Hackers.
	titleText [_message, "plain", 10];
	titleFadeOut 5;
};