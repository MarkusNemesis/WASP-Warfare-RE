private ["_this","_Camera","_MHQ","_ConsArea", "_ConsAreaPos", "_NearestArea", "_Side", "_InArea"];
 Cons_Array = [];
             _Side   = side Player;
_MHQ   = if (_Side == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

_NearestArea  = [_Side, _MHQ] call Compile preprocessFileLineNumbers "Functions\Nearest_Base_Area.sqf";
_InArea   = _NearestArea select 2;
_AreaObj  = _NearestArea select 3;
_ConsArea  = if (_InArea) then {
_AreaObj} else {
_MHQ
};

  _ConsAreaPos = getPosATL  _ConsArea;
 showCinemaBorder false;
           _Camera = "camera" camCreate getPosATL  (Player);
     _Camera cameraEffect ["INTERNAL", "BACK TOP"];
     _Camera camSetPos [_ConsAreaPos select 0, _ConsAreaPos select 1, 30];
  _Camera camCommit 1;
           cameraEffectEnableHUD true;
            disableSerialization;
6881 cutRsc ["ConstructionView","PLAIN",2];
[[],"onLoad"] call Construction_Camera;
 private ["_Dir", "_Pitch", "_Angle", "_Vecdx", "_Vecdy", "_Vecdz", "_Vecux", "_Vecuy", "_Vecuz"];
 _Dir = 0;
 _Angle = -70;
 _Pitch = 0;
_Vecdx = sin(_Dir) * cos(_Angle);
_Vecdy = cos(_Dir) * cos(_Angle);
_Vecdz = sin(_Angle);
_Vecux = cos(_Dir) * cos(_Angle) * sin(_Pitch);
_Vecuy = sin(_Dir) * cos(_Angle) * sin(_Pitch);
_Vecuz = cos(_Angle) * cos(_Pitch);
_Camera setVectorDirAndUp [ [_Vecdx,_Vecdy,_Vecdz], [_Vecux,_Vecuy,_Vecuz] ];
private ["_SideNum", "_ObjectDir", "_Dis", "_Angel", "_HelpObjArray"];
_SideNum  = 50;
_Dis   = if (_InArea) then {
AreaRadius} else {
AreaRadius / 2
};

_Angel     = 360 / _SideNum;
_ObjectDir   = getDir _ConsArea;
_HelpObjArray  = [];
Cons_Array set [7,[]];
for "_i" from 1 to (_SideNum) do {
  private["_StartPos", "_EndPos"];
  _StartPos = [(_ConsAreaPos select 0) + sin _ObjectDir * _Dis, (_ConsAreaPos select 1) + cos _ObjectDir * _Dis, _ConsAreaPos select 2];
 _ObjectDir = _ObjectDir + _Angel;
 _EndPos = [(_ConsAreaPos select 0) + sin _ObjectDir * _Dis, (_ConsAreaPos select 1) + cos _ObjectDir * _Dis, _ConsAreaPos select 2];
   [_StartPos,_EndPos,"Land_Flush_Light_red_F",10,0] spawn Construction_BWallsLocal;

};

 _KeyPress   = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call Construction_KeyControl;
 _result = false;
 _result"];
_MouseMove  = (findDisplay 46) displayAddEventHandler ["MouseMoving","_this call Construction_MouseMove;
 _result = true;
 _result"];
_MouseClick = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call Construction_MouseClick;
 _result = true;
 _result"];
[] call Construction_CreateMenu;
       Cons_Array set[0,_Camera];
Cons_Array set[1,_KeyPress];
Cons_Array set[2,_MouseMove];
Cons_Array set[3,_MouseClick];
Cons_Array set[4,_ConsAreaPos];
  Cons_Array set[5,objNull];
   Cons_Array set[6,[]];
    Cons_Array set[8,objNull];
   