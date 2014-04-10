/*
Created by =BTC= Giallustio
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

//Functions
BTC_assign_actions =
{
	if ([player] call BTC_is_class_can_revive) then {
		player addAction [("<t color=""#ED2744"">") + ("Revive") + "</t>","addons\=BTC=_revive_lite\=BTC=_revive_lite_addAction.sqf",[[],BTC_first_aid], 8, true, true, "", "[] call BTC_check_action_first_aid"];
	};
};

BTC_get_gear =
{
	private ["_unit",/*"_gear",*/"_weapons","_prim_weap","_prim_items","_sec_weap","_sec_items","_items_assigned","_handgun","_handgun_items","_headgear","_uniform","_uniform_items","_vest","_vest_items","_back_pack","_back_pack_items","_back_pack_weap","_magazinesAmmoFull","_mag_uniform","_mag_vest","_mag_back","_mag_loaded_prim","_mag_loaded_sec","_mag_loaded_at","_ammo"];

	_unit = _this select 0;
	_gear = [];
	_weapons = [];
	_prim_items = primaryWeaponItems _unit;
	_sec_weap = secondaryWeapon _unit;
	_sec_items = secondaryWeaponItems _unit;
	_items_assigned = assignedItems _unit;
	_handgun = handgunWeapon _unit;
	_handgun_items = handgunItems _unit;

	if (_sec_weap != "") then {_weapons = _weapons + [_sec_weap]};
	if (_handgun != "") then {_weapons = _weapons + [_handgun]};

	_headgear = headgear _unit;
	_uniform = uniform _unit;
	_uniform_items = uniformItems _unit;
	_vest = vest _unit;
	_vest_items = vestItems _unit;
	_back_pack = backpack _unit;
	_back_pack_items = backpackItems _unit;
	_back_pack_weap = getWeaponCargo (unitBackpack _unit);

	_magazinesAmmoFull = magazinesAmmoFull _unit;
	_mag_uniform = [];
	_mag_vest = [];
	_mag_back = [];
	_mag_loaded_prim = [];
	_mag_loaded_sec = [];
	_mag_loaded_at = [];
	{
		if !(_x select 2) then
		{
			switch (true) do
			{
				case ((_x select 4) == "Vest" && ((_x select 3) != 0) && (getNumber(configFile >> "CfgMagazines" >> (_x select 0) >> "count") > 1))     : {_mag_vest = _mag_vest + [[(_x select 0),(_x select 1)]]};
				case ((_x select 4) == "Uniform" && ((_x select 3) != 0) && (getNumber(configFile >> "CfgMagazines" >> (_x select 0) >> "count") > 1))  : {_mag_uniform = _mag_uniform + [[(_x select 0),(_x select 1)]]};
				case ((_x select 4) == "Backpack" && ((_x select 3) != 0) && (getNumber(configFile >> "CfgMagazines" >> (_x select 0) >> "count") > 1)) : {_mag_back = _mag_back + [[(_x select 0),(_x select 1)]]};
			};
		}
		else
		{
			switch (true) do
			{
				case ((_x select 3) == 1) : {_mag_loaded_prim = [(_x select 0),(_x select 1)]};
				case ((_x select 3) == 2) : {_mag_loaded_sec = [(_x select 0),(_x select 1)]};
				case ((_x select 3) == 4) : {_mag_loaded_at = [(_x select 0),(_x select 1)]};
			};
		};
	} forEach _magazinesAmmoFull;		// After reading this it all made sense, hehe :) - https://community.bistudio.com/wiki/magazinesAmmoFull

	_ammo = [_mag_loaded_prim,_mag_loaded_sec,_mag_loaded_at,_mag_uniform,_mag_vest,_mag_back];
	_gear = [
		_uniform,			// 0	(0)
		_vest,				// 1	(1)
		_headgear,			// 2	(3)
		_back_pack,			// 3	(4)
		_back_pack_items,	// 4	(5)
		_back_pack_weap,	// 5	(6)
		_weapons,			// 6	(7)
		_prim_items,		// 7	(8)
		_sec_items,			// 8	(9)
		_handgun_items,		// 9	(10)
		_items_assigned,	// 10	(11)
		_uniform_items,		// 11	(12)
		_vest_items,		// 12	(13)
		_ammo];				// 13	(16)
	_gear
};

BTC_set_gear =
{
	private ["_unit","_gear","_ammo"];

	_unit = _this select 0;		// Player
	_gear = _this select 1;		// BTC_gear
	removeAllWeapons _unit;
	removeUniform _unit;
	removeVest _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	removeBackpack _unit;
	_unit unassignItem "NVGoggles";
	_unit removeItem "NVGoggles";

	if ((_gear select 0) != "") then {_unit addUniform (_gear select 0);};
	if ((_gear select 1) != "") then {_unit addVest (_gear select 1);};
	_unit addBackpack "B_AssaultPack_blk";
	if (count (_gear select 10) > 0) then {{if (_x != "" && _x != "Binocular" && _x != "Rangefinder" && _x != "Laserdesignator") then {_unit addItem _x;_unit assignItem _x;} else {_unit addWeapon _x;};} forEach (_gear select 10);};

	_ammo = _gear select 13;
	if (count (_ammo select 0) > 0) then {_unit addMagazine (_ammo select 0)};
	if (count (_ammo select 1) > 0) then {_unit addMagazine (_ammo select 1)};
	if (count (_ammo select 2) > 0) then {_unit addMagazine (_ammo select 2)};

	{if (isClass (configFile >> "cfgWeapons" >> _x)) then {_unit addweapon _x;};} forEach (_gear select 6);

	removeBackpack _unit;
	if ((_gear select 3) != "") then {_unit addBackPack (_gear select 3); clearAllItemsFromBackpack _unit;};

	{_unit addMagazine _x;} forEach (_ammo select 3);
	{if (!(isClass (configFile >> "CfgMagazines" >> _x))) then {_unit addItem _x;} else {if (getNumber(configFile >> "CfgMagazines" >> _x >> "count") < 2) then {_unit addMagazine _x;};};} forEach (_gear select 11);

	{_unit addMagazine _x;} forEach (_ammo select 4);
	{if (!(isClass (configFile >> "CfgMagazines" >> _x))) then {_unit addItem _x;} else {if (getNumber(configFile >> "CfgMagazines" >> _x >> "count") < 2) then {_unit addMagazine _x;};};} forEach (_gear select 12);

	{_unit addMagazine _x;} forEach (_ammo select 5);

	{if (!(isClass (configFile >> "CfgMagazines" >> _x))) then {_unit addItem _x;} else {if (getNumber(configFile >> "CfgMagazines" >> _x >> "count") < 2) then {_unit addMagazine _x;};};} forEach (_gear select 4);

	if ((_gear select 2) != "") then {_unit addHeadgear (_gear select 2);};

	if (count ((_gear select 5) select 0) > 0) then
	{
		for "_i" from 0 to (count ((_gear select 5) select 0) - 1) do
		{
			(unitBackpack _unit) addWeaponCargo [((_gear select 5) select 0) select _i,((_gear select 5) select 1) select _i];
		};
	};

	//if (count (_gear select 7) > 0) then {{if (_x != "") then {_unit addPrimaryWeaponItem _x;};} forEach (_gear select 7);};
	if (count (_gear select 8) > 0) then {{if (_x != "") then {_unit addSecondaryWeaponItem _x;};} forEach (_gear select 8);};
	if (count (_gear select 9) > 0) then {{if (_x != "") then {_unit addHandgunItem _x;};} forEach (_gear select 9);};
};

BTC_fnc_PVEH =
{
	_array = _this select 1;
	_type = _array select 0;
	switch (true) do
	{
		case (_type == 0) :
		{
			_side = _array select 1;
			_unit = _array select 3;
			if (_side == BTC_side) then
			{
				_pos = _array select 2;
				_marker = createmarkerLocal [format ["FA_%1", _pos], _pos];
				format ["FA_%1", _pos] setmarkertypelocal "mil_box";
				format ["FA_%1", _pos] setMarkerTextLocal format ["F.A. %1", name _unit];
				format ["FA_%1", _pos] setmarkerColorlocal "ColorGreen";
				format ["FA_%1", _pos] setMarkerSizeLocal [0.3, 0.3];
				[_pos,_unit] spawn
				{
					_pos  = _this select 0;
					_unit = _this select 1;
					while {(!(isNull _unit) && (format ["%1", _unit getVariable "BTC_need_revive"] == "1"))} do
					{
						format ["FA_%1", _pos] setMarkerPosLocal getpos _unit;
						sleep 1;
					};
					deleteMarker format ["FA_%1", _pos];
				};
			};
		};

		case (_type == 1) :
		{
			(_array select 1) setDir 180;
			(_array select 1) playMoveNow "AinjPpneMstpSnonWrflDb_grab";
		};

		case (_type == 2) :
		{
			private ["_injured"];
			_injured = (_array select 1);
			[_injured] spawn
			{
				_injured = _this select 0;
				_injured allowDamage false;
				WaitUntil {sleep 1; (isNull _injured) || (format ["%1", _injured getVariable "BTC_need_revive"] == "0")};
				_injured allowDamage true;
			};
		};

		case (_type == 3) :
		{
			private ["_injured","_veh"];
			_injured = (_array select 1);
			_veh     = (_array select 2);
			if (name _injured == name player) then {_injured moveInCargo _veh};
		};

		case (_type == 4) :
		{
			private ["_array_injured"];
			_array_injured = (_array select 1);
			{
				if (name player == name _x) then {unAssignVehicle player;player action ["eject", vehicle player];_spawn = [] spawn {sleep 0.5;player switchMove "ainjppnemstpsnonwrfldnon";};};
			} forEach _array_injured;
		};

		case (_type == 5) :
		{
			private ["_array_injured"];
			_spawn = [(_array select 1),(_array select 2)] spawn
			{
				_injured = _this select 0;
				_healer  = _this select 1;
				_injured setPos (_healer modelToWorld [0,1,0]);
				_injured setDir (getDir _healer + 180);
				_injured switchMove "AinjPfalMstpSnonWnonDnon_carried_up";
				WaitUntil {!Alive _healer || ((animationstate _healer == "acinpercmstpsraswrfldnon") || (animationstate _healer == "acinpercmrunsraswrfldf") || (animationstate _healer == "acinpercmrunsraswrfldr") || (animationstate _healer == "acinpercmrunsraswrfldl"))};
				_injured switchMove "AinjPfalMstpSnonWnonDf_carried_dead";
				sleep 0.2;
				_injured setDir 180;
			};
		};

		case (_type == 6) :
		{
			private ["_array_injured"];
			_spawn = [(_array select 1)] spawn
			{
				(_this select 0) switchMove "AinjPfalMstpSnonWrflDnon_carried_down";
				sleep 3;
				if (format ["%1",(_this select 0) getVariable "BTC_need_revive"] == "1") then {(_this select 0) switchMove "ainjppnemstpsnonwrfldnon";};
			};
		};

		case (_type == 7) :
		{
			private ["_injured","_cpr_bonus"];
			_injured = _array select 1;
			_cpr_bonus = _array select 2;
			if (name player == _injured) then {BTC_r_timeout = BTC_r_timeout + _cpr_bonus;};
		};

		case (_type == 8) :
		{
			private ["_injured"];
			_injured = _array select 1;
			if (name player == _injured) then
			{
				private ["_state","_bleed"];
				_state = (_injured getVariable "BTC_r_status");
				_bleed = (_state select 0) - 70;
				if (_bleed < 0) then {_bleed = 0;};
				_injured setVariable ["BTC_r_status",[0,_bleed,(_state select 2),(_state select 3),(_state select 4)],true];
			};
		};

		case (_type == 9) :
		{
			private ["_injured"];
			_injured = _array select 1;
			if (name player == _injured) then
			{
				private ["_state","_bleed"];
				BTC_r_damage = 0;BTC_r_head = 0;BTC_r_damage_legs = 0;BTC_r_damage_hands = 0;player forceWalk false;BTC_r_med_effect = false;player setHit ["legs", 0];player setHit ["hands", 0];
			};
		};

		case (_type == 10) :
		{
			private ["_injured"];
			_unit = _array select 1;
			_anim = _array select 2;
			_unit switchMove _anim;
		};
	};
};

BTC_first_aid =
{
	private ["_injured","_array_item_injured","_array_item","_cond"];
	_men = nearestObjects [player, ["Man"], 2];
	if (count _men > 1) then {_injured = _men select 1;};
	if (format ["%1",_injured getVariable "BTC_need_revive"] != "1") exitWith {};
	_array_item = items player;
	_array_item_injured = items _injured;
	_cond = false;
	if (BTC_need_first_aid == 0) then {_cond = true;};
	if ((_array_item_injured find "FirstAidKit" == -1) && (BTC_need_first_aid == 1)) then {_cond = false;} else {_cond = true;};
	if (!_cond && BTC_need_first_aid == 1) then {if ((_array_item find "FirstAidKit" == -1)) then {_cond = false;} else {_cond = true;};};
	if (!_cond) exitWith {hint "Can't revive him";};
	if (BTC_need_first_aid == 1) then {if (_array_item_injured find "FirstAidKit" == -1) then {player removeItem "FirstAidKit";};};
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	waitUntil {!Alive player || (animationState player != "AinvPknlMstpSlayWrflDnon_medic" && animationState player != "amovpercmstpsraswrfldnon_amovpknlmstpsraswrfldnon" && animationState player != "amovpknlmstpsraswrfldnon_ainvpknlmstpslaywrfldnon" && animationState player != "ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon")};
	if (Alive player && Alive _injured && format ["%1",player getVariable "BTC_need_revive"] == "0") then
	{
		_injured setVariable ["BTC_need_revive",0,true];
		_injured playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
	};
};

BTC_player_killed =
{
	private ["_type_backpack","_weapons","_magazines","_weapon_backpack","_ammo_backpack","_score","_score_array","_name","_body_marker","_ui","_saveGear"];

	titleText ["Death is not the end!", "BLACK OUT", 2];
	_body = _this select 0;
	[_body] spawn
	{
		_body = _this select 0;
		_dir = getDir _body;
		_pos = getPosATL vehicle _body;

		WaitUntil {Alive player};

		[[_body, [0,0,0]], "CAD_fnc_moveBody", true] spawn BIS_fnc_MP;	// Moves the players corpse out of the way.
		_saveGear = [_body] call BTC_get_gear;		// Save Gear!
		[player, _saveGear] spawn BTC_set_gear;		// Load Gear!

		detach player;
		/*_body_marker = player;*/
		player setCaptive true;
		BTC_killed_pveh = [2, player];		// was _body_marker
		publicVariable "BTC_killed_pveh";
		player allowDamage false;
		player setVariable ["BTC_need_revive",1,true];

		player playMoveNow "AinjPpneMstpSnonWrflDnon";
		player switchMove "AinjPpneMstpSnonWrflDnon";

		_actions = [] spawn BTC_assign_actions;
		_body setVariable ["lootable", 1, true];						// Make Lootable (player menu items)!

		WaitUntil {animationstate player == "ainjppnemstpsnonwrfldnon"};

		player setDir _dir;
		player setVelocity [0,0,0];
		player setPosATL _pos;

		_side = playerSide;
		_injured = player;

		if (BTC_injured_marker == 1) then
		{
			BTC_marker_pveh = [0, BTC_side, _pos, player];		// was _body_marker
			publicVariable "BTC_marker_pveh";
		};

		disableUserInput true;
		titleText ["", "BLACK IN"];
		disableUserInput false;

		_time = time;
		_timeout = _time + BTC_revive_time_max;
		_counter = 0;

		BTC_respawn_cond = false;

		disableSerialization;
		_dlg = createDialog "BTC_respawn_button_dialog";	// Simply creates the spawn button.

		BTC_display_EH = (findDisplay 46) displayAddEventHandler ["KeyDown", "_anim = [] spawn {sleep 1;player switchMove ""AinjPpneMstpSnonWrflDnon"";};"];

		while {format ["%1", player getVariable "BTC_need_revive"] == "1" && time < _timeout && !BTC_respawn_cond} do
		{
			_healer = call BTC_check_healer;
			hintSilent format ["%1\n%2", round (_timeout - time),_healer];
			if (_healer == "No medics nearby.") Then
			{
				_counter = _counter + 0.0018;					// Counts while no medics are nearby. Count stops when they are!
				if (_counter >= CAD_noMedicNear_timer) Then		// Loop cycle is = ~1.8 ms under "normal" condidtions, so 30 here makes 30 seconds. It can vary some though.
				{
					BTC_respawn_cond = true;
					closeDialog 0;
					_respawn = [] spawn BTC_player_respawn;		// Force Respawn - No Medics Nearby.
				};
			};
		};

		(findDisplay 46) displayRemoveEventHandler ["KeyDown",BTC_display_EH];
		closedialog 0;

		if (time > _timeout && format ["%1", player getVariable "BTC_need_revive"] == "1") then
		{
			_respawn = [] spawn BTC_player_respawn;				// Force Respawn - Timeout Reached.
		};

		if (format ["%1", player getVariable "BTC_need_revive"] == "0" && !BTC_respawn_cond) then 		// Player is getting revived.
		{
			hintSilent "";

			if (BTC_need_first_aid == 1 && ((items player) find "FirstAidKit" != -1)) then
			{
				player removeItem "FirstAidKit";
			};
			player playMove "amovppnemstpsraswrfldnon";
			player playMove "";
		};

		player setCaptive false;
		player allowDamage true;
		hintSilent "";

		if (time > _timeout || BTC_respawn_cond) then
		{
			[[_body, _pos], "CAD_fnc_moveBody", true] spawn BIS_fnc_MP;		// Unhides the hidden body
		}
		else		// IF PLAYER WAS REVIVED: It completly removes the corpse and recreates the menu items, which was removed onPlayerKilled.
		{
			[_body] call CAD_get_playerItems;
			deletevehicle _body;
			BTC_respawn_cond = false;
			player setskill 0;
			player addrating 99999;
			player enableFatigue false;
			[] spawn createMenuActions;		// Creates Custom Action Menu.
			[] spawn
			{
				sleep 2;
				if(!isNull pvar_PlayerTeamKiller) then
				{
					pDialogTeamkiller = pvar_PlayerTeamKiller;
					pvar_PlayerTeamKiller = objNull;
					if (allowPlayerIcons == "ON") then
					{
						[] execVM "client\functions\createTeamKillDialog.sqf";
					};
				};
			};
		};
	};
};

BTC_check_healer =
{
	_pos = getpos player;
	_men = [];_veh = [];_dist = 501;_healer = objNull;_healers = [];
	_msg = "No medics nearby.";
	_men = nearestObjects [_pos, BTC_who_can_revive, 500];
	_veh = nearestObjects [_pos, ["LandVehicle", "Air", "Ship"], 500];
	{
		{private ["_man"];_man = _x;if (isPlayer _man && ({_man isKindOf _x} count BTC_who_can_revive) > 0) then {_men = _men + [_man];};} forEach crew _x;
	} forEach _veh;
	if (count _men > 0) then
	{
		{if (Alive _x && format ["%1",_x getVariable "BTC_need_revive"] != "1" && ([_x,player] call BTC_can_revive) && isPlayer _x && side _x == BTC_side) then {_healers = _healers + [_x];};} forEach _men;
		if (count _healers > 0) then
		{
			{
				if (_x distance _pos < _dist) then {_healer = _x;_dist = _x distance _pos;};
			} forEach _healers;
			if !(isNull _healer) then {_msg = format ["%1 could heal you! He is %2 m away!", name _healer,round(_healer distance _pos)];};
		};
	};
	_msg
};

BTC_player_respawn =
{
	titleText ["", "WHITE OUT", 0.001];
	BTC_respawn_cond = true;

	deTach player;
	player setVariable ["BTC_need_revive",0,true];
	closeDialog 0;
	/*titleText ["", "BLACK OUT"];*/
	/*sleep 0.2;*/
	/*titleText ["", "BLACK FADED"];*/

	if (vehicle player != player) then
	{
		unAssignVehicle player;
		player action ["eject", vehicle player];
	};

	player setPos getMarkerPos BTC_respawn_marker;
	sleep 1;
	closeDialog 0;
	player setDamage 0;
	player switchMove "amovpercmstpslowwrfldnon";
	player switchMove "";

	player setVariable ["BTC_need_revive",0,true];
	closeDialog 0;
	sleep 0.1;

	titleText ["You were born to respawn...", "WHITE OUT", 0.001];
	sleep 1;
	// remove everything
	{
		player removeWeapon _x;
	} forEach weapons player;
	player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
	sleep 1;
	// Player setup
	[] call PlayerSetup;				// initialise players gear
	[] spawn createMenuActions;			// add player menu items
	[] spawn
	{
		sleep 2;
		//waitUntil{!respawnDialogActive};
		if(!isNull pvar_PlayerTeamKiller) then
		{
			pDialogTeamkiller = pvar_PlayerTeamKiller;
			pvar_PlayerTeamKiller = objNull;
			if (allowPlayerIcons == "ON") then
			{
				[] execVM "client\functions\createTeamKillDialog.sqf";
			};
		};
	};
	BTC_respawn_cond = false;
	titleText ["", "WHITE IN", 2.5];
};

BTC_check_action_first_aid =
{
	private ["_injured","_array_item_injured"];

	_cond = false;
	_array_item = items player;
	_men = nearestObjects [vehicle player, ["Man"], 2];

	if (count _men > 1 && format ["%1", player getVariable "BTC_need_revive"] == "0") then {
		if (format ["%1", (_men select 1) getVariable "BTC_need_revive"] == "1") then {_cond = true;};
		_injured = _men select 1;
	};

	if (_cond) then {
		if ((_men select 1) getVariable "BTC_revive_side" == str (BTC_side)) then {_cond = true;} else {_cond = false;};
	};

	if (_cond && BTC_need_first_aid == 1) then {
		if (_array_item find "FirstAidKit" == -1) then {_cond = false;};
		_array_item_injured = items _injured;
		if (!_cond && _array_item_injured find "FirstAidKit" != -1) then {_cond = true;};
	};
	_cond
};

BTC_is_class_can_revive =
{
	_unit    = _this select 0;
	_cond = false;
	{if (_unit isKindOf _x) then {_cond = true};} forEach BTC_who_can_revive;
	_cond
};

BTC_can_revive =
{
	_unit = _this select 0;
	_injured = _this select 1;
	_array_item_unit = items _unit;
	_array_item_injured = items _injured;
	_cond = false;
	{if (_unit isKindOf _x) then {_cond = true};} forEach BTC_who_can_revive;
	if (_cond && BTC_need_first_aid == 1) then
	{
		if (_array_item_unit find "FirstAidKit" == -1) then {_cond = false;};
		if (!_cond && _array_item_injured find "FirstAidKit" != -1) then {_cond = true;};
	};
	_cond
};

BTC_3d_markers_pvp =
{
	_3d = addMissionEventHandler ["Draw3D",
	{
		{
			if (((_x distance player) < BTC_3d_distance) && (_x getVariable "BTC_revive_side" == str (BTC_side)) && (format ["%1", _x getVariable "BTC_need_revive"] == "1")) then
			{
				drawIcon3D["a3\ui_f\data\map\MapControl\hospital_ca.paa",BTC_3d_icon_color,_x,BTC_3d_icon_size,BTC_3d_icon_size,0,format["%1 (%2m)", name _x, ceil (player distance _x)],0,0.02];
			};
		} forEach playableUnits;
	}];
};

CAD_fnc_moveBody =	// Function to move the body straight after getting killed.
{
    private["_body","_pos"];

    _body = _this select 0;
    _pos = _this select 1;

    _body setPosATL _pos;
};

CAD_get_playerItems =
{
	private ["_body"];

	_body = _this select 0;

	player setVariable ["canfood",		_body getVariable ["canfood",	   0], true];
	player setVariable ["water",		_body getVariable ["water",	   0], true];
	player setVariable ["repairkits",	_body getVariable ["repairkits", 0], true];
	player setVariable ["medkits",		_body getVariable ["medkits",	   0], true];
	player setVariable ["cmoney",		_body getVariable ["cmoney",	   0], true];
	player setVariable ["fuelFull",		_body getVariable ["fuelFull",   0], true];
	player setVariable ["fuelEmpty",	_body getVariable ["fuelEmpty",  0], true];
}