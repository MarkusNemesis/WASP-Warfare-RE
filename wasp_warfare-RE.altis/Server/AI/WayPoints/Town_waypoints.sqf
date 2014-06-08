 _Group  = _this select 0;
_GroupType = _this select 1;
_Camp  = _this select 2;
_TownPos = _this select 3;
_TownRange = _this select 4;
_WWCamps = _this select 5;
_TownsCamps = _this select 6;
  if (_GroupType == "Guard" ) then{
 _WayPoint = _Group addWaypoint [getPosATL  (_Camp select 1), 0];
 _WayPoint waypointAttachObject (_Camp select 1);
  _WayPoint setWaypointType "MOVE";
 _WayPoint setWaypointHousePosition 2;

};

 if (_GroupType == "Recon" ) then{
 _WayPoint = _Group addWaypoint [_TownPos, _TownRange];
 _WayPoint setWaypointType "SAD";
 _WayPoint setWaypointSpeed "LIMITED";
  _WayPoint = _Group addWaypoint [_TownPos, _TownRange];
 _WayPoint setWaypointType "SAD";
 _WayPoint setWaypointSpeed "LIMITED";
 _WayPoint = _Group addWaypoint [_TownPos, _TownRange];
 _WayPoint setWaypointType "CYCLE";
 _WayPoint setWaypointSpeed "LIMITED";

};

 if (_GroupType == "Patrol") then{
 for "_i" from 0 to (count(_TownsCamps)-1) do  {
  _CampPos  = getPosATL  ((_WWCamps select (_TownsCamps select _i)) select 1);
  _WayPoint = _Group addWaypoint [_CampPos, 30];
  _WayPoint setWaypointType "MOVE";
  _WayPoint setWaypointSpeed "LIMITED";
         if (_i == (count(_TownsCamps)-1)) then  {
   _WayPoint = _Group addWaypoint [_TownPos, 30];
   _WayPoint setWaypointType "MOVE";
   _WayPoint setWaypointSpeed "LIMITED";
   _WayPoint setWaypointCombatMode "NO CHANGE";
   _WayPoint setWaypointBehaviour "UNCHANGED";
         _WayPoint = _Group addWaypoint [_CampPos, 30];
   _WayPoint setWaypointType "CYCLE";
   _WayPoint setWaypointSpeed "LIMITED";
   _WayPoint setWaypointCombatMode "NO CHANGE";
   _WayPoint setWaypointBehaviour "UNCHANGED";
   
};

 
};


};

if (_GroupType == "WaterPatrol") then{
 private["_Dir", "_Points"];
 _Dir   = 0;
 _Points  = [];
   waitUntil {
  private["_Dist", "_RespPos"];
  _Dir  = _Dir + 50;
 if (_Dir > 360) then {
_Dir = _Dir - 360
};

  _Dist  = _TownRange + floor(random 100);
  _RespPos = [(_TownPos select 0) + sin _Dir * _Dist, (_TownPos select 1) + cos _Dir * _Dist, _TownPos select 2];
    if (surfaceIsWater _RespPos) then {
_Points set [count _Points, _RespPos]
};

    (count _Points == 2) 
};

  _WayPoint = _Group addWaypoint [_Points select 0, 100];
 _WayPoint setWaypointType "MOVE";
 _WayPoint setWaypointSpeed "LIMITED";
 _WayPoint setWaypointCombatMode "RED";
 _WayPoint setWaypointBehaviour "AWARE";
     _WayPoint = _Group addWaypoint [_Points select 1, 100];
 _WayPoint setWaypointType "MOVE";
 _WayPoint setWaypointSpeed "LIMITED";
 _WayPoint setWaypointCombatMode "NO CHANGE";
 _WayPoint setWaypointBehaviour "UNCHANGED";
   _WayPoint = _Group addWaypoint [_Points select 0, 100];
 _WayPoint setWaypointType "CYCLE";
 _WayPoint setWaypointSpeed "LIMITED";
 _WayPoint setWaypointCombatMode "NO CHANGE";
 _WayPoint setWaypointBehaviour "UNCHANGED";
 
};

