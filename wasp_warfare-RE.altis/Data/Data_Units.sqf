//// Server and Client Data
//// All Units Data
//// Goga
///////////////////////////

//// _this: Side

//// Ranks:
// ---------	  AI	  Time
// "PRIVATE"	- 0.3	- 2
// "CORPORAL"	- 0.4	- 3
// "SERGEANT"	- 0.5	- 4
// "LIEUTENANT" - 0.7	- 5
// "CAPTAIN"	- 0.8	- 6
// "MAJOR"		- 0.9	- 7
// "COLONEL" 

private ["_AllUnitsData", "_ReconUnitsData", "_SpecialUnitsData", "_this", "_result", "_SideN", "_i"];

////////////////////////
//// Simple Units Data
////////////////////////
_AllUnitsData = [
				  //[ 0 	,	1					, 2				,	3	 	, 	4	, 5	 	]	  
				  //[Lev	,	Obj type			, Rank			, Supply 	, Money , time  ]
					["B0"	, "Soldier_F"			, "PRIVATE"		, 1			, 50	, 1		],
					["B0"	, "Soldier_lite_F"		, "PRIVATE"		, 1			, 50	, 1		],
					["B0"	, "Soldier_A_F"			, "PRIVATE"		, 1			, 50	, 1		],
					["B1"	, "Soldier_GL_F"		, "CORPORAL"	, 1			, 100	, 2		],
					["B1"	, "soldier_AR_F"		, "CORPORAL"	, 1			, 100	, 2		],
					["B2"	, "Soldier_CQ_F"		, "CORPORAL"	, 2			, 100	, 2		],
					["B1"	, "Soldier_SL_F"		, "SERGEANT"	, 1			, 150	, 3		],
					["B2"	, "Soldier_TL_F"		, "LIEUTENANT"	, 2			, 200	, 4		],
					["B2"	, "officer_F"			, "CAPTAIN"		, 2		    , 200	, 5		],
					["B2"	, "soldier_M_F"			, "SERGEANT"	, 2			, 220	, 3		],
					["B1"	, "soldier_LAT_F"		, "CORPORAL"	, 1			, 240	, 2		],
					["B2"	, "soldier_AT_F"		, "SERGEANT"	, 2			, 250	, 3		],
					["B2"	, "soldier_AA_F"		, "SERGEANT"	, 2			, 250	, 3		],
					// HelpMens
					["B1"	, "medic_F"			    , "CORPORAL"	, 1		    , 130	, 2		],
					["B2"	, "soldier_repair_F"	, "SERGEANT"	, 2			, 150	, 3		],
					["B2"	, "soldier_exp_F"		, "SERGEANT"	, 2			, 300	, 3		],
					["B3"	, "engineer_F"			, "LIEUTENANT"	, 3			, 400	, 4		],
					// Crew and Pilots
					["B2"	, "Pilot_F"			    , "LIEUTENANT"	, 2			, 200	, 4		],
					["B0"	, "crew_F"			    , "CORPORAL"	, 1			, 130	, 2		],
					["B2"	, "helicrew_F"			, "LIEUTENANT"	, 2			, 250	, 4		],
					// Snipers 
					["B3"	, "spotter_F"			, "LIEUTENANT"	, 3			, 470	, 4		],
					["B3"	, "sniper_F"			, "LIEUTENANT"	, 3			, 500	, 4		],
					// Divers
					["B1"	, "diver_F"			    , "CORPORAL"	, 1		    , 300	, 2		],
					["B2"	, "diver_TL_F"			, "LIEUTENANT"	, 2			, 350	, 2		],
					["B2"	, "diver_exp_F"			, "SERGEANT"	, 2			, 400	, 3		],
					// Support
					["B1"	, "soldier_AAR_F"		, "PRIVATE"		, 2			, 150	, 2		],
					["B2"	, "soldier_AAT_F"		, "PRIVATE"		, 2			, 150	, 2		],
					["B2"	, "soldier_AAA_F"		, "PRIVATE"		, 2			, 150	, 2		],
					["B2"	, "support_AMG_F"		, "PRIVATE"		, 1			, 150	, 2		],
					["B2"	, "support_AMort_F"		, "PRIVATE"		, 1			, 150	, 2		],
					["B2"	, "support_MG_F"		, "PRIVATE"		, 1			, 150	, 2		],
					["B2"	, "support_GMG_F"		, "PRIVATE"		, 1			, 150	, 2		],
					["B2"	, "support_Mort_F"		, "PRIVATE"		, 1			, 150	, 2		]
				];
				
_SideN 	= switch (_this) do
{
    case Resistance	: {"I_"};
	case west		: {"B_"};
	case east		: {"O_"};
};

for "_i" from 0 to (count(_AllUnitsData)-1) do
{
	private ["_UnitData"];
	
	/// Считываем данные с таблицы
	_UnitData = _AllUnitsData select _i;
	_UnitData set [1 , _SideN + (_UnitData select 1)];
	
	/// Записываем данные для нужной стороны
	_AllUnitsData set [_i, _UnitData];
};

//////////////////////
//// Recon Units Data
//////////////////////
_ReconUnitsData	= [
				  //[ 0 	,	1					, 2				,	3	 	, 	4	, 5	 	]	  
				  //[Lev	,	Obj type			, Rank			, Supply 	, Money , time  ]
					["B3"	, "recon_F"				, "LIEUTENANT"	, 3			, 100	, 5		],
					["B3"	, "recon_CQ_F"			, "CAPTAIN"		, 3			, 100	, 6		],
					["B3"	, "recon_LAT_F"			, "CAPTAIN"		, 3			, 100	, 6		],
					["B3"	, "recon_exp_F"			, "CAPTAIN"		, 3			, 100	, 6		],
					["B3"	, "recon_medic_F"		, "CAPTAIN"		, 3			, 100	, 6		],
					["B3"	, "recon_TL_F"			, "MAJOR"		, 3			, 100	, 7		],
					["B3"	, "recon_M_F"			, "MAJOR"		, 3			, 100	, 7		],
					["B3"	, "recon_JTAC_F"		, "LIEUTENANT"	, 3			, 100	, 5		]
				  ];
				  
_SideN 	= switch (_this) do
{
  	case west		: {"B_"};
	case east		: {"O_"};
	case Resistance : {"I_"};
};

for "_i" from 0 to (count(_ReconUnitsData)-1) do
{
	private ["_UnitData"];
	
	/// Считываем данные с таблицы
	_UnitData = _ReconUnitsData select _i;
	_UnitData set [1 , _SideN + (_UnitData select 1)];
	
	/// Записываем данные для нужной стороны
	_ReconUnitsData set [_i, _UnitData];
};

////////////////////////
//// Special Units Data
////////////////////////
private ["_Bluefor", "_Opfor", "_Resis"];

/// Resistance Unique Units
_Resis			= [
				  //[ 0 	,	1					, 2				,	3	 	, 	4	, 5	 	]	  
				  //[Lev	,	Obj type			, Rank			, Supply 	, Money , time  ]
					["B2"	, "I_helipilot_F"		, "SERGEANT"	, 2			, 100	, 4		]
				  ];

/// Bluefor Unique Units				  
_Bluefor		= [
					["B2"	, "B_Miller"			, "CORPORAL"	, 2			, 100	, 5		],
					["B2"	, "B_Kerry_F"			, "CORPORAL"	, 2			, 100	, 5		],
					["B2"	, "B_RangeMaster_F"		, "CORPORAL"	, 2			, 100	, 5		],
					["B2"	, "B_Soldier_02_f"		, "CORPORAL"	, 2			, 100	, 5		],
					["B2"	, "B_Soldier_03_f"		, "CORPORAL"	, 2			, 100	, 5		]
				  ];
				  
/// Opfor Unique Units				  
_Opfor			= [
					["B2"	, "O_helipilot_F"		, "SERGEANT"	, 2			, 100	, 4		],
					["B1"	, "O_scientist_F"		, "PRIVATE"		, 2			, 100	, 2		],
					["B1"	, "O_soldierU_F"		, "PRIVATE"		, 2			, 100	, 2		],
					["B1"	, "O_soldierU_CQ_F"		, "CORPORAL"	, 2			, 100	, 3		],
					["B1"	, "O_soldierU_AR_F"		, "CORPORAL"	, 2			, 100	, 3		],
					["B1"	, "O_soldierU_AAR_F"	, "CORPORAL"	, 2			, 100	, 3		],
					["B1"	, "O_soldierU_LAT_F"	, "CORPORAL"	, 2			, 100	, 3		],
					["B2"	, "O_soldierU_AT_F"		, "SERGEANT"	, 2			, 100	, 4		],
					["B2"	, "O_soldierU_AAT_F"	, "SERGEANT"	, 2			, 100	, 4		],
					["B2"	, "O_soldierU_TL_F"		, "LIEUTENANT"	, 2			, 100	, 5		]
				  ];
				  
_SpecialUnitsData	= switch (_this) do
{
	case Resistance	: {_Resis};
  	case west		: {_Bluefor};
	case east		: {_Opfor};
};

//// Answer: Full Units Data Array for needed Side	
_result = _AllUnitsData + _ReconUnitsData + _SpecialUnitsData;
_result