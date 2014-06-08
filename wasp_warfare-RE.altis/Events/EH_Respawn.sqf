 private ["_this", "_DeadBody", "_NewBody", "_DeadBdPos", "_MHQobj", "_RespawnInfo"];
_NewBody = _this select 0;
  _DeadBody = _this select 1;
  if (!isPlayer _NewBody) then  {
   private["_MHQ", "_RespawnPos", "_AI_Array", "_RespawnPoints"];
 _ResPoint = ObjNull;
        (Group _NewBody)  selectLeader _NewBody;
 _NewBody setRank "MAJOR";
   _NewBody disableAI "MOVE";
   _AI_Array = switch (side _NewBody) do {
  case west  : {
AI_WEST
};

  case east  : {
AI_EAST
};

 
};

  {
  if ((_x select 0) == _DeadBody) exitWith {
   _x set [0, _NewBody];
       _x set [2, ["notask"]];
       _AI_Array set [_forEachIndex, _x];
  
};

 } forEach _AI_Array;
 for "_i" from 0 to 30 do  {
      _RespawnPoints = [GetPosASL _DeadBody, side (Group _NewBody)] call Fun_GetRespawnPoints;
   _Distance  = 100000;
        for "_r" from 0 to ((count _RespawnPoints) - 1) do  {
   _Point = (_RespawnPoints select _r) select 0;
     _Dist = _DeadBody distance _Point;
          if (_Dist < _Distance) then {
_Distance = _Dist;
 _ResPoint = _Point
};

  
};

  sleep 1;
 
};

     _RespawnPos = [getPosATL _ResPoint, 20, 5] call Fun_CalcRandomRespawn;
 _NewBody setPosATL _RespawnPos;
 _NewBody enableAI "MOVE";

};

