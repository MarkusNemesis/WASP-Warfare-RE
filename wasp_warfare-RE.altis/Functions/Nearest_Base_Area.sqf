private ["_this", "_i", "_NearestArea", "_NearestDist", "_Area", "_AreaObj", "_Dist", "_BaseArea", "_Bases", "_Object", "_MaxBaseRadius", "_result","_InArea", "_NearestAObj"];
_MaxBaseRadius = AreaRadius;
     _Side   = _this select 0;
   _Object   = _this select 1;
   _NearestDist = 10000;
     _Bases   = if (_Side == west) then {
Public_BaseAreaBF} else {
Public_BaseAreaOF
};

 _result   = [0,0,0];
     if (count(_Bases) > 0) then{
  for "_i" from 0 to (count(_Bases)-1) do {
    _Area   = _Bases select _i;
    _AreaObj = _Area select 1;
     _Dist = _Object distance _AreaObj;
  if (_Dist < _NearestDist) then  {
   _NearestDist = _Dist;
      _NearestArea = _Area select 0;
    _NearestAObj = _Area select 1;
   
};

    
};

  if (_NearestDist <= _MaxBaseRadius) then {
_InArea = true} else {
_InArea = false
};

 _result = [_NearestArea, _NearestDist, _InArea, _NearestAObj];
}else{
  _result = [-1, 0, false, objNull];
   
};

_result       