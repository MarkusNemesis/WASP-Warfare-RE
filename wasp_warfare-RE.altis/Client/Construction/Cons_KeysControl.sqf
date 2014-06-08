private ["_ChangePos","_ChangeDir"];
  _ChangePos ={
  private ["_this" ,"_Camera", "_Dist", "_Angle", "_CameraDir", "_CameraVecUp","_CameraSpeed"];
   _Camera   = _this select 1;
 _CameraSpeed = 3;
 _CameraPos   = getPosATL  _Camera;
 _CameraDir   = (direction _Camera) + (_this select 0);
    _CameraNewPos  = [(_CameraPos select 0) + sin _CameraDir * _CameraSpeed, (_CameraPos select 1) + cos _CameraDir * _CameraSpeed,_CameraPos select 2];
     private ["_Dir","_Pitch","_KursorPos","_LocalObj","_Height"];
  _Dir = getDir _Camera;
             _Pitch = 0;
                _CameraVecUp  = vectorUp _Camera;
          _Angle = -( acos((_CameraVecUp select 2) / cos(_Pitch)));
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
  _Camera camSetPos _CameraNewPos;
  _Camera  camCommitPrepared 0.20;
     Cons_Array set [4,_KursorPos];
      _LocalObj  = Cons_Array select 5;
  if not (isNull _LocalObj) then  {
   _LocalObj setPosATL  _KursorPos;
  
};

 
};


};

 _ChangeDir ={
 private ["_LocalObj","_Dir","_this","_angel"];
 _angel   = _this select 0;
 _LocalObj  = Cons_Array select 5;
  if not (isNull _LocalObj) then {
  _Dir = getDir _LocalObj;
  _Dir = _Dir + _angel;
  _LocalObj setDir _Dir;
 
};


};

private ["_Camera","_keypress","_MouseMove","_MouseClick","_key","_this","_LocalObj"];
 _Camera  = Cons_Array select 0;
_keypress = Cons_Array select 1;
_MouseMove = Cons_Array select 2;
_MouseClick = Cons_Array select 3;
_LocalObj = Cons_Array select 5;
 _key  = _this select 1;
     if (_key == 1) then {
 [] call Construction_Exit;

};

if (_key == 30) then {
 [-90,_Camera] call _ChangePos;

};

if (_key == 32) then {
 [90,_Camera] call _ChangePos;

};

if (_key == 17) then {
 [0,_Camera] call _ChangePos;

};

if (_key == 31) then {
 [180,_Camera] call _ChangePos;

};

  if (_key == 16) then {
 [-5] call _ChangeDir;

};

  if (_key == 18) then {
 [5] call _ChangeDir;

};

if (_key == 49) then {
  private["_Display", "_NVG", "_Control"];
 _Display = uiNamespace getVariable "ConstructionDisplay";
 _Control  = _Display displayCtrl 1012;
  _NVG  = ctrlText _Control;
 hint str(_NVG);
 if (_NVG == "NVG: OFF") then {
  camUseNVG true;
  _Control ctrlSetText "NVG: ON";
 } else {
  camUseNVG false;
  _Control ctrlSetText "NVG: OFF";
 
};


};

  _this select 1