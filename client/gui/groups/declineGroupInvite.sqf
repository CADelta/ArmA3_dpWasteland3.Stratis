//	@file Name: declineGroupInvite.sqf
//	@file Author: [404] Deadbeat

//Get the inviters UID
{
	if(getPlayerUID player == _x select 1) then
	{
        currentInvites set [_forEachIndex,"REMOVETHISCRAP"];
        currentInvites = currentInvites - ["REMOVETHISCRAP"];
        publicVariableServer "currentInvites";
	};
}forEach currentInvites;

player globalChat format["you have declined the invite"];