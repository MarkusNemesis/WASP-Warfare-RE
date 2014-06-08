private ["_Camps"];
 _Camps = Public_CampsArray;
{
 private["_Camp", "_CampObj", "_CampPos", "_EnemySide", "_CampRange", "_EnemyInRange", "_CampSide", "_CampID"];
   _Camp   = _x;
       _CampID   = _forEachIndex;
    _CampObj  = _Camp select 1;
    _CampSide  = _Camp select 3;
      _CampRange  = 6;
       _EnemySide   = switch (_CampSide) do   {
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

    _EnemyInRange = ["Man", _CampObj, _CampRange, _EnemySide] call ServerTown_EnemyNear;
   if (_EnemyInRange > 0) then  {
  private["_FriendInRange", "_CampPoints", "_CampMaxPoints"];
  _FriendInRange = ["Man", _CampObj, _CampRange, [_CampSide]] call ServerTown_EnemyNear;
  _CampPoints  = _Camp select 4;
           _CampMaxPoints = _Camp select 5;
           _NearestMan  = nearestObjects [_CampObj, ["Man"], _CampRange];
      if (_EnemyInRange > _FriendInRange) then   {
   _CampPoints = _CampPoints - 3;
  
};

      if ((_FriendInRange > _EnemyInRange) && (_CampPoints < _CampMaxPoints)) then  {
   _CampPoints = _CampPoints + 1;
  
};

    if (_CampPoints <= 0) then  {
   private["_ChangeSidePublic"];
   _ChangeSidePublic =   {
    ["Public_CampsArray", _CampID, 3, _Camp select 7, _this] call Send_ArrayRowCol;
   
};

         {
    private["_ManSideCount"];
    _ManSideCount = ["Tank", _CampObj, _CampRange, [_x]] call ServerTown_EnemyNear;
            if (_ManSideCount > 0) then    {
     private["_CampCanSee", "_Slc"];
     _CampCanSee = _Camp select 7;
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

     _CampCanSee set [_Slc, true];
           _Camp set [7, _CampCanSee];
    
};

   } forEach _EnemySide;
   ["Public_CampsArray", _CampID, 7, _Camp select 7, _Camp select 7] call Send_ArrayRowCol;
        [_CampSide, [_Camp select 2, {
["CampLost", _this] call SayMSG_All}], ObjNull] call Send_Run;
        switch (_CampSide) do   {
    case resistance  : {
     private["_West", "_East"];
     _West = ["Man", _CampObj, _CampRange, [west]] call ServerTown_EnemyNear;
     _East = ["Man", _CampObj, _CampRange, [east]] call ServerTown_EnemyNear;
         if (_West > _East) then {
_Camp set [3, west];
 west call _ChangeSidePublic}      else {
_Camp set [3, east];
 east call _ChangeSidePublic
};

    
};

    case west   : {
_Camp set [3, east];
 east call _ChangeSidePublic
};

    case east   : {
_Camp set [3, west];
 west call _ChangeSidePublic
};

   
};

         [_Camp select 3, [_Camp select 2, {
["CampCapt", _this] call SayMSG_All}], ObjNull] call Send_Run;
         _Payment = {
    private["_Description", "_Price"];
    _Description = format["%1 Camp taken", (Public_TownsArray select _this) select 2];
    _Price   = 100;
    ["Camp", _Description, _Price] spawn HintMSG_Pay;
      [Player, 0, _Price] call SetPlayerSupplyMoney;
     
};

         {
    if (isPlayer _x) then {
     [_x, [_Camp select 2, _Payment], ObjNull] call Send_Run;
    
};

   } forEach _NearestMan;
         _CampPoints = floor (_CampMaxPoints / 3);
   ["Public_CampsArray", _CampID, 4, _Camp select 7, _CampPoints] call Send_ArrayRowCol;
  
};

      _CampPoints = if (_CampPoints > _CampMaxPoints) then {
_CampMaxPoints} else {
_CampPoints
};

  _Camp set[4, _CampPoints];
      _Camps set [_forEachIndex, _Camp];
  ["Public_CampsArray", _CampID, 4, _NearestMan, _CampPoints] call Send_ArrayRowCol_PList;
 
};

} forEach _Camps;
