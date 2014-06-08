 private["_AI_TeamLeaders", "_AITLArray"];
_AI_TeamLeaders = if (isMultiplayer) then {
playableUnits} else {
switchableUnits
};

_AITLArray  = [];
{
 if (side _x == side Player) then {
_AITLArray set [count _AITLArray, _x]
};

} forEach _AI_TeamLeaders;
{
 _GroupID = groupID (group _x);
 if (! isPlayer _x) then   {
  private ["_AITLMarker", "_AITLMarkerPos"];
  _AITLMarker  = format ["%1%2AITLMarker", _GroupID];
  _AITLMarkerPos = getMarkerPos _AITLMarker;
    if (format["%1",_AITLMarkerPos] == "[0,0,0]") then   {
           createMarkerLocal [_AITLMarker, getPosATL  _x];
           _AITLMarker setMarkerTypeLocal "mil_triangle";
           _AITLMarker setMarkerSizeLocal [0.7,0.7];
             _AITLMarker setMarkerColorLocal "ColorYellow";
           _AITLMarker setMarkerTextLocal format["%1", _GroupID];
        }  else  {
         _AITLMarker setMarkerPosLocal getPosATL  (_x);
  
};

 } else {
      _AITLMarker  = format ["%1%2AITLMarker", _GroupID];
  deleteMarkerLocal _AITLMarker;
 
};

} forEach _AITLArray;
