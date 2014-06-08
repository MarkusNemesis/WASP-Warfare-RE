  private ["_this", "_x", "_y", "_Camera", "_Dir", "_Pitch", "_Angle", "_AngMax", "_AngMin", "_CameraVecUp", "_Vecdx", "_Vecdy", "_Vecdz", "_Vecux", "_Vecuy", "_Vecuz",   "_Kursor", "_CameraPos", "_Dist","_LocalObj"];
 _x      = _this select 1;
    _y      = _this select 2;
    _Camera = Cons_Array select 0;
   _AngMax = -35;
       _AngMin = -85;
         _Dir = (getDir _Camera) + _x;
          _Pitch = 0;
               _CameraVecUp  = vectorUp _Camera;
         _Angle = -( acos((_CameraVecUp select 2) / cos(_Pitch)) + _y);
  if (_Angle > _AngMax) then {
_Angle = _AngMax
};

if (_Angle < _AngMin) then {
_Angle = _AngMin
};

_Vecdx = sin(_Dir) * cos(_Angle);
_Vecdy = cos(_Dir) * cos(_Angle);
_Vecdz = sin(_Angle);
_Vecux = cos(_Dir) * cos(_Angle) * sin(_Pitch);
_Vecuy = sin(_Dir) * cos(_Angle) * sin(_Pitch);
_Vecuz = cos(_Angle) * cos(_Pitch);
  private ["_Height"];
_CameraPos = getPosASL _Camera;
                       _Dist = ((getPosATL _Camera) select 2) * tg(90 + _Angle);
                _Height = getTerrainHeightASL [(_CameraPos select 0) + sin _Dir * _Dist, (_CameraPos select 1) + cos _Dir * _Dist, 0];
_Dist = ((_CameraPos select 2) - _Height) * tg(90 + _Angle);
_KursorPos = [(_CameraPos select 0) + sin _Dir * _Dist, (_CameraPos select 1) + cos _Dir * _Dist, 0];
     private [ "_NearestArea", "_Side", "_CanMove", "_InArea"];
 _Side   = side Player;
_MHQ   = if (_Side == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

_NearestArea  = [_Side, _MHQ] call Compile preprocessFileLineNumbers "Functions\Nearest_Base_Area.sqf";
_InArea   = _NearestArea select 2;
_AreaObj  = _NearestArea select 3;
_CanMove  = false;
  if (_InArea) then  {
   private ["_Dist"];
    _Dist   = _AreaObj distance _KursorPos;
  _CanMove = if (_Dist < AreaRadius) then {
true} else {
false
};

  hintsilent format["InArea: %1\nDistance: %2\n CanMove: %3", _InArea, _Dist, _CanMove];
 } else {
  private ["_Dist"];
    _Dist   = _MHQ distance _KursorPos;
  _CanMove = if (_Dist < AreaRadius / 2) then {
true} else {
false
};

  hintsilent format["InArea: %1\nDistance: %2\n CanMove: %3", _InArea, _Dist, _CanMove];
 
};

  if (_CanMove) then {
  _Camera setVectorDirAndUp [ [_Vecdx,_Vecdy,_Vecdz], [_Vecux,_Vecuy,_Vecuz] ];
      Cons_Array set [4,_KursorPos];
      _LocalObj  = Cons_Array select 5;
  if not (isNull _LocalObj) then  {
   _LocalObj setPosATL _KursorPos;
  
};

 
};

