  private["_Town", "_TownGroups", "_WGroups", "_EGroups", "_RGroups"];
_Town    = _this;
_TownGroups  = _Town select 10;
{
 private["_GroupAI"];
 _GroupAI = units _x;
   deleteGroup _x;
     {
  if (!isNil "_x") then  {
     if (vehicle _x != _x) then {
    if not ((typeOf (vehicle _x)) isKindOf "B_HMG_01_high_F") then {
deleteVehicle (vehicle _x)
};

   
};

  deleteVehicle _x;
  
};

 } forEach _GroupAI;
   _x spawn {
  sleep 180;
  deleteGroup _this;
   
};

} forEach _TownGroups;
