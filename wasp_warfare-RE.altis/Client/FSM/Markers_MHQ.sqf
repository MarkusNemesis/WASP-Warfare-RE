private["_MHQMarker", "_Side", "_MHQ", "_MHQAlive", "_MHQPos"];
_Side  = side Player;
             _MHQMarker  = uiNamespace getVariable "Markers_MHQ";
      _MHQ  = if (_Side == west) then {
Public_MHQ_BF} else {
Public_MHQ_OF
};

_MHQAlive = alive _MHQ;
             _MHQPos  = getPosATL  (_MHQ);
           if (_MHQMarker == "") then{
  if (_MHQAlive) then {
    _MHQMarker = format["%1MHQMarker",_Side];
      createMarkerLocal [_MHQMarker,_MHQPos];
       _MHQMarker setMarkerTypeLocal "b_hq";
       _MHQMarker setMarkerColorLocal "ColorGreen";
     _MHQMarker setMarkerSizeLocal [1,1];
      
};

}else{
  _MHQMarker setMarkerPosLocal (_MHQPos);
       _MHQMarker setMarkerTextLocal "MHQ";
      
};

if (!_MHQAlive && (_MHQMarker !="")) then{
 deleteMarkerLocal _MHQMarker;
 _MHQMarker = "";
 
};

uiNamespace setVariable ["Markers_MHQ"  , _MHQMarker];
