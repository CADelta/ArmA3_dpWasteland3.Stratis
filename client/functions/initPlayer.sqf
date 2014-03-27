//  @file Name: initPlayer.sqf
//  @file Author: [CAD] Krycek

diag_log format["*** initialisePlayer Started ***"];

// Create the blackout
titleText ["Welcome to dp Wasteland, please wait for your player to setup", "BLACK", 0];
sleep 1;

// Remove player from Group
if(count units group player > 1) then
{
	[player] joinSilent grpNull;
};

// Stop people being civ's and spawning with a primary weapon.
if(!(playerSide in [west, east, resistance]) && (primaryWeapon player != "")) then
{
	endMission "LOSER";
};

player allowDamage true;

diag_log format["*** initialisePlayer Finished ***"];