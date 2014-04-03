/*
Created by =BTC= Giallustio
Visit us at:
http://www.blacktemplars.altervista.org/
06/03/2012

BTC Revive "Lite"
Modified for dp Wasteland by [CAD] Krycek
Visit us at:
http://dp-clan.enjin.com/

Credit goes to: =BTC= Giallustio for an awesome revive addon. TY! :)
*/

//Functions
BTC_assign_actions =
{
	if ([player] call BTC_is_class_can_revive) then {player addAction [("<t color=""#ED2744"">") + ("Revive") + "</t>","addons\=BTC=_revive_lite\=BTC=_revive_lite_addAction.sqf",[[],BTC_first_aid], 8, true, true, "", "[] call BTC_check_action_first_aid"];};

	player addAction [("<t color=""#ED2744"">") + ("Drag") + "</t>","addons\=BTC=_revive_lite\=BTC=_revive_lite_addAction.sqf",[[],BTC_drag], 8, true, true, "", "[] call BTC_check_action_drag"];
	player addAction [("<t color=""#ED2744"">") + ("Pull out injured") + "</t>","addons\=BTC=_revive_lite\=BTC=_revive_lite_addAction.sqf",[[],BTC_pull_out], 8, true, true, "", "[] call BTC_pull_out_check"];
};

BTC_get_gear =
{
	private ["_array_mag","_id","_display_name","_count","_array_class","_array_bullet","_array_class_x","_array_bullet_x","_r_mag_d","_h_mag_d","_brack"];
	_unit = _this select 0;
	_gear = [];
	_weapons = [];
	_prim_weap = primaryWeapon _unit;
	_prim_items = primaryWeaponItems _unit;
	_sec_weap = secondaryWeapon _unit;
	_sec_items = secondaryWeaponItems _unit;
	_items_assigned = assignedItems _unit;
	_handgun = handgunWeapon _unit;
	_handgun_items = handgunItems _unit;
	if (_prim_weap != "") then {_weapons = _weapons + [_prim_weap]};
	if (_sec_weap != "") then {_weapons = _weapons + [_sec_weap]};
	if (_handgun != "") then {_weapons = _weapons + [_handgun]};
	_goggles = goggles _unit;
	_headgear = headgear _unit;
	_uniform = uniform _unit;
	_uniform_items = uniformItems _unit;
	_vest = vest _unit;
	_vest_items = vestItems _unit;
	_back_pack = backpack _unit;
	_back_pack_items = backpackItems _unit;
	_back_pack_weap = getWeaponCargo (unitBackpack _unit);
	_weap_sel = currentWeapon _unit;
	_weap_mode = currentWeaponMode _unit;
	_fire_mode_array = getArray (configFile >> "cfgWeapons" >> _weap_sel >> "modes");
	_fire_mode = _fire_mode_array find _weap_mode;

	_magazinesAmmoFull = magazinesAmmoFull _unit;
	_mag_uniform = [];_mag_vest = [];_mag_back = [];_mag_loaded_prim = [];_mag_loaded_sec = [];_mag_loaded_at = [];
	{
		if !(_x select 2) then
		{
			switch (true) do
			{
				case ((_x select 4) == "Vest" && ((_x select 3) != 0) && (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 1))     : {_mag_vest = _mag_vest + [[(_x select 0),(_x select 1)]]};
				case ((_x select 4) == "Uniform" && ((_x select 3) != 0) && (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 1))  : {_mag_uniform = _mag_uniform + [[(_x select 0),(_x select 1)]]};
				case ((_x select 4) == "Backpack" && ((_x select 3) != 0) && (getNumber(configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 1)) : {_mag_back = _mag_back + [[(_x select 0),(_x select 1)]]};
			};
		}
		else
		{
			switch (true) do
			{
				case ((_x select 3) == 1)  : {_mag_loaded_prim = [(_x select 0),(_x select 1)]};
				case ((_x select 3) == 2)  : {_mag_loaded_sec = [(_x select 0),(_x select 1)]};
				case ((_x select 3) == 4) : {_mag_loaded_at = [(_x select 0),(_x select 1)]};
			};
		};
	} forEach _magazinesAmmoFull;
	_ammo = [_mag_loaded_prim,_mag_loaded_sec,_mag_loaded_at,_mag_uniform,_mag_vest,_mag_back];
	_gear =
	[
		_uniform,
		_vest,
		_goggles,
		_headgear,
		_back_pack,
		_back_pack_items,
		_back_pack_weap,
		_weapons,
		_prim_items,
		_sec_items,
		_handgun_items,
		_items_assigned,
		_uniform_items,
		_vest_items,
		_weap_sel,
		_fire_mode,
		_ammo
	];
	//diag_log text format ["------------------------------------------",""];
	//{diag_log text format ["%1",_x]} forEach _gear;
	//diag_log text format ["------------------------------------------",""];
	_gear
};

BTC_set_gear =
{
	/*_gear =
	[
		_uniform,0
		_vest,1
		_goggles,2
		_headgear,3
		_back_pack,4
		_back_pack_items,5
		_back_pack_weap,6
		_weapons,7
		_prim_items,8
		_sec_items,9
		_handgun_items,10
		_items_assigned,11
		_uniform_items,12
		_vest_items,13
		_weap_sel,14
		_fire_mode,15
		_ammo,16
	];*/
	_unit = _this select 0;
	_gear = _this select 1;
	//_id = 0;
	//{diag_log text format ["Gear (ID: %1) = %2",_id,_x];_id = _id + 1;} forEach _gear;
	removeAllWeapons _unit;
	removeUniform _unit;
	removeVest _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	removeBackpack _unit;
	{_unit removeItem _x} forEach (items _unit);
	{_unit unassignItem _x;_unit removeItem _x} forEach (assignedItems _unit);
	////////////////////////
	if ((_gear select 0) != "") then {_unit addUniform (_gear select 0);};
	if ((_gear select 1) != "") then {_unit addVest (_gear select 1);};
	_unit addBackpack "B_AssaultPack_blk";
	if (count (_gear select 11) > 0) then {{if (_x != "" && _x != "Binocular" && _x != "Rangefinder" && _x != "Laserdesignator") then {_unit addItem _x;_unit assignItem _x;} else {_unit addWeapon _x;};} forEach (_gear select 11);};

	_ammo = _gear select 16;
	if (count (_ammo select 0) > 0) then {_unit addMagazine (_ammo select 0)};
	if (count (_ammo select 1) > 0) then {_unit addMagazine (_ammo select 1)};
	if (count (_ammo select 2) > 0) then {_unit addMagazine (_ammo select 2)};

	{if (isClass (configFile >> "cfgWeapons" >> _x)) then {_unit addweapon _x;};} forEach (_gear select 7);

	removeBackpack _unit;
	if ((_gear select 4) != "") then {_unit addBackPack (_gear select 4);clearAllItemsFromBackpack _unit;};

	//mags
	_u_cont = (uniformContainer _unit);
	_v_cont = (vestContainer _unit);

	{_unit addMagazine _x;} forEach (_ammo select 3);
	{if (!(isClass (configFile >> "cfgMagazines" >> _x))) then {_unit addItem _x;} else {if (getNumber(configFile >> "cfgMagazines" >> _x >> "count") < 2) then {_unit addMagazine _x;};};} forEach (_gear select 12);

	if (!isNull _u_cont) then {_u_cont addItemCargo ["itemWatch",25];};

	{_unit addMagazine _x;} forEach (_ammo select 4);
	{if (!(isClass (configFile >> "cfgMagazines" >> _x))) then {_unit addItem _x;} else {if (getNumber(configFile >> "cfgMagazines" >> _x >> "count") < 2) then {_unit addMagazine _x;};};} forEach (_gear select 13);

	if (!isNull _v_cont) then {_v_cont addItemCargo ["itemWatch",80];};

	{_unit addMagazine _x;} forEach (_ammo select 5);

	{if (!(isClass (configFile >> "cfgMagazines" >> _x))) then {_unit addItem _x;} else {if (getNumber(configFile >> "cfgMagazines" >> _x >> "count") < 2) then {_unit addMagazine _x;};};} forEach (_gear select 5);

	if (!isNull _u_cont) then {for "_i" from 1 to 25 do {_unit removeItemFromUniform "itemWatch";};};
	if (!isNull _v_cont) then {for "_i" from 1 to 80 do {_unit removeItemFromVest "itemWatch";};};

	if ((_gear select 2) != "") then {_unit addGoggles (_gear select 2);};
	if ((_gear select 3) != "") then {_unit addHeadgear (_gear select 3);};
	if (count ((_gear select 6) select 0) > 0) then
	{
		for "_i" from 0 to (count ((_gear select 6) select 0) - 1) do
		{
			(unitBackpack _unit) addweaponCargoGlobal [((_gear select 6) select 0) select _i,((_gear select 6) select 1) select _i];
		};
	};
	removeAllPrimaryWeaponItems _unit;
	if (count (_gear select 8) > 0) then {{if (_x != "") then {_unit addPrimaryWeaponItem _x;};} forEach (_gear select 8);};
	if (count (_gear select 9) > 0) then {{if (_x != "") then {_unit addSecondaryWeaponItem _x;};} forEach (_gear select 9);};
	if (count (_gear select 10) > 0) then {{if (_x != "") then {_unit addHandgunItem _x;};} forEach (_gear select 10);};
	_unit selectweapon (_gear select 14);
	if ((_gear select 15) != -1) then {player action ["SWITCHWEAPON", player, player, (_gear select 15)];};
};

BTC_fnc_handledamage_gear =
{									// HandleDamage Event Handler explained (http://goo.gl/etLSpz)
	_player = _this select 0;		// Unit the EH is assigned to.
	_enemy  = _this select 3;		// Source of damage (returns the unit if no source).
	_damage = _this select 2;		// Damage to the above selection (sum of dealt and prior damage).
	_part   = _this select 1;		// Selection (=body part) that was hit.
//	4TH IS NOT USED IN THIS EXAMPLE!!! (Only here as an example)
//	_ammo	= _this select 4; 		// Ammo classname of the projectile that dealt the damage (returns "" if no projectile).

	if (Alive _player && format ["%1", _player getVariable "BTC_need_revive"] == "0") then
	{
		BTC_gear = [_player] call BTC_get_gear;
	};
	_damage
	//if (format ["%1", _player getVariable "BTC_need_revive"] == "1") then {} else {_damage};
};

BTC_fnc_PVEH =
{
	//0 - first aid - create // [0,east,pos]
	//1 - first aid - delete
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
	player playMove "AinvPknlMstpSlayWrflDnon_medic";		// Changed from "AinvPknlMstpSlayWrflDnon_medic" to "AinvPknlMstpSnonWrflDr_medic0" the same also goes for the next one, which is also "AinvPknlMstpSnonWrflDr_medic0" now!
	sleep 5;
	waitUntil {!Alive player || (animationState player != "AinvPknlMstpSlayWrflDnon_medic" && animationState player != "amovpercmstpsraswrfldnon_amovpknlmstpsraswrfldnon" && animationState player != "amovpknlmstpsraswrfldnon_ainvpknlmstpslaywrfldnon" && animationState player != "ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon")};
	if (Alive player && Alive _injured && format ["%1",player getVariable "BTC_need_revive"] == "0") then
	{
		_injured setVariable ["BTC_need_revive",0,true];
		_injured playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
		//_injured switchMove "";
	};
};

BTC_drag =
{
	private ["_injured"];
	_men = nearestObjects [player, ["Man"], 2];
	if (count _men > 1) then
	{
		_injured = _men select 1;
	};
	if (format ["%1",_injured getVariable "BTC_need_revive"] != "1") exitWith {};
	BTC_dragging = true;
	_injured setVariable ["BTC_dragged",1,true];
	_injured attachTo [player, [0, 1.1, 0.092]];
//	player playMoveNow "AcinPknlMstpSrasWrflDnon";
	player playMoveNow "amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_1";
	_id = player addAction [("<t color=""#ED2744"">") + ("Drop") + "</t>","addons\=BTC=_revive_lite\=BTC=_revive_lite_addAction.sqf",[[],BTC_release], 9, true, true, "", "true"];
	_injured playMoveNow "AinjPpneMstpSnonWrflDb_grab";
	BTC_drag_pveh = [1,_injured];publicVariable "BTC_drag_pveh";
	WaitUntil {!Alive player || ((animationstate player == "acinpknlmstpsraswrfldnon") || (animationstate player == "acinpknlmwlksraswrfldb"))};
	private ["_act","_veh_selected","_array","_array_veh","_name_veh","_text_action","_action_id"];
	_act = 0;
	_veh_selected = objNull;
	_array_veh = [];
	while {!isNull player && alive player && !isNull _injured && alive _injured && format ["%1", _injured getVariable "BTC_need_revive"] == "1" && BTC_dragging} do
	{
		_array = nearestObjects [player, ["Air","LandVehicle"], 5];
		_array_veh = [];
		{
			if (_x emptyPositions "cargo" != 0) then
			{
				_array_veh = _array_veh + [_x];
			};
		} forEach _array;
		if (count _array_veh == 0) then
		{
			_veh_selected = objNull;
		};
		if (count _array_veh > 0 && _veh_selected != _array_veh select 0) then
		{
			_veh_selected    = _array_veh select 0;
			_name_veh        = getText (configFile >> "CfgVehicles" >> typeof _veh_selected >> "displayName");
			_text_action     = ("<t color=""#ED2744"">" + "Load wounded in " + (_name_veh) + "</t>");
			_action_id = player addAction [_text_action,"addons\=BTC=_revive_lite\=BTC=_revive_lite_addAction.sqf",[[_injured,_veh_selected],BTC_load_in], 7, true, true];
			_act  = 1;
		};
		if (count _array_veh == 0 && _act == 1) then
		{
			player removeAction _action_id;_act = 0;
		};
		sleep 0.1;
	};
	if (_act == 1) then
	{
		player removeAction _action_id;
	};
	player playMoveNow "AmovPknlMstpSrasWrflDnon";		//AmovPknlMstpSrasWrflDnon	(amovppnemstpsraswrfldnon_amovpknlmstpsraswrfldnon = Transition from kneeling to lying)
	_injured setVariable ["BTC_dragged",0,true];
	if (format ["%1",_injured getVariable "BTC_need_revive"] == "1") then
	{
		detach _injured;
		_injured playMoveNow "AinjPpneMstpSnonWrflDb_release";	//Anim: Injured unit placed back on ground after being dragged.
	};
	player removeAction _id;
	BTC_dragging = false;
};

BTC_release =
{
	BTC_dragging = false;
};

BTC_load_in =
{
	_injured = _this select 0;
	_veh     = _this select 1;
	BTC_dragging = false;
	BTC_load_pveh = [3,_injured,_veh];publicVariable "BTC_load_pveh";
};

BTC_pull_out =
{
	_array = nearestObjects [player, ["Air","LandVehicle"], 5];
	_array_injured = [];
	if (count _array != 0) then
	{
		{
			if (format ["%1",_x getVariable "BTC_need_revive"] == "1") then {_array_injured = _array_injured + [_x];};
		} forEach crew (_array select 0);
	};
	BTC_pullout_pveh = [4,_array_injured];publicVariable "BTC_pullout_pveh";
};

BTC_pull_out_check =
{
	_cond = false;
	_array = nearestObjects [player, ["Air","LandVehicle"], 5];
	if (count _array != 0) then
	{
		{
			if (format ["%1",_x getVariable "BTC_need_revive"] == "1") then {_cond = true;};
		} forEach crew (_array select 0);
	};
	_cond
};

BTC_player_killed =
{
	private ["_type_backpack","_weapons","_magazines","_weapon_backpack","_ammo_backpack","_score","_score_array","_name","_body_marker","_ui"];
	titleText ["Death is not the end!", "BLACK OUT", 4];
	_body = _this select 0;
	[_body] spawn
	{
		_body = _this select 0;
		_dir = getDir _body;
		_pos = getPosATL vehicle _body;
		if (BTC_lifes != 0 || BTC_active_lifes == 0) then
		{
			WaitUntil {Alive player};
			//_body setPosATL [0,0,0];		// Simple attempt to move the _body out of the way while the player is awaiting revive.
			[[_body, [0,0,0]],"moveBody", true] spawn BIS_fnc_MP;
			detach player;
			//player setPos [getMarkerPos BTC_respawn_marker select 0, getMarkerPos BTC_respawn_marker select 1, 5000];
			_body_marker = player;
			player setCaptive true;
			BTC_r_camera_nvg = false;
			BTC_killed_pveh = [2,_body_marker];
			publicVariable "BTC_killed_pveh";
			player allowDamage false;
			player setVariable ["BTC_need_revive",1,true];

			player playMoveNow "AinjPpneMstpSnonWrflDnon";
			player switchMove "AinjPpneMstpSnonWrflDnon";

			_actions = [] spawn BTC_assign_actions;

			if (BTC_respawn_gear == 1) then
			{
				_gear = [player,BTC_gear] spawn BTC_set_gear;	// Restores the players gear from right before he died.
			};
			WaitUntil {animationstate player == "ainjppnemstpsnonwrfldnon"};
			//sleep 2;
			player setDir _dir;
			player setVelocity [0,0,0];
			player setPosATL _pos;

			_side = playerSide;
			_injured = player;

			if (BTC_injured_marker == 1) then
			{
				BTC_marker_pveh = [0,BTC_side,_pos,_body_marker];
				publicVariable "BTC_marker_pveh";
			};
			disableUserInput true;

			for [{_n = BTC_revive_time_min}, {_n > 0 && player getVariable "BTC_need_revive" == 1}, {_n = _n - 0.5}] do
			{
				if (BTC_active_lifes == 1) then
				{
					titleText [format ["Lifes remaining: %1",BTC_lifes], "BLACK FADED"];
				}
				else
				{
					titleText ["", "BLACK FADED"];
				};
				sleep 0.5;
			};

			if (BTC_black_screen == 0) then
			{
				titleText ["", "BLACK IN"];
			};
			disableUserInput false;
			_time = time;
			_timeout = _time + BTC_revive_time_max;
			private ["_id","_lifes"];
			BTC_respawn_cond = false;

			if (BTC_disable_respawn == 1) then
			{
				player enableSimulation false;
			};

			if (BTC_black_screen == 0 && BTC_disable_respawn == 0) then
			{
				disableSerialization;_dlg = createDialog "BTC_respawn_button_dialog";	// Simply creates the spawn button.
			};

			if (BTC_black_screen == 1 && BTC_disable_respawn == 0 && !Dialog) then
			{
				_dlg = createDialog "BTC_respawn_button_dialog";	// Simply creates the spawn button.
			};
			BTC_display_EH = (findDisplay 46) displayAddEventHandler ["KeyDown", "_anim = [] spawn {sleep 1;player switchMove ""AinjPpneMstpSnonWrflDnon"";};"];

			while {format ["%1", player getVariable "BTC_need_revive"] == "1" && time < _timeout && !BTC_respawn_cond} do
			{
				if (BTC_disable_respawn == 0 && {!Dialog} && {!BTC_respawn_cond}) then
				{
					_dlg = createDialog "BTC_respawn_button_dialog";	// Simply creates the spawn button.
				};
				_healer = call BTC_check_healer;
				_lifes = "";
				if (BTC_active_lifes == 1) then
				{
					_lifes = format ["Lifes remaining: %1",BTC_lifes];
				};
				if (BTC_black_screen == 1) then
				{
					titleText [format ["%1\n%2\n%3", round (_timeout - time),_healer,_lifes], "BLACK FADED"]
				}
				else
				{
					hintSilent format ["%1\n%2\n%3", round (_timeout - time),_healer,_lifes];
				};
			};

			(findDisplay 46) displayRemoveEventHandler ["KeyDown",BTC_display_EH];
			closedialog 0;

			if (time > _timeout && format ["%1", player getVariable "BTC_need_revive"] == "1") then
			{
				_respawn = [] spawn BTC_player_respawn;		// Triggered when the revive timeout is reached!
			};
			if (format ["%1", player getVariable "BTC_need_revive"] == "0" && !BTC_respawn_cond) then 	// Triggered when player gets revived!
			{
				if (BTC_black_screen == 1) then
				{
					titleText ["", "BLACK IN"];
				}
				else
				{
					hintSilent "";
				};
				if (BTC_need_first_aid == 1 && ((items player) find "FirstAidKit" != -1)) then
				{
					player removeItem "FirstAidKit";
				};
				player playMove "amovppnemstpsraswrfldnon";
				player playMove "";
			};

			if (BTC_disable_respawn == 0 && BTC_action_respawn == 1) then {player removeAction BTC_action_respawn_id;};
			player setCaptive false;

			if (BTC_disable_respawn == 1) then {player enableSimulation true;};
			player allowDamage true;
//			player switchMove "";		// Reset player moves.
			hintSilent "";				// Removes any hints.

			if (time > _timeout || BTC_respawn_cond) then		// If revive-time runs out or BTC_respawn_cond = true, then it unhides the body and goes directly to BTC_player_respawn.
			{
				//_body setPosATL _pos;							// This should simple return the moved away _body to its original posistion of death, so players can go loot it.
				[[_body,_pos],"moveBody", true] spawn BIS_fnc_MP;
			}
			else												// If player was revived, then it completly removes the corpse and recreates the menu items, which was removed onPlayerKilled.
			{
				deletevehicle _body;
				BTC_respawn_cond = false;
				player setskill 0;
				player addrating 9999999;
				player enableFatigue false;
				[] spawn createMenuActions;						// Adds player menu items.
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
	BTC_respawn_cond = true;
//	if (BTC_active_lifes == 1) then {BTC_lifes = BTC_lifes - 1;};
//	if (BTC_active_lifes == 1 && BTC_lifes == 0) exitWith BTC_out_of_lifes;
	if (BTC_active_lifes != 1 || BTC_lifes != 0) then
	{
		deTach player;
		player setVariable ["BTC_need_revive",0,true];
		closeDialog 0;
		if (BTC_black_screen == 0) then {titleText ["", "BLACK OUT"];};
		sleep 0.2;
		titleText ["", "BLACK FADED"];
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
		if (BTC_respawn_time > 0) then
		{
			player enableSimulation false;
			player attachTo [BTC_r_base_spawn,[0,0,6000]];
			//player setVelocity [0,0,0];
			sleep 1;
			private ["_n"];
			for [{_n = BTC_respawn_time}, {_n != 0}, {_n = _n - 1}] do
			{
				private ["_msg"];
				//player enableSimulation false;
				//player setpos [0,0,6000];
				//player setVelocity [0,0,0];
				titleText [format ["Respawn in %1",_n], "BLACK FADED"];
				sleep 1;
			};
		};
		player setVariable ["BTC_need_revive",0,true];
		closeDialog 0;
		sleep 0.1;
		if (BTC_dlg_on_respawn != 0 && !BTC_respawn_cond) then
		{
			player attachTo [BTC_r_base_spawn,[0,0,0]];
			sleep 0.1;
			deTach player;
			player setVelocity [0,0,0];
			player setPos getMarkerPos BTC_respawn_marker;
			player enableSimulation true;
			player switchMove "amovpercmstpsraswrfldnon";
			player switchMove ""; //amovpercmstpsraswrfldnon
			if (BTC_black_screen == 1 && BTC_respawn_time == 0) then {titleText ["", "BLACK IN"];sleep 2;titleText ["", "PLAIN"];};
			if (BTC_black_screen == 0 || BTC_respawn_time > 0) then
			{
				titleText ["", "BLACK IN"];
				sleep 2;
				titleText ["", "PLAIN"];
			};
		}
		else
		{
			titleText ["You were born to respawn...", "BLACK", 0];
			sleep 1;
			// remove everything
			{
				player removeWeapon _x;
			} forEach weapons player;
			player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
//			player playMove "aidlpercmstpsraswrfldnon_idlesteady01n";

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
		};
		BTC_respawn_cond = false;
	};
};

BTC_check_action_first_aid =
{
	private ["_injured","_array_item_injured"];
	_cond = false;
	_array_item = items player;
	_men = nearestObjects [vehicle player, ["Man"], 2];
	if (count _men > 1 && format ["%1", player getVariable "BTC_need_revive"] == "0") then
	{
		if (format ["%1", (_men select 1) getVariable "BTC_need_revive"] == "1" && !BTC_dragging && format ["%1", (_men select 1) getVariable "BTC_dragged"] != "1") then {_cond = true;};		//***CAD*** Org = "BTC_dragged"] != "1"  // Changed back to org from == "0"
		_injured = _men select 1;
	};
	if (_cond && BTC_pvp == 1) then
	{
		if ((_men select 1) getVariable "BTC_revive_side" == str (BTC_side)) then {_cond = true;} else {_cond = false;};
	};
	if (_cond && BTC_need_first_aid == 1) then
	{

		if (_array_item find "FirstAidKit" == -1) then {_cond = false;};
		_array_item_injured = items _injured;
		if (!_cond && _array_item_injured find "FirstAidKit" != -1) then {_cond = true;};
	};
	_cond
};

BTC_check_action_drag =
{
	_cond = false;
	_men = nearestObjects [vehicle player, ["Man"], 2];

	_priRifle = primaryWeapon player;
	myArifle = primaryWeapon player;	// CAD TEST
	publicVariable myArifle;			// CAD TEST

	if (count _men > 1) then
	{
		/*if (BTC_pvp == 1) then
		{
			if (side (_men select 1) == BTC_side && format ["%1", (_men select 1) getVariable "BTC_need_revive"] == "1" && !BTC_dragging && format ["%1", (_men select 1) getVariable "BTC_dragged"] == "0" && player primaryWeapon !(null)) then		//***CAD*** Org = "BTC_dragged"] != "1"
			{
				_cond = true;
			};
		}
		else
		{*/
			if ((format ["%1", (_men select 1) getVariable "BTC_need_revive"] == "1") && !(BTC_dragging) && (format ["%1", (_men select 1) getVariable "BTC_dragged"] != "1") && (_priRifle != "")) then
			{
				_cond = true;
			};
		//};
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

BTC_3d_markers =
{
	_3d = addMissionEventHandler ["Draw3D",
	{
		{
			if (((_x distance player) < BTC_3d_distance) && (format ["%1", _x getVariable "BTC_need_revive"] == "1")) then
			{
				drawIcon3D["a3\ui_f\data\map\MapControl\hospital_ca.paa",BTC_3d_icon_color,_x,BTC_3d_icon_size,BTC_3d_icon_size,0,format["%1 (%2m)", name _x, ceil (player distance _x)],0,0.02];
			};
		} forEach playableUnits;
	}];
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

BTC_revive_loop =
{
	while {true} do
	{
		sleep 1;
		if (Alive player && format ["%1",player getVariable "BTC_need_revive"] != "1") then
		{
			//hintsilent format ["%1 %2",currentWeaponMode player,currentMagazineDetail player];
			//diag_log text format ["SAVED %1",dialog];
			BTC_gear = [player] call BTC_get_gear;
		};
	};
};

moveBody =
{
    private["_body","_pos"];

    _body = _this select 0;
    _pos = _this select 1;

    _body setPosATL _pos;
};