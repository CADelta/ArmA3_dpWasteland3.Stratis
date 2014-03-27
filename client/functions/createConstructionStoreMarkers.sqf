//	@file Name: createConstructionStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek

_constructionStores = ["constructionStore1","constructionStore2","constructionStore3","constructionStore4"];

//Creates the markers around general stores.
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
	_markerName setMarkerTextLocal "Construction Store";

} forEach _constructionStores;
