/**
 * Load the selected object (selected R3F_LOG_objet) in a carrier
 *
 * @param 0 the carrier
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

	private ["_objet", "_classes_transporteurs", "_transporteur", "_i"];

	_objet = R3F_LOG_objet_selectionne;
	_transporteur = _this select 0;

	if (!(isNull _objet) && !(_objet getVariable "R3F_LOG_disabled")) then
	{
		if (isNull (_objet getVariable "R3F_LOG_est_transporte_par") && (isNull (_objet getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet getVariable "R3F_LOG_est_deplace_par")))) then
		{
			private ["_objets_charges", "_chargement_actuel", "_cout_capacite_objet", "_chargement_maxi"];

			_objets_charges = _transporteur getVariable "R3F_LOG_objets_charges";

			// Calculation of Current load
			_chargement_actuel = 0;
			{
				for [{_i = 0}, {_i < count R3F_LOG_CFG_objets_transportables}, {_i = _i + 1}] do
				{
					if (_x isKindOf (R3F_LOG_CFG_objets_transportables select _i select 0)) exitWith
					{
						_chargement_actuel = _chargement_actuel + (R3F_LOG_CFG_objets_transportables select _i select 1);
					};
				};
			} forEach _objets_charges;

			// Finding, the capacity of the object
			_cout_capacite_objet = 99999;
			for [{_i = 0}, {_i < count R3F_LOG_CFG_objets_transportables}, {_i = _i + 1}] do
			{
				if (_objet isKindOf (R3F_LOG_CFG_objets_transportables select _i select 0)) exitWith
				{
					_cout_capacite_objet = (R3F_LOG_CFG_objets_transportables select _i select 1);
				};
			};

			// Finding the maximum capacity of the carrier
			_chargement_maxi = 0;
			for [{_i = 0}, {_i < count R3F_LOG_CFG_transporteurs}, {_i = _i + 1}] do
			{
				if (_transporteur isKindOf (R3F_LOG_CFG_transporteurs select _i select 0)) exitWith
				{
					_chargement_maxi = (R3F_LOG_CFG_transporteurs select _i select 1);
				};
			};

			// If the object fits into the vehicle
			if (_chargement_actuel + _cout_capacite_objet <= _chargement_maxi) then
			{
				if (_objet distance _transporteur <= 30) then
				{
					// Is stored on the network, the new content of the vehicle
					_objets_charges = _objets_charges + [_objet];
					_transporteur setVariable ["R3F_LOG_objets_charges", _objets_charges, true];

					if (_objet getVariable "timeout" >= 0) Then	// Only get objects which already have a timer on them, this prevents setting timers on objects that should not have one.
					{
						// This gives the object 2 hours extra time while inside the vehicle, so it does not despawn while being transported!  |  Tag: boxCreation.sqf
						_objet setVariable ["timeout", (time + 7200), true];
					};

					player globalChat STR_R3F_LOG_action_charger_selection_en_cours;		//"Loading in progress..."

					sleep 2;
					// Choose a disengaged position (shpere 50 m radius) in the air in a cube 9km ^ 3
					private ["_nb_tirage_pos", "_position_attache"];
					_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
					_nb_tirage_pos = 1;
					while {(!isNull (nearestObject _position_attache)) && (_nb_tirage_pos < 25)} do
					{
						_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
						_nb_tirage_pos = _nb_tirage_pos + 1;
					};

					_objet attachTo [R3F_LOG_PUBVAR_point_attache, _position_attache];

					R3F_LOG_objet_selectionne = objNull;

					player globalChat format [STR_R3F_LOG_action_charger_selection_fait, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];	//"The object ""%1"" has been loaded in the vehicle."
				}
				else
				{
					player globalChat format [STR_R3F_LOG_action_charger_selection_trop_loin, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"The object ""%1"" is too far from the vehicle to be loaded."
				};
			}
			else
			{
				player globalChat format [STR_R3F_LOG_action_charger_selection_pas_assez_de_place, (_chargement_maxi - _chargement_actuel), _cout_capacite_objet];		//"There is not enough space in this vehicle. Space left: %1, Required: %2"
			};
		}
		else
		{
			player globalChat format [STR_R3F_LOG_action_charger_selection_objet_transporte, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"The object ""%1"" is in transit."
		};
	};

	R3F_LOG_mutex_local_verrou = false;
};