private[];
WaitUntil{
 private["_RespawnEnd","_RespawnInfo","_DiePos", "_RespawnPoint", "_TimeEnd", "_RespawnList", "_Towns", "_TownList", "_CampList",   "_BaseList", "_MHQList", "_Camps", "_CampListE", "_AmbuList"];
  _RespawnEnd  = false;
          _RespawnInfo = uiNamespace getVariable "Respawn";
   _DiePos   = _RespawnInfo select 0;
      _RespawnPoint = _RespawnInfo select 1;
      _TimeEnd  = _RespawnInfo select 2;
       _TimeEnd   = round(_TimeEnd - time);
      _RespawnList = _RespawnInfo select 3;
       _Towns   = Public_TownsArray;
       _Camps   = Public_CampsArray;
         _TownList  = [];
 _CampList  = [];
 _CampListE  = [];
 _BaseList  = [];
 _MHQList  = [];
 _AmbuList  = [];
    {
  private["_Town", "_TownSize", "_TownRange", "_TownObj", "_Distance", "_TownCamps"];
   _Town   = _x;
  _TownCamps  = _Town select 9;
  _TownName  = _Town select 2;
  _TownObj  = _Town select 1;
  _TownSize  = _Town select 3;
   _TownRange   = 150 + (20 * _TownSize);
  _Distance  = _TownObj distance _DiePos;
   if (_Distance <= _TownRange) then {
_TownList set[ count(_TownList), [_TownName,_TownCamps]]
};

 } forEach _Towns;
    {
  private ["_TownInList", "_TownCamps"];
    _TownInList = _x;
  _TownCamps = _TownInList select 1;
    {
   private["_Camp", "_CampID", "_CampSide", "_CampObj"];
   _CampID  = _x;
   _Camp  = _Camps select _CampID;
   _CampSide = _Camp select 3;
   _CampObj = _Camp select 1;
       if (_CampSide == (side Player)) then   {
    _CampList set[ count(_CampList), [_TownInList select 0,_CampID, _CampObj] ];
   
};

  } forEach _TownCamps;
 } forEach _TownList;
    {
  private["_Camp", "_CampObj", "_TownName"];
  _Camp   = _x;
  _CampObj = _Camp select 2;
  _TownName = _Camp select 0;
  _EnemySide = if (side Player == west) then {
[east, resistance]} else {
[west, resistance]
};

     _Enemy  = ["Tank", _CampObj, 10, _EnemySide] call Calculate_EnemyNear;
  if (_Enemy == 0) then {
_CampListE set[count(_CampListE),_x];

};

 } forEach _CampList;
    private["_AllAreaBld", "_Areas"];
  _AllAreaBld = [side Player] call Fun_GetAllAreaAndBld;
 _Areas  = _AllAreaBld select 0;
  if (((_Areas select 0) select 0) != -1) then {
  {
   private["_Area", "_AreaId", "_Bld"];
   _Area  = _x;
   _AreaId = _forEachIndex;
   _Bld = _Area select 3;
   if (count(_Bld) > 0) then {
    {
     private["_BldArray", "_BldObj", "_BldAbr"];
     _BldArray = _x;
     _BldObj  = _BldArray select 1;
     _BldAbr  = _BldArray select 4;
     _BaseList set [count(_BaseList),[format["BASE-%1",_AreaId], _BldAbr, _BldObj]];
    } forEach _Bld;
   
};

  } forEach _Areas;
 
};

    private["_MHQobj"];
  _MHQobj  = if (side Player == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

   if (alive _MHQobj) then {
_MHQList = [["MHQ", "", _MHQobj]]
};

           private["_AmbuType", "_AmbuRange", "_AmbuArray"];
 _AmbuType = if (side Player == west) then {
"B_Truck_01_medical_F"} else {
"O_Truck_02_medical_F"
};

 _AmbuRange = 200;
 _AmbuArray = nearestObjects [_DiePos, [_AmbuType], _AmbuRange];
  {
  private ["_Dist"];
  _Dist = format["%1m", _DiePos distance _x];
  if (alive _x) then {
_AmbuList set [count(_AmbuList), ["AMBULANCE", _Dist, _x]]
};

 } forEach _AmbuArray;
      _RespawnList = _CampListE + _AmbuList + _BaseList + _MHQList;
 _RespawnInfo set[3, _RespawnList];
 uiNamespace setVariable ["Respawn", _RespawnInfo];
     if (_TimeEnd <= 0) then  {
   private["_RespPosition","_Range"];
    _RespPosition = getPosATL  (_RespawnPoint select 2);
   _Range  = 20;
      _RespawnPos = [(_RespPosition select 0)  + random(_Range),(_RespPosition select 1) + random(_Range),_RespPosition select 2];
  Player setPosATL _RespawnPos;
      uiNamespace setVariable ["Respawn", [ getPosATL  Player , ["MHQ", "", _MHQobj] , -1,[]]];
    _RespawnEnd  = true;
   
};

  sleep 1;
 _RespawnEnd}