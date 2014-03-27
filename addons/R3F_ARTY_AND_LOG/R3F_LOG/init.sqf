/**
 * Copyright (C) 2010 madbull ~R3F~
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "config.sqf"

if (isServer) then
{
	// On cr?e le point d'attache qui servira aux attachTo pour les objets ? charger virtuellement dans les v?hicules
	R3F_LOG_PUBVAR_point_attache = "Land_HelipadEmpty_F" createVehicle [0,0,0];
	publicVariable "R3F_LOG_PUBVAR_point_attache";
};

// Un serveur d?di? n'en a pas besoin
if !(isServer && isDedicated) then
{
	// Le client attend que le serveur ai cr?? et publi? la r?f?rence de l'objet servant de point d'attache
	waitUntil {!isNil "R3F_LOG_PUBVAR_point_attache"};

	/** Indique quel objet le joueur est en train de d?placer, objNull si aucun */
	R3F_LOG_joueur_deplace_objet = objNull;

	/** Pseudo-mutex permettant de n'ex?cuter qu'un script de manipulation d'objet ? la fois (true : v?rouill?) */
	R3F_LOG_mutex_local_verrou = false;

	/** Objet actuellement s?lectionner pour ?tre charg?/remorqu? */
	R3F_LOG_objet_selectionne = objNull;

	// On construit la liste des classes des transporteurs dans les quantit?s associ?s (pour les nearestObjects, count isKindOf, ...)
	R3F_LOG_classes_transporteurs = [];

	{
		R3F_LOG_classes_transporteurs = R3F_LOG_classes_transporteurs + [_x select 0];
	} forEach R3F_LOG_CFG_transporteurs;

	// On construit la liste des classes des transportables dans les quantit?s associ?s (pour les nearestObjects, count isKindOf, ...)
	// We construct the list of classes in the associated transportable quantities (for nearestObjects, count isKindOf, ...)
	R3F_LOG_classes_objets_transportables = [];

	{
		R3F_LOG_classes_objets_transportables = R3F_LOG_classes_objets_transportables + [_x select 0];
	} forEach R3F_LOG_CFG_objets_transportables;

	R3F_LOG_FNCT_objet_init = compile preprocessFile "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_init.sqf";
	R3F_LOG_FNCT_heliporteur_init = compile preprocessFile "addons\R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\heliporteur_init.sqf";
	R3F_LOG_FNCT_remorqueur_init = compile preprocessFile "addons\R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorqueur_init.sqf";
	R3F_LOG_FNCT_transporteur_init = compile preprocessFile "addons\R3F_ARTY_AND_LOG\R3F_LOG\transporteur\transporteur_init.sqf";

	/** Indique quel est l'objet concern? par les variables d'actions des addAction */
	R3F_LOG_objet_addAction = objNull;

	// Liste des variables activant ou non les actions de menu
	// List of variables to enable or disable the action menus
	R3F_LOG_action_charger_deplace_valide = false;
	R3F_LOG_action_charger_selection_valide = false;
	R3F_LOG_action_contenu_vehicule_valide = false;

	R3F_LOG_action_remorquer_deplace_valide = false;
	R3F_LOG_action_remorquer_selection_valide = false;

	R3F_LOG_action_heliporter_valide = false;
	R3F_LOG_action_heliport_larguer_valide = false;

	R3F_LOG_action_deplacer_objet_valide = false;
	R3F_LOG_action_remorquer_deplace_valide = false;
	R3F_LOG_action_selectionner_objet_remorque_valide = false;
	R3F_LOG_action_detacher_valide = false;
	R3F_LOG_action_charger_deplace_valide = false;
	R3F_LOG_action_selectionner_objet_charge_valide = false;

	/** Ce fil d'ex?cution permet de diminuer la fr?quence des v?rifications des conditions normalement faites dans les addAction (~60Hz) */
	/** This thread of execution can reduce the frequency of audits conditions normally do in addAction (~ 60Hz) */
	execVM "addons\R3F_ARTY_AND_LOG\R3F_LOG\surveiller_conditions_actions_menu.sqf";
};