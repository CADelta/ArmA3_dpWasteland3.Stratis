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
	["TERRITORY_AGIA_NORTH", "North Agia Marina", 20, "TOWN"],
	["TERRITORY_AGIA_SOUTH", "South Agia Marina", 20, "TOWN"],
	["TERRITORY_MILITARY_RANGE", "Military Range", 30, "MILITARY"],
	["TERRITORY_AGIA_GUNSTORE", "Agia Marina Gun Store", 50, "MILITARY"],
	["TERRITORY_AGIOS_CEPHAS", "Agios Cephas", 10, "TOWN"],
	["TERRITORY_AGIOS_IOANNIS", "Agios Ioannis", 10, "TOWN"],
	["TERRITORY_AIRBASE_NORTH", "North Stratis Airbase", 50, "AIRBASE"],
	["TERRITORY_AIRBASE_SOUTH", "South Stratis Airbase", 50, "AIRBASE"],
	["TERRITORY_OLD_OUTPOST", "Old Outpost", 30, "MILITARY"],
	["TERRITORY_OLD_OUTPOST_CONSTRUCTION", "Old Outpost Construction Store", 20, "TOWN"],
	["TERRITORY_AIRSTATION_MIKE", "Air Station Mike", 30, "MILITARY"],
	["TERRITORY_CAMP_MAXWELL", "Camp Maxwell", 50, "MILITARY"],
	["TERRITORY_CAMP_ROGAIN", "Camp Rogain", 50, "MILITARY"],
	["TERRITORY_CAMP_TEMPEST", "Camp Tempest", 30, "MILITARY"],
	["TERRITORY_GIRNA", "Girna", 20, "TOWN"],
	["TERRITORY_KAMINO_FIRING_RANGE", "Kamino Firing Range", 30, "MILITARY"],
	["TERRITORY_KAMINO_SETTLEMENT", "Kamino Settlement", 20, "TOWN"],
	["TERRITORY_KILL_FARM", "Kill Farm", 20, "TOWN"],
	["TERRITORY_LIMERI_BAY", "Limeri Bay", 10, "TOWN"],
	["TERRITORY_LZ_BALDY", "LZ Baldy", 10, "MILITARY"],
	["TERRITORY_LZ_CONNOR", "LZ Connor", 50, "MILITARY"],
	["TERRITORY_RADIO_TOWERS", "Radio Towers", 50, "MILITARY"],
	["TERRITORY_NEW_TOWN", "New Town", 20, "TOWN"],
	["TERRITORY_OLD_TOWN", "Old Town", 20, "TOWN"],
	["TERRITORY_OLD_GUNSTORE", "Old Gun Store", 20, "TOWN"],
	["TERRITORY_TSOUKALIA", "Tsoukalia", 10, "TOWN"],
	["TERRITORY_JAY_COVE", "Jay Cove", 10, "TOWN"],
	["TERRITORY_THE_SPARTAN", "The Spartan", 10, "TOWN"],
	["TERRITORY_AGIA_GENSTORE", "Agia Marina General Store", 20, "MILITARY"]
];
