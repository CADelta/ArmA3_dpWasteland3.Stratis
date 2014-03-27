//	@file Name: playerSelect.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=, [CAD] Krycek

#define playerMenuDialog 55500
#define playerMenuPlayerList 55505
#define playerMenuSpectateButton 55506
#define playerMenuWarnMessage 55509

disableSerialization;

private ["_dialog","_playerListBox","_spectateButton","_switch","_index","_dpModSelect","_playerData","_target","_check","_spectating","_camadm","_camPos","_warnText","_targetUID","_playerName","_player","_adminName","_rnum"];
_uid = getPlayerUID player;

//camadm = objNull;
//camPos = 0;

if ((_uid in dpModerators) || (_uid in serverCADministrators)) then
{
	_dialog = findDisplay playerMenuDialog;
	_playerListBox = _dialog displayCtrl playerMenuPlayerList;
	_spectateButton = _dialog displayCtrl playerMenuSpectateButton;
	_warnMessage = _dialog displayCtrl playerMenuWarnMessage;

	_switch = _this select 0;
	_index = lbCurSel _playerListBox;
	_playerData = _playerListBox lbData _index;

	{
		if (str(_x) == _playerData) then
		{
			_target = _x;
			_check = 1;
		};
	}forEach playableUnits;

	if (_check == 0) exitWith{};

	switch (_switch) do
	{
	    case 0: //Spectate
		{
			if (!isNil "_target") then
			{
			_spectating = ctrlText _spectateButton;
			if (_spectating == "Spectate") then {
				_spectateButton ctrlSetText "Spectating";
					//player commandChat format ["Viewing %1.", name _target];

					if (!isNil "_camadm") then { camDestroy _camadm; };
					_camadm = "camera" camCreate ([(position vehicle _target select 0) - 5,(position vehicle _target select 1), (position vehicle _target select 2) + 10]);
					_camadm cameraEffect ["external", "TOP"];
					_camadm camSetTarget (vehicle _target);
					_camadm camCommit 1;


					_rnum = 0;
					while {ctrlText _spectateButton == "Spectating"} do
					{
						switch (_rnum) do
						{
							if (daytime > 19 || daytime < 5) then {camUseNVG true;} else {camUseNVG false;};
							case 0: {detach _camadm; _camadm attachTo [(vehicle _target), [0,-10,4]]; _camadm setVectorUp [0, 1, 5];};
							case 1: {detach _camadm; _camadm attachTo [(vehicle _target), [0,10,4]]; _camadm setDir 180; _camadm setVectorUp [0, 1, -5];};
							case 2: {detach _camadm; _camadm attachTo [(vehicle _target), [0,1,50]]; _camadm setVectorUp [0, 50, 1];};
							case 3: {detach _camadm; _camadm attachTo [(vehicle _target), [-10,0,2]]; _camadm setDir 90; _camadm setVectorUp [0, 1, 5];};
							case 4: {detach _camadm; _camadm attachTo [(vehicle _target), [10,0,2]]; _camadm setDir -90; _camadm setVectorUp [0, 1, -5];};
						};
						player commandchat "Viewing cam " + str(_rnum) + " on " + str(name vehicle _target);
						_rnum = _rnum + 1;
						if (_rnum > 4) then {_rnum = 0;};
						sleep 5;
					};
				}
				else
				{
					_spectateButton ctrlSetText "Spectate";
					player commandchat format ["No Longer Viewing.", name _target];
					player cameraEffect ["terminate","back"];
					if (!isNil "_camadm") then {camDestroy _camadm;};
				};
			};
		};

		case 1: //Warn
		{
			_warnText = ctrlText _warnMessage;
	        _adminName = name player;
			_playerName = name _target;
	        [[[_warnText,_playerName,_adminName],"client\functions\serverFunc\warnMessage.sqf"],"BIS_fnc_execVM",nil,false] spawn BIS_fnc_MP;
		};

		case 2: //Slay
	    {
			[[[name _target],"client\functions\serverFunc\slayPlayer.sqf"],"BIS_fnc_execVM",nil,false] spawn BIS_fnc_MP;
	    };

	    case 3: //Unlock Team Switcher
	    {
			_targetUID = getPlayerUID _target;
	        {
			    if(_x select 0 == _targetUID) then
			    {
			    	pvar_teamSwitchList set [_forEachIndex, "REMOVETHISCRAP"];
					pvar_teamSwitchList = pvar_teamSwitchList - ["REMOVETHISCRAP"];
					publicVariable "pvar_teamSwitchList";

	                [format["if (name player == ""%1"") then {client_firstSpawn = nil;};",name _target],"BIS_fnc_spawn",nil,false] spawn BIS_fnc_MP;
			    };
			}forEach pvar_teamSwitchList;
	    };

		case 4: //Unlock Team Killer
	    {
			_targetUID = getPlayerUID _target;
	        {
			    if(_x select 0 == _targetUID) then
			    {
			    	pvar_teamKillList set [_forEachIndex, "REMOVETHISCRAP"];
					pvar_teamKillList = pvar_teamKillList - ["REMOVETHISCRAP"];
					publicVariable "pvar_teamKillList";
			    };
			}forEach pvar_teamKillList;
	    };

        case 5: //Remove All Money
	    {
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
  					_x setVariable["cmoney",0,true];
			    };
			}forEach playableUnits;
	    };

        case 6: //Remove All Weapons
	    {
			[[[name _target],"client\functions\serverFunc\removeWeapons.sqf"],"BIS_fnc_execVM",nil,false] spawn BIS_fnc_MP;
	    };

        case 7: //Check Player Gear
	    {
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
  					createGearDialog [_x, "RscDisplayInventory"];
			    };
			}forEach playableUnits;
	    };

        case 8: //Change camera view position
	    {
			_spectating = ctrlText _spectateButton;
			camPos = camPos + 1;
			if (camPos > 4) then {camPos = 0;};

			if (_spectating == "Spectating" && camadm != objNull) then
			{

				switch (camPos) do
				{
					case 0: {detach camadm; camadm attachTo [(vehicle _target), [0,-10,4]]; camadm setVectorUp [0, 1, 5];};
					case 1: {detach camadm; camadm attachTo [(vehicle _target), [0,10,4]]; camadm setDir 180; camadm setVectorUp [0, 1, -5];};
					case 2: {detach camadm; camadm attachTo [(vehicle _target), [0,1,50]]; camadm setVectorUp [0, 50, 1];};
					case 3: {detach camadm; camadm attachTo [(vehicle _target), [-10,0,2]]; camadm setDir 90; camadm setVectorUp [0, 1, 5];};
					case 4: {detach camadm; camadm attachTo [(vehicle _target), [10,0,2]]; camadm setDir -90; camadm setVectorUp [0, 1, -5];};
				};
	    	};
	    };
	};
};