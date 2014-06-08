private["_side"];
_side  = side Player;
_WWCamps = Public_CampsArray;
{
  private ["_Count", "_Pos", "_Name", "_Marker", "_Camps", "_Id", "_Cside", "_Ccolor", "_CampMarker",    "_CanSee", "_Slc", "_COpen"];
  _Count = _forEachIndex;
 _Camps = _x;
 _Id  = _Camps select 0;
 _Cside  = _Camps select 3;
 _COpen = _Camps select 7;
 _Ccolor = "ColorBlue";
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

 _CanSee = _COpen select _Slc;
  if (_Side == _Cside) then  {
    _Ccolor = "ColorGreen" } else  {
    if (_CanSee) then   {
   _Ccolor = if (_Cside == resistance) then {
"ColorBlue"} else {
"ColorRed"
};

  }  else  {
   _Ccolor = "ColorBlue";
  
};

 
};

  _CampMarker = Format ["WW_CampMarker_%1",_Id];
 _CampMarker setMarkerColorLocal _Ccolor;
} forEach _WWCamps;
