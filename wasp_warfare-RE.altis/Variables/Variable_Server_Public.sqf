Public_Supply  = if(Debug)then{
[ 10000 , 10000 ]}else{
[ paramsArray select 2 ,paramsArray select 2 ]
};

 Public_PlayerList  = [];
   Public_VoteBF  = ["nobody" , -1  , []  , 0  ];
Public_VoteOF   = ["nobody" , -1  , []  , 0  ];
  Public_BaseAreaBF = [];
Public_BaseAreaOF = [];
      Public_BuyTurn   = [];
Public_BuyTurnNumber = [];
  Public_VehMarkers = [ [], []];
 _UpgradesData  = Compile preprocessFileLineNumbers "Data\Data_Upgrades.sqf";
Public_UpgradesBF = ["", "Public" call _UpgradesData];
Public_UpgradesOF = ["", "Public" call _UpgradesData];
  