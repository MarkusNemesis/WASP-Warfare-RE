  private["_this", "_HelpObj", "_ArrowObj"];
_HelpObj = _this;
_ArrowObj = "Sign_Arrow_Direction_Yellow_F" createVehicleLocal getPosATL  (_HelpObj);
  waitUntil{
 private["_result", "_ObjectCorner", "_Dis", "_Dir", "_Pos", "_ArrowPos", "_Z"];
 sleep 0.01;
  _ObjectCorner  = _HelpObj call Construction_ObjCornerPos;
 _Dis   = _ObjectCorner select 4;
 _Dir   = GetDir _HelpObj;
 _Pos   = getPosATL _HelpObj;
  _Dir   = _Dir - 180;
 _Dis   = _Dis + 2;
 _Z    = (_Pos select 2) + 1.5;
 _ArrowPos   = [(_Pos select 0) + sin _Dir * _Dis, (_Pos select 1) + cos _Dir * _Dis, _Z];
 _ArrowObj setPosATL _ArrowPos;
 _ArrowObj setDir _Dir;
   [["Object", _Dir, _Pos], "BuildInf"] spawn Construction_Camera;
    _result = if (isNull _HelpObj) then {
true} else {
false
};

   if (_result) then {
deleteVehicle _ArrowObj;

};

   _result
};

