 private ["_WWCamp","_PreCamp", "_CreateMGPointNearCamp"];
_WWCamp = [];
_PreCamp = [          [ Camp_1 , 0  ],    [ Camp_2 , 1  ],    [ Camp_3 , 1  ],    [ Camp_4 , 2  ],    [ Camp_5 , 2  ],    [ Camp_6 , 3  ],    [ Camp_7 , 4  ],    [ Camp_8 , 4  ],    [ Camp_9 , 4  ],    [ Camp_10 , 5  ],    [ Camp_11 , 5  ],    [ Camp_12 , 5  ],    [ Camp_13 , 6  ],    [ Camp_14 , 6  ],    [ Camp_15 , 6  ],    [ Camp_16 , 7  ],    [ Camp_17 , 7  ],    [ Camp_18 , 7  ],    [ Camp_19 , 8  ],    [ Camp_20 , 8  ],    [ Camp_21 , 8  ],    [ Camp_22 , 8  ],    [ Camp_23 , 9  ],    [ Camp_24 , 9  ],    [ Camp_25 , 10  ],    [ Camp_26 , 10  ],    [ Camp_27 , 11  ],    [ Camp_28 , 12  ],    [ Camp_29 , 12  ],    [ Camp_30 , 13  ],    [ Camp_31 , 13  ],    [ Camp_32 , 14  ],    [ Camp_33 , 14  ],    [ Camp_34 , 14  ],    [ Camp_35 , 14  ],    [ Camp_36 , 15  ],    [ Camp_37 , 15  ],    [ Camp_38 , 16  ],    [ Camp_39 , 16  ],    [ Camp_40 , 17  ],    [ Camp_41 , 17  ],    [ Camp_42 , 18  ],    [ Camp_43 , 18  ],    [ Camp_44 , 19  ],    [ Camp_45 , 20  ],    [ Camp_46 , 20  ],    [ Camp_47 , 21  ],    [ Camp_48 , 21  ],    [ Camp_49 , 22  ],    [ Camp_50 , 23  ],    [ Camp_51 , 24  ],    [ Camp_52 , 25  ],    [ Camp_53 , 26  ],    [ Camp_54 , 27  ],    [ Camp_55 , 27  ],    [ Camp_56 , 28  ],    [ Camp_57 , 28  ],    [ Camp_58 , 29  ],    [ Camp_59 , 30  ],    [ Camp_60 , 31  ],    [ Camp_61 , 32  ],    [ Camp_62 , 33  ],    [ Camp_63 , 34  ],    [ Camp_64 , 35  ],    [ Camp_65 , 36  ],    [ Camp_66 , 36  ],    [ Camp_67 , 36  ],    [ Camp_68 , 37  ],    [ Camp_69 , 37  ],    [ Camp_70 , 37  ],    [ Camp_71 , 38  ],    [ Camp_72 , 38  ],    [ Camp_73 , 39  ],    [ Camp_74 , 39  ],    [ Camp_75 , 39  ],    [ Camp_76 , 40  ],    [ Camp_77 , 40  ],    [ Camp_78 , 41  ],    [ Camp_79 , 41  ],    [ Camp_80 , 42  ],    [ Camp_81 , 42  ],    [ Camp_82 , 43  ],    [ Camp_83 , 43  ],    [ Camp_84 , 44  ],    [ Camp_85 , 44  ],    [ Camp_86 , 44  ],    [ Camp_87 , 45  ],    [ Camp_88 , 46  ],    [ Camp_89 , 46  ],    [ Camp_90 , 46  ],    [ Camp_91 , 47  ],    [ Camp_92 , 47  ],    [ Camp_93 , 47  ],    [ Camp_94 , 48  ],    [ Camp_95 , 49  ],    [ Camp_96 , 49  ],    [ Camp_97 , 50  ],    [ Camp_98 , 51  ],    [ Camp_99 , 51  ],    [ Camp_100 , 51  ],    [ Camp_101 , 52  ],    [ Camp_102 , 53  ]   ];
   _CreateMGPointNearCamp ={
     private["_Town", "_Camp", "_TownPos", "_CampPos", "_Dist", "_Dir", "_MGPos", "_MGBunker", "_MGWeapon", "_ATWeapon",   "_ATPos"];
 _Town  = _this select 0;
    _Camp  = _this select 1;
    _TownPos = getPosASL _Town;
    _CampPos  = getPosASL _Camp;
    _Dist  = 15;
         _Dir  = ((_CampPos select 0) - (_TownPos select 0)) atan2 ((_CampPos select 1) - (_TownPos select 1));
 _MGPos  = [(_CampPos select 0) + sin _Dir * _Dist, (_CampPos select 1) + cos _Dir * _Dist, _CampPos select 2];
   _MGBunker = "Land_BagBunker_Small_F" createVehicle _MGPos;
 _MGWeapon = "B_HMG_01_high_F" createVehicle _MGPos;
 _MGBunker setDir (_Dir - 180);
 _MGWeapon setDir _Dir;
 _MGBunker setPosASL [_MGPos select 0, _MGPos select 1,  (getTerrainHeightASL [_MGPos select 0, _MGPos select 1])];
 _MGWeapon setPosASL [_MGPos select 0, _MGPos select 1,  (getTerrainHeightASL [_MGPos select 0, _MGPos select 1])];
  _MGBunker setVectorUp (surfaceNormal _MGPos);
 _MGWeapon setVectorUp (surfaceNormal _MGPos);
 
};

_WWTowns  = Public_TownsArray;
  for "_i" from 0 to (count(_PreCamp)-1) do{
 _OldCamp  = (_PreCamp select _i) select 0;
 _Pos  = getPos _OldCamp;
 _Dir  = getDir _OldCamp;
 _TownID  = (_PreCamp select _i) select 1;
 _NCampName = "Land_BagBunker_Tower_F";
     deleteVehicle _OldCamp;
 _NewCamp = _NCampName createVehicle _Pos;
 _NewCamp setPosASL [_Pos select 0, _Pos select 1, (getTerrainHeightASL [_Pos select 0, _Pos select 1]) - 0.2 ];
 _NewCamp setDir _Dir;
   _NewCamp setVectorUp (surfaceNormal _Pos);
                     _WWCamp set [_i,[_i,_NewCamp,_TownID ,resistance ,10   ,30   ,6  , [false,false,false]]];
  _NewCamp addEventhandler ["HandleDamage",{
_result = 0, _result}];
    _Town  = _WWTowns select _TownID;
 _TownCamps = _Town select 9;
 _TownCamps set [count(_TownCamps),_i];
 _Town     set [ 9, _TownCamps];
 _WWTowns   set [_TownID,_Town];
  [_Town select 1, _NewCamp] call _CreateMGPointNearCamp;

};

  _PreCamp = nil;
 Public_TownsArray = _WWTowns;
Public_CampsArray = _WWCamp;
_WWCamp = nil;
