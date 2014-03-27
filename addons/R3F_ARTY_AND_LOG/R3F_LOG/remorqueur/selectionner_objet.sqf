/**
 * S?lectionne un objet ? remorquer
 *
 * @param 0 l'objet ? s?lectionner
 */

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;

	R3F_LOG_objet_selectionne = _this select 0;
	player globalChat format [STR_R3F_LOG_action_selectionner_objet_remorque_fait, getText (configFile >> "CfgVehicles" >> (typeOf R3F_LOG_objet_selectionne) >> "displayName")];		//"Now select the vehicle in which to load the object ""%1""..."

	R3F_LOG_mutex_local_verrou = false;
};