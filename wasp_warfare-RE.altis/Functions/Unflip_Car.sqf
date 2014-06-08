private ["_Vehicle", "_Distance"];
_Vehicle = cursorTarget;
_Distance = Player distance _Vehicle;
if (((typeOf _Vehicle) isKindOf "LandVehicle") && (_Distance < 10)) then{
 private["_VehPos"];
 _VehPos = getPosASL _Vehicle;
 _Vehicle setPosASL [_VehPos select 0, _VehPos select 1,  (getTerrainHeightASL [_VehPos select 0, _VehPos select 1]) + 0.5];
 _Vehicle setVectorUp (surfaceNormal _VehPos);

};

