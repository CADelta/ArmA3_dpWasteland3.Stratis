/**
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

[] spawn
{
	#include "R3F_ARTY_disable_enable.sqf"
	#include "R3F_LOG_disable_enable.sqf"
	
	
	call compile preprocessFile format ["addons\R3F_ARTY_AND_LOG\en_strings_lang.sqf"];
	
	if (isServer) then
	{
		// Service offert par le serveur : orienter un objet (car setDir est à argument local)
		R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir =
		{
			private ["_objet", "_direction"];
			_objet = _this select 1 select 0;
			_direction = _this select 1 select 1;
			
			// Orienter l'objet et broadcaster l'effet
			_objet setDir _direction;
			_objet setPos (getPos _objet);
		};
		"R3F_ARTY_AND_LOG_PUBVAR_setDir" addPublicVariableEventHandler R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
	};
	
	#ifdef R3F_ARTY_enable
		#include "R3F_ARTY\init.sqf"
		R3F_ARTY_active = true;
	#endif
	
	#ifdef R3F_LOG_enable
		#include "R3F_LOG\init.sqf"
		R3F_LOG_active = true;
	#else
		// Pour les actions du PC d'arti
		R3F_LOG_joueur_deplace_objet = objNull;
	#endif
	
	// Auto-détection permanente des objets sur le jeu
	if (isDedicated) then
	{
		// Version allégée pour le serveur dédié
		//execVM "addons\R3F_ARTY_AND_LOG\surveiller_nouveaux_objets_dedie.sqf";
	}
	else
	{
		execVM "addons\R3F_ARTY_AND_LOG\surveiller_nouveaux_objets.sqf";
		
		// Disable R3F on map objects that are not network-synced
		//{
		//	_x setVariable ["R3F_LOG_disabled", true];
		//} forEach ((nearestObjects [[0,0], R3F_LOG_CFG_objets_deplacables, 99999]) - (allMissionObjects "All"));
	};
};