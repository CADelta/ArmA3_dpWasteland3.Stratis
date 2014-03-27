//	@file Name: playerSpawn.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

diag_log format["*** playerSpawn Started ***"];

//******************************************
private ["_side"];

playerUID = getPlayerUID(player);

//Check Teamkiller
doKickTeamKiller = false;
{
	if(_x select 0 == playerUID) then {

		if((_x select 1) >= 2) then {
			if(playerSide in [west, east]) then {
				doKickTeamKiller = true;
			};
		};
	};
} forEach pvar_teamKillList;

//Check Teamswitcher
doKickTeamSwitcher = false;
{
	if(_x select 0 == playerUID) then
    {
        if(playerSide != (_x select 1) && str(playerSide) != "GUER") then{
        	doKickTeamSwitcher = true;
			_side = str(_x select 1);
        };
	};
} forEach pvar_teamSwitchList;

//Kick to lobby for appropriate reason
//Teamkiller Kick
if(doKickTeamKiller) exitWith
{
	titleText ["", "BLACK IN", 0];
	titleText [localize "STR_WL_Loading_Teamkiller", "black"]; titleFadeOut 9999;
	[] spawn {sleep 20; endMission "LOSER";};
};

//Teamswitcher Kick
if(doKickTeamSwitcher) exitWith
{
	titleText ["", "BLACK IN", 0];
	titleText [format[localize "STR_WL_Loading_Teamswitched", localize format ["STR_WL_Gen_Team%1_2", _side]], "black"]; titleFadeOut 9999;
	[] spawn {sleep 20; endMission "LOSER";};
};
//******************************************

titleText ["", "BLACK OUT", 0.0001];
true call client_respawnDialog;
titleText ["", "BLACK IN", 0.0001];

diag_log format["*** playerSpawn Finished ***"];