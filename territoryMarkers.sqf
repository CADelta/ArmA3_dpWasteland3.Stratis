//  @file Name: territoryMarkers.sqf
//  @file Author: [CAD] Krycek

// Territory system definitions. See territory/README.md for more details.
//
// Format is:
// 1 - Territory marker name. Must begin with 'TERRITORY_'
// 2 - Descriptive name
// 3 - Monetary value
// 4 - Territory category, currently unused. See territory/README.md for details.

config_territory_markers = compileFinal str
[
	["TERRITORY_AGIA_NORTH", "North Agia Marina", 50, "TOWN"],
	["TERRITORY_AGIA_SOUTH", "South Agia Marina", 50, "TOWN"],
	["TERRITORY_MILITARY_RANGE", "Military Range", 75, "MILITARY"],
	["TERRITORY_AGIA_GUNSTORE", "Agia Marina Gun Store", 100, "MILITARY"],
	["TERRITORY_AGIOS_CEPHAS", "Agios Cephas", 25, "TOWN"],
	["TERRITORY_AGIOS_IOANNIS", "Agios Ioannis", 25, "TOWN"],
	["TERRITORY_AIRBASE_NORTH", "North Stratis Airbase", 100, "AIRBASE"],
	["TERRITORY_AIRBASE_SOUTH", "South Stratis Airbase", 100, "AIRBASE"],
	["TERRITORY_OLD_OUTPOST", "Old Outpost", 75, "MILITARY"],
	["TERRITORY_OLD_OUTPOST_CONSTRUCTION", "Old Outpost Construction Store", 50, "TOWN"],
	["TERRITORY_AIRSTATION_MIKE", "Air Station Mike", 75, "MILITARY"],
	["TERRITORY_CAMP_MAXWELL", "Camp Maxwell", 100, "MILITARY"],
	["TERRITORY_CAMP_ROGAIN", "Camp Rogain", 100, "MILITARY"],
	["TERRITORY_CAMP_TEMPEST", "Camp Tempest", 75, "MILITARY"],
	["TERRITORY_GIRNA", "Girna", 50, "TOWN"],
	["TERRITORY_KAMINO_FIRING_RANGE", "Kamino Firing Range", 75, "MILITARY"],
	["TERRITORY_KAMINO_SETTLEMENT", "Kamino Settlement", 50, "TOWN"],
	["TERRITORY_KILL_FARM", "Kill Farm", 50, "TOWN"],
	["TERRITORY_LIMERI_BAY", "Limeri Bay", 25, "TOWN"],
	["TERRITORY_LZ_BALDY", "LZ Baldy", 25, "MILITARY"],
	["TERRITORY_LZ_CONNOR", "LZ Connor", 100, "MILITARY"],
	["TERRITORY_RADIO_TOWERS", "Radio Towers", 100, "MILITARY"],
	["TERRITORY_NEW_TOWN", "New Town", 50, "TOWN"],
	["TERRITORY_OLD_TOWN", "Old Town", 50, "TOWN"],
	["TERRITORY_OLD_GUNSTORE", "Old Gun Store", 50, "TOWN"],
	["TERRITORY_TSOUKALIA", "Tsoukalia", 25, "TOWN"],
	["TERRITORY_JAY_COVE", "Jay Cove", 25, "TOWN"],
	["TERRITORY_THE_SPARTAN", "The Spartan", 25, "TOWN"],
	["TERRITORY_AGIA_GENSTORE", "Agia Marina General Store", 50, "MILITARY"]
];
