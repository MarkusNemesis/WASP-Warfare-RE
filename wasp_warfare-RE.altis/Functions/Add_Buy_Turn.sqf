private["_FactoryType", "_Building", "_VehType", "_VehRank", "_Time", "_TimeCreate", "_CreateScript", "_Group", "_Driver",  "_Guner", "_Driver", "_Commander", "_Type", "_DataToServer", "_RespawnPos"];
_FactoryType = _this select 0;
   _Building  = _this select 1;
   _VehType  = _this select 2;
_VehRank  = _this select 3;
   _Time   = _this select 4;
_TimeCreate  = _this select 5;
_CreateScript = _this select 6;
_Group   = _this select 7;
_Driver   = _this select 8;
   _Guner   = _this select 9;
   _Commander  = _this select 10;
   _Lock   = _this select 11;
   _RespawnPos  = _Building select 5;
   if (_FactoryType == "TC") then{
 private ["_RespawnPos", "_TownPos", "_TownDir", "_Dis"];
 _TownPos = getPosATL  (_Building select 1);
 _TownDir = getDir (_Building select 1);
 _Dis = 15;
  _RespawnPos = [(_TownPos select 0) + sin _TownDir * _Dis, (_TownPos select 1) + cos _TownDir * _Dis, _TownPos select 2];
 _Building = [_Building select 0, _Building select 1, "", "", "", _RespawnPos];
}else{
   private["_BuildingObj", "_BuildingDir", "_BuildingPos", "_Distance"];
 _BuildingObj = _Building select 1;
      _BuildingDir = getDir _BuildingObj;
      _BuildingPos = position _BuildingObj;
     _Distance  = 30;
           _BuildingDir = _BuildingDir - 180;
        _RespawnPos = [  (_BuildingPos select 0) + sin _BuildingDir * _Distance,  (_BuildingPos select 1) + cos _BuildingDir * _Distance,  _BuildingPos select 2 ];

};

_DataToServer = [ _Building select 1,   _VehType,     _VehRank,     _Time,      _TimeCreate,    _CreateScript,    _Group,      _Driver,     _Guner,      _Commander,     _Lock,      _RespawnPos    ];
["Public_BuyTurn", "End", [false,false,false], _DataToServer] call Send_ArrayRow;
