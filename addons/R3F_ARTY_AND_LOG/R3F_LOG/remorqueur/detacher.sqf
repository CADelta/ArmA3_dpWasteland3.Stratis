/**
 * Remove an object of a vehicle
 *
 * @param 0 object to detach
 *
 * Copyright (C) 2010 madbull ~R3F~
 *
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;

	// remorqueur = TOW
	private ["_remorqueur", "_objet"];

	_objet = _this select 0;
	_remorqueur = _objet getVariable "R3F_LOG_est_transporte_par";

	// Do not allow to drop an object if it is conveyed by helicopter
	if ({_remorqueur isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
	{
		// Is stored on the network that the vehicle tow something
		_remorqueur setVariable ["R3F_LOG_remorque", objNull, true];
		// It also stores the network as the object is attached tow
		_objet setVariable ["R3F_LOG_est_transporte_par", objNull, true];

		player playMove "AinvPknlMstpSlayWnonDnon_medic";
		sleep 4;

		detach _objet;
		_objet setVelocity [0, 0, 0.01];

		if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
		{
			// If no one has de-tow the object during sleep 4
			if (isNull (_remorqueur getVariable "R3F_LOG_remorque") &&
				(isNull (_objet getVariable "R3F_LOG_est_transporte_par")) &&
				(isNull (_objet getVariable "R3F_LOG_est_deplace_par"))
			) then
			{
				[_objet] execVM "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\deplacer.sqf";
			};
		}
		else
		{
			player globalChat STR_R3F_LOG_action_detacher_fait;		//"Object untowed."
		};
	}
	else
	{
		player globalChat STR_R3F_LOG_action_detacher_impossible_pour_ce_vehicule;		//"Only the pilot can detach this object."
	};

	R3F_LOG_mutex_local_verrou = false;
};