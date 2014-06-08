      private["_Towns"];
_Towns = Public_TownsArray;
{
 private["_Town", "_TownId", "_TownSide", "_EnemySide", "_TownSize", "_TownRange","_SpotRange", "_TownRespawn",   "_TownLastResp", "_RespawnPause", "_TownUpTime", "_UpTimePause", "_TownMaxPoint", "_TownPoint",   "_DeletePause"];
   _Town   = _x;
       _TownId   = _forEachIndex;
    _TownObj  = _Town select 1;
    _TownSize  = _Town select 3;
    _TownMaxPoint = _Town select 6;
    _TownSide  = _Town select 7;
    _TownPoint  = _Town select 8;
    _TownRespawn = _Town select 11;
    _TownLastResp = _Town select 12;
    _TownUpTime  = _Town select 14;
      _TownRange    = 150 + (20 * _TownSize);
  _SpotRange  = _TownRange + 400;
    _RespawnPause = if (_TownSide == resistance) then {
10} else {
180
};

  _DeletePause = 180;
       _UpTimePause = 60;
        _EnemySide   = switch (_TownSide) do   {
  case west  : {
[east]
};

  case east  : {
[west]
};

  case resistance : {
[west, east]
};

 
};

      if (!_TownRespawn && (time > _TownLastResp + _RespawnPause)) then {
  private[ "_EnemySpot"];
    _EnemySpot = ["Tank", _TownObj, _SpotRange, _EnemySide] call ServerTown_EnemyNear;
      if (_EnemySpot > 0) then   {
      [_TownSide, [_TownId, {
["TownEnem", _this] call SayMSG_All}], ObjNull] call Send_Run;
     _Town set [11, true];
     _Town set [12, time];
     ["Public_TownsArray", _TownId, 11, _Town select 13, true] call Send_ArrayRowCol;
   ["Public_TownsArray", _TownId, 12, _Town select 13, time] call Send_ArrayRowCol;
         [_Town, nil] spawn ServerTown_Respawn;
  
};

 
};

    if (_TownRespawn && (time > _TownLastResp + _DeletePause)) then {
  private["_EnemyInRange"];
    _EnemyInRange = ["Tank", _TownObj, _SpotRange, _EnemySide] call ServerTown_EnemyNear;
      _Town set [12, if (_TownSide == resistance) then {
time - _RespawnPause * 2} else {
time}];
     ["Public_TownsArray", _TownId, 12, _Town select 13, time] call Send_ArrayRowCol;
      if (_EnemyInRange <= 0) then  {
   _Town set [11, false];
     ["Public_TownsArray", _TownId, 11, _Town select 13, false] call Send_ArrayRowCol;
         _Town call ServerTown_DeleteAI;
         ["Public_TownsArray", _TownId, 10, [false, false, false], []] call Send_ArrayRowCol;
  
};

 
};

    if (_TownRespawn) then {
  private["_EnemyInRange", "_FriendInRange", "_TownMinPoint", "_TownPointBack"];
    _EnemyInRange = ["Tank", _TownObj, _TownRange, _EnemySide] call ServerTown_EnemyNear;
  _FriendInRange = ["Tank", _TownObj, _TownRange, [_TownSide]] call ServerTown_EnemyNear;
  _TownMinPoint = round(_TownMaxPoint / 3);
  _TownPointBack = _TownPoint;
      if (_EnemyInRange > 0) then  {
      _Town set [12, time];
   Public_TownsArray set [_TownId, _Town];
         {
    private["_ManSideCount"];
    _ManSideCount = ["Tank", _TownObj, _TownRange, [_x]] call ServerTown_EnemyNear;
            if (_ManSideCount > 0) then    {
     private["_TownCanSee", "_Slc"];
     _TownCanSee = _Town select 13;
     _Slc   = switch (_x) do      {
      case west  : {
0
};

      case east  : {
1
};

      case resistance : {
2
};

     
};

     _TownCanSee set [_Slc, true];
          _Town set [13, _TownCanSee];
     ["Public_TownsArray", _TownId, 13, _Town select 13, _TownCanSee] call Send_ArrayRowCol;
              
};

   } forEach _EnemySide;
  
};

        if (_EnemyInRange > _FriendInRange) then  {
   _TownPoint = _TownPoint - (_EnemyInRange - _FriendInRange);
  
};

      if ((_EnemyInRange < _FriendInRange) && (_TownPoint < _TownMinPoint)) then  {
   _TownPoint = _TownPoint + (_FriendInRange - _EnemyInRange);
  
};

      if (_TownPoint <= 0) then  {
   private["_ChangeTownCampsSideScript"];
         _ChangeTownCampsSideScript =    {
    private["_this", "_Town", "_NewSide", "_Slc", "_TownsCamps"];
    _Town  = _this select 0;
          _NewSide = _this select 1;
              _TownsCamps = _Town select 9;
          _Camps  = Public_CampsArray;
                 {
     private["_Camp", "_CampCanSee"];
     _Camp  = _Camps select _x;
                         _CampCanSee = _Camp select 7;
     _Slc  = switch (_NewSide) do      {
      case west  : {
0
};

      case east  : {
1
};

      case resistance : {
2
};

     
};

     _CampCanSee set [_Slc, true];
                 _Camp set [7, _CampCanSee];
        _Camp set [3, _NewSide];
        ["Public_CampsArray", _x, 7, _CampCanSee, _CampCanSee] call Send_ArrayRowCol;
     ["Public_CampsArray", _x, 3, _CampCanSee, _NewSide] call Send_ArrayRowCol;
         } forEach _TownsCamps;
   
};

                          ["Public_TownsArray", _TownId, 10, [false, false, false], []] call Send_ArrayRowCol;
         [_TownSide, [_TownId, {
["TownLost", _this] call SayMSG_All}], ObjNull] call Send_Run;
      switch (_TownSide) do   {
    case resistance  : {
     private["_West", "_East"];
     _West = ["Tank", _TownObj, _TownRange, [west]] call ServerTown_EnemyNear;
     _East = ["Tank", _TownObj, _TownRange, [east]] call ServerTown_EnemyNear;
         if (_West > _East) then {
_Town set [7, west]} else {
_Town set [7, east]
};

    
};

    case west   : {
_Town set [7, east]
};

    case east   : {
_Town set [7, west]
};

   
};

   ["Public_TownsArray", _TownId, 7, _Town select 13, _Town select 7] call Send_ArrayRowCol;
         [_Town select 7, [_TownId, {
["TownCapt", _this] call SayMSG_All}], ObjNull] call Send_Run;
            _NearestMan = nearestObjects [_TownObj, ["Man"], _TownRange];
    _Payment  = {
    private["_Description", "_Price", "_TownName", "_TownSize"];
    _TownName  = _this select 0;
    _TownSize  = _this select 1;
    _Description = format["Town '%1' taken", _TownName];
    _Price   = 1000 + 200 * _TownSize;
    ["Town", _Description, _Price] spawn HintMSG_Pay;
      [Player, 0, _Price] call SetPlayerSupplyMoney;
      
};

         {
    if (isPlayer _x) then {
     [_x, [[_Town select 2,_TownSize], _Payment], ObjNull] call Send_Run;
    
};

   } forEach _NearestMan;
         _Town set [11, false];
     _Town set [12, time];
     ["Public_TownsArray", _TownId, 11, _Town select 13, false] call Send_ArrayRowCol;
   ["Public_TownsArray", _TownId, 12, _Town select 13, time] call Send_ArrayRowCol;
         [_Town, _Town select 7] call _ChangeTownCampsSideScript;
         _TownPoint = _TownMinPoint;
  
};

      if (_TownPoint != _TownPointBack) then {
   _Town set[8, _TownPoint];
   ["Public_TownsArray", _TownId, 8, _Town select 13, _TownPoint] call Send_ArrayRowCol;
  
};

 
};

     if (!_TownRespawn && (time > _TownUpTime + _UpTimePause) && (_TownSide in [west, east]) && (_TownPoint < _TownMaxPoint)) then {
  _TownPoint = _TownPoint + 1;
       _TownPoint = if ((_TownPoint) > _TownMaxPoint) then {
_TownMaxPoint} else {
_TownPoint
};

        _Town set [8, _TownPoint];
    _Town set [14, time];
     ["Public_TownsArray", _TownId, 14, _Town select 13, time] call Send_ArrayRowCol;
  ["Public_TownsArray", _TownId, 8, _Town select 13, _TownPoint] call Send_ArrayRowCol;
   
};

} forEach _Towns;
