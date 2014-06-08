//// Data
//// TownCenter Vehicle and unit
//// DeraKOren
////////////////////////////////

// this: side

private ["_Side", "_TCVehicles", "_result", "_SideN"];

//// Vehicle
////////////////
_TCVehicles	=
	[ 
	  //[ L 	, Type						, Crew Rank		, Supply, Money	, Time	, Driver, Guner	, Comm 	]
	  //[ 0 	, 1							, 2				, 3		, 4		, 5		, 6		, 7		, 8	   	]
		["SP0"	, "C_Quadbike_01_F"			, "PRIVATE"		, 1		, 150	, 5		, true	, false	, false	],
		["SP2"	, "c_offroad_01_armed"		, "PRIVATE"		, 1		, 250	, 7		, true	, false	, false	],
		["SP0"	, "C_Offroad_01_F"			, "PRIVATE"		, 1		, 250	, 7		, true	, false	, false	],
		["SP2"	, "C_Offroad_01_PA_F"		, "PRIVATE"		, 1		, 250	, 7		, true	, false	, false	],
		["SP2"	, "C_Offroad_01_RP_F"		, "PRIVATE"		, 1		, 250	, 7		, true	, false	, false	],
		["SP0"	, "C_Hatchback_01_F"		, "PRIVATE"		, 1		, 300	, 7		, true	, false	, false	],
		["SP3"	, "C_Hatchback_01_sport_F"	, "PRIVATE"		, 1		, 450	, 7		, true	, false	, false	],
		["SP2"	, "C_SUV_01_F"		        , "PRIVATE"		, 1		, 300	, 9		, true	, false	, false	],
		["SP2"	, "C_Van_01_fuel_F"			, "PRIVATE"		, 1		, 450	, 12	, true	, false	, false	],
		//["SP1"	, "C_Van_01_box_F"		, "PRIVATE"		, 1		, 1500	, 100	, true	, false	, false	],
		["SP2"	, "C_Van_01_transport_F"	, "PRIVATE"		, 1		, 300	, 12	, true	, false	, false	]
	];
	
_TCUnits 	=
	[
		["SP0"	, "Soldier_lite_F"			, "PRIVATE"		, 1		, 50	, 3			, false	, false	, false	],	
		["SP1"	, "medic_F"				    , "CORPORAL"	, 1		, 75	, 5			, false	, false	, false	],
		["SP2"	, "soldier_repair_F"		, "SERGEANT"	, 2		, 125	, 7			, false	, false	, false	]
	];
	
_SideN	= switch (_this) do
{
    case Resistance	: {"I_"};
	case west		: {"B_"};
	case east		: {"O_"};
};

{
	private["_Unit", "_UType"];
	
	_Unit 	= _x;
	_UType	= _SideN + (_Unit select 1);
	_Unit	 set [ 1, _UType];
	_TCUnits set [_forEachIndex, _Unit];
} foreach _TCUnits;

_result = _TCUnits + _TCVehicles;
_result