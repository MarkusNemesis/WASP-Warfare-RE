//// Data
//// LightVehicle Data
//// DeraKOren
///////////////////////

// this: side

private ["_Side", "_BlueforLightVeh", "_OpforLightVeh", "_ResisLightVeh", "_CivilLightVeh", "_result", "_VehArray"];

/// Bluefor
///////////
_BlueforLightVeh =
	[ 
	  //[ L 	, Type						, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	, AiUse	]
	  //[ 0 	, 1							, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	, 9		]
		["LF0"	, "B_MRAP_01_F"				, "PRIVATE"		, 2		, 300	, 10	, true	, false	, false	, false	],
		["LF1"	, "B_MRAP_01_hmg_F"			, "PRIVATE"		, 3		, 500	, 20	, true	, true	, false	, true	],
		["LF3"	, "B_MRAP_01_gmg_F"			, "PRIVATE"		, 4		, 700	, 25	, true	, true	, false	, true	],
		["LF0"	, "B_Quadbike_01_F"			, "PRIVATE"		, 1		, 150	, 10	, true	, false	, false	, false	],
		["LF0"	, "B_Truck_01_transport_F"	, "PRIVATE"		, 1		, 400	, 20	, true	, false	, false	, false	],
		["LF1"	, "B_Truck_01_covered_F"	, "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	],	
		["LF1"	, "B_Truck_01_box_F"	    , "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	],
		["LF2"	, "B_Truck_01_mover_F"	    , "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	],
		["LF2"	, "B_Truck_01_medical_F"	, "PRIVATE"		, 1		, 550	, 20	, true	, false	, false	, true	],
		["LF3"	, "B_Truck_01_Repair_F"	    , "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, true	],
		["LF2"	, "B_Truck_01_fuel_F"	    , "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	],
		["LF2"	, "B_Truck_01_ammo_F"	    , "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	],
		["LF1"	, "B_G_Offroad_01_armed_F"	, "PRIVATE"		, 2		, 400	, 30	, true	, true	, true	, true	]

	];
	
//// Opfor
///////////
_OpforLightVeh	=
	[
	  //[ L 	, Type						, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	, AiUse	]
	  //[ 0 	, 1							, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	, 9		]
		["LF0"	, "O_MRAP_02_F"				, "PRIVATE"		, 2		, 300	, 10	, true	, false	, false	, false	],
		["LF1"	, "O_MRAP_02_hmg_F"			, "PRIVATE"		, 3		, 500	, 20	, true	, true	, false	, true	],
		["LF3"	, "O_MRAP_02_gmg_F"			, "PRIVATE"		, 4		, 700	, 25	, true	, true	, false	, true	],
		["LF0"	, "O_Quadbike_01_F"			, "PRIVATE"		, 1		, 150	, 10	, true	, false	, false	, false	],
		["LF0"	, "O_Truck_02_transport_F"	, "PRIVATE"		, 1		, 400	, 20	, true	, false	, false	, false	],
		["LF1"	, "O_Truck_02_covered_F"	, "PRIVATE"		, 1		, 400	, 20	, true	, false	, false	, false	],
		["LF1"	, "O_Truck_02_box_F"		, "PRIVATE"		, 1		, 400	, 20	, true	, false	, false	, false	],
		["LF2"	, "O_Truck_02_medical_F"	, "PRIVATE"		, 1		, 550	, 20	, true	, false	, false	, true	],
		["LF3"	, "O_Truck_02_repair_F"		, "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, true	],
		["LF2"	, "O_Truck_02_fuel_F"		, "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	],
		["LF2"	, "O_Truck_02_Ammo_F"		, "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	],
		["LF2"	, "O_Truck_03_transport_F"	, "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	],
		["LF2"	, "O_Truck_03_covered_F"	, "PRIVATE"		, 1		, 450	, 20	, true	, false	, false	, false	]
	];
	
//// Resistance
////////////////
_ResisLightVeh	=
	[ 
	  //[ L 	, Type							, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	, AiUse	]
	  //[ 0 	, 1								, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	, 9		]
		["LF0"	, "I_MRAP_03_F"					, "PRIVATE"		, 2		, 300	, 20	, true	, false	, false	, false	],
		["LF1"	, "I_MRAP_03_hmg_F"				, "PRIVATE"		, 3		, 500	, 30	, true	, true	, true	, true	],
		["LF3"	, "I_MRAP_03_gmg_F"				, "PRIVATE"		, 4		, 700	, 45	, true	, true	, true	, true	],
		["LF0"	, "I_Quadbike_01_F"				, "PRIVATE"		, 1		, 150	, 10	, true	, false	, false	, false	],
		["LF0"	, "I_Quadbike_01_F"				, "PRIVATE"		, 1		, 150	, 10	, true	, false	, false	, false	],
		["LF0"	, "I_G_offroad"					, "PRIVATE"		, 1		, 250	, 10	, true	, false	, false	, false	],
		["LF1"	, "I_G_offroad_armed"			, "PRIVATE"		, 1		, 250	, 10	, true	, false	, false	, true	],
		["LF2"	, "I_Truck_02_medical_F"		, "PRIVATE"		, 1		, 400	, 25	, true	, false	, false	, false	],
		["LF2"	, "I_Truck_02_box_F"			, "PRIVATE"		, 1		, 400	, 25	, true	, false	, false	, false	],
		["LF2"	, "I_Truck_02_fuel_F"			, "PRIVATE"		, 1		, 400	, 25	, true	, false	, false	, false	],
		["LF2"	, "I_Truck_02_ammo_F"        	, "PRIVATE"		, 1		, 400	, 25	, true	, false	, false	, false	]
	];
	
//// Civilian
////////////////
_CivilLightVeh	=
	[ 
	  //[ L 	, Type						, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	, AiUse	]
	  //[ 0 	, 1							, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	, 9		]
		["LF0"	, "C_Quadbike_01_F"			, "PRIVATE"		, 1		, 150	, 10	, true	, false	, false	, false	],
		["LF1"	, "c_offroad_01_armed"		, "PRIVATE"		, 1		, 250	, 10	, true	, false	, false	, true	],
		["LF0"	, "C_Offroad_01_F"			, "PRIVATE"		, 1		, 250	, 10	, true	, false	, false	, false	],
		["LF1"	, "C_Offroad_01_PA_F"		, "PRIVATE"		, 1		, 250	, 10	, true	, false	, false	, false	],
		["LF1"	, "C_Offroad_01_RP_F"		, "PRIVATE"		, 1		, 250	, 10	, true	, false	, false	, false	]
	];
	
_VehArray	= switch (_this) do
{
    case resistance	: {_ResisLightVeh};
	case west		: {_BlueforLightVeh};
	case east		: {_OpforLightVeh};
	case civilian	: {_CivilLightVeh};
};

_result = _VehArray;
_result