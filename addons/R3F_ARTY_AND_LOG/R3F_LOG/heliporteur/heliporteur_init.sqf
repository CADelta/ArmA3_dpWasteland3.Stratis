/**
 * file Name: heliporteur_init.sqf
 * Initializes a vehicle Helicarrier
 *
 * @param 0 the Helicarrier
 */

private ["_heliporteur", "_est_desactive", "_heliporte"];

_heliporteur = _this select 0;

_est_desactive = _heliporteur getVariable "R3F_LOG_disabled";
if (isNil "_est_desactive") then
{
	_heliporteur setVariable ["R3F_LOG_disabled", false];
};

// Definition of the local variable if it is not defined in the network
_heliporte = _heliporteur getVariable "R3F_LOG_heliporte";
if (isNil "_heliporte") then
{
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, false];
};

_heliporteur addAction [("<img image='client\ui\r3f\r3f_lift.paa'/> <t color='#ffff00'>" + STR_R3F_LOG_action_heliporter + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\heliporter.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_heliporter_valide"];		//"Lift the object"

_heliporteur addAction [("<img image='client\ui\r3f\r3f_drop.paa'/> <t color='#06ef00'>" + STR_R3F_LOG_action_heliport_larguer + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\larguer.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_heliport_larguer_valide"];		// "Drop the object"
