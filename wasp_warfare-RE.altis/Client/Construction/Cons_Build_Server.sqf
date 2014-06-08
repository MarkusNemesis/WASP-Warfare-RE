  private ["_this","_ObjData","_ObjPos","_ObjDir","_UnfinishedBld","_SupplyCost","_MoneyCost", "_Abr", "_Player", "_Side"];
 _ObjData  = _this select 0;
  _ObjPos  = _this select 1;
  _ObjDir  = _this select 2;
  _Player  = _this select 4;
  _Side  = side _Player;
    _Abr  = if (isNil {
_ObjData select 4}) then {
""} else {
_ObjData select 4
};

  _UnfinishedBld = "Land_cargo_addon01_V1_F" createVehicle _ObjPos;
 _UnfinishedBld setDir _ObjDir;
_UnfinishedBld setPosATL _ObjPos;
 [_ObjData select 0,_ObjPos,_ObjDir, _ObjData select 3,_UnfinishedBld, _Abr, _Side] spawn  {
  private ["_this","_ObjType","_ObjPos","_ObjDir","_UnfinishedBld","_Time", "_Side"];
     _ObjType  = _this select 0;
  _ObjPos   = _this select 1;
  _ObjDir   = _this select 2;
  _Time   = _this select 3;
 if (Debug) then {
_Time = 0.2
};

  _UnfinishedBld  = _this select 4;
  _Side   = _this select 6;
     sleep (_Time / 2);
        deleteVehicle _UnfinishedBld;
  _UnfinishedBld = "Land_Unfinished_Building_01_F" createVehicle _ObjPos;
  _UnfinishedBld setDir _ObjDir;
  _UnfinishedBld setPosATL _ObjPos;
     [_ObjType,_ObjPos,_ObjDir,_Time,_UnfinishedBld, _this select 5, _Side] spawn   {
    private ["_this","_ObjType","_ObjPos","_ObjDir","_UnfinishedBld","_Time","_Building", "_Abr", "_Side"];
       _ObjType  = _this select 0;
    _ObjPos   = _this select 1;
    _ObjDir   = _this select 2;
    _Time   = _this select 3;
 if (Debug) then {
_Time = 0.2
};

    _UnfinishedBld  = _this select 4;
    _Abr   = _this select 5;
    _Side   = _this select 6;
       sleep (_Time / 2);
        deleteVehicle _UnfinishedBld;
    _Building = _ObjType createVehicle _ObjPos;
    _Building setDir _ObjDir;
            _Building setPosASL [_ObjPos select 0, _ObjPos select 1, getTerrainHeightASL [_ObjPos select 0, _ObjPos select 1]];
    _Building setVectorUp (surfaceNormal _ObjPos);
                        if ((_ObjType == "Flag_NATO_F") || (_ObjType == "Flag_CSAT_F")) then    {
          private ["_VariableName", "_Bases", "_AreaID"];
     _VariableName = if (_Side == west) then {
"Public_BaseAreaBF"} else {
"Public_BaseAreaOF"
};

     _Bases   = missionNamespace getVariable _VariableName;
     _AreaID   = count(_Bases);
              _Area = [count(_Bases),_Building,_ObjPos,[]];
             if (_Side == west) then {
      ["Public_BaseAreaBF", "End", [true,false,false], _Area] spawn Send_ArrayRow;
     }     else {
      ["Public_BaseAreaOF", "End", [false,true,false], _Area] spawn Send_ArrayRow;
     
};

                   }    else    {
          private ["_NearestArea", "_AreaID", "_Area", "_BaseArea", "_Bases", "_Select", "_BuildingArray", "_BuildingInf", "_Dis", "_RespawnPos"];
     _NearestArea = [_Side, _Building] call Compile preprocessFileLineNumbers "Functions\Nearest_Base_Area.sqf";
      _VariableName = if (_Side == west) then {
"Public_BaseAreaBF"} else {
"Public_BaseAreaOF"
};

     _AreaID   = _NearestArea select 0;
                  _Bases   = missionNamespace getVariable _VariableName;
          _Area   = _Bases select _AreaID;
               _BuildingArray = _Area select 3;
                           _Building addEventHandler ["Killed",{
_this call EH_KilledBld}];
     _Building addEventHandler ["HandleDamage",{
_this call EH_DamageBld}];
               _ObjDir = _ObjDir - 180;
     _Dis = 20;
     _RespawnPos = [(_ObjPos select 0) + sin _ObjDir * _Dis, (_ObjPos select 1) + cos _ObjDir * _Dis, _ObjPos select 2];
               _BuildingInf = [count(_BuildingArray), _Building, _ObjType, _ObjPos, "", _RespawnPos];
      _BuildingArray set [count(_BuildingArray), _BuildingInf];
          _Area set [3, _BuildingArray];
                 _Bases set [_AreaID, _Area];
                      if (_Side == west) then {
      ["Public_BaseAreaBF", _AreaID, 3, [true,false,false], _BuildingArray] spawn Send_ArrayRowCol;
     }     else {
      ["Public_BaseAreaOF", _AreaID, 3, [false,true,false], _BuildingArray] spawn Send_ArrayRowCol;
     
};

                    private ["_SideNum", "_Dis", "_Angel", "_HelpObjArray", "_BuildConerDis"];
     _SideNum  = 4;
     _BuildConerDis  = _Building call Construction_ObjCornerPos;
     _Dis   = _BuildConerDis select 4;
 _Dis = _Dis + 3;
     _Angel     = 360 / _SideNum;
     _ObjDir   = _ObjDir + _Angel / 2;
                    private ["_SignPos", "_Sign", "_SignDis", "_SignPosDir", "_SignTexture"];
          _SignPosDir = _ObjDir - 80;
     _SignDis  = _Dis + 0.5;
     _SignPos  = [(_ObjPos select 0) + sin _SignPosDir * _SignDis, (_ObjPos select 1) + cos _SignPosDir * _SignDis, _ObjPos select 2];
     _Sign   = "Land_Noticeboard_F" createVehicle _SignPos;
      _Sign setDir (getDir _Building);
               _Sign setPosASL [_SignPos select 0, _SignPos select 1, getTerrainHeightASL [_SignPos select 0, _SignPos select 1]];
     _Sign setVectorUp (surfaceNormal _SignPos);
          _SignTexture = switch (_Abr) do     {
      case "B" : {
"GUI\Images\Buy\Buy_B.paa"
};

      case "LF" : {
"GUI\Images\Buy\Buy_LF.paa"
};

      case "HF" : {
"GUI\Images\Buy\Buy_HF.paa"
};

      case "BF" : {
"GUI\Images\Buy\Buy_BF.paa"
};

      case "CC" : {
"GUI\Images\CC_Icon.paa"
};

      case "AF" : {
"GUI\Images\Buy\Buy_AF.paa"
};

     
};

               private["_TextureScript"];
     _TextureScript =     {
      private["_Sign", "_SignTexture"];
      _Sign    = _this select 0;
      _SignTexture = _this select 1;
      _Sign setObjectTexture [0, _SignTexture];
     
};

     [[[_Sign, _SignTexture],_TextureScript],"BIS_fnc_spawn",true,true] spawn BIS_fnc_MP;
               private ["_CamoNetType", "_BldCamoNet"];
          _CamoNetType  = if (_Side == west) then {
"CamoNet_BLUFOR_big_F"} else {
"CamoNet_OPFOR_big_F"
};

     _BldCamoNet  = switch (_Abr) do     {
      case "B" : {
true
};

      case "LF" : {
true
};

      case "HF" : {
true
};

      case "BF" : {
false
};

      case "CC" : {
true
};

      case "AF" : {
false
};

     
};

          if (_BldCamoNet) then     {
      private["_CamoNetObj", "_help", "_up"];
      _CamoNetObj = _CamoNetType createVehicle (_BuildConerDis select 5);
      _CamoNetObj setDir ( getDir _Building);
                 _CamoNetObj setPosASL [_ObjPos select 0, _ObjPos select 1, getTerrainHeightASL [_ObjPos select 0, _SignPos select 1]];
      _CamoNetObj setVectorUp (surfaceNormal _ObjPos);
     
};

               for "_i" from 1 to (_SideNum - 1) do      {
            private["_StartPos", "_EndPos"];
       _StartPos = [(_ObjPos select 0) + sin _ObjDir * _Dis, (_ObjPos select 1) + cos _ObjDir * _Dis, getTerrainHeightASL [_ObjPos select 0, _ObjPos select 1]];
      _ObjDir = _ObjDir + _Angel;
      _EndPos = [(_ObjPos select 0) + sin _ObjDir * _Dis, (_ObjPos select 1) + cos _ObjDir * _Dis, getTerrainHeightASL [_ObjPos select 0, _ObjPos select 1]];
             [_StartPos,_EndPos,"Land_HBarrier_3_F",3,0] call Construction_BWalls;
           
};

    
};

   
};

 
};

 