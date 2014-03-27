//	Name: init.sqf
//	Author: AimZ =(dp)=, [CAD] Krycek

diag_log format["******** MISSION init Started ********"];
versionName = "v3.0";
modVersion = "build-2sgrd95";
vChecksum = 1;
{vChecksum = vChecksum + _x;} forEach (toArray modVersion);

player allowDamage false;

// CLIENT AND SERVER - INITIAL VIEW DISTANCE & OBJECT VIEW DISTANCE SETTINGS
setViewDistance 1400;
setObjectViewDistance 800;

//Core init
[] execVM "territoryMarkers.sqf";		// Needed for Territory System

// SERVER SIDE CODE
if (isServer) then
{
	[] execVM "server\functions\PartialAntiCheats.sqf";

    diag_log format ["*** Server Setup ***"];
	serverCompiledScripts = false;
	[] call compileFinal preprocessFileLineNumbers "server\serverCompile.sqf";
	waitUntil {serverCompiledScripts};
	[] call serverInit;
};

// CLIENT SIDE CODE
if (!isDedicated) then
{
    diag_log format ["*** Client Setup ***"];
	enableSaving [false, false];		// Saving disabled without autosave.

	playerCompiledScripts = false;
	[] call compileFinal preprocessFileLineNumbers "client\clientCompile.sqf";
	waitUntil {playerCompiledScripts};
	[] call clientInit;

	"THISISNOT4SPARTA" addPublicVariableEventHandler {[] spawn (_this select 1);};
    datFOURClientStarted = player;
    publicVariableServer "datFOURClientStarted";
};

//Init of 3rd Party Scripts:
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
0 = execVM "addons\IgiLoad\IgiLoadInit.sqf";
call compile preprocessFileLineNumbers "addons\=BTC=_revive_lite\=BTC=_revive_lite_init.sqf";

//[] execVM "addons\scripts\real_weather.sqf"; 		// Disabled until it is configured correctly.

diag_log format["******** MISSION init Finshed ********"];
