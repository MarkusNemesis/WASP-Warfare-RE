#include "EH_Functions.sqf"private ["_DeadBld", "_Killer", "_DeadBldName", "_PlayersWhoKill", "_DeadBldPrice",   "_DeadBldEnemy", "_DeadBldName"];
_DeadBld   = _this select 0;
       _Killer   = _this select 1;
       _BldData  = (typeOf _DeadBld) call Fun_GetBldInf;
  _DeadBldName = _BldData select 0;
      _DeadBldEnemy = if (side _Killer != side _DeadBld) then {
true} else {
false
};

_PlayersWhoKill = _Killer call _KillerManOrVehicleCrew;
  _DeadBldPrice = _DeadBld call _VehiclePriceFromData;
  if (_Killer != _DeadBld) then{
 if (count _PlayersWhoKill > 0) then {
  {
   private["_Price", "_Text", "_KisP", "_Text2"];
   _KisP = [_Killer, _x] call _KillerIsPlayer;
        _Price = (3000) / (count _PlayersWhoKill);
   _Price = if (_DeadBldEnemy) then {
_Price} else {
-_Price
};

     _Text = if (_DeadBldEnemy) then {
"KILL"} else {
"TEAM KILL"
};

    _Text2 = if (_KisP) then {
"YOU"} else {
""
};

            if (!isNull _x) then   {
            ["Kill", _x, [_DeadBld, _Price, _DeadBldEnemy, _KisP]] call Send_EventHandler;
   
};

  } forEach _PlayersWhoKill;
 
};


};

deleteVehicle _DeadBld;
