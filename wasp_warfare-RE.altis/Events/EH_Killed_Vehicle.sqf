#include "EH_Functions.sqf"private ["_DeadVehicle", "_Killer", "_DeadVehicleName", "_PlayersWhoKill", "_DeadVehiclePrice",   "_DeadVehicleEnemy"];
_DeadVehicle   = _this select 0;
_Killer    = _this select 1;
_DeadVehicleName = getText (configFile >> "CfgVehicles" >> (typeof _DeadVehicle) >> "displayName");
_DeadVehicleEnemy = if (side _Killer != side _DeadVehicle) then {
true} else {
false
};

_PlayersWhoKill  = _Killer call _KillerManOrVehicleCrew;
   _DeadVehiclePrice = _DeadVehicle call _VehiclePriceFromData;
  if (_Killer != _DeadVehicle) then{
 if (count _PlayersWhoKill > 0) then {
  {
   private["_Price", "_Text", "_KisP", "_Text2"];
   _KisP = [_Killer, _x] call _KillerIsPlayer;
         _Price = (_DeadVehiclePrice select 1) / (count _PlayersWhoKill);
   _Price = if (_DeadVehicleEnemy) then {
_Price} else {
-_Price
};

     _Text = if (_DeadVehicleEnemy) then {
"KILL"} else {
"TEAM KILL"
};

    _Text2 = if (_KisP) then {
"YOU"} else {
""
};

             if (!isNull _x) then   {
             ["Kill", _x, [_DeadVehicle, _Price, _DeadVehicleEnemy, _KisP]] call Send_EventHandler;
   
};

  } forEach _PlayersWhoKill;
 
};


};

  _DeadVehicle spawn _DeleteDeadBody;
