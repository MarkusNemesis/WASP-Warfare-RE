//// Data
//// Air Vehicles
//// DeraKOren
//////////////////

// this: side

private ["_BHelicopters", "_OHelicopters", "_IHelicopters", "_VehArray"];

//// Bluefor
////////////
_BHelicopters =
	[ 
	  //[ L 	, Type							, Crew Rank		, Supply, Money		, Time	, Driver, Guner	, Comm 	]
	  //[ 0 	, 1								, 2				, 3		, 4			, 5		, 6		, 7		, 8	   	]
		["AF3"	, "B_Heli_Attack_01_F"			, "LIEUTENANT"	, 50	, 30000		, 25	, true	, true	, false	],
		["AF1"	, "B_Heli_Transport_01_F"		, "LIEUTENANT"	, 20	, 10000		, 20	, true	, true	, false	],
		["AF0"	, "B_Heli_Light_01_F"			, "LIEUTENANT"	, 15	, 7500		, 15	, true	, true	, false	],
		["AF2"	, "B_Heli_Light_01_armed_F"		, "LIEUTENANT"	, 30	, 10000		, 20	, true	, true	, false	],
		["AF2"	, "B_Heli_Transport_01_camo_F"	, "LIEUTENANT"	, 20	, 12000		, 20	, true	, true	, false	],
		["AF2"	, "B_Plane_CAS_01_F"			, "LIEUTENANT"	, 20	, 35000		, 25	, true	, true	, false	]
	];

//// Opfor
///////////	
_OHelicopters =
	[ 
	  //[ L 	, Type							, Crew Rank		, Supply, Money		, Time	, Driver, Guner	, Comm 	]
	  //[ 0 	, 1								, 2				, 3		, 4			, 5		, 6		, 7		, 8	   	]
		["AF3"	, "O_Heli_Attack_02_F"			, "LIEUTENANT"	, 50	, 30000		, 25	, true	, true	, false	],
		["AF3"	, "O_Heli_Attack_02_black_F"	, "LIEUTENANT"	, 50	, 33000		, 25	, true	, true	, false	],
		["AF0"	, "O_Heli_Light_02_F"			, "LIEUTENANT"	, 2	    , 12000		, 20	, true	, true	, false	],
		["AF1"	, "O_Heli_Light_02_unarmed_F"	, "LIEUTENANT"	, 30	, 10000		, 20	, true	, true	, false	],
		["AF2"	, "O_Plane_CAS_02_F"			, "LIEUTENANT"	, 30	, 35000		, 25	, true	, true	, false	]
	];

//// Resistance
///////////////	
_IHelicopters =
	[ 
	  //[ L 	, Type							, Crew Rank		, Supply, Money		, Time	, Driver, Guner	, Comm 	]
	  //[ 0 	, 1								, 2				, 3		, 4			, 5		, 6		, 7		, 8	   	]
		["AF1"	, "I_Heli_Transport_02_F"		, "LIEUTENANT"	, 20	, 8000		, 12	, true	, false	, false	],
		["AF2"	, "I_Plane_Fighter_03_AA_F"	    , "LIEUTENANT"	, 20	, 8000		, 12	, true	, false	, false	],
		["AF2"	, "I_Plane_Fighter_03_CAS_F"	, "LIEUTENANT"	, 20	, 8000		, 12	, true	, false	, false	],
		["AF2"	, "I_Heli_light_03_unarmed_F"	, "LIEUTENANT"	, 20	, 8000		, 12	, true	, false	, false	]
	]; 
	
_VehArray	= switch (_this) do
{
    case resistance	: {_IHelicopters};
	case west		: {_BHelicopters};
	case east		: {_OHelicopters};
	case civilian	: {[]};
};

_result = _VehArray;
_result