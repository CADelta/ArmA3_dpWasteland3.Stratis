//	@file Name: updateTeamKiller.sqf
//	@file Author: [404] Deadbeat

if (str(playerSide) in ["WEST", "EAST"]) then
{
	{
		if(_x select 0 == playerUID) then
		{
			if((_x select 1) >= 2) then
			{
				titleText ["", "BLACK IN", 0];
				titleText [localize "STR_WL_Loading_Teamkiller", "black"]; titleFadeOut 9999;
                removeAllWeapons player;
				[] spawn {sleep 20; endMission "LOSER";};
			};
		};
	} forEach pvar_teamKillList;
};