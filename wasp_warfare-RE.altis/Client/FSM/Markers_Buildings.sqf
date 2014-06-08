private["_Side", "_AllAreaBld", "_Areas", "_Buildings"];
_Side  = side Player;
_AllAreaBld = [_Side] call Fun_AreasAndBuildings;
_Areas  = _AllAreaBld select 0;
_Buildings = _AllAreaBld select 1;
if (((_Areas select 0) select 0) >= 0) then  {
  {
    private ["_Area", "_AreaObj", "_i", "_Exist"];
   _Area   = _x;
        _AreaObj  = _Area select 1;
    _Exist  = 0;
          if (count(Markers_Areas) > 0) then  {
   for "_i" from 0 to (count(Markers_Areas)-1) do   {
        private["_MarkerArray", "_MarkerName", "_MarkerObj"];
       _MarkerArray  = Markers_Areas select _i;
    _MarkerName   = _MarkerArray select 0;
       _MarkerObj  = _markerArray select 1;
       if (_AreaObj == _MarkerObj) then {
_Exist = 1
};

     
};

  
};

  if (_Exist == 0) then  {
      private ["_AreaMarker"];
      _AreaMarker = Format ["WW_AreaMarker_%1",_AreaObj];
   createMarkerLocal [_AreaMarker,getPosATL  (_AreaObj)];
   _AreaMarker setMarkerShapeLocal "ELLIPSE";
   _AreaMarker setMarkerBrushLocal "FDiagonal";
   _AreaMarker setMarkerColorLocal "ColorBlue";
   _AreaMarker setMarkerSizeLocal [AreaRadius,AreaRadius];
   Markers_Areas set [count(Markers_Areas),[_AreaMarker,_AreaObj]];
  
};

 } forEach _Areas;

};

 if (count(_Buildings) > 0 && ((_Buildings select 0) select 0) >= 0) then {
 {
  private ["_Building", "_BldObj", "_Exist"];
    _Building = _x;
  _BldObj  = _Building select 1;
  _Exist  = 0;
    if (count(Markers_Buildings) > 0) then  {
   for "_i" from 0 to (count(Markers_Buildings)-1) do   {
        private["_MarkerArray", "_MarkerName", "_MarkerObj"];
       _MarkerArray  = Markers_Buildings select _i;
    _MarkerName   = _MarkerArray select 0;
       _MarkerObj  = _markerArray select 1;
       if (_BldObj == _MarkerObj) then {
_Exist = 1
};

     
};

  
};

  if (_Exist == 0) then  {
      private ["_BldMarker", "_ConsData", "_BldName"];
      _BldName = "";
   _ConsData  = "Buildings" call Data_Cons;
    for "_i" from 0 to (count(_ConsData)-1) do   {
    _BldData = _ConsData select _i;
        if ((TypeOf _BldObj) isKindOf (_BldData select 2)) then {
_BldName = _BldData select 6
};

   
};

      _BldMarker = Format ["WW_BldMarker_%1",_BldObj];
   createMarkerLocal [_BldMarker,getPosATL  (_BldObj)];
   _BldMarker setMarkerTypeLocal "mil_dot";
   _BldMarker setMarkerColorLocal "ColorBlue";
   _BldMarker setMarkerTextLocal format["%1", _BldName];
   Markers_Buildings set [count(Markers_Buildings),[_BldMarker,_BldObj]];
  
};

   } forEach _Buildings;

};

