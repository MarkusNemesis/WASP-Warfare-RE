//// Data
//// Gear Data (Rebuilt from Spayker Data) 
//// DeraKOren
////////////////////////////////////////////

	// _this: [Side, Question]

private["_Question", "_Primary", "_Secondary", "_HandGun", "_GearArray", "_Level", "_Ammunition", "_Muzzles",
		"_Optics", "_Acc", "_Uniform", "_Vest", "_Backpack", "_Glasses", "_Helmet", "_Item", "_Ammo"];
		
///////////////
//// Gear Data
///////////////

_Primary =
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 								, Money , Blue	, Opfor , Resis ]
		["WP1"	, "arifle_TRG21_F"							, 300	, false	, true	, false	],
		["WP0"	, "arifle_TRG20_F"							, 350	, false	, true	, false	],
		["WP2"	, "arifle_TRG21_GL_F"						, 350	, false	, true	, false	],
		["WP1"	, "arifle_SDAR_F"							, 200	, true	, true	, false	],
		["WP0"	, "arifle_Katiba_F"							, 300	, false	, true	, false	],
		["WP1"	, "arifle_Katiba_C_F"						, 350	, false	, true	, false	],
		["WP2"	, "arifle_Katiba_GL_F"						, 400	, false	, true	, false	],
		["WP1"	, "LMG_Zafir_F"								, 400	, false	, true	, false	],
		["WP0"	, "SMG_01_F"								, 200	, true	, true	, false	],
		["WP0"	, "SMG_02_F"								, 200	, true	, true	, false	],
		["WP2"	, "srifle_EBR_F"							, 500	, true	, false	, false	],
		["WP2"	, "srifle_DMR_01_F"                         , 500	, false	, true	, false	],
		["WP3"	, "srifle_GM6_F"							, 1000	, false	, true	, false	],
		["WP1"	, "arifle_Mk20_F"							, 300	, true	, true	, true	],
		["WP0"	, "arifle_Mk20C_F"							, 300	, true	, true	, true	],
		["WP2"	, "arifle_Mk20_GL_F"						, 400	, true	, true	, true	],
		["WP1"	, "arifle_MX_F"								, 300	, true	, false	, false	],
		["WP2"	, "arifle_MX_GL_F"							, 350	, true	, false	, false	],
		["WP1"	, "arifle_MX_SW_F"							, 350	, true	, false	, false	],
		["WP0"	, "arifle_MXC_F"							, 300	, true	, false	, false	],
		["WP2"	, "arifle_MXM_F"							, 300	, true	, false	, false	],
		["WP2"	, "LMG_Mk200_F"								, 400	, true	, false	, false	],
		["WP3"	, "srifle_LRR_F"							, 500	, true	, false	, false	]
	];

_Secondary	=
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
	  	["WP0"	, "launch_RPG32_F"							, 700	, false	, true	, true	],
		["AA"	, "launch_B_Titan_F"						, 750	, true	, true	, true	],
		["AT"	, "launch_B_Titan_short_F"					, 800	, true	, true	, true	],
		["WP0"	, "launch_NLAW_F"							, 600	, true	, false	, true	]

	];
	
_HandGun	=
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
		["WP0"	, "hgun_Rook40_F"							, 50	, true	, true	, true	],
		["WP0"	, "hgun_ACPC2_F"							, 70	, true	, true	, true	],
		["WP1"	, "hgun_P07_F"								, 50	, true	, true	, true	],
		["WP2"	, "hgun_PDW2000_F"							, 150	, true	, true	, true	],
		["WP1"	, "hgun_Pistol_heavy_01_F"                  , 550	, true	, false	, true	],
		["WP1"	, "hgun_Pistol_heavy_02_F"                  , 550	, false	, true	, true	] //zubr
	];

_Muzzles = 
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
	  	["WP3"	, "muzzle_snds_acp"							, 150		, true	, true	, true	],
		["WP3"	, "muzzle_snds_h"							, 150		, true	, true	, true	],
		["WP3"	, "muzzle_snds_H_MG"						, 150		, true	, false	, true	],
		["WP3"	, "muzzle_snds_B"							, 200		, true	, true	, true	],
		["WP3"	, "muzzle_snds_L"							, 200		, true	, true	, true	],
		["WP3"	, "muzzle_snds_M"							, 200		, true	, true	, true	]
	];
	
_Optics = 
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
	  	["WP2"	, "optic_arco"								, 50		, true	, true	, true	],
		["WP2"	, "optic_MRCO"								, 150		, true	, true	, true	],
		["WP2"	, "optic_Hamr"								, 50		, true	, true	, true	],
		["WP2"	, "optic_Holosight"							, 50		, true	, true	, true	],
		["WP2"	, "optic_Holosight_smg"						, 50		, true	, true	, true	],
		["WP1"	, "optic_Aco"								, 150		, true	, true	, true	],
		["WP1"	, "optic_ACO_grn"							, 150		, true	, true	, true	],
		["WP1"	, "optic_ACO_grn_smg"						, 250		, true	, true	, true	],
		["WP1"	, "optic_aco_smg"							, 200		, true	, true	, true	],
		["WP2"	, "optic_SOS"								, 150	    , true	, true	, true	],
		["WP2"	, "optic_DMS"                               , 200	    , true	, true	, true	],
		["WP3"	, "optic_Nightstalker"						, 500		, true	, true	, true	],
		["WP3"	, "optic_tws"						        , 1000		, true	, true	, true	],
		["WP3"	, "optic_tws_mg"						    , 1500		, true	, true	, true	],
		["WP3"	, "optic_NVS"						        , 700		, true	, true	, true	],
		["WP1"	, "optic_Yorris"                            , 500		, false	, true	, true	],
		["WP1"	, "optic_MRD"                               , 500		, true	, false	, true	]
	];
	
_Acc = 
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
	  	["WP0"	, "acc_flashlight"							, 100		, true	, true	, true	],
		["WP2"	, "acc_pointer_IR"							, 200		, true	, true	, true	]
	];

_Ammunition	=
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
		["WP1"	, "HandGrenade"								, 20	, true	, true	, true	],
		["WP0"	, "MiniGrenade"								, 2		, true	, true	, true	],
		//["WP0"	, "HandGrenade_Stone"					, 10	, true	, true	, true	],
		["WP0"	, "SmokeShell"								, 20	, true	, true	, true	],
		["WP0"	, "SmokeShellRed"							, 20	, true	, true	, true	],
		["WP0"	, "SmokeShellGreen"							, 20	, true	, true	, true	],
		["WP0"	, "SmokeShellYellow"						, 20	, true	, true	, true	],
		["WP0"	, "SmokeShellPurple"					    , 20	, true	, true	, true	],
		["WP0"	, "SmokeShellBlue"							, 20	, true	, true	, true	],
		["WP0"	, "SmokeShellOrange"						, 20	, true	, true	, true	],
		["WP0"	, "Chemlight_green"							, 20	, true	, true	, true	],
		["WP0"	, "Chemlight_red"							, 20	, true	, true	, true	],
		["WP0"	, "Chemlight_yellow"						, 20	, true	, true	, true	],
		["WP0"	, "Chemlight_blue"							, 2		, true	, true	, true	],
		["WP0"	, "FlareWhite_F"							, 20	, true	, true	, true	],
		["WP0"	, "FlareGreen_F"							, 20	, true	, true	, true	],
		["WP0"	, "FlareRed_F"								, 20	, true	, true	, true	],
		["WP0"	, "FlareYellow_F"							, 20	, true	, true	, true	],
		["WP2"	, "ATMine_Range_Mag"						, 200	, true	, true	, true	],
		["WP1"	, "APERSMine_Range_Mag"						, 190	, true	, true	, true	],
		["WP1"	, "APERSBoundingMine_Range_Mag"				, 300	, true	, true	, true	],
		["WP1"	, "SLAMDirectionalMine_Wire_Mag"			, 350	, true	, true	, true	],
		["WP1"	, "APERSTripMine_Wire_Mag"					, 400	, true	, true	, true	],
		["WP3"	, "SatchelCharge_Remote_Mag"				, 500	, true	, true	, true	],
		["WP2"	, "DemoCharge_Remote_Mag"					, 450	, true	, true	, true	],
		["WP2"	, "ClaymoreDirectionalMine_Remote_Mag"		, 500	, true	, true	, true	],
		["WP2"	, "Laserbatteries"							, 10	, true	, true	, true	],
		["WP1"	, "Toolkit"								    , 50	, true	, true	, true	],
		["WP0"	, "FirstAidKit"								, 15	, true	, true	, true	],
		["WP1"	, "Medikit"								    , 25	, true	, true	, true	],
		["WP1"	, "MineDetector"						    , 300	, true	, true	, true	]
	];
	
_Uniform	=
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
	  	["WP0"	, "U_O_CombatUniform_ocamo"					, 10	, false	, true	, false	],
	  	["WP0"	, "U_O_CombatUniform_oucamo"				, 10	, false	, true	, false	],
		["WP1"	, "U_O_GhillieSuit"						    , 50	, false	, true	, false	],
		["WP1"	, "U_O_OfficerUniform_ocamo"				, 15	, false	, true	, false	],
		["WP2"	, "U_O_SpecopsUniform_blk"					, 15	, false	, true	, false	],
		["WP2"	, "U_O_SpecopsUniform_ocamo"				, 15	, false	, true	, false	],		
		["WP0"	, "U_O_PilotCoveralls"						, 25	, false	, true	, false	],
		["WP1"	, "U_O_Wetsuit"							    , 65	, false	, true	, false	],
		["WP0"	, "U_B_CombatUniform_mcam"					, 10	, true	, false	, false	],
		["WP0"	, "U_B_CombatUniform_mcam_tshirt"			, 10	, true	, false	, false	],
		["WP1"	, "U_B_CombatUniform_mcam_vest"				, 10	, true	, false	, false	],
		["WP1"	, "U_B_CombatUniform_mcam_worn"				, 15	, true	, false	, false	],
		["WP1"	, "U_B_GhillieSuit"						    , 50	, true	, false	, false	],
		["WP2"	, "U_B_SpecopsUniform_sgg"					, 20	, true	, false	, false	],		
		["WP0"	, "U_B_HeliPilotCoveralls"					, 15	, true	, false	, false	],
		["WP0"	, "U_B_PilotCoveralls"					    , 25	, true	, false	, false	],
		["WP1"	, "U_B_Wetsuit"					            , 65	, true	, false	, false	]
		];
	
_Vest	=
	[
	  //[ 0 	, 1					, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 			, Money , Blue	, Opfor , Resis ]
["WP1"	, "V_RebreatherIR"	        , 350	, false	, true	, false	],
["WP1"	, "V_RebreatherB"           , 350	, true	, false	, false	],
["WP1"	, "V_BandollierB_blk"       , 100	, true	, true	, false	],
["WP1"	, "V_BandollierB_cbr"       , 100	, true	, true	, false	],
["WP1"	, "V_BandollierB_khk"       , 100	, true	, true	, false	],
["WP1"	, "V_BandollierB_oli"       , 100	, true	, true	, false	],
["WP1"	, "V_BandollierB_rgr"       , 100	, true	, true	, false	],
["WP2"	, "V_Chestrig_blk"          , 150	, true	, true	, false	],
["WP2"	, "V_Chestrig_khk"          , 150	, true	, true	, false	],
["WP2"	, "V_Chestrig_oli"          , 150	, true	, true	, false	],
["WP2"	, "V_Chestrig_rgr"          , 150	, true	, true	, false	],
["WP3"	, "V_HarnessO_brn"          , 200	, true	, true	, false	],
["WP3"	, "V_HarnessO_gry"          , 200	, true	, true	, false	],
["WP3"	, "V_HarnessOGL_brn"        , 200	, true	, true	, false	],
["WP3"	, "V_HarnessOGL_gry"        , 200	, true	, true	, false	],
["WP3"	, "V_HarnessOSpec_brn"      , 200	, true	, true	, false	],
["WP3"	, "V_HarnessOSpec_gry"      , 200	, true	, true	, false	],
["WP2"	, "V_PlateCarrier1_blk"     , 150	, true	, true	, false	],
["WP2"	, "V_PlateCarrier1_rgr"     , 150	, true	, true	, false	],
["WP2"	, "V_PlateCarrier2_rgr"     , 150	, true	, true	, false	],
["WP2"	, "V_PlateCarrier3_rgr"     , 250	, true	, true	, false	],
["WP3"	, "V_PlateCarrierGL_rgr"    , 200	, true	, true	, false	],
["WP1"	, "V_PlateCarrierIA1_dgtl"  , 100	, true	, true	, false	],
["WP3"	, "V_PlateCarrierIA2_dgtl"  , 200	, true	, true	, false	],
["WP3"	, "V_PlateCarrierIAGL_dgtl" , 200	, true	, true	, false	],
["WP3"	, "V_PlateCarrierSpec_rgr"  , 200	, true	, true	, false	],
["WP0"	, "V_Rangemaster_belt"	    , 50	, true	, true	, false	],
["WP2"	, "V_TacVest_blk"           , 150	, true	, true	, false	],
["WP2"	, "V_TacVest_blk_POLICE"    , 150	, true	, true	, false	],
["WP2"	, "V_TacVest_brn"           , 150	, true	, true	, false	],
["WP2"	, "V_TacVest_camo"          , 150	, true	, true	, false	],
["WP2"	, "V_TacVest_khk"           , 150	, true	, true	, false	],
["WP2"	, "V_TacVest_oli"           , 150	, true	, true	, false	],
["WP2"	, "V_TacVestCamo_khk"       , 150	, true	, true	, false	],
["WP2"	, "V_TacVestIR_blk"         , 150	, true	, true	, false	]
     ];

_Backpack	=
	[
	  //[ 0 	, 1					  , 2	, 3		, 4		, 5		]
	  //[ L 	, TypeName 			  , Money , Blue, Opfor , Resis ]		
["WP0"	, "B_AssaultPack_khk"         , 50	, true	, true	, true	],
["WP0"	, "B_AssaultPack_dgtl"        , 50	, true	, true	, true	],
["WP0"	, "B_AssaultPack_rgr"         , 50	, true	, true	, true	],
["WP0"	, "B_AssaultPack_sgg"         , 50	, true	, true	, true	],
["WP0"	, "B_AssaultPack_blk"         , 50	, true	, true	, true	],
["WP0"	, "B_AssaultPack_cbr"         , 50	, true	, true	, true	],
["WP0"	, "B_AssaultPack_mcamo"       , 50	, true	, true	, true	],
["WP1"	, "B_Kitbag_mcamo"            , 150	, true	, true	, true	],
["WP1"	, "B_Kitbag_sgg"              , 150	, true	, true	, true	],
["WP1"	, "B_Kitbag_cbr"              , 150	, true	, true	, true	],
["WP2"	, "B_Bergen_sgg"              , 200	, true	, true	, true	],
["WP2"	, "B_Bergen_mcamo"            , 200	, true	, true	, true	],
["WP2"	, "B_Bergen_rgr"              , 200	, true	, true	, true	],
["WP2"	, "B_Bergen_blk"              , 200	, true	, true	, true	],
["WP1"	, "B_FieldPack_blk"           , 150	, true	, true	, true	],
["WP1"	, "B_FieldPack_ocamo"         , 150	, true	, true	, true	],
["WP1"	, "B_FieldPack_oucamo"        , 150	, true	, true	, true	],
["WP1"	, "B_FieldPack_cbr"           , 150	, true	, true	, true	],
["WP3"	, "B_Carryall_ocamo"          , 350	, true	, true	, true	],
["WP3"	, "B_Carryall_oucamo"         , 350	, true	, true	, true	],
["WP3"	, "B_Carryall_mcamo"          , 350	, true	, true	, true	],
["WP3"	, "B_Carryall_oli"            , 350	, true	, true	, true	],
["WP3"	, "B_Carryall_khk"            , 350	, true	, true	, true	],
["WP3"	, "B_Carryall_cbr"            , 350	, true	, true	, true	],
["WP0"	, "B_OutdoorPack_blk"         , 50	, true	, true	, true	],
["WP0"	, "B_OutdoorPack_tan"         , 50	, true	, true	, true	],
["WP0"	, "B_OutdoorPack_blu"         , 50	, true	, true	, true	],
["WP0"	, "B_HuntingBackpack"         , 50	, true	, true	, true	]
	];
	
_Glasses	=
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
		["WP1"	, "G_B_Diving"								, 15	, true	, false	, false	],
		["WP1"	, "G_O_Diving"								, 15	, false	, true	, false	],
		["WP1"	, "G_I_Diving"								, 15	, false	, false	, true	],
		["WP0"	, "G_Shades_Black"							, 5		, true	, true	, true	],
		["WP0"	, "G_Aviator"								, 5		, true	, true	, true	],
		["WP0"	, "G_Combat"								, 5		, true	, true	, true	],
		["WP0"	, "G_Lady_Blue"								, 5		, true	, true	, true	],
		["WP0"	, "G_Shades_Black"							, 5		, true	, true	, true	],
		["WP0"	, "G_Lowprofile"							, 5		, true	, true	, true	],
		["WP0"	, "G_Shades_Black"							, 5		, true	, true	, true	],
		["WP0"	, "G_Spectacles"							, 5		, true	, true	, true	],
		["WP0"	, "G_Sport_Blackred"						, 5		, true	, true	, true	],
		["WP0"	, "G_Squares"								, 5		, true	, true	, true	],
		["WP0"	, "G_Tactical_Black"						, 5		, true	, true	, true	],
		["WP0"	, "G_Tactical_Clear"						, 5		, true	, true	, true	]
	];
	
_Helmet	=
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
	  	["WP2"	, "H_HelmetO_ocamo"						, 50	, false	, true	, false	],
		["WP2"	, "H_HelmetB_plain_mcamo"				, 50	, true	, false	, false	],
		["WP2"	, "H_HelmetB_plain_blk"					, 50	, true	, false	, false	],
		["WP2"	, "H_PilotHelmetHeli_O"					, 50	, false	, true	, false	],
		["WP1"	, "H_HelmetB"							, 50	, true	, false	, false	],
		["WP1"	, "H_HelmetB_paint"						, 50	, true	, false	, false	],
		["WP1"	, "H_HelmetB_light"						, 50	, true	, false	, false	],
		["WP2"	, "H_PilotHelmetHeli_B"					, 50	, true	, false	, false	],
		["WP0"	, "H_MilCap_ocamo"						, 7		, true	, true	, false	],
		["WP0"	, "H_MilCap_mcamo"						, 7		, true	, true	, false	],
		["WP0"	, "H_MilCap_oucamo"						, 7		, true	, true	, false	],
		["WP0"	, "H_MilCap_rucamo"						, 7		, true	, true	, false	],
		["WP0"	, "H_MilCap_gry"						, 7		, true	, true	, false	],
		["WP0"	, "H_MilCap_dgtl"						, 7		, true	, true	, false	],
		["WP0"	, "H_MilCap_blue"						, 7		, true	, true	, false	],
		["WP0"	, "H_Cap_red"							, 10	, true	, true	, false	],
		["WP2"	, "H_HelmetSpecO_ocamo"				    , 50	, true	, true	, false	],
		["WP0"	, "H_Cap_headphones"					, 7		, true	, true	, false	],
		["WP1"	, "H_HelmetO_ocamo"						, 50	, true	, true	, false	],
	    ["WP2"	, "H_HelmetO_oucamo"					, 50	, true	, true	, false	],
		["WP1"	, "H_HelmetIA"							, 40	, true	, true	, false	],
		["WP2"	, "H_HelmetCrew_B"						, 50	, true	, true	, false	],
		["WP2"	, "H_PilotHelmetFighter_B"				, 50	, true	, false	, false	],
		["WP1"	, "H_CrewHelmetHeli_B"					, 40	, true	, true	, false	],
		["WP0"	, "H_BandMask_blk"						, 7		, true	, true	, false	],
		["WP2"	, "H_HelmetSpecO_ocamo"					, 50	, true	, true	, false	],
		["WP0"	, "H_Bandanna_surfer"					, 7		, true	, true	, false	],
		["WP0"	, "H_Shemag_khk"						, 7		, true	, true	, false	],
		["WP0"	, "H_ShemagOpen_khk"					, 7		, true	, true	, false	],
		["WP0"	, "H_Beret_blk"							, 7		, true	, true	, false	],
		["WP0"	, "H_Watchcap_blk"						, 7		, true	, true	, false	],
		["WP0"	, "H_TurbanO_blk"						, 7		, true	, true	, false	],
		["WP0"	, "H_StrawHat"							, 7		, true	, true	, false	],
		["WP0"	, "H_Hat_blue"							, 7		, true	, true	, false	]		
	];

_Item	=
	[
	  //[ 0 	, 1										, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 								, Money , Blue	, Opfor , Resis ]
	  	["WP3"	, "NVGoggles"							, 150	, true	, false	, false	],
		["WP3"	, "NVGoggles_OPFOR"						, 150	, false	, true	, false	],
		["WP3"	, "NVGoggles_INDEP"						, 150	, false	, false	, true	],
		["WP0"	, "Binocular"							, 50	, true	, true	, true	],
		["WP3"	, "Laserdesignator"						, 550	, true	, true	, true	],
		["WP0"	, "ItemGPS"								, 100	, true	, true	, true	],
		["WP0"	, "ItemMap"								, 50	, true	, true	, true	],
		["WP0"	, "ItemWatch"							, 20	, true	, true	, true	],
		["WP0"	, "ItemCompass"							, 20	, true	, true	, true	],
		["WP0"	, "ItemRadio"							, 40	, true	, true	, true	],
		["WP3"	, "B_UavTerminal"						, 1000	, true	, false	, false	],
		["WP3"	, "O_UavTerminal"						, 1000	, false	, true	, false	],
		["WP3"	, "I_UavTerminal"						, 1000	, false	, false	, false	]
	];
	
_Ammo	=
	[
	  //[ 0 	, 1											, 2		, 3		, 4		, 5		]
	  //[ L 	, TypeName 									, Money , Blue	, Opfor , Resis ]
	  	["WP0"	, "5Rnd_127x108_Mag"						, 100   , false	, true	, true	],
		["WP0"	, "20Rnd_556x45_UW_mag"						, 25	, true	, true	, true	],
		["WP0"	, "20Rnd_762x51_Mag"						, 35	, true	, false	, true	],
	    ["WP0"	, "10Rnd_762x51_Mag"                        , 35	, false	, true	, true	],
		["WP0"	, "30Rnd_45ACP_Mag_SMG_01"					, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_45ACP_Mag_SMG_01_tracer_green"		, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_556x45_Stanag"						, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_556x45_Stanag_Tracer_Red"			, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_556x45_Stanag_Tracer_Green"		, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_556x45_Stanag_Tracer_Yellow"		, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_65x39_caseless_green"				, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_65x39_caseless_green_mag_Tracer"	, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_65x39_caseless_mag"				, 25	, true	, true	, true	],
		["WP0"	, "30Rnd_65x39_caseless_mag_Tracer"			, 25	, true	, true	, true	],
		["WP0"	, "150Rnd_762x51_Box"						, 35	, false	, true	, true	],
		["WP0"	, "150Rnd_762x51_Box_Tracer"				, 35	, false	, true	, true	],
		["WP0"	, "RPG32_F"							        , 150	, false	, true	, true	],
		["WP0"	, "RPG32_HE_F"							    , 200	, false	, true	, true	],
		["AA"	, "Titan_AA"							    , 100	, true	, true	, true	],
		["WP3"	, "Titan_AP"							    , 120	, true	, true	, true	],
		["AT"	, "Titan_AT"							    , 150	, true	, true	, true	],
        ["WP0"	, "NLAW_F"							        , 150	, true	,false	, true	],
		["WP0"	, "16Rnd_9x21_Mag"						    , 30	, true	, true	, true	],
		["WP0"	, "30Rnd_9x21_Mag"						    , 35	, true	, true	, true	],
		["WP0"	, "9Rnd_45ACP_Mag"						    , 30	, false	, true	, true	],
		["WP0"	, "7Rnd_408_Mag"						    , 30	, true	, false	, true	],
		["WP1"	, "11Rnd_45ACP_Mag"                         , 50	, true	, false	, true	],
		["WP1"	, "6Rnd_45ACP_Cylinder"                     , 50	, false	, true	, true	],
		["WP0"	, "100Rnd_65x39_caseless_mag"				, 150	, true	, false	, true	],
		["WP0"	, "100Rnd_65x39_caseless_mag_Tracer"		, 150   , true	, false	, true	],
		["WP0"	, "200Rnd_65x39_cased_Box"					, 200   , true	, false	, true	],
		["WP0"	, "200Rnd_65x39_cased_Box_Tracer"			, 200	, true	, false	, true	],
		["WP0"	, "1Rnd_HE_Grenade_shell"					, 6		, true	, true	, true	],
		["WP0"	, "1Rnd_Smoke_Grenade_shell"				, 6		, true	, true	, true	],
		["WP0"	, "1Rnd_SmokeRed_Grenade_shell"				, 6		, true	, true	, true	],
		["WP0"	, "1Rnd_SmokeGreen_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "1Rnd_SmokeYellow_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "1Rnd_SmokePurple_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "1Rnd_SmokeBlue_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "1Rnd_SmokeOrange_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "UGL_FlareWhite_F"						, 6		, true	, true	, true	],
		["WP0"	, "UGL_FlareGreen_F"						, 6		, true	, true	, true	],
		["WP0"	, "UGL_FlareRed_F"						    , 6		, true	, true	, true	],
		["WP0"	, "UGL_FlareYellow_F"						, 6		, true	, true	, true	],
		["WP0"	, "UGL_FlareCIR_F"						    , 6		, true	, true	, true	],
		["WP1"	, "3Rnd_HE_Grenade_shell"					, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_Smoke_Grenade_shell"				, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_SmokeRed_Grenade_shell"				, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_SmokeGreen_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_SmokeYellow_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_SmokePurple_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_SmokeOrange_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_SmokeBlue_Grenade_shell"			, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_UGL_FlareWhite_F"					, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_UGL_FlareGreen_F"					, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_UGL_FlareRed_F"						, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_UGL_FlareYellow_F"					, 6		, true	, true	, true	],
		["WP0"	, "3Rnd_UGL_FlareCIR_F"						, 12	, true	, true	, true	]
	];
///////////////
//// Functions	
///////////////
_GearArrayBySide	=
{
	private["_this", "_Array", "_Side", "_NewArray", "_SideNum"];
	
	_Array		= _this select 0;	// Gear Array
	_Side		= _this select 1;	// Side or String "All"
	_NewArray	= [];				// Gear Sort By  Side
	_SideNum	= switch _Side do	// Side Column Number 
	{
		case west		: {3};
		case east		: {4};
		case resistance	: {5};
	};
	
	{
		private["_GearLevel", "_Available"];
		
		// Check Gear Available for this Side (Can Be String "All")  
		_Available	= if ((typeName _Side) == "SIDE") then {_x select _SideNum} else {true}; 
		
		// Write Available Gear to New Array (Upgrade Level, Type, Money Cost)
		if (_Available) then {_NewArray = _NewArray + [[_x select 0, _x select 1 , _x select 2]]};
	} forEach _Array;
	
	/// Return Gear Array Sorted by Side
	_NewArray
};
	
/////////////////
//// Main Script
/////////////////
_Side		= _this select 0;	// Side or String "All"
_Question	= _this select 1;	// Gear Data Name 

_GearArray	= switch (_Question) do
{
	case "Primary"		: {_Primary};
	case "Secondary"	: {_Secondary};
	case "HandGun"		: {_HandGun};
	case "Ammunition"	: {_Ammunition};
	case "Muzzles"		: {_Muzzles};
	case "Optics"		: {_Optics};
	case "Acc"			: {_Acc};
	case "Uniform"		: {_Uniform};
	case "Vest"			: {_Vest};
	case "Backpack"		: {_Backpack};
	case "Glasses"		: {_Glasses};
	case "Helmet"		: {_Helmet};
	case "Item"			: {_Item};
	case "Ammo"			: {_Ammo};
};

//// Sort Gear By Side
_GearArray 	= [_GearArray, _Side] call _GearArrayBySide;

//// Reutrn Gear Array Sorted by Side
_result 	= _GearArray;
_result