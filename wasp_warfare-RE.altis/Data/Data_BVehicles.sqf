//// Data
//// Boat Vehicle
//// DeraKOren
//////////////////

//_this: side

private ["_Side", "_BlueforBoatVeh", "_OpforBoatVeh", "_ResisBoatVeh", "_CivilBoatVeh", "_result", "_VehArray"];

/// Bluefor
///////////
_BlueforBoatVeh =
	[ 
	  //[ L 	, Type						  	, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	]
	  //[ 0 	, 1							  	, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	]
		["LF0"	, "B_Boat_Transport_01_F" 	  	, "PRIVATE"		, 1 	, 250	, 30	, true	, false	, false	],
		["LF1"	, "C_Boat_Civil_01_F" 		   	, "PRIVATE"		, 1		, 500	, 45	, true	, false	, false	],
		["LF2"	, "B_Boat_Armed_01_minigun_F" 	, "PRIVATE"		, 10	, 850	, 60	, true	, true	, true	],
		["LF3"	, "B_SDV_01_F"			  		, "PRIVATE"		, 20	, 3000	, 75	, true	, true	, false	]
	];
	
//// Opfor
///////////
_OpforBoatVeh	=
	[
	  //[ L 	, Type							, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	]
	  //[ 0 	, 1								, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	]
		["LF0"	, "O_Boat_Transport_01_F" 		, "PRIVATE"		, 1		, 250	, 30	, true	, false	, false	],
		["LF1"	, "C_Boat_Civil_01_F" 			, "PRIVATE"		, 1		, 500	, 45	, true	, false	, false	],
		["LF2"	, "O_Boat_Armed_01_hmg_F" 		, "PRIVATE"		, 10	, 850	, 60	, true	, true	, true	],
		["LF3"	, "O_SDV_01_F" 			  		, "PRIVATE"		, 20	, 3000	, 75	, true	, true	, false	]
	];
	
//// Resistance
////////////////
_ResisBoatVeh	=
	[ 
	  //[ L 	, Type						  , Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	]
	  //[ 0 	, 1							  , 2				, 3		, 4		, 5		, 6		, 7		, 8	   	]
		["LF0"	, "I_Boat_Transport_01_F"     , "PRIVATE"		, 1		, 200	, 20	, true	, false	, false	],
		["LF2"	, "I_Boat_Armed_01_minigun_F" , "PRIVATE"		, 10	, 800	, 25	, true	, true	, true	],
		["LF3"	, "I_SDV_01_F"				  , "PRIVATE"		, 20	, 1000	, 25	, true	, true	, false	]
	];
	
//// Civilian
////////////////
_CivilBoatVeh	=
	[
	  //[ L 	, Type						  	, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	]
	  //[ 0 	, 1							  	, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	]
		["LF0"	, "C_Rubberboat"     			, "PRIVATE"		, 1		, 200	, 20	, true	, false	, false	],
		["LF0"	, "C_Boat_Civil_01_F"   		, "PRIVATE"		, 1		, 500	, 20	, true	, false	, false	],
		["LF0"	, "C_Boat_Civil_01_rescue_F"    , "PRIVATE"		, 1		, 500	, 20	, true	, false	, false	],
		["LF0"	, "C_Boat_Civil_01_police_F"    , "PRIVATE"		, 1		, 500	, 20	, true	, false	, false	]
	];
	
_VehArray	= switch (_this) do
{
    case resistance	: {_ResisBoatVeh};
	case west		: {_BlueforBoatVeh};
	case east		: {_OpforBoatVeh};
	case civilian	: {_CivilBoatVeh};
};

_result = _VehArray;
_result