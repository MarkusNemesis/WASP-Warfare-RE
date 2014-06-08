private["_side"];
_side  = side Player;
_WWTowns = Public_TownsArray;
{
  private ["_Count", "_Pos", "_Name", "_Marker", "_Town", "_Id", "_MaxP", "_Point", "_TSide", "_TColor",    "_TownOpen", "_TownMarker", "_Slc", "_CanSee"];
  _Count  = _forEachIndex;
 _Town  = _x;
 _Id   = _Town select 0;
 _Name   = _Town select 2;
 _MaxP   = _Town select 6;
 _Point   = _Town select 8;
 _TSide   = _Town select 7;
 _TownOpen = _Town select 13;
 _TColor  = "ColorBlue";
  _Slc = switch (side Player) do  {
  case west  : {
0
};

  case east  : {
1
};

  case resistance : {
2
};

 
};

 _CanSee = _TownOpen select _Slc;
   if (_Side == _TSide) then  {
    _TColor = "ColorGreen" }  else  {
    if (_CanSee) then   {
   _TColor = if (_TSide == resistance) then {
"ColorBlue"} else {
"ColorRed"
};

  }  else  {
   _TColor = "ColorBlue";
  
};

 
};

  _TownMarker = Format ["WW_TownMarker_%1",_Id];
 _TownMarker setMarkerColorLocal _TColor;
   if (_Side == _TSide) then  {
_TownMarker setMarkerTextLocal format["%1: %2/%3",_Name,_Point,_MaxP]} else  {
_TownMarker setMarkerTextLocal format["%1",_Name]
};

} forEach _WWTowns;
