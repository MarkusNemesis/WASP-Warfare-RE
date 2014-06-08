private["_WGroups", "_EGroups", "_RGroups"];
_WGroups = 0;
_EGroups = 0;
_RGroups = 0;
{
 _Units = units _x;
 if (count _Units <= 0) then {
  deleteGroup _x;
  
};

 } forEach AllGroups;
{
 if (side _x == west) then {
_WGroups = _WGroups + 1
};

 if (side _x == east) then {
_EGroups = _EGroups + 1
};

 if (side _x == resistance) then {
_RGroups = _RGroups + 1
};

} forEach AllGroups;
["GROUPS COUNT", format["West: %1;
 East: %2;
 Resis: %3;
", _WGroups, _EGroups, _RGroups]] call Fun_AddToLog;
