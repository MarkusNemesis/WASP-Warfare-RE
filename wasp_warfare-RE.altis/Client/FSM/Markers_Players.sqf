private ["_ClientTeams", "_Side", "_MarkersPlayers"];
_Side   = side Player;
   _ClientTeams  = [];
     _MarkersPlayers = uiNamespace getVariable "Markers_Players";
 {
 private["_Unit"];
 _Unit = _x;
 if ((isPlayer _Unit)) then  {
  if ((side _Unit) == _Side) then {
_ClientTeams set [count(_ClientTeams),_Unit]
};

 
};

} forEach allUnits;
{
 private ["_Unit", "_UID", "_UnitPos", "_Marker", "_Name"];
 _Unit  = _x;
           _UID  = getPlayerUID _Unit;
       _UnitPos = getPosATL  _Unit;
        _Name  = name _Unit;
         _Marker  = Format["%1%2Marker", _UID, _Side];
     if (_UID in _MarkersPlayers) then {
    _Marker setMarkerPosLocal (_UnitPos);
      _Marker setMarkerTextLocal format["%1",_Name];
   } else {
    createMarkerLocal [_Marker,_UnitPos];
      _Marker setMarkerTypeLocal "mil_triangle";
     _Marker setMarkerColorLocal "ColorOrange";
     _Marker setMarkerSizeLocal [1,1];
           _MarkersPlayers set[count(_MarkersPlayers), _UID];
 
};

} forEach _ClientTeams;
{
 if (!isNil "_x") then  {
  private["_MarkerUID", "_UID", "_Found", "_Unit", "_Marker"];
  _MarkerUID = _x;
  _Found  = false;
  _Marker  = Format["%1%2Marker", _MarkerUID, _Side];
       for "_i" from 0 to (count(_ClientTeams) - 1) do  {
   _Unit = _ClientTeams select _i;
    _UID = getPlayerUID _Unit;
         if (_MarkerUID == _UID) exitWith {
_Found = true
};

  
};

      if (!_Found) then  {
   deleteMarkerLocal _Marker;
    _MarkersPlayers set [_forEachIndex, -1];
   _MarkersPlayers = _MarkersPlayers - [-1];
  
};

 
};

} forEach _MarkersPlayers;
uiNamespace setVariable ["Markers_Players", _MarkersPlayers];
 