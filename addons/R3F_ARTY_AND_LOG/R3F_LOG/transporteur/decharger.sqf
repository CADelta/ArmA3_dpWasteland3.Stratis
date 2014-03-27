/**
 * Unload an object from a carrier - called from the interface listing the contents of the carrier
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

	#include "dlg_constantes.h"
	private ["_transporteur", "_objets_charges", "_type_objet_a_decharger", "_objet_a_decharger", "_i"];

	_transporteur = uiNamespace getVariable "R3F_LOG_dlg_CV_transporteur";
	_objets_charges = _transporteur getVariable "R3F_LOG_objets_charges";

	_type_objet_a_decharger = lbData [R3F_LOG_IDC_dlg_CV_liste_contenu, lbCurSel R3F_LOG_IDC_dlg_CV_liste_contenu];

	closeDialog 0;

	// Search for an object type requested?
	_objet_a_decharger = objNull;
	for [{_i = 0}, {_i < count _objets_charges}, {_i = _i + 1}] do
	{
		if (typeOf (_objets_charges select _i) == _type_objet_a_decharger) exitWith
		{
			_objet_a_decharger = _objets_charges select _i;
		};
	};

	if !(isNull _objet_a_decharger) then
	{
		// Is stored on the network, the new content of the carrier (assigned with this item less)
		_objets_charges = _objets_charges - [_objet_a_decharger];
		_transporteur setVariable ["R3F_LOG_objets_charges", _objets_charges, true];

		detach _objet_a_decharger;

		_objet_a_decharger setVariable ["timeout", (time + 600), true];	// Resets the despawn timer on the object that just got unloaded.

		if ({_objet_a_decharger isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
		{
			[_objet_a_decharger] execVM "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\deplacer.sqf";
		}
		else
		{
			private ["_dimension_max"];
			_dimension_max = (((boundingBox _objet_a_decharger select 1 select 1) max (-(boundingBox _objet_a_decharger select 0 select 1))) max ((boundingBox _objet_a_decharger select 1 select 0) max (-(boundingBox _objet_a_decharger select 0 select 0))));

			player globalChat STR_R3F_LOG_action_decharger_en_cours;		//"Unloading in progress..."

			sleep 2;

			// We set the random object to the rear of the carrier
			_objet_a_decharger setPos
			[
				(getPos _transporteur select 0) - ((_dimension_max+5+(random 10)-(boundingBox _transporteur select 0 select 1))*sin (getDir _transporteur - 90+random 180)),
				(getPos _transporteur select 1) - ((_dimension_max+5+(random 10)-(boundingBox _transporteur select 0 select 1))*cos (getDir _transporteur - 90+random 180)),
				0
			];
			_objet_a_decharger setVelocity [0, 0, 0];

			player globalChat STR_R3F_LOG_action_decharger_fait;		//"The object has been unloaded from the vehicle."
		};
	}
	else
	{
		player globalChat STR_R3F_LOG_action_decharger_deja_fait;		//"The object has already been unloaded."
	};

	R3F_LOG_mutex_local_verrou = false;
};