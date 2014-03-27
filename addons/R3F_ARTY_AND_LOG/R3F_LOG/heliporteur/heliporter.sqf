/**
 * Héliporte un objet avec un héliporteur
 *
 * @param 0 l'héliporteur
 *
 * Copyright (C) 2010 madbull ~R3F~
 *
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

  // ***** NOTE - All translations from Frence to English is made using google translate. *****
  // Modified by: [CAD] Krycek

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;

	private ["_heliporteur", "_objet","_heavyTransportHelis"];
	_heliporteur = _this select 0;
	_objet = nearestObjects [_heliporteur, R3F_LOG_CFG_objets_heliportables, 20];
	// Because Helicarrier can be a heliportable object
	_objet = _objet - [_heliporteur];

	if (count _objet > 0) then
	{
		_objet = _objet select 0;

		if !(_objet getVariable "R3F_LOG_disabled") then
		{
			if (isNull (_objet getVariable "R3F_LOG_est_transporte_par")) then
			{
				if (count crew _objet == 0) then
				{
					// If the object is not being moved by a player
					if (isNull (_objet getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet getVariable "R3F_LOG_est_deplace_par"))) then
					{
						private ["_ne_remorque_pas", "_remorque"];
						// Not transported by helicopter which tows something else
						_ne_remorque_pas = true;
						_remorque = _objet getVariable "R3F_LOG_remorque";
						if !(isNil "_remorque") then
						{
							if !(isNull _remorque) then
							{
								_ne_remorque_pas = false;
							};
						};
						if (_ne_remorque_pas) then
						{
							_heliporteur setVariable ["R3F_LOG_heliporte", _objet, true];
							_objet setVariable ["R3F_LOG_est_transporte_par", _heliporteur, true];

							_heavyTransportHelis = ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","I_Heli_Transport_02_F"];		// List Helis that can lift the Cargo Tower.

							if !(typeOf _heliporteur in _heavyTransportHelis) then	// Condition is: Any other Heli then Mohawk and Ghosthawk.
							{
								if !(typeOf _objet == "Land_Cargo_Tower_V1_F") then
								{
									_objet attachTo [_heliporteur, [0, 0, (boundingBoxReal _heliporteur select 0 select 2) - (boundingBoxReal _objet select 0 select 2) - (getPosATL _heliporteur select 2) + 0.5]];
									player globalChat format [STR_R3F_LOG_action_heliporter_fait, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
								}
								else
								{
									cutText ["Wow, you need a bigger Chopper for this task Pilot!", "PLAIN",1,false];

									R3F_LOG_mutex_local_verrou = true;
									private ["_heliporteur", "_objet"];
									_heliporteur = _this select 0;
									_objet = _heliporteur getVariable "R3F_LOG_heliporte";
									_heliporteur setVariable ["R3F_LOG_heliporte", objNull, true];
									_objet setVariable ["R3F_LOG_est_transporte_par", objNull, true];
									detach _objet;
									_objet setPosATL [getPos _objet select 0, getPos _objet select 1, 0];
									_objet setVelocity [0, 0, 0];
									R3F_LOG_mutex_local_verrou = false;
								};
							}
							else
							{
								if !(typeOf _objet == "Land_Cargo_Tower_V1_F") then
								{
									_objet attachTo [_heliporteur, [0, 0, (boundingBoxReal _heliporteur select 0 select 2) - (boundingBoxReal _objet select 0 select 2) - (getPosATL _heliporteur select 2) + 0.5]];
									player globalChat format [STR_R3F_LOG_action_heliporter_fait, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"Object ""%1"" attached."
								}
								else
								{
									_objet attachTo [_heliporteur, [0, 0, (boundingBoxReal _heliporteur select 0 select 2) - (boundingBoxReal _objet select 0 select 2) - (getPosATL _heliporteur select 2) - 5]];
									player globalChat format [STR_R3F_LOG_action_heliporter_fait, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"Object ""%1"" attached."
								};
							};
						}
						else
						{
							player globalChat format [STR_R3F_LOG_action_heliporter_objet_remorque, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"Can't lift the object ""%1"" because it's towing another object."
						};
					}
					else
					{
						player globalChat format [STR_R3F_LOG_action_heliporter_deplace_par_joueur, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"The object ""%1"" is being moved by a player."
					};
				}
				else
				{
					player globalChat format [STR_R3F_LOG_action_heliporter_joueur_dans_objet, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"There is a player in the object ""%1""."
				};
			}
			else
			{
				player globalChat format [STR_R3F_LOG_action_heliporter_deja_transporte, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"The object ""%1"" is already transported by a vehicle."
			};
		};
	};

	R3F_LOG_mutex_local_verrou = false;
};