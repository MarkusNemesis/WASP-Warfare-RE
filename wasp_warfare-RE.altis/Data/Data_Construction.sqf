//// Client Data
//// Data for Construction Module
//// DeraKOren
/////////////////////////////////

//// _this: "Question";

private ["_BuildingsData", "_BuildingsDataBluefor", "_BuildingsDataOpfor", "_WallsData", "_this", "_result", "_Question"];


//// Buildings Data
////////////////////
_BuildingsDataBluefor	= 	[
  //{		0			, 1 ,			2					.	3		,	4	, 	5	, 6				]	  
  //[	Obj Name		,key, 		Obj type				, Supply	, Money	, time  , Abbreviation	]
	["Barracks"			, 2	, "Land_Cargo_House_V1_F"		,	200		, 200	, 20	, "B"			],
	["Light Factory"	, 3	, "Land_FuelStation_Build_F"	,	1000	, 2000	, 60	, "LF"			],
	["Heavy Factory"	, 4	, "Land_i_Garage_V2_F"			,	3000	, 5000	, 120	, "HF"			],
	["Boat Factory"		, 6	, "Land_Lighthouse_small_F"		,	1000	, 2000	, 180	, "BF"			],
	["Command Center"	, 5	, "Land_TBox_F"					,	500		, 1000	, 60	, "CC"			],
	["Air Factory"		, 6	, "Land_TentHangar_V1_F"		,	5000	, 9000	, 180	, "AF"			]
	
							];
						
_BuildingsDataOpfor		= 	[
  //{		0			, 1 ,			2					.	3		,	4	, 	5	, 6				]	  
  //[	Obj Name		,key, 		Obj type				, Supply	, Money	, time  , Abbreviation	]
	["Barracks"			, 2	, "Land_Cargo_House_V3_F"		,	200		, 200	, 20	, "B"			],
	["Light Factory"	, 3	, "Land_FuelStation_Build_F"	,	1000	, 2000	, 60	, "LF"			],
	["Heavy Factory"	, 4	, "Land_i_Garage_V2_F"			,	3000	, 5000	, 120	, "HF"			],	// Land_FuelStation_Build_F
	["Boat Factory"		, 6	, "Land_Lighthouse_small_F"		,	1000	, 2000	, 180	, "BF"			],
	["Command Center"	, 5	, "Land_TBox_F"					,	500		, 1000	, 60	, "CC"			],	//Land_TBox_F "Land_spp_Transformer_F"
	["Air Factory"		, 6	, "Land_TentHangar_V1_F"		,	5000	, 9000	, 180	, "AF"			]	// Land_Radar_Small_F
							];

_BuildingsData = if (side Player == west) then {_BuildingsDataBluefor} else {_BuildingsDataOpfor};
						
//// Wall Data
////////////////////
_WallsData	=	[
  //[]
  //[]
	[]
				];
				
/*
	wood
"Land_Shoot_House_Wall_F"
"Land_Shoot_House_Wall_Stand_F"
"Land_Shoot_House_Wall_Crouch_F"
"Land_Shoot_House_Wall_Prone_F"

	Бетонная плита
"Land_CncBarrierMedium_F"
"Land_CncBarrierMedium_F"

	Военные стены
"Land_Mil_WallBig_4m_F"

	Сетка
"Land_Mil_WiredFence_F"
"Land_New_WiredFence_5m_F"
"Land_Slums01_8m"
"Land_SportGround_fence_F"

	каменная
"Land_Mound01_8m_F"
"Land_Stone_4m_F"

	стальная
"Land_Wall_Tin_4_2" 

"Land_Pipe_fence_4m_F"
*/
				
//// Static Data
////////////////////
_DefensDataBluefor	= 	[
  //{		0			, 1 ,			2					.	3		,	4	, 	5	, 6				]	  
  //[	Obj Name		,key, 		Obj type				, Supply	, Money	, time  , Abbreviation	]
	["MG Low"			, 2	, "B_HMG_01_F"		            ,	20	    , 200	, 20	, "MG"			],
	["MG High"	        , 3	, "B_HMG_01_high_F"				,	20	    , 200	, 20	, "MG"			],
	["GMG Low"	        , 4	, "B_GMG_01_F"			        ,	30	    , 500	, 120	, "GM1"			],
	["GMG High"		    , 6	, "B_GMG_01_high_F"		        ,	30	    , 500	, 120	, "GM2"			],
	["Mortar"	        , 5	, "B_Mortar_01_F"				,	10	    , 1000	, 160	, "MRT"			],
	["AA Launcher"		, 6	, "B_static_AA_F"		        ,	50	    , 2000	, 180	, "AA"			],
	["AT Launcher"		, 6	, "B_static_AT_F"		        ,	50	    , 2500	, 180	, "AT"			]
							];
_DefensDataOpfor	= 	[
  //{		0			, 1 ,			2					.	3		,	4	, 	5	, 6				]	  
  //[	Obj Name		,key, 		Obj type				, Supply	, Money	, time  , Abbreviation	]
	["MG Low"			, 2	, "O_HMG_01_F"		            ,	20	    , 200	, 20	, "MG"			],
	["MG High"	        , 3	, "O_HMG_01_high_F"				,	20	    , 200	, 20	, "MG"			],
	["GMG Low"	        , 4	, "O_GMG_01_F"			        ,	30	    , 500	, 120	, "GM1"			],
	["GMG High"		    , 6	, "O_GMG_01_high_F"		        ,	30	    , 500	, 120	, "GM2"			],
	["Mortar"	        , 5	, "O_Mortar_01_F"				,	10	    , 1000	, 160	, "MRT"			],
	["AA Launcher"		, 6	, "O_static_AA_F"		        ,	50	    , 2000	, 180	, "AA"			],
	["AT Launcher"		, 6	, "O_static_AT_F"		        ,	50	    , 2500	, 180	, "AT"			]
							];
//// Answer					
_result = switch (_this) do
{
    case "Buildings"	: {_BuildingsData};
};

_result 