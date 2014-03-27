/**
 * Initializes towing vehicle // Initialise un v?hicule remorqueur
 *
 * @param 0 le remorqueur
 */

private ["_remorqueur", "_est_desactive", "_remorque"];

_remorqueur = _this select 0;

_est_desactive = _remorqueur getVariable "R3F_LOG_disabled";
if (isNil "_est_desactive") then
{
	_remorqueur setVariable ["R3F_LOG_disabled", false];
};

// D?finition locale de la variable si elle n'est pas d?finie sur le r?seau
// Definition of the local variable if it is not defined in the network
_remorque = _remorqueur getVariable "R3F_LOG_remorque";
if (isNil "_remorque") then
{
	_remorqueur setVariable ["R3F_LOG_remorque", objNull, false];
};

_remorqueur addAction [("<img image='client\ui\r3f\r3f_tow.paa'/> <t color='#ff0000'>" + STR_R3F_LOG_action_remorquer_deplace + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorquer_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_deplace_valide"];		//"Tow the object"

_remorqueur addAction [("<img image='client\ui\r3f\r3f_tow.paa'/> <t color='#ff0000'>" + STR_R3F_LOG_action_remorquer_selection + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorquer_selection.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_selection_valide"];		//"... tow the selected object to this vehicle"