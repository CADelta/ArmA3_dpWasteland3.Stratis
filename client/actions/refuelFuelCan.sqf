//	@file Name: refuelFuelCan.sqf
//	@file Author: [404] Deadbeat, Aimz =(dp)=, [CAD] Krycek

/*** BELIEVE THIS VERSION MAKES THE JERRY CAN DISAPPEAR WHEN REFILLING IT AT A GAS PUMP ***
private ["_fuelEmpty","_fuelFull"];

_fuelEmpty = player getVariable "fuelEmpty";
_fuelFull = player getVariable "fuelFull";

if (player getVariable "fuelEmpty" > 0) then
{
	player setVariable ["fuelFull",_fuelEmpty + 1,false];
	player setVariable["fuelEmpty",_fuelEmpty - 1,false];
	hint "Your jerry can is now full.";
}
else
{
	hint "You have no empty jerry can.";
};*/

player setVariable ["fuelFull",1,false];
player setVariable["fuelEmpty",0,false];
hint "Your jerry can is now full";
