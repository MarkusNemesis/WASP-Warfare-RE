private["_this", "_Question", "_Function", "_Select", "_onLoad", "_CreateAndDeleteMarkers",  "_DeleteAllMarkers", "_AnimateSelectedMarker", "_Click"];
_Question = _this select 1;
disableSerialization;
_CreateAndDeleteMarkers ={
 private["_Markers", "_RespawnInfo", "_DiePos", "_RespawnPoint", "_TimeEnd", "_RespawnList"];
  _Markers  = uiNamespace getVariable "WFDisplay_Respawn_Markers";
   _RespawnInfo = uiNamespace getVariable "Respawn";
       _DiePos   = _RespawnInfo select 0;
          _RespawnPoint = _RespawnInfo select 1;
           _TimeEnd  = _RespawnInfo select 2;
           _RespawnList = _RespawnInfo select 3;
              {
  private["_AreaOrTown", "_PointID", "_PointObj", "_Marker", "_PointPos", "_SelectedPoint"];
  _AreaOrTown  = _x select 0;
          _PointID  = _x select 1;
          _PointObj  = _x select 2;
          _PointPos  = getPosATL  _PointObj;
        _SelectedPoint = _RespawnPoint select 2;
       _Marker   = format["RespawnMarker_%1", _PointObj];
       if (_PointObj in _Markers) then  {
         _Marker setMarkerTypeLocal "selector_selectedMission";
    _Marker setMarkerColorLocal "ColorWhite";
       _Marker setMarkerDirLocal 0;
             if (_PointObj == _SelectedPoint) then   {
        private["_Dir"];
    _Dir = uiNamespace getVariable "WFDisplay_Respawn_Animate";
    _Dir = _Dir + 10;
        _Marker setMarkerTypeLocal "Select";
        _Marker setMarkerColorLocal "ColorYellow";
       _Marker setMarkerDirLocal _Dir;
                  uiNamespace setVariable ["WFDisplay_Respawn_Animate", _Dir];
   
};

  }  else  {
      createMarkerLocal [_Marker,_PointPos];
        _Marker setMarkerTypeLocal "selector_selectedMission";
    _Marker setMarkerColorLocal "ColorWhite";
       _Marker setMarkerSizeLocal [1,1];
               _Markers set[count(_Markers), _PointObj];
  
};

  } forEach _RespawnList;
    {
  if (!isNil "_x") then    {
   private["_MarkerObj", "_MarkerIndex", "_Marker", "_Find"];
   _MarkerObj  = _x;
             _MarkerIndex = _forEachIndex;
          _Marker   = format["RespawnMarker_%1", _MarkerObj];
    _Find    = false;
                  {
    private["_x", "_forEachIndex"];
    _PointObj = _x select 2;
          if (_MarkerObj == _PointObj) then {
_Find = true
};

   } forEach _RespawnList;
         if (!_Find) then   {
    deleteMarkerLocal _Marker;
     _Markers set [_MarkerIndex, -1];
    _Markers = _Markers - [-1];
   
};

  
};

 } forEach _Markers;
    uiNamespace setVariable ["WFDisplay_Respawn_Markers", _Markers];

};

_DeleteAllMarkers ={
 private["_Markers"];
 _Markers = uiNamespace getVariable "WFDisplay_Respawn_Markers";
    {
  if (!isNil "_x") then   {
  private["_MarkerObj", "_MarkerIndex", "_Marker"];
   _MarkerObj  = _x;
            _MarkerIndex = _forEachIndex;
         _Marker   = format["RespawnMarker_%1", _MarkerObj];
       deleteMarkerLocal _Marker;
  
};

 } forEach _Markers;
   uiNamespace setVariable ["WFDisplay_Respawn_Markers", []];

};

_onLoad ={
 private ["_RespawnInfo", "_RespawnPoint", "_RespawnList"];
  uiNamespace setVariable ["WFDisplay_Respawn", (_this select 0) select 0];
   uiNamespace setVariable ["WFDisplay_Respawn_Markers", []];
       uiNamespace setVariable ["WFDisplay_Respawn_Animate", 0];
        _RespawnInfo = uiNamespace getVariable "Respawn";
 _RespawnPoint = _RespawnInfo select 1;
 _RespawnList = _RespawnInfo select 3;
              lbClear 1500;
   {
  private["_Type", "_Text"];
  _Type = switch (_x select 1) do          {
   case "B" : {
"Barracks"
};

   case "LF" : {
"Light Factory"
};

   case "HF" : {
"Heavy Factory"
};

   case "AF" : {
"Air Factory"
};

   case "BF" : {
"Boat Factory"
};

   case "CC" : {
"Comand Center"
};

   case ""  : {
"MHQ"
};

   default    {
format["Camp-%1",_x select 1]
};

  
};

     if ((_x select 0) == "AMBULANCE") then {
_Type = _x select 1
};

     _Text = if ((_x select 0) == "MHQ") then {
"MHQ"} else {
format ["%1: %2", _x select 0,_Type]
};

  LbAdd [1500,_Text];
 } foreach _RespawnList;
     {
  private["_PointObj", "_Selected"];
  _PointObj = _x select 2;
  _Selected = _RespawnPoint select 2;
    if (_PointObj == _Selected) exitWith {
lbSetCurSel [1500, _forEachIndex]
};

 } forEach _RespawnList;
   waitUntil  {
  private["_Display", "_RespawnInfo","_DiePos", "_RespawnPoint", "_TimeEnd", "_RespawnList"];
      _Display  = uiNamespace getVariable "WFDisplay_Respawn";
  _Markers  = uiNamespace getVariable "WFDisplay_Respawn_Markers";
  _RespawnInfo = uiNamespace getVariable "Respawn";
  _DiePos   = _RespawnInfo select 0;
  _RespawnPoint = _RespawnInfo select 1;
  _TimeEnd  = _RespawnInfo select 2;
 _TimeEnd = round(_TimeEnd - time);
  _RespawnList = _RespawnInfo select 3;
       _result   = false;
             ctrlSetText [1100, format["00:%1",_TimeEnd]];
  if (_TimeEnd < 30) then {
(_Display DisplayCtrl 1100) ctrlSetTextColor [1, 1, 0, 1];

};

  if (_TimeEnd < 10) then {
(_Display DisplayCtrl 1100) ctrlSetTextColor [1, 0, 0, 1];

};

      _PointText = parseText format["<t align='left' size='%1' color='#ffffff'>Selected Respawn Point: <br />%2</t>",0.8,_RespawnPoint select 0];
  (_Display DisplayCtrl 1101) ctrlSetStructuredText _PointText;
        lbClear 1500;
    {
   private["_Type", "_Text"];
   _Type = switch (_x select 1) do           {
    case "B" : {
"Barracks"
};

    case "LF" : {
"Light Factory"
};

    case "HF" : {
"Heavy Factory"
};

    case "AF" : {
"Air Factory"
};

    case "BF" : {
"Boat Factory"
};

    case "CC" : {
"Comand Center"
};

    case ""  : {
"MHQ"
};

    default    {
format["Camp-%1",_x select 1]
};

   
};

      _Text = if ((_x select 0) == "MHQ") then {
"MHQ"} else {
format ["%1: %2", _x select 0,_Type]
};

   LbAdd [1500,_Text];
  } foreach _RespawnList;
        [] call _CreateAndDeleteMarkers;
          if (_TimeEnd <= 0) then   {
   closeDialog 0;
  
};

    sleep 0.1;
   if (isNull _Display) then {
_result = true;
 [] call _DeleteAllMarkers} else {
_result = false
};

    if ((isNull _Display) && (_TimeEnd > 0)) then {
createDialog "WFRespawn"
};

  _result 
};


};

_Select ={
 private["_RespawnInfo", "_DiePos", "_RespawnPoint", "_TimeEnd", "_RespawnList", "_RespawnListNum", "_RespawnPoint"];
  _Display  = uiNamespace getVariable "WFDisplay_Respawn";
 _RespawnInfo = uiNamespace getVariable "Respawn";
 _DiePos   = _RespawnInfo select 0;
 _RespawnPoint = _RespawnInfo select 1;
 _TimeEnd  = _RespawnInfo select 2;
 _TimeEnd = round(_TimeEnd - time);
 _RespawnList = _RespawnInfo select 3;
   _RespawnListNum = lbCurSel 1500;
   {
  if (_RespawnListNum == _forEachIndex) then  {
   _RespawnPoint = _x;
         (_Display DisplayCtrl 2000) ctrlMapAnimAdd [0.2, 0.1, getPosATL  (_x select 2)];
   ctrlMapAnimCommit (_Display DisplayCtrl 2000);
  
};

 } forEach _RespawnList;
 _RespawnInfo set[1, _RespawnPoint];
 uiNamespace setVariable ["Respawn", _RespawnInfo];

};

_Click ={
 private["_Control", "_MouseX", "_MouseY", "_MapCoord", "_RespawnInfo", "_RespawnPoint", "_RespawnList",   "_Distance", "_DistPoint", "_Index"];
 _Control  = (_this select 0) select 0;
   _MouseX   = (_this select 0) select 2;
   _MouseY   = (_this select 0) select 3;
    _RespawnInfo = uiNamespace getVariable "Respawn";
 _RespawnPoint = _RespawnInfo select 1;
    _RespawnList = _RespawnInfo select 3;
    _Distance  = 35;
         _DistPoint  = [];
 _Index   = 0;
  _MapCoord =_Control ctrlMapScreenToWorld [_MouseX, _MouseY];
     {
  private["_PointObj", "_Dist"];
  _PointObj = _x select 2;
        _Dist   = _MapCoord distance _PointObj;
      if (_Dist < _Distance) then {
_DistPoint = _x;
 _Distance = _Dist;
 _Index = _forEachIndex
};

   } forEach _RespawnList;
    if (count(_DistPoint) > 0) then {
    lbSetCurSel [1500, _Index];
     _RespawnInfo set [1, _DistPoint];
  uiNamespace setVariable ["Respawn", _RespawnInfo];
 
};


};

_Function = switch (_Question) do{
    case "onLoad"  : {
_onLoad
};

 case "Select"  : {
_Select
};

 case "Click"  : {
_Click
};


};

call _Function;
