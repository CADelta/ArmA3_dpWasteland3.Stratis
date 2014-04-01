/**
 * @ file Name: remorquer_deplace.sqf
 * The tow displaced by the player with a towing object
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

	private ["_objet", "_remorqueur"];

	_objet = R3F_LOG_joueur_deplace_objet;

	_remorqueur = nearestObjects [_objet, R3F_LOG_CFG_remorqueurs, 22];
	// Because the tow may be a towable object
	_remorqueur = _remorqueur - [_objet];

	if (count _remorqueur > 0) then
	{
		_remorqueur = _remorqueur select 0;

		if (alive _remorqueur && isNull (_remorqueur getVariable "R3F_LOG_remorque") && ([0,0,0] distance velocity _remorqueur < 6) && (getPos _remorqueur select 2 < 2) && !(_remorqueur getVariable "R3F_LOG_disabled")) then
		{
			// Is stored on the network that the vehicle towing something
			_remorqueur setVariable ["R3F_LOG_remorque", _objet, true];
			// It also stores on the network that the barrel is attached to the tow
			_objet setVariable ["R3F_LOG_est_transporte_par", _remorqueur, true];

			// Placing the player on the side of the vehicle, which helps prevent injury and makes more realistic animation
			player attachTo [_remorqueur, [
				(boundingBox _remorqueur select 1 select 0),
				(boundingBox _remorqueur select 0 select 1) + 1,
				(boundingBox _remorqueur select 0 select 2) - (boundingBox player select 0 select 2)
			]];

			player setDir 270;
			player setPos (getPos player);

			// Making releasing the object from player (if it has in "hands")
			R3F_LOG_joueur_deplace_objet = objNull;
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 2;

			// Attach to the rear of the vehicle at ground level
			_objet attachTo [_remorqueur, [
				0,
				(boundingBox _remorqueur select 0 select 1) + (boundingBox _objet select 0 select 1) + 3,
				(boundingBox _remorqueur select 0 select 2) - (boundingBox _objet select 0 select 2)
			]];

			detach player;

			// If the object is a static weapon, it corrects the orientation according to the direction of the barrel
			if (_objet isKindOf "StaticWeapon") then
			{
				private ["_azimut_canon"];

				_azimut_canon = ((_objet weaponDirection (weapons _objet select 0)) select 0) atan2 ((_objet weaponDirection (weapons _objet select 0)) select 1);

				// Only the D30 has the gun pointing towards the vehicle
				if !(_objet isKindOf "D30_Base") then
				{
					_azimut_canon = _azimut_canon + 180;
				};

				// One is obliged to ask the server to rotate the object for us
				R3F_ARTY_AND_LOG_PUBVAR_setDir = [_objet, (getDir _objet)-_azimut_canon];
				if (isServer) then
				{
					["R3F_ARTY_AND_LOG_PUBVAR_setDir", R3F_ARTY_AND_LOG_PUBVAR_setDir] spawn R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
				}
				else
				{
					publicVariable "R3F_ARTY_AND_LOG_PUBVAR_setDir";
				};
			};

			sleep 5;
		};
	};

	R3F_LOG_mutex_local_verrou = false;
};