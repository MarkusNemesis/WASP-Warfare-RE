//// Data
//// All Ambulance Array for Respawn Script
//// DeraKOren
////////////////////////////////////////////
// _this: side or "all", [Side] or [String]
private["_AmbulanceArray", "_result"];
//// Data Array
////////////////
_AmbulanceArray	=
[	
//[ 0							, 1				]
//[ Class or Type				, Side			]
["B_Truck_01_medical_F"		, [west]		],
["O_Truck_02_medical_F"		, [east]		],
["I_Truck_02_medical_F"		, [resistance]	]
];
//// Main Script
/////////////////
_result	= [];
switch (typeName _this)	do {
	/// Get Ambulance Classes by Side
case "SIDE"		: {
		for "_i" from 0 to (count(_AmbulanceArray)-1) do
		{
			private["_AmbuSide"];
			_AmbuSide	= (_AmbulanceArray select _i) select 1;						// [Array] Ambulance Sides
			if (_this in _AmbuSide) then {
				_result set [count _result, (_AmbulanceArray select _i) select 0];
			};
		};
	};
	/// Get All Ambulance Classes 
case "STRING"	: {
		if (tolower _this == "all") then {
			for "_i" from 0 to (count(_AmbulanceArray)-1) do {
				_result set [count _result, (_AmbulanceArray select _i) select 0];
			};
		};
	};
};
//// Return Ambulance Classes Array	[class, class, ... ]
_result
