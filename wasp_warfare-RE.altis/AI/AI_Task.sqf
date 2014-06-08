 private ["_CreateTask"];
_CreateTask ={
   private["_this", "_Side", "_Distance", "_NearestTown"];
 _Side   = side _this;
 _Distance  = 10000000;
 _NearestTown = [];
  {
  private["_TownObj", "_TownSide", "_Dist"];
  _TownObj = _x select 1;
       _TownSide = _x select 7;
       _Dist  = _this distance _TownObj;
      if (_TownSide != _Side && {
_Dist < _Distance}) then {
   private["_TownSize", "_TownRange"];
   _Distance  = _Dist;
   _TownSize  = _x select 3;
   _TownRange  = 150 + (20 * _TownSize);
   _NearestTown = [_TownObj, _forEachIndex, _TownRange];
     
};

 } forEach Public_TownsArray;
  {
deleteWaypoint _x} forEach waypoints (group _this);
 _WayPoint = (group _this) addWaypoint [getPosATL  (_this), 5];
 _WayPoint setWaypointType "Move";
 (group _this) setCurrentWaypoint _WayPoint;
 _WayPoint = (group _this) addWaypoint [getPosATL  (_NearestTown select 0), _NearestTown select 2];
 _WayPoint setWaypointType "SAD";
    ["taketown", _NearestTown select 1]
};

private["_AITLObj", "_AITLTask", "_Task"];
_AITLObj = _this select 0;
     _AITLTask = _this select 2;
     _Task  = toLower (_AITLTask select 0);
  if (alive _AITLObj) then {
_AITLTask = _AITLObj call _CreateTask
};

_this set [2 , _AITLTask];
_this