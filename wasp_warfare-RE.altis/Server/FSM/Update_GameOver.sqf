private["_CheckAlive", "_BuildingsAndMHQ", "_WestArray", "_EastArray", "_WestAlive", "_EastAlive"];
_CheckAlive ={
 private["_this", "_BldArray", "_Alive"];
 _BldArray = _this;
 _Alive  = false;
  {
  if (alive _x) exitWith {
_Alive = true
};

 } forEach _BldArray;
   _Alive
};

_BuildingsAndMHQ ={
 private["_this", "_Side", "_MHQ", "_Buildings", "_result"];
 _Side  = _this;
  _MHQ   = if (_Side == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

 _Buildings = ([_Side] call Fun_GetAllAreaAndBld) select 1;
 _result  = [_MHQ];
  if (((_Buildings select 0) select 0) != -1) then {
    {
   private["_Building", "_Object"];
   _Building  = _x;
   _Object  = _Building select 1;
        _Buildings set [_forEachIndex, _Object];
    } forEach _Buildings;
  _result = [_MHQ] + _Buildings;
 } else {
  _result = [_MHQ];
 
};

    _result
};

_WestArray  = west call _BuildingsAndMHQ;
  _EastArray  = east call _BuildingsAndMHQ;
  _WestAlive  = _WestArray call _CheckAlive;
  _EastAlive  = _EastArray call _CheckAlive;
  if ((!_WestAlive) && (!_EastAlive)) then{
 GameOver = true;
 [["DRAW" , false, true],"BIS_fnc_endMission",true,false] spawn BIS_fnc_MP;

};

if ((_WestAlive) && (!_EastAlive)) then{
 GameOver = true;
 [["END1" , true , true],"BIS_fnc_endMission",west,false] spawn BIS_fnc_MP;
 [["LOSER" , false, true],"BIS_fnc_endMission",east,false] spawn BIS_fnc_MP;

};

if ((!_WestAlive) && (_EastAlive)) then{
 GameOver = true;
 [["END1" , true , true],"BIS_fnc_endMission",east,false] spawn BIS_fnc_MP;
 [["LOSER" , false, true],"BIS_fnc_endMission",west,false] spawn BIS_fnc_MP;

};

