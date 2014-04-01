/**
 * Remorque l'objet sélectionné (R3F_LOG_objet_selectionne) é un véhicule
 *
 * @param 0 le remorqueur
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

	_objet = R3F_LOG_objet_selectionne;
	_remorqueur = _this select 0;

	if (!(isNull _objet) && (alive _objet) && !(_objet getVariable "R3F_LOG_disabled")) then
	{
		if (isNull (_objet getVariable "R3F_LOG_est_transporte_par") && (isNull (_objet getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet getVariable "R3F_LOG_est_deplace_par")))) then
		{
			if (_objet distance _remorqueur <= 15) then		// Tow distance was 30, think that is a bit to far.
			{
             	//The vehicle that is driving.
                _tempobj = _remorqueur;		_countTransportedBy = 1;
				while{!isNull(_tempobj getVariable["R3F_LOG_est_transporte_par", objNull])} do {_countTransportedBy = _countTransportedBy + 1; _tempobj = _tempobj getVariable["R3F_LOG_est_transporte_par", objNull];};

                //The vehicle that is being towed.
				_tempobj = _objet;		_countTowedVehicles = 1;
				while{!isNull(_tempobj getVariable["R3F_LOG_remorque", objNull])} do {_countTowedVehicles = _countTowedVehicles + 1; _tempobj = _tempobj getVariable["R3F_LOG_remorque", objNull];};

                if(_countTransportedBy + _countTowedVehicles <= 2) then
                {
                	// Is stored on the network that the vehicle towing something
					_remorqueur setVariable ["R3F_LOG_remorque", _objet, true];
					// It also stores on the network that the barrel is attached to the trailer
					_objet setVariable ["R3F_LOG_est_transporte_par", _remorqueur, true];

					player playMove "AinvPknlMstpSlayWrflDnon_medic";

					player addEventHandler ["AnimDone",
					{
						if (_this select 1 == "AinvPknlMstpSlayWrflDnon_medic") then
						{
							player switchMove "";
							player removeAllEventHandlers "AnimDone";
						};
					}];

					if ((getPosASL player) select 2 > 0) then
					{

						// Placing the player on the side of the vehicle, which helps prevent injury and makes it more realistic animation
						player attachTo [_remorqueur, [
							(boundingBox _remorqueur select 1 select 0),
							(boundingBox _remorqueur select 0 select 1) + 1,
							(boundingBox _remorqueur select 0 select 2) - (boundingBox player select 0 select 2)
						]];

						player setDir 270;
						player setPos (getPos player);
						sleep 0.05;
						detach player;
					};

					sleep 2;

					_compensateY = 0;
					_compensateZ = 0;

					if (_remorqueur isKindOf "Boat_Armed_01_base_F" && !(_objet isKindOf "Boat_Armed_01_base_F")) then
					{
						_compensateZ = _compensateZ + 1.25;
					};
					if (!(_remorqueur isKindOf "Boat_Armed_01_base_F") && _objet isKindOf "Boat_Armed_01_base_F") then
					{
						_compensateZ = _compensateZ - 0.5;
					};
					if (_objet isKindOf "Heli_Light_01_base_F") then
					{
						_compensateY = _compensateY - 1.25;
						_compensateZ = _compensateZ - 2.2;
					};
					if (_objet isKindOf "Heli_Light_02_base_F") then
					{
						_compensateY = _compensateY + 3;
						_compensateZ = _compensateZ + 0.25;
					};
					if (_objet isKindOf "Heli_Transport_01_base_F") then
					{
						_compensateY = _compensateY + 1.25;
					};
					if (_objet isKindOf "Heli_Attack_02_base_F") then
					{
						_compensateZ = _compensateZ + 0.2;
					};
					if (_objet isKindOf "Truck_01_base_F") then
					{
						_compensateY = _compensateY + 10;
					};

					// Attached to the rear of the vehicle at ground level
					_objet attachTo [_remorqueur, [
						0,

						((boundingCenter _objet select 1) - (boundingCenter _remorqueur select 1)) +
						((boundingBoxReal _remorqueur select 0 select 1) + (boundingCenter _remorqueur select 1)) +
						((boundingBoxReal _objet select 0 select 1) + (boundingCenter _objet select 1)) - 0.11 + _compensateY,

						((boundingCenter _objet select 2) - (boundingCenter _remorqueur select 2)) +
						((boundingBoxReal _remorqueur select 0 select 2) + (boundingCenter _remorqueur select 2)) +
						((boundingBoxReal _objet select 1 select 2) - (boundingCenter _objet select 2)) + 0.1 + _compensateZ
					]];

					R3F_LOG_objet_selectionne = objNull;

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
                }
				else
				{
                	player globalChat "You can't tow more than one vehicle.";
                };
			}
			else
			{
				player globalChat format [STR_R3F_LOG_action_remorquer_selection_trop_loin, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"The object ""%1"" is too far from the vehicle to be towed."
			};
		}
		else
		{
			player globalChat format [STR_R3F_LOG_action_remorquer_selection_objet_transporte, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];		//"The object ""%1"" is in transit."
		};
	};

	R3F_LOG_mutex_local_verrou = false;
};