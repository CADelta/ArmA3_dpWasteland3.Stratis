/*
Created by =BTC= Giallustio
version 0.97 Offical release
Visit us at:
http://www.blacktemplars.altervista.org/
06/03/2012

BTC Revive "Lite"
Modified for dp Wasteland 3 by CADelta
Current Build: 302
Visit us at:
http://dp-clan.enjin.com/

Credit goes to: =BTC= Giallustio for an awesome revive addon. TY! :)
*/

////////////////// EDITABLE \\\\\\\\\\\\\\\\\\\\\\\\\\
BTC_revive_time_min = 15;
BTC_revive_time_max = 300;
CAD_noMedicNear_timer = 30;
BTC_who_can_revive  = ["CAManBase"];
BTC_respawn_gear    = 1;
BTC_need_first_aid  = 1;
BTC_injured_marker  = 1;
BTC_3d_can_see      = ["CAManBase"];
BTC_3d_distance     = 30;
BTC_3d_icon_size    = 0.5;
BTC_3d_icon_color   = [1,0,0,1];
////////////////// Don't edit below \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if (!isDedicated) then {};

//CALL COMPILE FNCs
call compile preprocessFileLineNumbers "addons\=BTC=_revive_lite\=BTC=_revive_lite_functions.sqf";

if (isServer) then
{
	BTC_killed_pveh = [];publicVariable "BTC_killed_pveh";
	BTC_marker_pveh = [];publicVariable "BTC_marker_pveh";
};

if (isDedicated) exitWith {};

BTC_respawn_cond = false;

//Init
[] spawn {
	waitUntil {!isNull player};
	waitUntil {player == player};

	"BTC_marker_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;
	"BTC_killed_pveh" addPublicVariableEventHandler BTC_fnc_PVEH;

	player addRating 99999;
	BTC_side = playerSide;
	BTC_respawn_marker = format ["respawn_%1", playerSide];
	if (BTC_respawn_marker == "respawn_guer") then {BTC_respawn_marker = "respawn_guerrila";};
	if (BTC_respawn_marker == "respawn_civ") then {BTC_respawn_marker = "respawn_civilian";};
	BTC_r_base_spawn = "Land_HelipadEmpty_F" createVehicleLocal getMarkerPos BTC_respawn_marker;

	player addEventHandler ["Killed", BTC_player_killed];

	player setVariable ["BTC_need_revive",0,true];
	player setVariable ["BTC_revive_side", str (BTC_side), true];

	if ([player] call BTC_is_class_can_revive) then {
		player addAction [("<t color=""#ED2744"">") + ("Revive") + "</t>","addons\=BTC=_revive_lite\=BTC=_revive_lite_addAction.sqf",[[],BTC_first_aid], 8, true, true, "", "[] call BTC_check_action_first_aid"];
	};

	if (({player isKindOf _x} count BTC_3d_can_see) > 0) then {
		_3d = [] spawn BTC_3d_markers_pvp;
	};
};