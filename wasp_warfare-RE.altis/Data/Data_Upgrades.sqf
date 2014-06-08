//// Data
//// Upgrades Data
//// DeraKOren
///////////////////

	// this: Question

private["_Question", "_Data", "_AllUpgrades", "_Result", "_PublicUpgrades"];

////////////////////
//// Upgrades Data
////////////////////
_AllUpgrades	=
	[
	  //[ 0		, 1			, 2			, 3		, 4		, 5					, 6						, 7				];
	  //[ Name	, Updated	, Supply	, Money	, Time	,	Must Be			, Full Name				, Description	];
		/// Weapon
		["WP0"	, true		, 0			, 0		, 0		, []				, "GEAR"				, ""			],
		["WP1"	, false		, 300		, 1000	, 120	, ["B1"]			, "GEAR I"				, ""			],
		["WP2"	, false		, 600		, 2000	, 120	, ["WP1"]			, "GEAR II"				, ""			],
		["WP3"	, false		, 900		, 3000	, 120	, ["WP2", "SP2"]	, "GEAR III"			, ""			],
		["AT"	, false		, 900		, 2000	, 120	, ["WP2"]			, "AntiTank Launcher"	, ""			],
		["AA"	, false		, 900		, 3000	, 120	, ["WP2", "AT"]		, "AntiAir Launcher"	, ""			],
		/// Baracks 
		["B0"	, true		, 0			, 0		, 0		, []				, "Barracks"			, ""			],
		["B1"	, false		, 200		, 500	, 120	, []				, "Barracks I"			, ""			],
		["B2"	, false		, 400		, 1000	, 120	, ["B1"]			, "Barracks II"			, ""			],
		["B3"	, false		, 600		, 1500	, 120	, ["B2"]			, "Barracks III"		, ""			],
		/// Light Factory
		["LF0"	, true		, 0			, 0		, 0		, []				, "Light Factory"		, ""			],
		["LF1"	, false		, 400		, 1000	, 120	, ["B1"]			, "Light Factory I"		, ""			],
		["LF2"	, false		, 800		, 2000	, 120	, ["LF1"]			, "Light Factory II"	, ""			],
		["LF3"	, false		, 1600		, 3000	, 120	, ["LF2"]			, "Light Factory III"	, ""			],
		/// Heavy Factory
		["HF0"	, true		, 0			, 0		, 0		, []				, "Heavy Factory"		, ""			],
		["HF1"	, false		, 1000		, 2000	, 120	, ["SP1"]			, "Heavy Factory I"		, ""			],
		["HF2"	, false		, 2000		, 4000	, 120	, ["HF1"]			, "Heavy Factory II"	, ""			],
		["HF3"	, false		, 3000		, 6000	, 120	, ["HF2"]			, "Heavy Factory III"	, ""			],
		/// Air Factory
		["AF0"	, true		, 0			, 0		, 0		, []				, "Air Factory"			, ""			],
		["AF1"	, false		, 2000		, 3000	, 120	, ["SP2"]			, "Air Factory I"		, ""			],
		["AF2"	, false		, 4000		, 6000	, 120	, ["AF1"]			, "Air Factory II"		, ""			],
		["AF3"	, false		, 6000		, 9000	, 120	, ["AF2"]			, "Air Factory III"		, ""			],
		/// Supply
		["SP0"	, true		, 0			, 0		, 0		, []				, "Supply"				, ""			],
		["SP1"	, false		, 2000		, 3000	, 120	, []				, "Supply I"			, ""			],
		["SP2"	, false		, 4000		, 6000	, 120	, ["SP1"]			, "Supply II"			, ""			],
		["SP3"	, false		, 6000		, 9000	, 120	, ["SP2"]			, "Supply III"			, ""			]
	];

///////////////
//// Functions
///////////////
_PublicUpgrades	=	// For Mission start (Create Public Variable)
{
	private["_NewArray", "_UpName", "_UpBool"];
	_NewArray = [];
	
	{
		_UpName	= _x select 0;
		_UpBool = _x select 1;
		_NewArray set [count(_NewArray), [_UpName, _UpBool]];
	} forEach _AllUpgrades;
	
	// Return
	_NewArray
};

/////////////////
//// Main Script
/////////////////
_Question	= _this;

_Data		= switch (_Question) do
{
	case "All"		: {_AllUpgrades};
	case "Public"	: {call _PublicUpgrades};
};

//// Return
_Result	= _Data;
_Result