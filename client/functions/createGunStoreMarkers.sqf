//	@file Name: createGunStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [CAD] Krycek

_gunStores = ["gunStore1", "gunStore2", "gunStore3", "gunStore4"];

//Creates the markers around gun stores.
{
	_unit = missionNamespace getVariable _x;

	// Circle zone															// <----- Disabled since the zones are now shown and used in the Territory System and makes more sense that way.
/*    _markerName = format["marker_shop_zone_%1",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, getPos _unit];
	_markerName setMarkerShapeLocal "ELLIPSE";
    _markerName setMarkerColorLocal "ColorBlue";
	_markerName setMarkerSizeLocal [100, 100];
	_markerName setMarkerBrushLocal "Grid";
	_markerName setMarkerAlphaLocal 0.5;
*/
	// Gun store title
    _markerName = format["marker_shop_title_%1",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, getPos _unit];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerTypeLocal "mil_dot";
    _markerName setMarkerColorLocal "ColorRed";
	_markerName setMarkerSizeLocal [1,1];
	_markerName setMarkerTextLocal "Gun Store";

} forEach _gunStores;
