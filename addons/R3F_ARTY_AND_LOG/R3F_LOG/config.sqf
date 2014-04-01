
/******************************************************************************************************************************
* This file contains the configuration variables of the logistics system.													  *
* Important note : All the classes names which inherits from the ones used in configuration variables will be also available. *
******************************************************************************************************************************/

diag_log format["****** R3F Config - Started ******"];

// Can Tow, Tow-able objects:
R3F_LOG_CFG_remorqueurs = [
    "Offroad_01_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
    "Truck_F",
    "Wheeled_APC_F",
	"APC_Tracked_01_base_F",
    "APC_Tracked_02_base_F",
    "APC_Tracked_03_base_F"
];


// Tow-able objects:
R3F_LOG_CFG_objets_remorquables = [
    "Offroad_01_base_F",
	"C_SUV_01_F",
	"Hatchback_01_base_F",
    "Truck_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
    "Wheeled_APC_F",
	"APC_Tracked_01_base_F",
    "APC_Tracked_02_base_F",
    "APC_Tracked_03_base_F",
    "Helicopter_Base_F",
	"Plane_Base_F"
];


// Can Lift, lift-able object:
R3F_LOG_CFG_heliporteurs = ["Helicopter_Base_F"];


// Lift-able objects:
R3F_LOG_CFG_objets_heliportables = [
    "Offroad_01_base_F",
	"C_SUV_01_F",
	"Hatchback_01_base_F",
    "Truck_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
    "Wheeled_APC_F",
	"APC_Tracked_01_base_F",
    "APC_Tracked_02_base_F",
    "APC_Tracked_03_base_F",
	"MBT_01_base_F",
    "MBT_02_base_F",
    "MBT_03_base_F",
	"O_Boat_Armed_01_hmg_F",
	"B_Boat_Armed_01_minigun_F",
	"I_Boat_Armed_01_minigun_F",
	"B_G_Boat_Transport_01_F",
	"B_Boat_Transport_01_F",
	"O_Boat_Transport_01_F",
	"I_Boat_Transport_01_F",
	"B_Lifeboat",
	"O_Lifeboat",
	"C_Rubberboat",
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_rescue_F",
	"C_Boat_Civil_01_police_F",
	"Land_Cargo20_military_green_F",
	"Land_Cargo40_military_green_F",
	"Land_Cargo_Tower_V1_F"
];


/********************************************* LOAD IN VEHICLE ****************************************************************
* List of class names of (ground or air) vehicles which can transport transportable objects.								  *
* The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).				  *
*******************************************************************************************************************************
* Note : the priority of the declaration of capacity to another corresponds to their order in the tables.					  *
*   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).	   	  *
*   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40, *
*   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones	  *
*   in "Truck", will have a capacity of 40.																					  *
******************************************************************************************************************************/

// Can Transport, transportable objects:
R3F_LOG_CFG_transporteurs = [
//	Trucks & Vans
	["Truck_01_base_F", 30],
	["Truck_03_base_F", 30],
	["Truck_02_base_F", 25],
	["Van_01_base_F", 10],
//	MRAPs
	["MRAP_01_base_F", 15],
	["MRAP_02_base_F", 15],
	["MRAP_03_base_F", 15],
//	Light Armour
	["Wheeled_APC_F", 20],
	["APC_Tracked_01_base_F", 25],
	["APC_Tracked_02_base_F", 25],
	["APC_Tracked_03_base_F", 25],
//	Heavy Armour
	["MBT_01_base_F", 20],
	["MBT_02_base_F", 20],
	["MBT_03_base_F", 20],
//	Helis
	["Heli_Light_01_base_F", 10],			// MH-9 & AH-9
	["Heli_Transport_01_base_F", 25],		// UH-80
	["Heli_Attack_01_base_F", 5],			// AH-99
	["Heli_Light_02_base_F", 15],			// PO-30
	["Heli_Attack_02_base_F", 15],			// Mi-48
	["Heli_Transport_02_base_F", 30],		// CH-49
	["I_Heli_light_03_base_F", 20],			// WY-55
//	Offroads
	["Offroad_01_base_F", 15],
//	Cars
	["SUV_01_base_F", 10],
	["Hatchback_01_base_F", 5],
//	ATVs
    ["Quadbike_01_base_F", 5],
//	Boats
	["Ship_F", 5],
//	Boxes and Containers
	["Land_Pallet_MilBoxes_F", 25],
	["Land_CargoBox_V1_F", 40],
	["Land_Cargo20_military_green_F", 100],
	["Land_Cargo40_military_green_F", 200]
];


/*********************************************************************************************************
* List of class names of transportable objects.															 *
* The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles). *
*********************************************************************************************************/

// Transportable objects:
R3F_LOG_CFG_objets_transportables =  [
//	Crates / containers
	["NATO_Box_Base", 5],
	["EAST_Box_Base", 5],
	["Box_Ammo_F", 5],
	["Land_Box_AmmoOld_F", 5],
	["IND_Box_Base", 5],
//	Structures
	["Land_Sacks_goods_F", 5],
	["Land_Pipes_small_F", 5],
	["Land_Pipes_large_F", 5],
	["Land_MetalBarrel_F", 5],
	["Land_IronPipes_F", 5],
	["Land_ConcretePipe_F", 15],
	["Land_BagFence_Corner_F", 2],
	["Land_BagFence_End_F", 2],
	["Land_BagFence_Long_F", 5],
	["Land_BagFence_Round_F", 5],
	["Land_BagFence_Short_F", 2],
	["Land_CncBarrier_F", 5],
	["Land_CncBarrier_stripes_F", 5],
	["Land_CncBarrierMedium_F", 5],
	["Land_CncBarrierMedium4_F", 15],
	["Land_CncWall1_F", 10],
	["Land_CncWall4_F", 20],
	["Land_CncShelter_F", 10],
	["Land_HBarrier_1_F", 5],
	["Land_HBarrier_3_F", 10],
	["Land_HBarrier_5_F", 15],
	["Land_HBarrierBig_F", 25],
	["Land_HBarrierWall_corner_F", 15],
	["Land_HBarrierWall4_F", 10],
	["Land_HBarrierWall6_F", 15],
	["Land_HBarrierWall_corridor_F", 15],
	["Land_HBarrierTower_F", 25],
	["Land_Crash_barrier_F", 5],
	["Land_LampHalogen_F", 10],
	["Land_CanisterFuel_F", 2],
	["Land_CanisterPlastic_F", 2],
	["Land_Cargo_House_V1_F", 20],
	["Land_Cargo_HQ_V1_F", 40],
	["Land_Cargo_Patrol_V1_F", 30],
	["Land_Unfinished_Building_01_F", 30],
	["Land_Unfinished_Building_02_F", 40],
	["Land_BarGate_F", 10],
	["Land_RampConcrete_F", 20],
	["Land_RampConcreteHigh_F", 30],
	["Land_Obstacle_Bridge_F", 5],
	["Land_New_WiredFence_10m_F", 5],
	["Land_BagBunker_Small_F", 15],
	["Land_BagBunker_Large_F", 30],
	["Land_BagBunker_Tower_F", 20],
	["Land_Concrete_SmallWall_4m_F", 5],
	["Land_Concrete_SmallWall_8m_F", 10],
	["Land_i_Garage_V1_F", 20],
	["Land_dp_smallTank_F", 30],
	["Land_dp_bigTank_F", 40],
	["Land_ReservoirTower_F", 60],
	["Land_Cargo_Tower_V1_F", 120],
	["Land_FuelStation_Feed_F", 25]
];


/************* MOVABLE-BY-PLAYER OBJECTS **************
* List of class names of objects moveables by player. *
******************************************************/

// Moveable objects:
R3F_LOG_CFG_objets_deplacables = [
	"Quadbike_01_base_F",
	"ReammoBox_F",
	"Land_Pallet_MilBoxes_F",
	"Land_CargoBox_V1_F",
	"Cargo_base_F",
	"Land_Sacks_goods_F",
	"Land_Pipes_small_F",
	"Land_Pipes_large_F",
	"Land_MetalBarrel_F",
	"Land_IronPipes_F",
	"Land_ConcretePipe_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BagBunker_Small_F",
	"Land_CncBarrier_F",
	"Land_CncBarrierMedium_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_HBarrier_1_F",
	"Land_Crash_barrier_F",
	"Land_LampHalogen_F",
	"Land_CanisterFuel_F",
	"Land_CanisterPlastic_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_BarGate_F",
	"Land_RampConcrete_F",
	"Land_RampConcreteHigh_F",
	"Land_Obstacle_Bridge_F",
	"Land_New_WiredFence_10m_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Tower_F",
	"Land_CncBarrier_stripes_F",
	"Land_CncShelter_F",
	"Land_Concrete_SmallWall_4m_F",
	"Land_Concrete_SmallWall_8m_F",
	"Land_HBarrierWall_corner_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrierWall_corridor_F",
	"Land_HBarrierTower_F",
	"Land_i_Garage_V1_F",
	"Land_Unfinished_Building_01_F",
	"Land_Unfinished_Building_02_F",
	"Land_dp_smallTank_F",
	"Land_dp_bigTank_F",
	"Land_ReservoirTower_F",
	"Land_Cargo_Tower_V1_F",
	"Land_FuelStation_Feed_F"
];

diag_log format["****** R3F Config - Ended Successfully ******"];
