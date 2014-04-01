/**
 * Dropping an object being heliborne
 *
 * @param 0 the Helicarrier
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

	private ["_heliporteur", "_objet", "_velocity", "_airdrop"];

	_heliporteur = _this select 0;
	_objet = _heliporteur getVariable "R3F_LOG_heliporte";

	// Is stored on the network that the vehicle heliborne nothing
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, true];
	// It also stores on the network that the object is no longer attached
	_objet setVariable ["R3F_LOG_est_transporte_par", objNull, true];

	_velocity = velocity _objet;

	detach _objet;

	sleep 0.1;

/*	if ([0,0,0] distance velocity _heliporteur < 15 && getPos _heliporteur select 2 < 40) then
	{
		_objet setPos [getPos _objet select 0, getPos _objet select 1, 1];
		_objet setVelocity [0, 0, 0.1];
	}
	else
	{*/
		_objet setVelocity _velocity;
	//};

	player globalChat format [STR_R3F_LOG_action_heliport_larguer_fait, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"Object ""%1"" dropped."

	R3F_LOG_mutex_local_verrou = false;
};