 private["_Units", "_UnitsNumberArray"];
_Units    = Units (Group Player);
_UnitsNumberArray = [];
{
_UnitsNumberArray set[count _UnitsNumberArray, _x call Fun_GetUnitNumberGroup]} forEach _Units;
{
 if (!isNil "_x") then {
  if (! isPlayer _x) then    {
   private ["_UnitMarker", "_UnitMarkerPos", "_UnitNumber"];
   _UnitNumber  = _x call Fun_GetUnitNumberGroup;
   _UnitMarker  = format ["%1UnitMarker", _UnitNumber];
   _UnitMarkerPos = getMarkerPos _UnitMarker;
      if (format["%1",_UnitMarkerPos] == "[0,0,0]") then    {
            createMarkerLocal [_UnitMarker, getPosATL  _x];
         _UnitMarker setMarkerTypeLocal "mil_dot";
          _UnitMarker setMarkerSizeLocal [0.5,0.5];
          _UnitMarker setMarkerColorLocal "ColorYellow";
         _UnitMarker setMarkerTextLocal str(_UnitNumber);
            if not (_UnitNumber in Markers_GroupUnits) then {
     Markers_GroupUnits set [count Markers_GroupUnits, _x call Fun_GetUnitNumberGroup];
    
};

   }   else   {
            _UnitMarker setMarkerPosLocal getPosATL  (_x);
   
};

  
};

 
};

} forEach _Units;
{
 if (!isNil "_x") then {
  if not (_x in _UnitsNumberArray) then  {
         private["_UnitMarker", "_UnitNumber"];
   _UnitNumber = _x;
   _UnitMarker = format ["%1UnitMarker", _UnitNumber];
   deleteMarkerLocal _UnitMarker;
         Markers_GroupUnits set [_forEachIndex, -1];
   Markers_GroupUnits = Markers_GroupUnits - [-1];
  
};

 
};

} forEach Markers_GroupUnits;
