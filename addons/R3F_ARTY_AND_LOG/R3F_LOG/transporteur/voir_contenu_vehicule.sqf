/**
 * Opens the dialog vehicle content and prepopulated according to the vehicle
 *
 * @param 0 the vehicle for which to view the content
 *
 * Copyright (C) 2010 madbull ~R3F~
 *
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

disableSerialization; // Because of displayCtrl

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;

	private ["_transporteur", "_chargement_actuel", "_chargement_maxi", "_contenu", "_tab_contenu_regroupe"];
	private ["_tab_objets", "_tab_quantite", "_i", "_j", "_dlg_contenu_vehicule"];

	_transporteur = _this select 0;

	uiNamespace setVariable ["R3F_LOG_dlg_CV_transporteur", _transporteur];

	createDialog "R3F_LOG_dlg_contenu_vehicule";

	_contenu = _transporteur getVariable "R3F_LOG_objets_charges";

	/** List of class names of objects contained in the vehicle, without duplicates */
	_tab_objets = [];
	/** Associated quantity (index) for class names in objectsArray */
	_tab_quantite = [];

	_chargement_actuel = 0;

	// Preparation of the list of contents and amounts associated with the objects
	for [{_i = 0}, {_i < count _contenu}, {_i = _i + 1}] do
	{
		private ["_objet"];
		_objet = _contenu select _i;

		if !((typeOf _objet) in _tab_objets) then
		{
			_tab_objets = _tab_objets + [typeOf _objet];
			_tab_quantite = _tab_quantite + [1];
		}
		else
		{
			private ["_idx_objet"];
			_idx_objet = _tab_objets find (typeOf _objet);
			_tab_quantite set [_idx_objet, ((_tab_quantite select _idx_objet) + 1)];
		};

		// Adding the object of the current load
		for [{_j = 0}, {_j < count R3F_LOG_CFG_objets_transportables}, {_j = _j + 1}] do
		{
			if (_objet isKindOf (R3F_LOG_CFG_objets_transportables select _j select 0)) exitWith
			{
				_chargement_actuel = _chargement_actuel + (R3F_LOG_CFG_objets_transportables select _j select 1);
			};
		};
	};

	// Search for the maximum capacity of the carrier
	_chargement_maxi = 0;
	for [{_i = 0}, {_i < count R3F_LOG_CFG_transporteurs}, {_i = _i + 1}] do
	{
		if (_transporteur isKindOf (R3F_LOG_CFG_transporteurs select _i select 0)) exitWith
		{
			_chargement_maxi = (R3F_LOG_CFG_transporteurs select _i select 1);
		};
	};


	// View content in the interface
	#include "dlg_constantes.h"
	private ["_ctrl_liste"];

	_dlg_contenu_vehicule = findDisplay R3F_LOG_IDD_dlg_contenu_vehicule;

	/**** START translations labels ****/
	(_dlg_contenu_vehicule displayCtrl R3F_LOG_IDC_dlg_CV_titre) ctrlSetText STR_R3F_LOG_dlg_CV_titre;					//"Content of vehicle"
	(_dlg_contenu_vehicule displayCtrl R3F_LOG_IDC_dlg_CV_credits) ctrlSetText STR_R3F_ARTY_LOG_nom_produit;
	(_dlg_contenu_vehicule displayCtrl R3F_LOG_IDC_dlg_CV_btn_decharger) ctrlSetText STR_R3F_LOG_dlg_CV_btn_decharger;	//"Unload"
	(_dlg_contenu_vehicule displayCtrl R3F_LOG_IDC_dlg_CV_btn_fermer) ctrlSetText STR_R3F_LOG_dlg_CV_btn_fermer;		//"Cancel"
	/**** END of the translations of labels ****/

	(_dlg_contenu_vehicule displayCtrl R3F_LOG_IDC_dlg_CV_capacite_vehicule) ctrlSetText (format [STR_R3F_LOG_dlg_CV_capacite_vehicule, _chargement_actuel, _chargement_maxi]);

	_ctrl_liste = _dlg_contenu_vehicule displayCtrl R3F_LOG_IDC_dlg_CV_liste_contenu;

	if (count _tab_objets == 0) then
	{
		(_dlg_contenu_vehicule displayCtrl R3F_LOG_IDC_dlg_CV_btn_decharger) ctrlEnable false;
	}
	else
	{
		// Insertion of each type of objects in the list
		for [{_i = 0}, {_i < count _tab_objets}, {_i = _i + 1}] do
		{
			private ["_index", "_icone"];

			_icone = getText (configFile >> "CfgVehicles" >> (_tab_objets select _i) >> "icon");

			// If the icon is valid
			if (toString ([toArray _icone select 0]) == "\") then
			{
				_index = _ctrl_liste lbAdd (getText (configFile >> "CfgVehicles" >> (_tab_objets select _i) >> "displayName") + format [" (%1x)", _tab_quantite select _i]);
				_ctrl_liste lbSetPicture [_index, _icone];
			}
			else
			{
				// If the satellite phone is used for artillery PC
				if (!(isNil "R3F_ARTY_active") && (_tab_objets select _i) == "SatPhone") then
				{
					_index = _ctrl_liste lbAdd ("     " + STR_R3F_LOG_nom_pc_arti + format [" (%1x)", _tab_quantite select _i]);
				}
				else
				{
					_index = _ctrl_liste lbAdd ("     " + getText (configFile >> "CfgVehicles" >> (_tab_objets select _i) >> "displayName") + format [" (%1x)", _tab_quantite select _i]);
				};
			};

			_ctrl_liste lbSetData [_index, _tab_objets select _i];
		};
	};

	waitUntil (uiNamespace getVariable "R3F_LOG_dlg_contenu_vehicule");
	R3F_LOG_mutex_local_verrou = false;
};