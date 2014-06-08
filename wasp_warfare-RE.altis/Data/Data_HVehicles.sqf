//// Data
//// Heavy Vehicle
//// DeraKOren
//////////////////

private ["_Side", "_BlueforHeavyVeh", "_OpforHeavyVeh", "_ResisHeavyVeh", "_CivilHeavyVeh", "_result", "_VehArray"];

/// Bluefor
///////////
_BlueforHeavyVeh =
	[ 
	  //[ L 	, Type							, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	, AiUse	]
	  //[ 0 	, 1								, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	, 9		]
		["HF1"	, "B_APC_Wheeled_01_cannon_F" 	, "PRIVATE"		, 10	, 1900	, 20	, true	, true	, true	, true	],
		["HF0"	, "B_APC_Tracked_01_rcws_F" 	, "PRIVATE"		, 20	, 800	, 25	, true	, true	, true	, true	],
		["HF3"	, "B_MBT_01_cannon_F" 			, "PRIVATE"		, 20	, 5000	, 25	, true	, true	, true	, true	],
		["HF3"	, "B_APC_Tracked_01_AA_F" 		, "PRIVATE"		, 20	, 6000	, 25	, true	, true	, true	, true	],
		["HF3"	, "B_MBT_01_arty_F" 			, "PRIVATE"	    , 20	, 7500	, 25	, true	, true	, true	, false	],
		["HF3"	, "B_MBT_01_mlrs_F" 			, "PRIVATE"	    , 20	, 7500	, 25	, true	, true	, true	, true	],
		["HF0"	, "B_APC_Tracked_01_CRV_F" 		, "PRIVATE"		, 20	, 1000	, 25	, true	, true	, true	, false	],
		["HF2"	, "B_MBT_01_TUSK_F"				, "PRIVATE"		, 20	, 5500	, 25	, true	, true	, true	, false	]
	];
	
//// Opfor
///////////
_OpforHeavyVeh	=
	[
	  //[ L 	, Type							, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	, AiUse	]
	  //[ 0 	, 1								, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	, 9		]
		["HF0"	, "O_APC_Wheeled_02_rcws_F"   	, "PRIVATE"		, 10	, 800	, 20	, true	, true	, true	, true	],
		["HF1"	, "O_APC_Tracked_02_cannon_F" 	, "PRIVATE"		, 20	, 1900	, 25	, true	, true	, true	, true	],
		["HF2"	, "O_MBT_02_cannon_F"			, "PRIVATE"		, 20	, 5000	, 25	, true	, true	, true	, true	],
		["HF3"	, "O_APC_Tracked_02_AA_F" 		, "PRIVATE"		, 20	, 6000	, 25	, true	, true	, true	, true	],
		["HF3"	, "O_MBT_02_arty_F" 			, "PRIVATE"	    , 20	, 7500	, 25	, true	, true	, true	, false	]
	];
	
//// Resistance
////////////////
_ResisHeavyVeh	=
	[
	  //[ L 	, Type							, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	, AiUse	]
	  //[ 0 	, 1								, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	, 9		]
		["HF0"	, "I_APC_Wheeled_03_cannon_F"   , "PRIVATE"		, 10	, 2000  , 20	, true	, true	, true	, true	],
		["HF0"	, "I_APC_tracked_03_cannon_F"   , "PRIVATE"		, 10	, 2000  , 20	, true	, true	, true	, true	],
		["HF0"	, "I_MBT_03_cannon_F"   		, "PRIVATE"		, 10	, 2000  , 20	, true	, true	, true	, true	]
	];
	
//// Civilian
//////////////
_CivilHeavyVeh	=
	[ 

	];
	
_VehArray	= switch (_this) do
{
    case resistance	: {_ResisHeavyVeh};
	case west		: {_BlueforHeavyVeh};
	case east		: {_OpforHeavyVeh};
	case civilian	: {_CivilHeavyVeh};
};

_result = _VehArray;
_result