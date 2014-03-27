//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

if (isServer) exitWith {};

diag_log format["*** playerSetup Started ***"];

//Player initialisation
player setskill 0;
player addrating 9999999;
player disableAI "move";
player disableAI "anim";
player disableAI "target";
player disableAI "autotarget";
player disableConversation true;
enableSentences false;
player enableFatigue false;

sleep 1;

player setVariable["thirst",100,true];
player setVariable["hunger",100,true];
player setVariable["cmoney",200,true];
player setVariable["water",1,true];
player setVariable["canfood",1,true];
player setVariable["medkits",1,true];
player setVariable["repairkits",1,true];
player setVariable["fuelFull", 0, true];
player setVariable["fuelEmpty", 1, true];

// remove everything
{player removeWeapon _x;} forEach weapons player;
player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
player playMove "aidlpercmstpsraswrfldnon_idlesteady01n";

removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
removeAllAssignedItems player;

switch (playerSide) do
{
	case west:
	{
		player addUniform "U_B_CTRG_3";
		player addHeadgear "H_Cap_blu";
		player addBackpack "B_AssaultPack_mcamo";
	};
	case east:
	{
		player addUniform "U_O_CombatUniform_oucamo";
		player addHeadgear "H_Cap_red";
		player addBackpack "B_AssaultPack_blk";
	};
	case resistance:
	{
		player addUniform "U_IG_Guerilla1_1";
		player addHeadgear "H_Cap_grn";
		player addBackpack "B_AssaultPack_ocamo";
	};
};

player addVest "V_Rangemaster_belt";
//player addBackpack "B_AssaultPack_blk";					// Moved to individual factions for variety.

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

// start the spawn dialog
sleep 2;
[] call playerSpawn;

player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_P07_F";
player selectWeapon "hgun_P07_F";

player switchMove "AmovPknlMstpSrasWpstDnon";
player playMove "PistolMagazineReloadKneel";

player setDamage 0;		// Extra full heal right after spawning.

diag_log format["*** playerSetup Finished ***"];