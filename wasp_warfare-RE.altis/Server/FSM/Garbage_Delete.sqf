private["__VehAndWep", "_DelVehCount", "_Delete"];
_VehAndWep  = vehicles + (allMissionObjects "GroundWeaponHolder") + (allMissionObjects "Ship");
_DelVehCount = 0;
_Delete   = false;
{
 private["_TimeMarker"];
 _TimeMarker = _x getVariable "TimeMarker";
  if not (_x in [Public_MHQ_BF, Public_MHQ_OF]) then {
          if (!isNil "_TimeMarker") then   {
      if ((time - _TimeMarker) > Garbage_TimeDelete) then    {
    _VehMarker = format["%1VehicleMarker", _x];
    deleteMarker _VehMarker;
     deleteVehicle _x;
    _DelVehCount = _DelVehCount + 1;
    _Delete = true   
};

  
};

 
};

} forEach _VehAndWep;
if (_Delete) then {
["GARBAGE", format["DELETE: Vehicles and Weapons: %1", _DelVehCount]] spawn Fun_AddToLog
};

