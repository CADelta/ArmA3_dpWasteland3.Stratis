//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [CAD] Krycek

diag_log format["*** spawnRandom Started ***"];

waitUntil {!isNil "bis_fnc_init"};

private ["_townName","_randomLoc","_pos"];

_randomLoc = cityList select floor (random (count cityList));

_pos = getMarkerPos (_randomLoc select 0);
_pos = [_pos,10,(_randomLoc select 1)*2,1,0,0,0] call BIS_fnc_findSafePos;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
player setPosATL _pos;

respawnDialogActive = false;
closeDialog 0;

_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
["dp Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;

diag_log format["*** spawnRandom Finished ***"];